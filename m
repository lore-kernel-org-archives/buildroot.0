From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jul 2017 18:08:20 +0200
Subject: [Buildroot] [PATCH 3/3 v3] package/ifupdown-scripts: allow use
 with a custom skeleton
In-Reply-To: <7af4e1b5c5c358fd2a41e609ea250138a5565c18.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
 <7af4e1b5c5c358fd2a41e609ea250138a5565c18.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <238a54c3-4de7-35bf-bf51-a09061fb88b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-07-17 16:35, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 You'll also send a patch adding a select to package/ifupdown/Config.in?

 Regards,
 Arnout

> ---
>  package/ifupdown-scripts/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
> index 7086253a03..7064d58fec 100644
> --- a/package/ifupdown-scripts/Config.in
> +++ b/package/ifupdown-scripts/Config.in
> @@ -1,8 +1,7 @@
>  config BR2_PACKAGE_IFUPDOWN_SCRIPTS
> -	bool
> -	depends on BR2_ROOTFS_SKELETON_DEFAULT
> +	bool "ifupdown scripts"
>  	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
> -	default y
> +	default y if BR2_ROOTFS_SKELETON_DEFAULT
>  	help
>  	  Set of scripts used by ifupdown (either the standalone one, or the
>  	  busybox one) to bring network up, or tear it down.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
