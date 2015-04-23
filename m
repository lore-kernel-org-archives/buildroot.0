From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Apr 2015 00:26:43 +0200
Subject: [Buildroot] [PATCH 13/30] package/matchbox: fix option prompts
In-Reply-To: <627b2a8dc8d8772672b79e7bd2f3d36eb401dca1.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <627b2a8dc8d8772672b79e7bd2f3d36eb401dca1.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <553971A3.7040808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Use the package names instead of some fancy human-readable strings. ;-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/matchbox/Config.in                   | 2 +-
>  package/matchbox/matchbox-common/Config.in   | 4 ++--
>  package/matchbox/matchbox-desktop/Config.in  | 2 +-
>  package/matchbox/matchbox-keyboard/Config.in | 2 +-
>  package/matchbox/matchbox-panel/Config.in    | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 7d06bb2..e58aaf2 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_MATCHBOX
> -	bool "MatchBox Window Manager"
> +	bool "matchbox"

 Not so sure about this one... The upstream name is matchbox-window-manager, and
it is useful information that it's a window manager. OTOH that's already in the
comment right above it.

 So in the end I'm OK either way.

 Regards,
 Arnout

>  	depends on BR2_PACKAGE_XORG7
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_FONTCONFIG
> diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
> index 7d22d05..f1c4ce3 100644
> --- a/package/matchbox/matchbox-common/Config.in
> +++ b/package/matchbox/matchbox-common/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_MATCHBOX_COMMON
> -	bool "Matchbox session common files"
> +	bool "matchbox-common"
>  	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
>  	help
>  	  Common desktop folders and matchbox-session script.
>  
>  config BR2_PACKAGE_MATCHBOX_COMMON_PDA
> -	bool "PDA style desktop folders"
> +	bool "PDA style app folder"
>  	depends on BR2_PACKAGE_MATCHBOX_COMMON
> diff --git a/package/matchbox/matchbox-desktop/Config.in b/package/matchbox/matchbox-desktop/Config.in
> index c9fd196..ed80c22 100644
> --- a/package/matchbox/matchbox-desktop/Config.in
> +++ b/package/matchbox/matchbox-desktop/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_MATCHBOX_DESKTOP
> -	bool "Matchbox Desktop"
> +	bool "matchbox-desktop"
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  A PDA style application launcher or 'item browser'.
> diff --git a/package/matchbox/matchbox-keyboard/Config.in b/package/matchbox/matchbox-keyboard/Config.in
> index e017358..056a255 100644
> --- a/package/matchbox/matchbox-keyboard/Config.in
> +++ b/package/matchbox/matchbox-keyboard/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_MATCHBOX_KEYBOARD
> -	bool "Matchbox Virtual Keyboard"
> +	bool "matchbox-keyboard"
>  	select BR2_PACKAGE_XLIB_LIBXTST
>  	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_MATCHBOX_FAKEKEY
> diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox/matchbox-panel/Config.in
> index e3daaf5..47bd10a 100644
> --- a/package/matchbox/matchbox-panel/Config.in
> +++ b/package/matchbox/matchbox-panel/Config.in
> @@ -1,5 +1,5 @@
>  config BR2_PACKAGE_MATCHBOX_PANEL
> -	bool "Matchbox Panel"
> +	bool "matchbox-panel"
>  	select BR2_PACKAGE_MATCHBOX_LIB
>  	help
>  	  A flexible always present 'window bar' for holding
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
