From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 11:53:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix endianess detection
 with musl-based toolchains
In-Reply-To: <20161104202058.21533-1-bernd.kuhls@t-online.de>
References: <20161104202058.21533-1-bernd.kuhls@t-online.de>
Message-ID: <20161105115329.37cac9f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 Nov 2016 21:20:58 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/e27/e27a9a95f72dba3076549beb2a2ccfdbea2fcfee/
> http://autobuild.buildroot.net/results/462/4629ee4813aa36de884bba2576612f909c007264/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ness-detection-with-musl-based-toolchains.patch | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/mesa3d/0004-Fix-endianess-detection-with-musl-based-toolchains.patch

Applied to master, thanks. However, your patch is not acceptable
upstream: you got the feedback that it would break OpenBSD. I guess
more autoconf checks are needed.

Perhaps they should use the standard AC_C_BIGENDIAN autoconf macro,
instead of playing tricks with platform-specific header files?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
