From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 22:49:25 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libfuse3: fix build without C++
In-Reply-To: <20200420193230.1517772-1-fontaine.fabrice@gmail.com>
References: <20200420193230.1517772-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420204925.GJ5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-20 21:32 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/a6e64213f2910b2b81e79cb1e96e558413d7f70a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Use upstream patch
> 
>  ...on.build-libfuse-is-a-C-only-project.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
> 
> diff --git a/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch b/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
> new file mode 100644
> index 0000000000..279f590ce9
> --- /dev/null
> +++ b/package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch
> @@ -0,0 +1,39 @@
> +From fc25c5002cae23151309fce6059e230545fd4d82 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 20 Apr 2020 21:20:19 +0200
> +Subject: [PATCH] Do not require C++ compiler for building
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a6e64213f2910b2b81e79cb1e96e558413d7f70a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/libfuse/libfuse/commit/fc25c5002cae23151309fce6059e230545fd4d82]
> +---
> + example/meson.build | 2 +-
> + meson.build         | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/example/meson.build b/example/meson.build
> +index 3edddea9..2342df9c 100644
> +--- a/example/meson.build
> ++++ b/example/meson.build
> +@@ -31,7 +31,7 @@ foreach ex : threaded_examples
> +                install: false)
> + endforeach
> + 
> +-if not platform.endswith('bsd') and platform != 'dragonfly'
> ++if not platform.endswith('bsd') and platform != 'dragonfly' and add_languages('cpp', required : false)
> +     executable('passthrough_hp', 'passthrough_hp.cc',
> +                dependencies: [ thread_dep, libfuse_dep ],
> +                install: false)
> +diff --git a/meson.build b/meson.build
> +index 69b3630d..4428bdb9 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1,4 +1,4 @@
> +-project('libfuse3', ['cpp', 'c'], version: '3.9.1',
> ++project('libfuse3', ['c'], version: '3.9.1',
> +         meson_version: '>= 0.42',
> +         default_options: [ 'buildtype=debugoptimized' ])
> + 
> -- 
> 2.25.1
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
