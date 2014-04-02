From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Apr 2014 08:19:22 +0200
Subject: [Buildroot] [PATCH 4/6] package/vlc: depends on the virtual
 package libgl
In-Reply-To: <44a8749bc3ef2c283fa679da79efd8764e482682.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <44a8749bc3ef2c283fa679da79efd8764e482682.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <533BABEA.4030802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/14 00:00, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, vlc depends on mesa3d to provide the openGL support.
> 
> We now have a virtual package, libgl, which ensures openGL is available.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
>  package/vlc/vlc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index a9ee620..f78f209 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -118,9 +118,9 @@ else
>  VLC_CONF_OPT += --disable-flac
>  endif
>  
> -ifeq ($(BR2_PACKAGE_MESA3D),y)
> +ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
>  VLC_CONF_OPT += --enable-glx

 Since the option is called enable-glx, it sounds as if it should depend
on X as well (I don't think wayland has glx, right?)

 Regards,
 Arnout

> -VLC_DEPENDENCIES += mesa3d
> +VLC_DEPENDENCIES += libgl
>  else
>  VLC_CONF_OPT += --disable-glx
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
