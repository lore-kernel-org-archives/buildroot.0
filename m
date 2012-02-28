From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 20:56:57 +0000
Subject: [Buildroot] [PATCH 2/3] qt: Install QtDeclarative imports
In-Reply-To: <874nudi8ro.fsf@macbook.be.48ers.dk>
References: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
 <1330258388-28391-2-git-send-email-ismael.luceno@gmail.com>
 <874nudi8ro.fsf@macbook.be.48ers.dk>
Message-ID: <201202282056.57874.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 26 February 2012 21:28:59 Peter Korsgaard wrote:
>  Ismael>  # Plugin installation
>  Ismael>  define QT_INSTALL_TARGET_PLUGINS
>  Ismael> +      mkdir -p $(TARGET_DIR)/usr/lib/qt
>  Ismael>        if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
>  Ismael> -              mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
>  Ismael> -              cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
>  Ismael> +              cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins $(TARGET_DIR)/usr/lib/qt ; \
>  Ismael> +      fi
>  Ismael> +      if [ -d $(@D)/imports ] ; then \
>  Ismael> +              cp -dpfr $(@D)/imports $(TARGET_DIR)/usr/lib/qt ; \
> 
> It would make more sense to add the mkdir -p inside this
> conditional. Is there any reason why you are copying from the source
> directory and not staging like above?

 In fact, it would be simpler if the whole thing was copied from the 
staging dir, i.e.

if [ -d $(STAGING_DIR)/usr/lib/qt ]; then
  mkdir -p $(TARGET_DIR)/usr/lib
  cp -dpfr $(STAGING_DIR)/usr/lib/qt $(TARGET_DIR)/usr/lib
fi


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
