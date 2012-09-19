From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 22:56:42 +0200
Subject: [Buildroot] [PATCH v2 2/2] ccid: new package
In-Reply-To: <1348059150-32601-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <1348059150-32601-2-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <505A318A.6080107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 14:52, Waldemar Rymarkiewicz wrote:
> PC/SC driver for USB CCID smart card readers.
[snip]
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +CCID_CONF_OPT += --enable-libusb
> +CCID_DEPENDENCIES += libusb
> +else
> +CCID_CONF_OPT += --disable-libusb
> +endif
> +
> +$(eval $(call autotools-package))

  I just build-tested on a config without libusb, and it doesn't seem
to install anything.  The examples are compiled (not installed), but
I doubt they're useful for anything without the ccid plugin.

  So maybe it's better to select libusb after all.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
