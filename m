From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 12:42:18 +0200
Subject: [Buildroot] [PATCH/next 05/10] package/libcodec2: new package
In-Reply-To: <1439317015-8031-6-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829124218.7059b957@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 11 Aug 2015 20:16:50 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                             |  1 +
>  package/libcodec2/0001-cross.patch            | 44 +++++++++++++++++++++++++++
>  package/libcodec2/0002-disable-unittest.patch | 13 ++++++++
>  package/libcodec2/Config.in                   |  7 +++++
>  package/libcodec2/libcodec2.mk                | 23 ++++++++++++++
>  5 files changed, 88 insertions(+)
>  create mode 100644 package/libcodec2/0001-cross.patch
>  create mode 100644 package/libcodec2/0002-disable-unittest.patch
>  create mode 100644 package/libcodec2/Config.in
>  create mode 100644 package/libcodec2/libcodec2.mk

The two patches you added were not written in a way that makes them
upstreamable. Since upstream seems to be active, this is a little bit
sad.

So, I've replaced them by patches that can actually be upstream:

 * For generate_cookbook, I've added a patch that integrates the
   AX_CC_FOR_BUILD Autoconf macro from the GNU Autoconf Archive, and
   use that to build generate_cookbook.

 * For the unit tests, I've simply added a --enable/--disable option.

Could you take care of pushing the patches upstream? Another patch that
would be useful to push upstream is a patch to pass the subdir-objects
automake option, which would avoid a huge amount of warning when
autoreconfiguring the package.

I've applied your patch with those changes, to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
