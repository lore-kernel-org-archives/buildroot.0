From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:55:04 +0200
Subject: [Buildroot] [PATCH 08/30] package/matchbox: make
 matchbox-keyboard a real package
In-Reply-To: <726fbfea7c913e3e8e59a71dfe1d3f49b2c0113b.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <726fbfea7c913e3e8e59a71dfe1d3f49b2c0113b.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396A38.5070808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Currently, matchbox-keyboard is treated as if it were an option of the
> matchbox package.
> 
> But that's not true, since it is a real package all by itself, with its
> own archive and its own buildsystem.
> 
> So, make it a real package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/Config.in                   | 9 +--------
>  package/matchbox/matchbox-keyboard/Config.in | 7 +++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  create mode 100644 package/matchbox/matchbox-keyboard/Config.in
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 8d4ebc7..9b27d4d 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -25,13 +25,6 @@ source "package/matchbox/matchbox-panel/Config.in"
>  source "package/matchbox/matchbox-desktop/Config.in"
>  source "package/matchbox/matchbox-common/Config.in"
>  source "package/matchbox/matchbox-fakekey/Config.in"
> -
> -config BR2_PACKAGE_MATCHBOX_KEYBOARD
> -	bool "Matchbox Virtual Keyboard"
> -	select BR2_PACKAGE_XLIB_LIBXTST
> -	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
> -	select BR2_PACKAGE_MATCHBOX_FAKEKEY
> -	help
> -	  Virtual Keyboard
> +source "package/matchbox/matchbox-keyboard/Config.in"
>  
>  endif
> diff --git a/package/matchbox/matchbox-keyboard/Config.in b/package/matchbox/matchbox-keyboard/Config.in
> new file mode 100644
> index 0000000..e017358
> --- /dev/null
> +++ b/package/matchbox/matchbox-keyboard/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MATCHBOX_KEYBOARD
> +	bool "Matchbox Virtual Keyboard"
> +	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_MATCHBOX_FAKEKEY
> +	help
> +	  Virtual Keyboard
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
