From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Aug 2012 23:35:36 +0200
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <5034054C.6050807@petroprogram.com>
References: <50240DDE.4000901@petroprogram.com>
 <20120810090232.7ca6f885@skate> <5024D8B5.2020605@petroprogram.com>
 <5033FDFF.7090704@mind.be> <5034054C.6050807@petroprogram.com>
Message-ID: <503A96A8.6090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/12 00:01, Stefan Fr?berg wrote:
> I forgotted to mention Thomas that that APNG patch is steadily updated
> inhttp://sourceforge.net/projects/libpng-apng/
>
> So keeping it updated between libpng versions is really not an issue.

  Even better!  Then you can make something like

ifeq ($(BR2_PACKAGE_LIBPNG_APNG_SUPPORT),y)
LIBPNG_PATCH = sf://libpng-apng/files/libpng15/$(LIBPNG_VERSION)/libpng-$(LIBPNG_VERSION)-apng.patch.gz
endif

(where sf:// is Yann's soon-to-be-interoduced abbreviation of the sourceforge
URLs).  As far as I know (but never tried it), the above should download and
apply the patch.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
