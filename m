From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Mar 2012 23:12:13 +0100
Subject: [Buildroot] [PATCH 06/20] usbutils: bump version to 005
In-Reply-To: <1331502489-5036-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 11 Mar 2012 18:47:55 -0300")
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k42qyegy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump usbutils version to 005 and also switch to a debian mirror since
 Gustavo> it's still missing upstream.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/usbutils/usbutils.mk |    6 ++++--
 Gustavo>  1 files changed, 4 insertions(+), 2 deletions(-)

 Gustavo> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
 Gustavo> index e89f02e..cebc085 100644
 Gustavo> --- a/package/usbutils/usbutils.mk
 Gustavo> +++ b/package/usbutils/usbutils.mk
 Gustavo> @@ -4,10 +4,12 @@
 Gustavo>  #
 Gustavo>  #############################################################
 
 Gustavo> -USBUTILS_VERSION = 004
 Gustavo> -USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 Gustavo> +USBUTILS_VERSION = 005
 Gustavo> +USBUTILS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbutils
 Gustavo> +USBUTILS_SOURCE = usbutils_$(USBUTILS_VERSION).orig.tar.gz
 Gustavo>  USBUTILS_DEPENDENCIES = host-pkg-config libusb
 Gustavo>  USBUTILS_INSTALL_STAGING = YES
 Gustavo> +USBUTILS_AUTORECONF = YES

Why do we need to autoreconf? We don't have any patches.

-- 
Bye, Peter Korsgaard
