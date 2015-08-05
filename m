From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 05 Aug 2015 22:02:19 +0200
Subject: [Buildroot] [PATCH] package/libcec: needs gcc >= 4.7
References: <1438797957-14814-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <bn6a9cxtgu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 05 Aug 2015 20:05:57 +0200 schrieb Yann E. MORIN:

> As per upstream, gcc-4.7 is required to build libcec:
>     https://github.com/Pulse-Eight/libcec/
issues/78#issuecomment-91578591
> 
> Fixes:
>     http://autobuild.buildroot.org/
results/3b5/3b5611725c13668472482ed4ad3b46886d4c63d9/
>     http://autobuild.buildroot.org/
results/0d0/0d032cdd8dbf6d0ddef392c3e5a734881e00ee64/
>     http://autobuild.buildroot.org/results/c21/
c21c555c38261f6911349ff9fdac6edeb4debaac/
>     [...]
> 
> Possibly fixes:
>     http://autobuild.buildroot.org/
results/4a7/4a7b2af2fc3924255ac89e18f4f5c90bb8383265/
>     http://autobuild.buildroot.org/results/dd6/
dd61c186e6d85a9b30cd32edb74a52f7a4f73cc8/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN"
> <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in   | 4 +++-
>  package/libcec/Config.in | 6 ++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in index
> c3b3183..797f59d 100644 --- a/package/kodi/Config.in +++
> b/package/kodi/Config.in @@ -158,13 +158,15 @@ config
> BR2_PACKAGE_KODI_LIBCEC
>  	bool "hdmi cec"
>  	depends on !BR2_STATIC_LIBS # libcec depends on 
BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libcec

Hi Yann,

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
