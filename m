From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Mar 2016 19:25:56 +0100
Subject: [Buildroot] [PATCH 1/1] qt: get rid of extra spaces in license
 file list
In-Reply-To: <1456887280-2465-1-git-send-email-danomimanchego123@gmail.com>
References: <1456887280-2465-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <56D73034.2030605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/16 03:54, Danomi Manchego wrote:
> Use "QT_LICENSE := $(QT_LICENSE), xxxx" construct to get rid of the
> extra spaces before commas added by the font license clauses.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> 
> ---
> 
> We discussed this over the mailing list.  Since I had the changes
> anyway for proof of concept, I turned it around into a patch.
> ---
>  package/qt/qt.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index c4fff2d..f29a671 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -18,9 +18,9 @@ QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR
>  QT_DEPENDENCIES = host-pkgconf
>  QT_INSTALL_STAGING = YES
>  
> -QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
> +QT_LICENSE := LGPLv2.1 with exceptions or GPLv3
>  ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
> -QT_LICENSE += or Digia Qt Commercial license
> +QT_LICENSE := $(QT_LICENSE) or Digia Qt Commercial license

 += could have been kept in this case, but it's nicer to have a parallel
structure in the entire file.

 Regards,
 Arnout

>  endif
>  QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
>  
> @@ -663,14 +663,14 @@ endef
>  ifneq ($(BR2_PACKAGE_QT_FONT_MICRO)$(BR2_PACKAGE_QT_FONT_FIXED),)
>  # as stated in the font source src/3rdparty/fonts/micro.bdf
>  # source src/3rdparty/fonts/5x7.bdf and source src/3rdparty/fonts/6x13.bdf
> -QT_LICENSE += , Public Domain (Micro/Fixed font)
> +QT_LICENSE := $(QT_LICENSE), Public Domain (Micro/Fixed font)
>  endif
>  ifneq ($(BR2_PACKAGE_QT_FONT_HELVETICA)$(BR2_PACKAGE_QT_FONT_JAPANESE),)
> -QT_LICENSE += , Adobe Helvetica license (Helvetica/Japanese fonts)
> +QT_LICENSE := $(QT_LICENSE), Adobe Helvetica license (Helvetica/Japanese fonts)
>  QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
>  endif
>  ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
> -QT_LICENSE += , Freeware (Unifont font)
> +QT_LICENSE := $(QT_LICENSE), Freeware (Unifont font)
>  QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
>  endif
>  endif # QT_FONTS
> @@ -680,7 +680,7 @@ define QT_INSTALL_TARGET_FONTS_TTF
>  	mkdir -p $(TARGET_DIR)/usr/lib/fonts
>  	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
>  endef
> -QT_LICENSE += , Bitstream license (DejaVu/Vera TrueType fonts)
> +QT_LICENSE := $(QT_LICENSE), Bitstream license (DejaVu/Vera TrueType fonts)
>  QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
>  	src/3rdparty/fonts/README.DejaVu \
>  	src/3rdparty/fonts/COPYRIGHT.Vera
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
