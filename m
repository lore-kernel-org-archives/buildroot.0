From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:04:40 +0200
Subject: [Buildroot] [PATCH 16/32 v2] package/matchbox-common: fix
 dependencies
In-Reply-To: <9fa81fd7cbd6c1694dd4718ccf1ec24fe45f63fe.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
 <9fa81fd7cbd6c1694dd4718ccf1ec24fe45f63fe.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <20150609230440.6a91bd70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  3 Jun 2015 22:41:33 +0200, Yann E. MORIN wrote:
> matchbox-common can be used by both matchbox-desktop and matchbox-panel,
> so it needs to depend on either, not both.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/matchbox-common/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
> index 33d6cc4..5a038e1 100644
> --- a/package/matchbox-common/Config.in
> +++ b/package/matchbox-common/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_MATCHBOX_COMMON
>  	bool "matchbox-common"
>  	select BR2_PACKAGE_MATCHBOX_LIB
> -	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
> +	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
>  	help
>  	  Common desktop folders and matchbox-session script.
>  

I'll apply because I want to apply the rest of the series, but why are
we doing this in the first place? I don't think packages in Buildroot
have a "depends on" on things that can *use* them. The dependencies in
Buildroot are always the other way around: you use a 'depends on' or a
'select' because you need some other thing.

Why isn't matchbox-common maybe always visible, like we do for all
packages ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
