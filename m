From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:52:16 +0200
Subject: [Buildroot] [PATCH 06/30] package/matchbox: make
 matchbox-common a real package
In-Reply-To: <3e3893d8a377276f8a62bdbb4a093b60d9977773.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <3e3893d8a377276f8a62bdbb4a093b60d9977773.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396990.4090601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Currently, matchbox-common is treated as if it were an option of the
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
>  package/matchbox/Config.in                 | 11 +----------
>  package/matchbox/matchbox-common/Config.in |  9 +++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  create mode 100644 package/matchbox/matchbox-common/Config.in
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 39aff3c..ead2649 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -23,16 +23,7 @@ source "package/matchbox/matchbox-lib/Config.in"
>  source "package/matchbox/matchbox-wm/Config.in"
>  source "package/matchbox/matchbox-panel/Config.in"
>  source "package/matchbox/matchbox-desktop/Config.in"
> -
> -config BR2_PACKAGE_MATCHBOX_COMMON
> -	bool "Matchbox session common files"
> -	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
> -	help
> -	  Common desktop folders and matchbox-session script.
> -
> -config BR2_PACKAGE_MATCHBOX_COMMON_PDA
> -	bool "PDA style desktop folders"
> -	depends on BR2_PACKAGE_MATCHBOX_COMMON
> +source "package/matchbox/matchbox-common/Config.in"
>  
>  config BR2_PACKAGE_MATCHBOX_KEYBOARD
>  	bool "Matchbox Virtual Keyboard"
> diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
> new file mode 100644
> index 0000000..7d22d05
> --- /dev/null
> +++ b/package/matchbox/matchbox-common/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_MATCHBOX_COMMON
> +	bool "Matchbox session common files"
> +	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
> +	help
> +	  Common desktop folders and matchbox-session script.
> +
> +config BR2_PACKAGE_MATCHBOX_COMMON_PDA
> +	bool "PDA style desktop folders"
> +	depends on BR2_PACKAGE_MATCHBOX_COMMON
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
