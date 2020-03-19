From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 18:58:54 +0100
Subject: [Buildroot] [PATCH] package/tinyproxy: use the release tarball,
 not a git clone
In-Reply-To: <20200319140444.5749-1-alexander.i.mukhin@gmail.com>
References: <20200315230739.67c238b5@windsurf.home>
 <20200319140444.5749-1-alexander.i.mukhin@gmail.com>
Message-ID: <20200319175854.GG10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2020-03-19 17:04 +0300, Alexander Mukhin spake thusly:
> Upstream ships distribution tarballs with pre-built manpages and
> necessary fixes, so that the build doesn't break if asciidoc is not
> available.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-Makefile.am-remove-docs-subdir.patch | 27 -------------------
>  package/tinyproxy/tinyproxy.hash              |  2 +-
>  package/tinyproxy/tinyproxy.mk                |  6 ++---
>  3 files changed, 3 insertions(+), 32 deletions(-)
>  delete mode 100644 package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch
> 
> diff --git a/package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch b/package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch
> deleted file mode 100644
> index e2a08678a3..0000000000
> --- a/package/tinyproxy/0001-Makefile.am-remove-docs-subdir.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 7ce6ee22057489d280e0ea5f6439edbbf0ad7ee2 Mon Sep 17 00:00:00 2001
> -From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> -Date: Sat, 14 Mar 2020 12:45:29 +0300
> -Subject: [PATCH] Makefile.am: remove docs subdir
> -
> -This avoids building the documentation, which requires asciidoc.
> -
> -Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ----
> - Makefile.am | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index e9113c2..2fe3d54 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -2,7 +2,6 @@ SUBDIRS = \
> - 	src \
> - 	data \
> - 	etc \
> --	docs \
> - 	m4macros \
> - 	tests
> - 
> --- 
> -2.20.1
> -
> diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
> index 2d439de517..099c974881 100644
> --- a/package/tinyproxy/tinyproxy.hash
> +++ b/package/tinyproxy/tinyproxy.hash
> @@ -1,2 +1,2 @@
>  # locally computed
> -sha256 ff4f3d1331d6d855d8b6ed794c22ab0a4285dd81fe9c98a7aa7ed591248d4ab9 tinyproxy-1.10.0.tar.gz
> +sha256 a23a8f647f622f01e51b93fa882ea5a15c20e026d45c3aafa81ec579e464daf7 tinyproxy-1.10.0.tar.bz2
> diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
> index f1a2a50c32..305be922f5 100644
> --- a/package/tinyproxy/tinyproxy.mk
> +++ b/package/tinyproxy/tinyproxy.mk
> @@ -5,11 +5,9 @@
>  ################################################################################
>  
>  TINYPROXY_VERSION = 1.10.0
> -TINYPROXY_SITE = $(call github,tinyproxy,tinyproxy,$(TINYPROXY_VERSION))
> +TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINYPROXY_VERSION)
> +TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.bz2
>  TINYPROXY_LICENSE = GPL-2.0+
>  TINYPROXY_LICENSE_FILES = COPYING
>  
> -# building from a git clone and patching Makefile.am
> -TINYPROXY_AUTORECONF = YES
> -
>  $(eval $(autotools-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
