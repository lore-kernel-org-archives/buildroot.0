From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Sep 2012 23:18:05 +0200
Subject: [Buildroot] [PATCH 1/2] pcsc-lite: new package
In-Reply-To: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <5058E50D.8040005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/18/12 14:15, Waldemar Rymarkiewicz wrote:
> +PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb
> +PCSC_LITE_DEPENDENCIES = libusb

  IIRC, libusb is really optional for pcsc-lite. You can use a
construct like:

ifeq ($(BR2_PACKAGE_LIBUSB),y)
PCSC_LITE_CONF_OPT += --enable-libusb
PCSC_LITE_DEPENDENCIES += libusb
else
PCSC_LITE_CONF_OPT += --disable-libusb
endif


  And maybe similarly for udev.


  Your mileage may vary, though. And I think the HAS_THREADS may
still be needed for pcsc-lite itself.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
