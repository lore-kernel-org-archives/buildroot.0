From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Sep 2012 17:11:30 +0200
Subject: [Buildroot] [PATCH v3 2/2] ccid: new package
In-Reply-To: <1348212739-32093-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <1348212739-32093-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <50686122.5080601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/09/12 09:32, Waldemar Rymarkiewicz wrote:
> PC/SC driver for USB CCID smart card readers.
>
> http://pcsclite.alioth.debian.org/ccid.html
>
> Signed-off-by: Waldemar Rymarkiewicz<waldemar.rymarkiewicz@tieto.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
> new file mode 100644
> index 0000000..d24f75d
> --- /dev/null
> +++ b/package/ccid/ccid.mk
> @@ -0,0 +1,12 @@
> +##########################################################
> +#
> +# CCID
> +#
> +# ########################################################
> +CCID_VERSION = 1.4.7
> +CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
> +CCID_SITE = https://alioth.debian.org/frs/download.php/3730
> +CCID_INSTALL_STAGING = YES
> +CCID_DEPENDENCIES = pcsc-lite host-pkg-config libusb
> +
> +$(eval $(call autotools-package))

  When installing, ccid says:
copy the src/92_pcscd_ccid.rules file in udev directory (/etc/udev/rules.d/)
Perhaps it would be a good idea to do that?  (If BR2_PACKAGE_UDEV, of course)

  Also, ccid has the same --enable-embedded option as pcsc-lite.  I'm not
sure if it is functional, though.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
