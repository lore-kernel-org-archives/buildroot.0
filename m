From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Mar 2014 23:54:54 +0100
Subject: [Buildroot] [PATCH 2 of 4] qwt: use TARGET_MAKE_ENV when
 running make and qmake
In-Reply-To: <163c8448b6f2a17be27d.1395257407@argentina>
References: <patchbomb.1395257405@argentina>
 <163c8448b6f2a17be27d.1395257407@argentina>
Message-ID: <5332093E.9010006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/14 20:30, Thomas De Schampheleire wrote:
> This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
> lines, to make sure PATH is set correctly, and to line up with the qt5
> packages that do this consistently.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
>  package/qwt/qwt.mk |  4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -28,11 +28,11 @@ endif
>  
>  define QWT_CONFIGURE_CMDS
>  	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
> -	(cd $(@D); $(QT_QMAKE))
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
>  endef
>  
>  define QWT_BUILD_CMDS
> -	$(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  # After installation, we fixup the INSTALL_PREFIX in qwtconfig.pri so
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
