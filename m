From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 18 Nov 2015 18:31:59 +0900
Subject: [Buildroot] package/gauche: fix build error on BR2_STATIC_LIBS
In-Reply-To: <201511180929.tAI9TATJ023961@ms-omx02.plus.so-net.ne.jp>
References: <201511180929.tAI9TATJ023961@ms-omx02.plus.so-net.ne.jp>
Message-ID: <8CEE50CE-A3EF-4714-B1F8-87782299C14C@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very sorry.
I forget to add [PATCH] in subject, I will send again.
Sorry bothering you.

Regards,
Kawashima

> 2015/11/18 18:29?Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp> ?????
> 
> Building gauche depends on dynamic link, so add dependency on
> !BR2_STATIC_LIBS.
> 
> Fix:
> http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92536419c1
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
> package/gauche/Config.in | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gauche/Config.in b/package/gauche/Config.in
> index 0720672..24377c4 100644
> --- a/package/gauche/Config.in
> +++ b/package/gauche/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GAUCHE
> 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 	depends on BR2_USE_MMU # fork()
> 	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on !BR2_STATIC_LIBS
> 	help
> 	  Gauche is an R7RS Scheme implementation developed to be a
> 	  handy script interpreter, which allows programmers and
> @@ -13,7 +14,7 @@ config BR2_PACKAGE_GAUCHE
> 
> 	  http://practical-scheme.net/gauche/
> 
> -comment "gauche needs a toolchain w/ NPTL"
> +comment "gauche needs a toolchain w/ NPTL, dynamic library"
> 	depends on BR2_USE_MMU
> 	depends on BR2_ARCH_HAS_ATOMICS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> ============================================================
>    Hiroshi Kawashima
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
