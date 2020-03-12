From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Mar 2020 21:52:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.64.1
In-Reply-To: <20200312194144.3786382-1-aduskett@gmail.com>
References: <20200312194144.3786382-1-aduskett@gmail.com>
Message-ID: <20200312205219.GI705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-12 12:41 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Change -Dlibmount from a bool to a feature.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../libglib2/0001-fix-compile-time-atomic-detection.patch | 2 +-
>  .../libglib2/0002-allow-explicit-disabling-of-tests.patch | 2 +-
>  package/libglib2/0003-remove-cpp-requirement.patch        | 8 ++++----
>  ...-Add-Wno-format-nonliteral-to-compiler-arguments.patch | 2 +-
>  package/libglib2/libglib2.hash                            | 4 ++--
>  package/libglib2/libglib2.mk                              | 8 ++++----
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
> index a471275243..9d2381bb35 100644
> --- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
> +++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
> @@ -18,7 +18,7 @@ diff --git a/glib/gthread-posix.c b/glib/gthread-posix.c
>  index 71a6b7b..d09d029 100644
>  --- a/glib/gthread-posix.c
>  +++ b/glib/gthread-posix.c
> -@@ -68,7 +68,7 @@
> +@@ -73,7 +73,7 @@
>   #endif
>   
>   /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
> diff --git a/package/libglib2/0002-allow-explicit-disabling-of-tests.patch b/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
> index d6c62499c3..c865c04e03 100644
> --- a/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
> +++ b/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
> @@ -23,7 +23,7 @@ diff --git a/meson.build b/meson.build
>  index 99806d0..3206603 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -77,7 +77,7 @@ installed_tests_template = files('template.test.in')
> +@@ -84,7 +84,7 @@ installed_tests_template = files('template.test.in')
>   installed_tests_template_tap = files('template-tap.test.in')
>   
>   # Don?t build the tests unless we can run them (either natively, in an exe wrapper, or by installing them for later use)
> diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
> index d28f8ab81c..e6632cb062 100644
> --- a/package/libglib2/0003-remove-cpp-requirement.patch
> +++ b/package/libglib2/0003-remove-cpp-requirement.patch
> @@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
>  @@ -1,4 +1,4 @@
>  -project('glib', 'c', 'cpp',
>  +project('glib', 'c',
> -   version : '2.62.4',
> +   version : '2.64.1',
>     # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>     meson_version : '>= 0.49.2',
>  @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> @@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
>   
>   cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
>   
> -@@ -1484,20 +1483,6 @@ if g_have_iso_c_varargs
> +@@ -1548,20 +1547,6 @@ if g_have_iso_c_varargs
>   #endif''')
>   endif
>   
> @@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
>   g_have_gnuc_varargs = cc.compiles('''
>     void some_func (void) {
>       int a(int p1, int p2, int p3);
> -@@ -2095,7 +2080,6 @@ subdir('gobject')
> +@@ -2167,7 +2152,6 @@ subdir('gobject')
>   subdir('gthread')
>   subdir('gmodule')
>   subdir('gio')
> @@ -79,7 +79,7 @@ diff --git a/tests/meson.build b/tests/meson.build
>  index e4ea226..7fd974c 100644
>  --- a/tests/meson.build
>  +++ b/tests/meson.build
> -@@ -56,11 +56,6 @@ tests = {
> +@@ -55,11 +55,6 @@ tests = {
>       'source': 'module-test.c',
>       'c_args': ['-DMODULE_TYPE="plugin"'],
>     },
> diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> index b76dd76f2f..f792ceba3f 100644
> --- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> +++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
> @@ -15,7 +15,7 @@ diff --git a/meson.build b/meson.build
>  index 3c615b7..7cae4e8 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -366,6 +366,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +@@ -372,6 +372,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
>       '-Wno-cast-function-type',
>  +    '-Wno-format-nonliteral',
>       # Due to function casts through (void*) we cannot support -Wpedantic:
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index e3478f06bb..345a01ba37 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.62/glib-2.62.4.sha256sum
> -sha256  4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc  glib-2.62.4.tar.xz
> +# https://download.gnome.org/sources/glib/2.64/glib-2.64.1.sha256sum
> +sha256  17967603bcb44b6dbaac47988d80c29a3d28519210b28157c2bd10997595bbc7  glib-2.64.1.tar.xz
>  # License files, locally calculated
>  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index f00818f69c..1b9eef7147 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBGLIB2_VERSION_MAJOR = 2.62
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
> +LIBGLIB2_VERSION_MAJOR = 2.64
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> @@ -80,10 +80,10 @@ endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> -LIBGLIB2_CONF_OPTS += -Dlibmount=true
> +LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
>  LIBGLIB2_DEPENDENCIES += util-linux
>  else
> -LIBGLIB2_CONF_OPTS += -Dlibmount=false
> +LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
>  endif
>  
>  # Purge useless binaries from target
> -- 
> 2.24.1
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
