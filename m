From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 07:59:40 +0100
Subject: [Buildroot] [PATCH v2 4/7] mesa3d: pull out from x11
In-Reply-To: <BLU0-SMTP224311C980B3CDE2A4B1CB4D9AA0@phx.gbl>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP224311C980B3CDE2A4B1CB4D9AA0@phx.gbl>
Message-ID: <52F1E15C.6070307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 19:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
> v2: rebased v1
> v1: rebased Spenser Gilliland?s patch:
>     http://patchwork.ozlabs.org/patch/278302/

 Again, retain the original SoB.

> 
>  package/Config.in                                  |    1 +
>  package/{x11r7 => }/mesa3d/Config.in               |    0
>  .../{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch  |    0
>  package/{x11r7 => }/mesa3d/mesa3d.mk               |    0
>  package/x11r7/Config.in                            |    1 -
>  5 files changed, 1 insertion(+), 1 deletion(-)
>  rename package/{x11r7 => }/mesa3d/Config.in (100%)
>  rename package/{x11r7 => }/mesa3d/mesa3d-uclibc-locale.patch (100%)
>  rename package/{x11r7 => }/mesa3d/mesa3d.mk (100%)
> 
> diff --git a/package/Config.in b/package/Config.in
> index f4903ba..3baf5eb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -314,6 +314,7 @@ source "package/lvm2/Config.in"
>  source "package/mdadm/Config.in"
>  source "package/media-ctl/Config.in"
>  source "package/memtester/Config.in"
> +source "package/mesa3d/Config.in"

 Maybe this was commented on before, but: Hardware handling? Doesn't it
fit better in either Graphic libraries or Libraries/Graphic?


 Regards,
 Arnout

>  source "package/minicom/Config.in"
>  source "package/nanocom/Config.in"
>  source "package/neard/Config.in"
> diff --git a/package/x11r7/mesa3d/Config.in b/package/mesa3d/Config.in
> similarity index 100%
> rename from package/x11r7/mesa3d/Config.in
> rename to package/mesa3d/Config.in
> diff --git a/package/x11r7/mesa3d/mesa3d-uclibc-locale.patch b/package/mesa3d/mesa3d-uclibc-locale.patch
> similarity index 100%
> rename from package/x11r7/mesa3d/mesa3d-uclibc-locale.patch
> rename to package/mesa3d/mesa3d-uclibc-locale.patch
> diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> similarity index 100%
> rename from package/x11r7/mesa3d/mesa3d.mk
> rename to package/mesa3d/mesa3d.mk
> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> index 5ef118b..458d09f 100644
> --- a/package/x11r7/Config.in
> +++ b/package/x11r7/Config.in
> @@ -15,7 +15,6 @@ if BR2_PACKAGE_XORG7
>  	endmenu
>  	menu "X11R7 Libraries"
>  		source package/x11r7/libxcb/Config.in
> -		source package/x11r7/mesa3d/Config.in
>  		source package/x11r7/xcb-util/Config.in
>  		source package/x11r7/xcb-util-image/Config.in
>  		source package/x11r7/xcb-util-keysyms/Config.in
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
