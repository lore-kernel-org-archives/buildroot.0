From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 08:02:41 +0200
Subject: [Buildroot] [PATCH 2 of 6 v2] linux: don't take HEAD as default
 for git repositories
In-Reply-To: <6d0a6d80647910c487ba.1374650579@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
 <6d0a6d80647910c487ba.1374650579@BEANTN0L019720>
Message-ID: <52087A81.4050404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/07/13 09:22, Thomas De Schampheleire wrote:
> Specifying a floating tag like HEAD for a repository version is bad practice,
> as it results in non-reproducible builds. This patch removes the default
> assignment of HEAD as version when a custom git repository is used for the
> Linux kernel.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I would still push this one in 2013.08.

  Regards,
  Arnout

>
> ---
> (v2): new patch in series after comment from Peter
>
>   linux/Config.in |  1 -
>   1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -68,7 +68,6 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_
>
>   config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
>   	string "Custom Git version"
> -	default "HEAD"
>   	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
>   	help
>   	  Git revision to use in the format used by git rev-parse,
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
