From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 02 May 2011 10:45:19 -0500
Subject: [Buildroot] [PATCH] usbutils: install into staging directory
 (needed by udev)
In-Reply-To: <8762ptun2f.fsf@macbook.be.48ers.dk>
References: <a1ee6c8c1a0d28005dfa4b6e8fff9bbe0637bf07.1304254799.git.smiley73@users.sourceforge.net>
	<8762ptun2f.fsf@macbook.be.48ers.dk>
Message-ID: <20110502104519.91442e7rgeoozyjo@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Peter Korsgaard <jacmet@uclibc.org>:

>>>>>> "heiko" == heiko  <heiko@zuerker.org> writes:
>
>  heiko> From: Heiko Zuerker <smiley73@users.sourceforge.net>
>  heiko> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
>  heiko> ---
>  heiko>  package/usbutils/usbutils.mk |    1 +
>  heiko>  1 files changed, 1 insertions(+), 0 deletions(-)
>
>  heiko> diff --git a/package/usbutils/usbutils.mk  
> b/package/usbutils/usbutils.mk
>  heiko> index bd50a5f..a034ddc 100644
>  heiko> --- a/package/usbutils/usbutils.mk
>  heiko> +++ b/package/usbutils/usbutils.mk
>  heiko> @@ -7,6 +7,7 @@
>  heiko>  USBUTILS_VERSION = 002
>  heiko>  USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
>  heiko>  USBUTILS_DEPENDENCIES = host-pkg-config libusb
>  heiko> +USBUTILS_INSTALL_STAGING = YES
>
> Out of interest, what is this for exactly? the .pc file or usb.ids?

It fails during the udev configure because it can't find the .pc file.

> Anyway, committed - Thanks.

Thanks

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
