From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 02 May 2017 18:05:38 +0300
Subject: [Buildroot] [PATCH 0/4] bluez5_utils: version bump fixes and
 updates
In-Reply-To: <cover.1493643541.git.baruch@tkos.co.il>
References: <cover.1493643541.git.baruch@tkos.co.il>
Message-ID: <1493737538.24567.274.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-05-01 at 15:59 +0300, Baruch Siach wrote:
> The recent bluez5_utils version bump moved around the build options so
> that?
> some builds now fail, and the help text became incorrect. This short
> series?
> fixes some of these issues.
> 

Thanks for taking care of this, I appreciate.
I have no time to keep on it right now, so, feel free modify as it
satisfies Thomas and others.

On first glance what you did looks sane to me.

> This series is mostly based on Andy Shevchenko's patch[1] with the
> following?
> main changes:
> 
> ? * Split out the DEPRECATED handling, adding a fix to the gatttool
> build?
> ????issue in the process
> 
> ? * Remove the redundant BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL config
> option
> 
> ? * Split the option addition patch into two: one for options that
> were?
> ????previously under --enable-experimental, and one for the newly
> introduced?
> ????midi profile
> 
> ? * Add missing BR2_PACKAGE_ALSA_LIB_SEQ select
> 
> [1] https://patchwork.ozlabs.org/patch/741645/
> 
> Andy Shevchenko (2):
> ? bluez5_utils: allow enabling formerly experimental plugins
> ? bluez5_utils: allow building the midi profile
> 
> Baruch Siach (2):
> ? bluez5_utils: allow install of deprecated tools
> ? bluez5_utils: correct the experimental option text
> 
> ?Config.in.legacy?????????????????????|??9 +++++++++
> ?package/bluez5_utils/Config.in???????| 39
> +++++++++++++++++++++++++++---------
> ?package/bluez5_utils/bluez5_utils.mk | 34
> ++++++++++++++++++++++++++++++-
> ?3 files changed, 71 insertions(+), 11 deletions(-)
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
