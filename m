From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Nov 2015 22:48:31 +0100
Subject: [Buildroot] [git commit] Revert "system: Fix warning when
 selecting systemd"
In-Reply-To: <20151109205943.8954F81DE4@busybox.osuosl.org>
References: <20151109205943.8954F81DE4@busybox.osuosl.org>
Message-ID: <564114AF.4020103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-11-15 21:40, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=adcc48e0b25fb6a9759bc8d889badbbad9e02954
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This reverts commit b4718c3a28fc3b178253b24bd6fbb8540a724c7e.
> 
> The BR2_ROOTFS_MERGED_USR symbol is used to activate various workarounds for
> a merged /usr by packages, so it should be active even with a custom rootfs
> skeleton.

 The problem is that with a custom skeleton, we don't know if it is merged /usr
or not. If it is not merged, then our workarounds are wrong. But of course, with
a custom skeleton, all bets are off...

 I guess we should at least mention in a help text somewhere that for systemd
the custom skeleton must have merged /usr.


 Regards,
 Arnout


> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  system/Config.in |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 92712a8..4d07010 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -92,7 +92,7 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> -	select BR2_ROOTFS_MERGED_USR if BR2_ROOTFS_SKELETON_DEFAULT
> +	select BR2_ROOTFS_MERGED_USR
>  	select BR2_PACKAGE_SYSTEMD
>  
>  comment "systemd needs (e)glibc toolchain, headers >= 3.10"
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
