From: Christian Stewart <christian@paral.in>
Date: Mon, 27 Jul 2015 16:55:32 +0000
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: remove debugging
	patch
In-Reply-To: <1438014835-11707-1-git-send-email-christian@paral.in>
References: <1438014835-11707-1-git-send-email-christian@paral.in>
Message-ID: <CA+h8R2p+nuD-RGX2fwZP9j0xJe2zRmaKWnXA+2Mbu8MW_StXBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I've just tested this version on an Odroid XU3 running ARM with an Edimax
USB wifi card. No debugging output without the insmod argument.

Tested-by: Christian Stewart <christian@paral.in>

Best,
Christian

On Mon, Jul 27, 2015 at 9:34 AM Christian Stewart <christian@paral.in>
wrote:

> This patch updates rtl8821au to include an upstream commit which
> disables debug output without a runtime insmod parameter debug=level.
> This makes the old buildroot patch to remove hardcoded debug defines
> unnecessary: as such, it has been removed.
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rtl8821au/0001-disable-default-debug.patch | 24
> ----------------------
>  package/rtl8821au/rtl8821au.mk                     |  2 +-
>  2 files changed, 1 insertion(+), 25 deletions(-)
>  delete mode 100644 package/rtl8821au/0001-disable-default-debug.patch
>
> diff --git a/package/rtl8821au/0001-disable-default-debug.patch
> b/package/rtl8821au/0001-disable-default-debug.patch
> deleted file mode 100644
> index de6fc62..0000000
> --- a/package/rtl8821au/0001-disable-default-debug.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Comment out the hardcoded debug defines. If extra debug is needed, we can
> add it
> -as a define in the make flags.
> -
> -Signed-off-by: Christian Stewart <christian@paral.in>
> -
> -diff --git a/include/autoconf.h b/include/autoconf.h
> ---- a/include/autoconf.h
> -+++ b/include/autoconf.h
> -@@ -130,12 +130,12 @@
> - /*
> -  * Debug Related Config
> -  */
> --#define DBG   1
> -+//#define DBG 1
> -
> --#define CONFIG_DEBUG /* DBG_871X, etc... */
> -+//#define CONFIG_DEBUG /* DBG_871X, etc... */
> - //#define CONFIG_DEBUG_RTL871X /* RT_TRACE, RT_PRINT_DATA, _func_enter_,
> _func_exit_ */
> -
> --#define CONFIG_PROC_DEBUG
> -+//#define CONFIG_PROC_DEBUG
> -
> -
> - //#define DBG_TX
> diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/
> rtl8821au.mk
> index d218e3c..eddb18e 100644
> --- a/package/rtl8821au/rtl8821au.mk
> +++ b/package/rtl8821au/rtl8821au.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -RTL8821AU_VERSION = f58e4a7fb27551bdbb4aee9db6086dd6ad996c8d
> +RTL8821AU_VERSION = fef8c9d67d076eee9dfb9e19cb7cb69815d5a207
>  RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
>  RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
>  RTL8821AU_LICENSE_FILES = COPYING
> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150727/b527b6e5/attachment.html>
