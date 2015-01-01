From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 20:45:05 +0100
Subject: [Buildroot] [PATCH 01/30] libselinux: new package
In-Reply-To: <1418702062-61039-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1418702062-61039-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150101204505.106dd21d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 15 Dec 2014 21:53:53 -0600, Matt Weber wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Config.in                |  1 +
>  package/libselinux/Config.in     | 25 ++++++++++++++
>  package/libselinux/libselinux.mk | 70 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+)
>  create mode 100644 package/libselinux/Config.in
>  create mode 100644 package/libselinux/libselinux.mk

Thanks, applied after doing a number of changes:

[Thomas:
  - Add hash file.
  - Enable on all architectures, and enable on uClibc. The
    autobuilders will let us know if there are any problems.
  - Use "Public Domain" as the license instead of "PublicDomain"
  - Handle Python 2 vs. Python 3 for the host package. Either can be
    used by libselinux.
  - Change the trick used to get the library and programs installed in
    usr/lib/ and usr/sbin/ instead of lib/ and sbin/.]

See the final commit at
http://git.buildroot.net/buildroot/commit/?id=9d9f54ac654b15bcffd2a20fe57ad01a494cc4c7.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
