From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:36:06 +0200
Subject: [Buildroot] [PATCH 04/30] package/matchbox: make matchbox-panel
 a real package
In-Reply-To: <9d8e6092e50ef50a78cd450f4a9daec38f374949.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <9d8e6092e50ef50a78cd450f4a9daec38f374949.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <553965C6.7010407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Currently, matchbox-panel is treated as if it were an option of the
> matchbox package.
> 
> But that's not true, since it is a real package all by itself, with its
> own archive and its own buildsystem.
> 
> So, make it a real package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 (on condition that it goes to matchbox/matchbox-panel)

 Regards,
 Arnout
> ---
>  package/matchbox/Config.in                | 7 +------
>  package/matchbox/matchbox-panel/Config.in | 6 ++++++
>  2 files changed, 7 insertions(+), 6 deletions(-)
>  create mode 100644 package/matchbox/matchbox-panel/Config.in
> 
> diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> index 15b1017..e791cea 100644
> --- a/package/matchbox/Config.in
> +++ b/package/matchbox/Config.in
> @@ -21,12 +21,7 @@ if BR2_PACKAGE_MATCHBOX
>  
>  source "package/matchbox/matchbox-lib/Config.in"
>  source "package/matchbox/matchbox-wm/Config.in"
> -
> -config BR2_PACKAGE_MATCHBOX_PANEL
> -	bool "Matchbox Panel"
> -	help
> -	  A flexible always present 'window bar' for holding
> -	  application launchers.
> +source "package/matchbox/matchbox-panel/Config.in"
>  
>  config BR2_PACKAGE_MATCHBOX_DESKTOP
>  	bool "Matchbox Desktop"
> diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox/matchbox-panel/Config.in
> new file mode 100644
> index 0000000..e3daaf5
> --- /dev/null
> +++ b/package/matchbox/matchbox-panel/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_MATCHBOX_PANEL
> +	bool "Matchbox Panel"
> +	select BR2_PACKAGE_MATCHBOX_LIB
> +	help
> +	  A flexible always present 'window bar' for holding
> +	  application launchers.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
