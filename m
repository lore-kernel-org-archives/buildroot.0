From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:50:47 +0100
Subject: [Buildroot] [PATCH 2/5] Revert "qt5base: install bundled fonts
 to target"
In-Reply-To: <1478601048-21388-3-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <1478601048-21388-3-git-send-email-anaumann@ultratronik.de>
Message-ID: <430951a1-e5e8-184c-e1b0-78bea7dd74b9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:30, Andreas Naumann wrote:
> qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645
> 
> This reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384.
> 
> Conflicts:
> 	package/qt5/qt5base/qt5base.mk
> 
> Conflicts:
> 	package/qt5/qt5base/qt5base.mk
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

 Remove the Conflicts: lines. Otherwise looks good.

 Regards,
 Arnout

> ---
>  package/qt5/qt5base/qt5base.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index f4ca921..e49718e 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -234,13 +234,6 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
>  	fi
>  endef
>  
> -define QT5BASE_INSTALL_TARGET_FONTS
> -	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
> -		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
> -		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
> -	fi
> -endef
> -
>  define QT5BASE_INSTALL_TARGET_EXAMPLES
>  	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
>  		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
