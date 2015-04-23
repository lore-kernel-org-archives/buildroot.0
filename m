From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:49:52 +0200
Subject: [Buildroot] [PATCH 05/30] package/matchbox: make
 matchbox-desktop a real package
In-Reply-To: <40921cd751a3d6dc2bca91cb2ad74001733f6931.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <40921cd751a3d6dc2bca91cb2ad74001733f6931.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396900.90701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Currently, matchbox-desktop is treated as if it were an option of the
> matchbox package.
> 
> But that's not true, since it is a real package all by itself, with its
> own archive and its own buildsystem.
> 
> So, make it a real package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One remark below...

> ---
>  package/matchbox/Config.in                  | 7 +------
>  package/matchbox/matchbox-desktop/Config.in | 5 +++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  create mode 100644 package/matchbox/matchbox-desktop/Config.in
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index e791cea..39aff3c 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -22,12 +22,7 @@ if BR2_PACKAGE_MATCHBOX
>  source "package/matchbox/matchbox-lib/Config.in"
>  source "package/matchbox/matchbox-wm/Config.in"
>  source "package/matchbox/matchbox-panel/Config.in"
> -
> -config BR2_PACKAGE_MATCHBOX_DESKTOP
> -	bool "Matchbox Desktop"
> -	select BR2_PACKAGE_ZLIB
> -	help
> -	  A PDA style application launcher or 'item browser'.
> +source "package/matchbox/matchbox-desktop/Config.in"

 Note that things should be sorted alphabetically. But I think that can better
be combined with the one-directory-up patch.

 Regards,
 Arnout

>  
>  config BR2_PACKAGE_MATCHBOX_COMMON
>  	bool "Matchbox session common files"
> diff --git a/package/matchbox/matchbox-desktop/Config.in b/package/matchbox/matchbox-desktop/Config.in
> new file mode 100644
> index 0000000..c9fd196
> --- /dev/null
> +++ b/package/matchbox/matchbox-desktop/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_MATCHBOX_DESKTOP
> +	bool "Matchbox Desktop"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  A PDA style application launcher or 'item browser'.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
