From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 00:24:06 +0100
Subject: [Buildroot] [PATCH 05/11] nfs-utils: reformat patch set as git
 patches
In-Reply-To: <d86142f877a476239ab6c3cf49f09cebb6f285f6.1352583641.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
 <d86142f877a476239ab6c3cf49f09cebb6f285f6.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50A03396.9050403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 22:42, Thomas Petazzoni wrote:
> As we will need to add more patches to nfs-utils, we need a correct
> ordering when applying patches. Therefore, reformat the patches to use
> a git format and git naming.
>
> The nfs-utils-dont-mix-flags.patch is no longer needed as it was
> patching Makefile.in files that were being regenerated due to the
> package having _AUTORECONF = YES. The Makefile.in are properly
> regenerated thanks to the nfs-utils-0002-Patch-taken-from-Gentoo.patch
> patch.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
[snip]
> diff --git a/package/nfs-utils/nfs-utils-cross-build.patch b/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
> similarity index 69%
> rename from package/nfs-utils/nfs-utils-cross-build.patch
> rename to package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
> index 43928bf..e310c49 100644
> --- a/package/nfs-utils/nfs-utils-cross-build.patch
> +++ b/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
> @@ -1,7 +1,17 @@
> -Patch taken from Gentoo.
> +From 971389625c9602085d399d8ae7fc42b75efcfb7c Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias<gustavo@zacarias.com.ar>
> +Date: Sat, 10 Nov 2012 18:56:12 +0100
> +Subject: [PATCH] Patch taken from Gentoo

  Could you take the opportunity to improve the patch description a bit?

[snip]
> diff --git a/package/nfs-utils/nfs-utils-susv3-legacy.patch b/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
> similarity index 50%
> rename from package/nfs-utils/nfs-utils-susv3-legacy.patch
> rename to package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
> index 66dd181..82a6c43 100644
> --- a/package/nfs-utils/nfs-utils-susv3-legacy.patch
> +++ b/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
> @@ -1,11 +1,20 @@
> -Switch legacy index() in favour of strchr()
> -Updated for 1.2.6 from the previous patch by Frederik Pasch.
> +From 636e78e4c9bc8be174805bde2f3ae7f940dc3d0e Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias<gustavo@zacarias.com.ar>
> +Date: Sat, 10 Nov 2012 18:58:15 +0100
> +Subject: [PATCH] Switch legacy index() in favour of strchr() Updated for
> + 1.2.6 from the previous patch by Frederik Pasch.

  There should be an extra newline here.

[snip]
> +--
> +1.7.9.5
> +

  Minor nit: this git version number is also something that is in the way for
refreshing patches.  I posted a script a while ago to generate patches from
git, and it strips those lines from the patches.

[snip]

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
