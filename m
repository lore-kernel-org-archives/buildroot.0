From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 08 Nov 2013 01:27:54 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: select BR2_LEGACY for
 module-init-tools legacy option
In-Reply-To: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <527C300A.4050809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/13 20:09, Thomas Petazzoni wrote:
> Commit 94c72087f3 ("module-init-tools: remove package") removed the
> module-init-tools package and therefore added the corresponding config
> option in Config.in.legacy. However, the commit forgot to add the
> "select BR2_LEGACY" that ensures the build cannot proceed until the
> user has acknowledged the change (i.e kmod replacing
> module-init-tools).
>
> This commit adds this missing "select BR2_LEGACY".
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   Config.in.legacy | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d02f0a6..587afe1 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -123,6 +123,7 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
>   	bool "module-init-tools replaced by kmod"
>   	select BR2_PACKAGE_KMOD
>   	select BR2_PACKAGE_KMOD_TOOLS
> +	select BR2_LEGACY
>   	help
>   	  The 'module-init-tools' package has been removed, since it
>   	  has been depracated upstream and replaced by 'kmod'.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
