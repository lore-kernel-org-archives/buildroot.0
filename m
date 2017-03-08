From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Mar 2017 14:04:12 +0100
Subject: [Buildroot] [PATCH 4/6] python3: refresh Git formatted patches
In-Reply-To: <1488927631-21945-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1488927631-21945-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAGm1_ksoKant-hi3wFqAJWBs958PavovV5kEES_Pm8Yi_VrR=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 8, 2017 at 12:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This refreshes the set of python3 patches so they apply cleanly on the
> v3.5.2 tag of cpython Github repository.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...up.py-do-not-add-invalid-header-locations.patch |  8 ++++----
>  ...the-install-location-of-_sysconfigdata.py.patch | 22 ++++++++++----------
>  ...3-Make-the-build-of-pyc-files-conditional.patch | 14 ++++++-------
>  ...gy_getaddrinfo-configure-test-when-cross-.patch |  8 ++++----
>  ...ructure-to-disable-the-build-of-certain-e.patch | 16 +++++++--------
>  ...006-distutils-sysconfig-use-sysconfigdata.patch |  4 ++--
>  ...ibrary-header-paths-for-cross-compilation.patch |  6 +++---
>  ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  8 ++++----
>  .../python3/0009-Don-t-add-multiarch-paths.patch   |  8 ++++----
>  .../0010-Abort-on-failed-module-build.patch        |  8 ++++----
>  package/python3/0011-Serial-ioctl-workaround.patch |  4 ++--
>  ...st-the-shebang-of-Python-scripts-for-cros.patch |  4 ++--
>  ...-config.sh.in-ensure-sed-invocations-only.patch |  4 ++--
>  ...-harcode-invalid-path-to-ncursesw-headers.patch |  8 ++++----
>  ...stem-locale-and-set-to-default-when-addin.patch |  8 ++++----
>  ...0016-Add-importlib-fix-for-PEP-3147-issue.patch | 12 +++++------
>  ...on-to-disable-installation-of-test-module.patch | 14 ++++++-------
>  .../0018-Add-an-option-to-disable-pydoc.patch      | 22 ++++++++++----------
>  .../0019-Add-an-option-to-disable-lib2to3.patch    | 24 +++++++++++-----------
>  ...-Add-option-to-disable-the-sqlite3-module.patch | 16 +++++++--------
>  ...21-Add-an-option-to-disable-the-tk-module.patch | 16 +++++++--------
>  ...dd-an-option-to-disable-the-curses-module.patch | 14 ++++++-------
>  .../0023-Add-an-option-to-disable-expat.patch      | 18 ++++++++--------
>  .../0024-Add-an-option-to-disable-CJK-codecs.patch |  8 ++++----
>  .../0025-Add-an-option-to-disable-NIS.patch        |  8 ++++----
>  ...0026-Add-an-option-to-disable-unicodedata.patch |  8 ++++----
>  .../0027-Add-an-option-to-disable-IDLE.patch       | 20 +++++++++---------
>  .../0028-Add-an-option-to-disable-decimal.patch    | 12 +++++------
>  ...-option-to-disable-the-ossaudiodev-module.patch |  8 ++++----
>  ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch | 20 +++++++++---------
>  ...Add-an-option-to-disable-openssl-support.patch} |  9 +++++++-
>  31 files changed, 183 insertions(+), 176 deletions(-)
>  rename package/python3/{0031-Add-an-option-to-disable-openssl.patch => 0031-Add-an-option-to-disable-openssl-support.patch} (73%)
>
> diff --git a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
> index defaad9..4d8c897 100644
> --- a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
> +++ b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
> @@ -1,4 +1,4 @@
> -From d6093bad6c700312ff7ff4a7bb15c815dda6f46b Mon Sep 17 00:00:00 2001
> +From 093733d806e32ef47db5c6d2379d7c93ae71524b Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:28:34 +0100
>  Subject: [PATCH] setup.py: do not add invalid header locations
> @@ -28,10 +28,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index da67731..dbd2a3c 100644
> +index 174ce72..b67d913 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -511,7 +511,8 @@ class PyBuildExt(build_ext):
> +@@ -534,7 +534,8 @@ class PyBuildExt(build_ext):
>                           add_dir_to_list(dir_list, directory)
>
>           if os.path.normpath(sys.base_prefix) != '/usr' \
> @@ -42,5 +42,5 @@ index da67731..dbd2a3c 100644
>               # (PYTHONFRAMEWORK is set) to avoid # linking problems when
>               # building a framework with different architectures than
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
> index 8e930ab..6325397 100644
> --- a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
> +++ b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
> @@ -1,4 +1,4 @@
> -From 4ac038d30ec71b3f223ac7c91613856dd82b6347 Mon Sep 17 00:00:00 2001
> +From 1fca2c29a600b1eaa28da19e8c258fa0300c4eaf Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:29:04 +0100
>  Subject: [PATCH] Change the install location of _sysconfigdata.py
> @@ -25,10 +25,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   2 files changed, 11 insertions(+), 3 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 823def3..4d2a061 100644
> +index 87528a0..5a258e0 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -585,6 +585,9 @@ pybuilddir.txt: $(BUILDPYTHON)
> +@@ -588,6 +588,9 @@ pybuilddir.txt: $(BUILDPYTHON)
>                 rm -f ./pybuilddir.txt ; \
>                 exit 1 ; \
>         fi
> @@ -36,9 +36,9 @@ index 823def3..4d2a061 100644
>  +      mkdir -p `cat pysysconfigdatadir.txt`
>  +      cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
>
> - # Build the shared modules
> - # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
> -@@ -1235,7 +1238,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
> + # This is shared by the math and cmath modules
> + Modules/_math.o: Modules/_math.c Modules/_math.h
> +@@ -1261,7 +1264,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                 else    true; \
>                 fi; \
>         done
> @@ -47,7 +47,7 @@ index 823def3..4d2a061 100644
>         do \
>                 if test -x $$i; then \
>                         $(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
> -@@ -1245,6 +1248,11 @@ libinstall:     build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
> +@@ -1271,6 +1274,11 @@ libinstall:     build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                         echo $(INSTALL_DATA) $$i $(LIBDEST); \
>                 fi; \
>         done
> @@ -59,7 +59,7 @@ index 823def3..4d2a061 100644
>         @for d in $(LIBSUBDIRS); \
>         do \
>                 a=$(srcdir)/Lib/$$d; \
> -@@ -1580,7 +1588,7 @@ clean: pycremoval
> +@@ -1606,7 +1614,7 @@ clean: pycremoval
>         find build -name 'fficonfig.h' -exec rm -f {} ';' || true
>         find build -name '*.py' -exec rm -f {} ';' || true
>         find build -name '*.py[co]' -exec rm -f {} ';' || true
> @@ -69,10 +69,10 @@ index 823def3..4d2a061 100644
>         -rm -f Programs/_testembed Programs/_freeze_importlib
>         -rm -rf build
>  diff --git a/configure.ac b/configure.ac
> -index 694293e..76b70a0 100644
> +index 1c07c05..8d0a43b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -70,7 +70,7 @@ if test "$cross_compiling" = yes; then
> +@@ -71,7 +71,7 @@ if test "$cross_compiling" = yes; then
>             AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>         fi
>           AC_MSG_RESULT($interp)
> @@ -82,5 +82,5 @@ index 694293e..76b70a0 100644
>   elif test "$cross_compiling" = maybe; then
>       AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
> index 3251da5..8ab09c0 100644
> --- a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
> +++ b/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
> @@ -1,4 +1,4 @@
> -From 28f81597314ea3ed03935b519453a55cf6c3c20d Mon Sep 17 00:00:00 2001
> +From 5df8e9556e8026dd19cf932fa8f2b726f56182d1 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:29:35 +0100
>  Subject: [PATCH] Make the build of pyc files conditional
> @@ -13,10 +13,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   2 files changed, 8 insertions(+)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 4d2a061..272f312 100644
> +index 5a258e0..6a7d974 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1283,6 +1283,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
> +@@ -1309,6 +1309,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                 $(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
>                         $(DESTDIR)$(LIBDEST)/distutils/tests ; \
>         fi
> @@ -24,7 +24,7 @@ index 4d2a061..272f312 100644
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
>                 $(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
>                 -d $(LIBDEST) -f \
> -@@ -1310,6 +1311,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
> +@@ -1336,6 +1337,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                 $(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
>                 -d $(LIBDEST)/site-packages -f \
>                 -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> @@ -33,10 +33,10 @@ index 4d2a061..272f312 100644
>                 $(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
>  diff --git a/configure.ac b/configure.ac
> -index 76b70a0..66d4642 100644
> +index 8d0a43b..db0e336 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1056,6 +1056,12 @@ fi
> +@@ -1074,6 +1074,12 @@ fi
>
>   AC_MSG_CHECKING(LDLIBRARY)
>
> @@ -50,5 +50,5 @@ index 76b70a0..66d4642 100644
>   # library that we build, but we do not want to link against it (we
>   # will find it with a -framework option). For this reason there is an
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> index 183d6b3..3957041 100644
> --- a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> +++ b/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
> @@ -1,4 +1,4 @@
> -From 093caf46b7a742ee2f7bcf617a915ac1653aa8ac Mon Sep 17 00:00:00 2001
> +From 449ac686b4c0f73bbbf0202c4a5689b5ddb37d53 Mon Sep 17 00:00:00 2001
>  From: Vanya Sergeev <vsergeev@gmail.com>
>  Date: Wed, 23 Dec 2015 11:30:33 +0100
>  Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
> @@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 66d4642..c492594 100644
> +index db0e336..f57f2eb 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3662,7 +3662,7 @@ fi
> +@@ -3744,7 +3744,7 @@ fi
>
>   AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
>
> @@ -23,5 +23,5 @@ index 66d4642..c492594 100644
>         if test $ipv6 = yes
>         then
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> index 76a553b..78bb5d9 100644
> --- a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> +++ b/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
> @@ -1,4 +1,4 @@
> -From 3a9f4aa255909ed152883eee787313efd20dbc58 Mon Sep 17 00:00:00 2001
> +From cbf8556ad057a402629a5be93dc77c906f3a86ab Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:31:08 +0100
>  Subject: [PATCH] Add infrastructure to disable the build of certain extensions
> @@ -42,7 +42,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   3 files changed, 11 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 272f312..9420860 100644
> +index 6a7d974..d70375a 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
>  @@ -182,6 +182,8 @@ FILEMODE=  644
> @@ -54,7 +54,7 @@ index 272f312..9420860 100644
>
>   # Subdirectories with code
>   SRCDIRS=      @SRCDIRS@
> -@@ -600,6 +602,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
> +@@ -607,6 +609,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
>         esac; \
>         $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
>                 _TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
> @@ -62,7 +62,7 @@ index 272f312..9420860 100644
>                 $(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
>
>   # Build static library
> -@@ -1425,7 +1428,8 @@ libainstall:     all python-config
> +@@ -1451,7 +1454,8 @@ libainstall:     all python-config
>   # Install the dynamically loadable modules
>   # This goes into $(exec_prefix)
>   sharedinstall: sharedmods
> @@ -73,10 +73,10 @@ index 272f312..9420860 100644
>                 --install-scripts=$(BINDIR) \
>                 --install-platlib=$(DESTSHARED) \
>  diff --git a/configure.ac b/configure.ac
> -index c492594..bfb599e 100644
> +index f57f2eb..c43ff9f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2588,6 +2588,8 @@ LIBS="$withval $LIBS"
> +@@ -2670,6 +2670,8 @@ LIBS="$withval $LIBS"
>
>   PKG_PROG_PKG_CONFIG
>
> @@ -86,7 +86,7 @@ index c492594..bfb599e 100644
>   AC_MSG_CHECKING(for --with-system-expat)
>   AC_ARG_WITH(system_expat,
>  diff --git a/setup.py b/setup.py
> -index dbd2a3c..1ebfa50 100644
> +index b67d913..149911c 100644
>  --- a/setup.py
>  +++ b/setup.py
>  @@ -44,7 +44,10 @@ host_platform = get_platform()
> @@ -102,5 +102,5 @@ index dbd2a3c..1ebfa50 100644
>   def add_dir_to_list(dirlist, dir):
>       """Add the directory 'dir' to the list 'dirlist' (after any relative
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
> index b3e41b1..f36966c 100644
> --- a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
> +++ b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
> @@ -1,4 +1,4 @@
> -From 7c560d917ee0e536c76fac275d1cb0b6136269ab Mon Sep 17 00:00:00 2001
> +From 5855e029370e5636e3eb2283eaa8d11248744eac Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:32:23 +0100
>  Subject: [PATCH] distutils/sysconfig: use sysconfigdata
> @@ -61,5 +61,5 @@ index 573724d..721edec 100644
>   def _init_nt():
>       """Initialize the module as appropriate for NT"""
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
> index 9ac65ba..d15ffc0 100644
> --- a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
> +++ b/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
> @@ -1,4 +1,4 @@
> -From e634929f76a45f5b683dc19bc01efed2ab83e19e Mon Sep 17 00:00:00 2001
> +From f24bff04a609d30ead9776ae3b27aa579135c8bf Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:33:14 +0100
>  Subject: [PATCH] Adjust library/header paths for cross-compilation
> @@ -21,7 +21,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   2 files changed, 15 insertions(+), 5 deletions(-)
>
>  diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
> -index d4cb11e..e7a0ba9 100644
> +index f03a4e3..0355963 100644
>  --- a/Lib/distutils/command/build_ext.py
>  +++ b/Lib/distutils/command/build_ext.py
>  @@ -232,7 +232,10 @@ class build_ext(Command):
> @@ -63,5 +63,5 @@ index 721edec..d20e2d8 100644
>   # Path to the base directory of the project. On Windows the binary may
>   # live in project/PCBuild/win32 or project/PCBuild/amd64.
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> index 47a0b83..624139a 100644
> --- a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> +++ b/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> @@ -1,4 +1,4 @@
> -From d7c568632f7cb83346096ea114a06f89a0b488d6 Mon Sep 17 00:00:00 2001
> +From f59154777625b039d8f76aa787817b108867ee04 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:36:00 +0100
>  Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
> @@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index 1ebfa50..24a7153 100644
> +index 149911c..1b4b981 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -753,12 +753,9 @@ class PyBuildExt(build_ext):
> +@@ -783,12 +783,9 @@ class PyBuildExt(build_ext):
>                   pass # Issue 7384: Already linked against curses or tinfo.
>               elif curses_library:
>                   readline_libs.append(curses_library)
> @@ -27,5 +27,5 @@ index 1ebfa50..24a7153 100644
>                                      libraries=readline_libs) )
>           else:
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0009-Don-t-add-multiarch-paths.patch b/package/python3/0009-Don-t-add-multiarch-paths.patch
> index 921e25c..92b09f3 100644
> --- a/package/python3/0009-Don-t-add-multiarch-paths.patch
> +++ b/package/python3/0009-Don-t-add-multiarch-paths.patch
> @@ -1,4 +1,4 @@
> -From bac5ac529cc0902a340a5cd03308433c6e80d1f6 Mon Sep 17 00:00:00 2001
> +From f270af67f4ea6cc781f7cf05ba66e078190368df Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:36:27 +0100
>  Subject: [PATCH] Don't add multiarch paths
> @@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 24a7153..8380a64 100644
> +index 1b4b981..9a48d5f 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -474,10 +474,10 @@ class PyBuildExt(build_ext):
> +@@ -497,10 +497,10 @@ class PyBuildExt(build_ext):
>           if not cross_compiling:
>               add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
>               add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> @@ -33,5 +33,5 @@ index 24a7153..8380a64 100644
>           # Add paths specified in the environment variables LDFLAGS and
>           # CPPFLAGS for header and library files.
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0010-Abort-on-failed-module-build.patch b/package/python3/0010-Abort-on-failed-module-build.patch
> index 131354b..74342da 100644
> --- a/package/python3/0010-Abort-on-failed-module-build.patch
> +++ b/package/python3/0010-Abort-on-failed-module-build.patch
> @@ -1,4 +1,4 @@
> -From 86ef08e36597e14cac06aef176f12375a27fdef5 Mon Sep 17 00:00:00 2001
> +From 01780527e647b15f7f1aed4351c18fb4098a8707 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:43:24 +0100
>  Subject: [PATCH] Abort on failed module build
> @@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/setup.py b/setup.py
> -index 8380a64..15b39f5 100644
> +index 9a48d5f..d02012d 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -296,6 +296,7 @@ class PyBuildExt(build_ext):
> +@@ -312,6 +312,7 @@ class PyBuildExt(build_ext):
>               print("Failed to build these modules:")
>               print_three_column(failed)
>               print()
> @@ -26,5 +26,5 @@ index 8380a64..15b39f5 100644
>           if self.failed_on_import:
>               failed = self.failed_on_import[:]
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0011-Serial-ioctl-workaround.patch b/package/python3/0011-Serial-ioctl-workaround.patch
> index 9e7d79c..cbd96b4 100644
> --- a/package/python3/0011-Serial-ioctl-workaround.patch
> +++ b/package/python3/0011-Serial-ioctl-workaround.patch
> @@ -1,4 +1,4 @@
> -From ace3ebd517ea0ac42208b6a06c7e8f82da3b9c1b Mon Sep 17 00:00:00 2001
> +From 49bfbdadd4808e7868e443b2786faf513c9818ea Mon Sep 17 00:00:00 2001
>  From: Baruch Siach <baruch@tkos.co.il>
>  Date: Wed, 23 Dec 2015 11:44:02 +0100
>  Subject: [PATCH] Serial ioctl() workaround
> @@ -29,5 +29,5 @@ index b78d33e..58b0444 100644
>   /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
>    * MDTR, MRI, and MRTS (appearantly used internally by some things
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
> index 2e50c1b..9f49706 100644
> --- a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
> +++ b/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
> @@ -1,4 +1,4 @@
> -From 45f482813de828415906e6a416c9c35450c38da7 Mon Sep 17 00:00:00 2001
> +From c0eb115234b1c41a25c1a9e8a39e49155357c45a Mon Sep 17 00:00:00 2001
>  From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>  Date: Wed, 23 Dec 2015 11:44:30 +0100
>  Subject: [PATCH] Do not adjust the shebang of Python scripts for
> @@ -31,5 +31,5 @@ index 90a8380..bdf4cf1 100644
>                            self.build_dir)
>                   updated_files.append(outfile)
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
> index 872f040..d5e330f 100644
> --- a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
> +++ b/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
> @@ -1,4 +1,4 @@
> -From 5858abdc25acd522869103d64b60a0c9687e2ec1 Mon Sep 17 00:00:00 2001
> +From a92c541ce8dd40af86642ac420e628aeeb6a5f05 Mon Sep 17 00:00:00 2001
>  From: Peter Korsgaard <peter@korsgaard.com>
>  Date: Thu, 20 Nov 2014 13:24:59 +0100
>  Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
> @@ -56,5 +56,5 @@ index 30c6927..f905a71 100644
>   PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
>   INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
> index f11d946..b781f49 100644
> --- a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
> +++ b/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
> @@ -1,4 +1,4 @@
> -From be44636b36086ca1b6de24265b7c3cc0c2bae913 Mon Sep 17 00:00:00 2001
> +From f33d59b67f26649babc8c91e38eff9bc817d0470 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:45:13 +0100
>  Subject: [PATCH] Do not harcode invalid path to ncursesw headers
> @@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 15b39f5..9e08e7e 100644
> +index d02012d..cc2f00b 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1296,7 +1296,6 @@ class PyBuildExt(build_ext):
> +@@ -1326,7 +1326,6 @@ class PyBuildExt(build_ext):
>           panel_library = 'panel'
>           if curses_library == 'ncursesw':
>               curses_defines.append(('HAVE_NCURSESW', '1'))
> @@ -26,5 +26,5 @@ index 15b39f5..9e08e7e 100644
>               # _curses_panel.so must link with panelw.
>               panel_library = 'panelw'
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
> index 22af71d..2c45a43 100644
> --- a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
> +++ b/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
> @@ -1,4 +1,4 @@
> -From 46fda6fc83500bf5663397f9d28b618e6b6b20c1 Mon Sep 17 00:00:00 2001
> +From 3f2764f8433f49cb7a9e647d3e4ec2ba3cffb694 Mon Sep 17 00:00:00 2001
>  From: Samuel Cabrero <samuelcabrero@gmail.com>
>  Date: Wed, 23 Dec 2015 11:45:48 +0100
>  Subject: [PATCH] Override system locale and set to default when adding gcc
> @@ -20,10 +20,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 9e08e7e..3feca04 100644
> +index cc2f00b..1c3b838 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -441,7 +441,7 @@ class PyBuildExt(build_ext):
> +@@ -457,7 +457,7 @@ class PyBuildExt(build_ext):
>           tmpfile = os.path.join(self.build_temp, 'gccpaths')
>           if not os.path.exists(self.build_temp):
>               os.makedirs(self.build_temp)
> @@ -33,5 +33,5 @@ index 9e08e7e..3feca04 100644
>           in_incdirs = False
>           inc_dirs = []
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
> index 54a0b87..a3ab570 100644
> --- a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
> +++ b/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
> @@ -1,4 +1,4 @@
> -From d2b5be9a0627e38d2280ef865dab3e74b7d2bde4 Mon Sep 17 00:00:00 2001
> +From 66c1baaf357f75591ee2f31966385b6eb96c8eb4 Mon Sep 17 00:00:00 2001
>  From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>  Date: Wed, 23 Dec 2015 11:46:14 +0100
>  Subject: [PATCH] Add importlib fix for PEP 3147 issue
> @@ -23,10 +23,10 @@ Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>   1 file changed, 5 insertions(+), 32 deletions(-)
>
>  diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
> -index 616b17f..e30129c 100644
> +index 9788828..dfcc27e 100644
>  --- a/Lib/importlib/_bootstrap_external.py
>  +++ b/Lib/importlib/_bootstrap_external.py
> -@@ -255,8 +255,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
> +@@ -258,8 +258,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
>       a True value is the same as setting 'optimization' to the empty string
>       while a False value is equivalent to setting 'optimization' to '1'.
>
> @@ -35,7 +35,7 @@ index 616b17f..e30129c 100644
>       """
>       if debug_override is not None:
>           _warnings.warn('the debug_override parameter is deprecated; use '
> -@@ -267,10 +265,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
> +@@ -270,10 +268,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
>           optimization = '' if debug_override else 1
>       head, tail = _path_split(path)
>       base, sep, rest = tail.rpartition('.')
> @@ -47,7 +47,7 @@ index 616b17f..e30129c 100644
>       if optimization is None:
>           if sys.flags.optimize == 0:
>               optimization = ''
> -@@ -281,39 +276,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
> +@@ -284,39 +279,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
>           if not optimization.isalnum():
>               raise ValueError('{!r} is not alphanumeric'.format(optimization))
>           almost_filename = '{}.{}{}'.format(almost_filename, _OPT, optimization)
> @@ -92,5 +92,5 @@ index 616b17f..e30129c 100644
>
>
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
> index ee0134a..563b5ba 100644
> --- a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
> +++ b/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
> @@ -1,4 +1,4 @@
> -From 1d2891204c6bf05d5e2eb0e5fa2ee78f6a2b755b Mon Sep 17 00:00:00 2001
> +From 78e54257cf149408036661be98be6f2650c5a8f9 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:47:00 +0100
>  Subject: [PATCH] Add an option to disable installation of test modules
> @@ -14,10 +14,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   2 files changed, 42 insertions(+), 20 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 9420860..d4c771a 100644
> +index d70375a..e5a4372 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1166,8 +1166,30 @@ maninstall:     altmaninstall
> +@@ -1192,8 +1192,30 @@ maninstall:     altmaninstall
>   PLATDIR=      @PLATDIR@
>   MACHDEPS=     $(PLATDIR)
>   XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
> @@ -50,7 +50,7 @@ index 9420860..d4c771a 100644
>                 test/audiodata \
>                 test/capath test/data \
>                 test/cjkencodings test/decimaltestdata test/xmltestdata \
> -@@ -1199,28 +1221,22 @@ LIBSUBDIRS=    tkinter tkinter/test tkinter/test/test_tkinter \
> +@@ -1225,28 +1247,22 @@ LIBSUBDIRS=    tkinter tkinter/test tkinter/test/test_tkinter \
>                 test/test_importlib/namespace_pkgs/project3/parent/child \
>                   test/test_importlib/namespace_pkgs/module_and_namespace_package \
>                   test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
> @@ -92,10 +92,10 @@ index 9420860..d4c771a 100644
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
>  diff --git a/configure.ac b/configure.ac
> -index bfb599e..9f3d226 100644
> +index c43ff9f..8b8c249 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2895,6 +2895,12 @@ if test "$posix_threads" = "yes"; then
> +@@ -2977,6 +2977,12 @@ if test "$posix_threads" = "yes"; then
>   fi
>
>
> @@ -109,5 +109,5 @@ index bfb599e..9f3d226 100644
>   AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
>   AC_MSG_CHECKING([if --enable-ipv6 is specified])
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0018-Add-an-option-to-disable-pydoc.patch b/package/python3/0018-Add-an-option-to-disable-pydoc.patch
> index 670ad40..f8192dd 100644
> --- a/package/python3/0018-Add-an-option-to-disable-pydoc.patch
> +++ b/package/python3/0018-Add-an-option-to-disable-pydoc.patch
> @@ -1,4 +1,4 @@
> -From a83b79b964700604de386800f86e5a55f53a0e17 Mon Sep 17 00:00:00 2001
> +From e07206329b3a4cdecaeca7991996950f82cd8744 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:47:11 +0100
>  Subject: [PATCH] Add an option to disable pydoc
> @@ -15,10 +15,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   3 files changed, 19 insertions(+), 3 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index d4c771a..a98ad65 100644
> +index e5a4372..83fc343 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1134,7 +1134,9 @@ bininstall: altbininstall
> +@@ -1160,7 +1160,9 @@ bininstall: altbininstall
>         -rm -f $(DESTDIR)$(BINDIR)/idle3
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
>         -rm -f $(DESTDIR)$(BINDIR)/pydoc3
> @@ -28,7 +28,7 @@ index d4c771a..a98ad65 100644
>         -rm -f $(DESTDIR)$(BINDIR)/2to3
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
>         -rm -f $(DESTDIR)$(BINDIR)/pyvenv
> -@@ -1184,7 +1186,7 @@ LIBSUBDIRS=      tkinter \
> +@@ -1210,7 +1212,7 @@ LIBSUBDIRS=      tkinter \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
>                 venv venv/scripts venv/scripts/posix \
> @@ -37,7 +37,7 @@ index d4c771a..a98ad65 100644
>
>   TESTSUBDIRS =         tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
>                 test test/test_asyncio \
> -@@ -1233,6 +1235,10 @@ TESTSUBDIRS =   tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
> +@@ -1259,6 +1261,10 @@ TESTSUBDIRS =   tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
>                 test/test_importlib/import_ test/test_importlib/source \
>                 unittest/test unittest/test/testmock
>
> @@ -49,10 +49,10 @@ index d4c771a..a98ad65 100644
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>  diff --git a/configure.ac b/configure.ac
> -index 9f3d226..e9b6d6f 100644
> +index 8b8c249..eea25d4 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2894,6 +2894,11 @@ if test "$posix_threads" = "yes"; then
> +@@ -2976,6 +2976,11 @@ if test "$posix_threads" = "yes"; then
>         AC_CHECK_FUNCS(pthread_atfork)
>   fi
>
> @@ -65,10 +65,10 @@ index 9f3d226..e9b6d6f 100644
>   AC_SUBST(TEST_MODULES)
>
>  diff --git a/setup.py b/setup.py
> -index 3feca04..137911d 100644
> +index 1c3b838..2a01896 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2220,6 +2220,12 @@ def main():
> +@@ -2253,6 +2253,12 @@ def main():
>       # turn off warnings when deprecated modules are imported
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
> @@ -81,7 +81,7 @@ index 3feca04..137911d 100644
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
>             version = sys.version.split()[0],
> -@@ -2244,8 +2250,7 @@ def main():
> +@@ -2277,8 +2283,7 @@ def main():
>             # If you change the scripts installed here, you also need to
>             # check the PyBuildScripts command above, and change the links
>             # created by the bininstall target in Makefile.pre.in
> @@ -92,5 +92,5 @@ index 3feca04..137911d 100644
>
>   # --install-platlib
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch b/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
> index f0d4770..5386fd7 100644
> --- a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
> +++ b/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
> @@ -1,4 +1,4 @@
> -From 3c877ea9f09913586f87064b7a2b9d2b49cb05aa Mon Sep 17 00:00:00 2001
> +From a42283b5bee8bfd0a6a39e6805787643d075f1a5 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:48:44 +0100
>  Subject: [PATCH] Add an option to disable lib2to3
> @@ -15,10 +15,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   3 files changed, 21 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index a98ad65..3823940 100644
> +index 83fc343..aeedad9 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1138,7 +1138,9 @@ ifeq (@PYDOC@,yes)
> +@@ -1164,7 +1164,9 @@ ifeq (@PYDOC@,yes)
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
>   endif
>         -rm -f $(DESTDIR)$(BINDIR)/2to3
> @@ -28,7 +28,7 @@ index a98ad65..3823940 100644
>         -rm -f $(DESTDIR)$(BINDIR)/pyvenv
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
>         if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
> -@@ -1177,7 +1179,6 @@ LIBSUBDIRS=      tkinter \
> +@@ -1203,7 +1205,6 @@ LIBSUBDIRS=      tkinter \
>                 html json http dbm xmlrpc \
>                 sqlite3 \
>                 logging csv wsgiref urllib \
> @@ -36,7 +36,7 @@ index a98ad65..3823940 100644
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
>                 distutils distutils/command $(XMLLIBSUBDIRS) \
> -@@ -1224,9 +1225,6 @@ TESTSUBDIRS =    tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
> +@@ -1250,9 +1251,6 @@ TESTSUBDIRS =    tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
>                   test/test_importlib/namespace_pkgs/module_and_namespace_package \
>                   test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
>                 sqlite3/test \
> @@ -46,7 +46,7 @@ index a98ad65..3823940 100644
>                 ctypes/test \
>                 idlelib/idle_test \
>                 distutils/tests \
> -@@ -1239,6 +1237,14 @@ ifeq (@PYDOC@,yes)
> +@@ -1265,6 +1263,14 @@ ifeq (@PYDOC@,yes)
>   LIBSUBDIRS += pydoc_data
>   endif
>
> @@ -61,7 +61,7 @@ index a98ad65..3823940 100644
>   ifeq (@TEST_MODULES@,yes)
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
> -@@ -1337,10 +1343,12 @@ ifeq (@PYC_BUILD@,yes)
> +@@ -1363,10 +1369,12 @@ ifeq (@PYC_BUILD@,yes)
>                 -d $(LIBDEST)/site-packages -f \
>                 -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
>   endif
> @@ -75,10 +75,10 @@ index a98ad65..3823940 100644
>   # Create the PLATDIR source directory, if one wasn't distributed..
>   $(srcdir)/Lib/$(PLATDIR):
>  diff --git a/configure.ac b/configure.ac
> -index e9b6d6f..652ad88 100644
> +index eea25d4..32239d3 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2906,6 +2906,12 @@ AC_ARG_ENABLE(test-modules,
> +@@ -2988,6 +2988,12 @@ AC_ARG_ENABLE(test-modules,
>         AS_HELP_STRING([--disable-test-modules], [disable test modules]),
>         [ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
>
> @@ -92,10 +92,10 @@ index e9b6d6f..652ad88 100644
>   AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
>   AC_MSG_CHECKING([if --enable-ipv6 is specified])
>  diff --git a/setup.py b/setup.py
> -index 137911d..722308b 100644
> +index 2a01896..be27531 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2221,10 +2221,11 @@ def main():
> +@@ -2254,10 +2254,11 @@ def main():
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>
> @@ -110,5 +110,5 @@ index 137911d..722308b 100644
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
> index 2093684..da1c01d 100644
> --- a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
> +++ b/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
> @@ -1,4 +1,4 @@
> -From 9ae1dce0a2fa01fc3dbc83d8b8c1b56e4b1b162b Mon Sep 17 00:00:00 2001
> +From 3d12c6e8180bc250d77a4bbb78899ccf8566b1cb Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:49:01 +0100
>  Subject: [PATCH] Add option to disable the sqlite3 module
> @@ -11,10 +11,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   2 files changed, 14 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 3823940..c822dbd 100644
> +index aeedad9..d262c04 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1177,7 +1177,6 @@ LIBSUBDIRS=      tkinter \
> +@@ -1203,7 +1203,6 @@ LIBSUBDIRS=      tkinter \
>                 email email/mime \
>                 ensurepip ensurepip/_bundled \
>                 html json http dbm xmlrpc \
> @@ -22,7 +22,7 @@ index 3823940..c822dbd 100644
>                 logging csv wsgiref urllib \
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
> -@@ -1224,7 +1223,6 @@ TESTSUBDIRS =    tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
> +@@ -1250,7 +1249,6 @@ TESTSUBDIRS =    tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
>                 test/test_importlib/namespace_pkgs/project3/parent/child \
>                   test/test_importlib/namespace_pkgs/module_and_namespace_package \
>                   test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
> @@ -30,7 +30,7 @@ index 3823940..c822dbd 100644
>                 ctypes/test \
>                 idlelib/idle_test \
>                 distutils/tests \
> -@@ -1245,6 +1243,11 @@ TESTSUBDIRS += lib2to3/tests                    \
> +@@ -1271,6 +1269,11 @@ TESTSUBDIRS += lib2to3/tests                    \
>         lib2to3/tests/data/fixers/myfixes
>   endif
>
> @@ -43,10 +43,10 @@ index 3823940..c822dbd 100644
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>  diff --git a/configure.ac b/configure.ac
> -index 652ad88..cae12ad 100644
> +index 32239d3..c9d0912 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2894,6 +2894,15 @@ if test "$posix_threads" = "yes"; then
> +@@ -2976,6 +2976,15 @@ if test "$posix_threads" = "yes"; then
>         AC_CHECK_FUNCS(pthread_atfork)
>   fi
>
> @@ -63,5 +63,5 @@ index 652ad88..cae12ad 100644
>
>   AC_ARG_ENABLE(pydoc,
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
> index 7dfb339..e766452 100644
> --- a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
> +++ b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
> @@ -1,4 +1,4 @@
> -From d0d42570e5a23c3bf559e0413ec97729fd2f9e24 Mon Sep 17 00:00:00 2001
> +From 61f201afe59bbfbb1094d987fd74ac9cd4764d52 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:49:14 +0100
>  Subject: [PATCH] Add an option to disable the tk module
> @@ -11,10 +11,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   2 files changed, 17 insertions(+), 3 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index c822dbd..0a93c27 100644
> +index d262c04..851faa3 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1170,7 +1170,7 @@ maninstall:      altmaninstall
> +@@ -1196,7 +1196,7 @@ maninstall:      altmaninstall
>   PLATDIR=      @PLATDIR@
>   MACHDEPS=     $(PLATDIR)
>   XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
> @@ -23,7 +23,7 @@ index c822dbd..0a93c27 100644
>                 site-packages \
>                 asyncio \
>                 collections concurrent concurrent/futures encodings \
> -@@ -1188,8 +1188,7 @@ LIBSUBDIRS=      tkinter \
> +@@ -1214,8 +1214,7 @@ LIBSUBDIRS=      tkinter \
>                 venv venv/scripts venv/scripts/posix \
>                 curses $(MACHDEPS)
>
> @@ -33,7 +33,7 @@ index c822dbd..0a93c27 100644
>                 test/test_email test/test_email/data \
>                 test/test_json \
>                 test/audiodata \
> -@@ -1248,6 +1247,12 @@ LIBSUBDIRS += sqlite3
> +@@ -1274,6 +1273,12 @@ LIBSUBDIRS += sqlite3
>   TESTSUBDIRS += sqlite3/test
>   endif
>
> @@ -47,10 +47,10 @@ index c822dbd..0a93c27 100644
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>  diff --git a/configure.ac b/configure.ac
> -index cae12ad..787b185 100644
> +index c9d0912..d5047ec 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2903,6 +2903,15 @@ if test "$SQLITE3" = "no" ; then
> +@@ -2985,6 +2985,15 @@ if test "$SQLITE3" = "no" ; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
>   fi
>
> @@ -67,5 +67,5 @@ index cae12ad..787b185 100644
>
>   AC_ARG_ENABLE(pydoc,
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
> index 22f7a24..37cf66f 100644
> --- a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
> +++ b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
> @@ -1,4 +1,4 @@
> -From d04ec780bf7c0825ab260bd1d6b7292141b2dcde Mon Sep 17 00:00:00 2001
> +From 2d1a718b6fc386e718c26dec23633f478e8791a0 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:49:30 +0100
>  Subject: [PATCH] Add an option to disable the curses module
> @@ -11,10 +11,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   2 files changed, 14 insertions(+), 1 deletion(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 0a93c27..b97c21e 100644
> +index 851faa3..90a055c 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1186,7 +1186,7 @@ LIBSUBDIRS=      \
> +@@ -1212,7 +1212,7 @@ LIBSUBDIRS=      \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
>                 venv venv/scripts venv/scripts/posix \
> @@ -23,7 +23,7 @@ index 0a93c27..b97c21e 100644
>
>   TESTSUBDIRS =         test test/test_asyncio \
>                 test/test_email test/test_email/data \
> -@@ -1253,6 +1253,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
> +@@ -1279,6 +1279,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
>         tkinter/test/test_ttk
>   endif
>
> @@ -35,10 +35,10 @@ index 0a93c27..b97c21e 100644
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>  diff --git a/configure.ac b/configure.ac
> -index 787b185..0be47b2 100644
> +index d5047ec..3814ba0 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2912,6 +2912,15 @@ if test "$TK" = "no"; then
> +@@ -2994,6 +2994,15 @@ if test "$TK" = "no"; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
>   fi
>
> @@ -55,5 +55,5 @@ index 787b185..0be47b2 100644
>
>   AC_ARG_ENABLE(pydoc,
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0023-Add-an-option-to-disable-expat.patch b/package/python3/0023-Add-an-option-to-disable-expat.patch
> index 73f9b36..eff1af8 100644
> --- a/package/python3/0023-Add-an-option-to-disable-expat.patch
> +++ b/package/python3/0023-Add-an-option-to-disable-expat.patch
> @@ -1,4 +1,4 @@
> -From 6281850ee8c3fb6d93b4997833af0cca4a48947b Mon Sep 17 00:00:00 2001
> +From cb39a3171e28ac6db79d3604959730746e50c2b4 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:49:42 +0100
>  Subject: [PATCH] Add an option to disable expat
> @@ -18,10 +18,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   3 files changed, 19 insertions(+), 7 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index b97c21e..bdfee19 100644
> +index 90a055c..fcb1ac4 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1180,7 +1180,7 @@ LIBSUBDIRS=      \
> +@@ -1206,7 +1206,7 @@ LIBSUBDIRS=      \
>                 logging csv wsgiref urllib \
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
> @@ -30,7 +30,7 @@ index b97c21e..bdfee19 100644
>                 importlib \
>                 turtledemo \
>                 multiprocessing multiprocessing/dummy \
> -@@ -1257,6 +1257,10 @@ ifeq (@CURSES@,yes)
> +@@ -1283,6 +1283,10 @@ ifeq (@CURSES@,yes)
>   LIBSUBDIRS += curses
>   endif
>
> @@ -42,10 +42,10 @@ index b97c21e..bdfee19 100644
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>  diff --git a/configure.ac b/configure.ac
> -index 0be47b2..e6bcacc 100644
> +index 3814ba0..a7e9d16 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2591,13 +2591,21 @@ PKG_PROG_PKG_CONFIG
> +@@ -2673,13 +2673,21 @@ PKG_PROG_PKG_CONFIG
>   AC_SUBST(DISABLED_EXTENSIONS)
>
>   # Check for use of the system expat library
> @@ -73,10 +73,10 @@ index 0be47b2..e6bcacc 100644
>   # Check for use of the system libffi library
>   AC_MSG_CHECKING(for --with-system-ffi)
>  diff --git a/setup.py b/setup.py
> -index 722308b..ecddb6a 100644
> +index be27531..53a471c 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1434,7 +1434,7 @@ class PyBuildExt(build_ext):
> +@@ -1464,7 +1464,7 @@ class PyBuildExt(build_ext):
>           #
>           # More information on Expat can be found at www.libexpat.org.
>           #
> @@ -86,5 +86,5 @@ index 722308b..ecddb6a 100644
>               define_macros = []
>               expat_lib = ['expat']
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
> index d3af94f..62c8a6b 100644
> --- a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
> +++ b/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
> @@ -1,4 +1,4 @@
> -From 18265d05ee97ad0c43995acdadce2458b57d7d64 Mon Sep 17 00:00:00 2001
> +From 26fb4f055203332db8a346ae80da542f721df01d Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:49:55 +0100
>  Subject: [PATCH] Add an option to disable CJK codecs
> @@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 6 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index e6bcacc..38b7515 100644
> +index a7e9d16..e9ea63f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2911,6 +2911,12 @@ if test "$SQLITE3" = "no" ; then
> +@@ -2993,6 +2993,12 @@ if test "$SQLITE3" = "no" ; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
>   fi
>
> @@ -26,5 +26,5 @@ index e6bcacc..38b7515 100644
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0025-Add-an-option-to-disable-NIS.patch b/package/python3/0025-Add-an-option-to-disable-NIS.patch
> index ef9ff42..d7a7344 100644
> --- a/package/python3/0025-Add-an-option-to-disable-NIS.patch
> +++ b/package/python3/0025-Add-an-option-to-disable-NIS.patch
> @@ -1,4 +1,4 @@
> -From 733ee65f308ec48be427463c06f372ca116ccada Mon Sep 17 00:00:00 2001
> +From a2b911055f5b75e02d6a8853a9b21dfad277758e Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:50:11 +0100
>  Subject: [PATCH] Add an option to disable NIS
> @@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 6 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 38b7515..f25733a 100644
> +index e9ea63f..98d1332 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2917,6 +2917,12 @@ AC_ARG_ENABLE(codecs-cjk,
> +@@ -2999,6 +2999,12 @@ AC_ARG_ENABLE(codecs-cjk,
>                 DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
>         fi])
>
> @@ -29,5 +29,5 @@ index 38b7515..f25733a 100644
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch b/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
> index 56a5178..f9ecf65 100644
> --- a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
> +++ b/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
> @@ -1,4 +1,4 @@
> -From 64fa1fc3a9aea7ffba7b96d08a14df91051f2b6f Mon Sep 17 00:00:00 2001
> +From 8f0bf1aac225c2a4465baeefc3e4538c27c497e7 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:50:27 +0100
>  Subject: [PATCH] Add an option to disable unicodedata
> @@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 6 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index f25733a..a7ddb2b 100644
> +index 98d1332..b1a1f39 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2923,6 +2923,12 @@ AC_ARG_ENABLE(nis,
> +@@ -3005,6 +3005,12 @@ AC_ARG_ENABLE(nis,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
>           fi])
>
> @@ -26,5 +26,5 @@ index f25733a..a7ddb2b 100644
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0027-Add-an-option-to-disable-IDLE.patch b/package/python3/0027-Add-an-option-to-disable-IDLE.patch
> index 73fc395..e8eaea9 100644
> --- a/package/python3/0027-Add-an-option-to-disable-IDLE.patch
> +++ b/package/python3/0027-Add-an-option-to-disable-IDLE.patch
> @@ -1,4 +1,4 @@
> -From 2766bcdd8f9b7395ce32a6d8480ef0a2186f2098 Mon Sep 17 00:00:00 2001
> +From 6187913d2d84a8f0df85781e32a23eb053365134 Mon Sep 17 00:00:00 2001
>  From: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:50:42 +0100
>  Subject: [PATCH] Add an option to disable IDLE
> @@ -14,10 +14,10 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>   3 files changed, 15 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index bdfee19..2466615 100644
> +index fcb1ac4..0c26bcf 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1132,7 +1132,9 @@ bininstall: altbininstall
> +@@ -1158,7 +1158,9 @@ bininstall: altbininstall
>         -rm -f $(DESTDIR)$(LIBPC)/python3.pc
>         (cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
>         -rm -f $(DESTDIR)$(BINDIR)/idle3
> @@ -27,7 +27,7 @@ index bdfee19..2466615 100644
>         -rm -f $(DESTDIR)$(BINDIR)/pydoc3
>   ifeq (@PYDOC@,yes)
>         (cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
> -@@ -1179,7 +1181,6 @@ LIBSUBDIRS=      \
> +@@ -1205,7 +1207,6 @@ LIBSUBDIRS=      \
>                 html json http dbm xmlrpc \
>                 logging csv wsgiref urllib \
>                 ctypes ctypes/macholib \
> @@ -35,7 +35,7 @@ index bdfee19..2466615 100644
>                 distutils distutils/command \
>                 importlib \
>                 turtledemo \
> -@@ -1261,6 +1262,10 @@ ifeq (@EXPAT@,yes)
> +@@ -1287,6 +1288,10 @@ ifeq (@EXPAT@,yes)
>   LIBSUBDIRS += $(XMLLIBSUBDIRS)
>   endif
>
> @@ -47,10 +47,10 @@ index bdfee19..2466615 100644
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>  diff --git a/configure.ac b/configure.ac
> -index a7ddb2b..6b59792 100644
> +index b1a1f39..d1be997 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2965,6 +2965,12 @@ AC_ARG_ENABLE(lib2to3,
> +@@ -3047,6 +3047,12 @@ AC_ARG_ENABLE(lib2to3,
>         AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
>         [ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
>
> @@ -64,10 +64,10 @@ index a7ddb2b..6b59792 100644
>   AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
>   AC_MSG_CHECKING([if --enable-ipv6 is specified])
>  diff --git a/setup.py b/setup.py
> -index ecddb6a..7fe68e8 100644
> +index 53a471c..b443987 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2221,11 +2221,13 @@ def main():
> +@@ -2254,11 +2254,13 @@ def main():
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>
> @@ -83,5 +83,5 @@ index ecddb6a..7fe68e8 100644
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0028-Add-an-option-to-disable-decimal.patch b/package/python3/0028-Add-an-option-to-disable-decimal.patch
> index 1ac91dd..5be1681 100644
> --- a/package/python3/0028-Add-an-option-to-disable-decimal.patch
> +++ b/package/python3/0028-Add-an-option-to-disable-decimal.patch
> @@ -1,4 +1,4 @@
> -From ff77defc777a57d4caee5183796fd44dd265e78b Mon Sep 17 00:00:00 2001
> +From 1c51f93b8244e3e3be4d125465255c5a056abe22 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:51:31 +0100
>  Subject: [PATCH] Add an option to disable decimal
> @@ -15,10 +15,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   2 files changed, 13 insertions(+), 6 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 6b59792..51e1760 100644
> +index d1be997..3d08ab0 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2624,13 +2624,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
> +@@ -2706,13 +2706,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
>   AC_MSG_RESULT($with_system_ffi)
>
>   # Check for use of the system libmpdec library
> @@ -45,10 +45,10 @@ index 6b59792..51e1760 100644
>   # Check for support for loadable sqlite extensions
>   AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
>  diff --git a/setup.py b/setup.py
> -index 7fe68e8..364b350 100644
> +index b443987..a1580a0 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1988,7 +1988,7 @@ class PyBuildExt(build_ext):
> +@@ -2021,7 +2021,7 @@ class PyBuildExt(build_ext):
>       def _decimal_ext(self):
>           extra_compile_args = []
>           undef_macros = []
> @@ -58,5 +58,5 @@ index 7fe68e8..364b350 100644
>               libraries = [':libmpdec.so.2']
>               sources = ['_decimal/_decimal.c']
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
> index 9ac9173..ee43664 100644
> --- a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
> +++ b/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
> @@ -1,4 +1,4 @@
> -From 789b0f99d7c1d25bfa9c05fd12f4d55bb70f377b Mon Sep 17 00:00:00 2001
> +From ed4bf13c66a3faa186781ca8ab2978a9bc8d5f39 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 11:51:58 +0100
>  Subject: [PATCH] Add an option to disable the ossaudiodev module
> @@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   1 file changed, 6 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 51e1760..c4c2353 100644
> +index 3d08ab0..4e2b88e 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2639,6 +2639,12 @@ else
> +@@ -2721,6 +2721,12 @@ else
>   fi
>   AC_SUBST(MPDEC)
>
> @@ -26,5 +26,5 @@ index 51e1760..c4c2353 100644
>   AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
>   AC_ARG_ENABLE(loadable-sqlite-extensions,
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch b/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
> index 156eb29..2b7ec05 100644
> --- a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
> +++ b/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
> @@ -1,4 +1,4 @@
> -From 4f851142b8f3149d23654117621285df34ec768b Mon Sep 17 00:00:00 2001
> +From e151b6863bd8f697f17b50eda2cecef57e433c3e Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 23 Dec 2015 13:58:00 +0100
>  Subject: [PATCH] Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD
> @@ -10,10 +10,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   2 files changed, 13 insertions(+)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 2466615..fdf622d 100644
> +index 0c26bcf..d1237eb 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -712,10 +712,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
> +@@ -719,10 +719,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
>   ############################################################################
>   # Importlib
>
> @@ -28,10 +28,10 @@ index 2466615..fdf622d 100644
>  +endif
>
>   Python/importlib_external.h: $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib
> -       ./Programs/_freeze_importlib \
> -@@ -789,8 +794,13 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
> - $(GRAMMAR_C): $(GRAMMAR_H)
> -               touch $(GRAMMAR_C)
> +       if test "$(cross_compiling)" != "yes"; then \
> +@@ -811,8 +816,13 @@ $(GRAMMAR_C): $(GRAMMAR_H)
> +               mv $(GRAMMAR_C).tmp $(GRAMMAR_C); \
> +       fi
>
>  +ifeq (@PGEN_FOR_BUILD@,)
>   $(PGEN): $(PGENOBJS)
> @@ -44,10 +44,10 @@ index 2466615..fdf622d 100644
>   Parser/grammar.o:     $(srcdir)/Parser/grammar.c \
>                                 $(srcdir)/Include/token.h \
>  diff --git a/configure.ac b/configure.ac
> -index c4c2353..750c232 100644
> +index 4e2b88e..16a827c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -79,6 +79,9 @@ else
> +@@ -80,6 +80,9 @@ else
>   fi
>   AC_SUBST(PYTHON_FOR_BUILD)
>
> @@ -58,5 +58,5 @@ index c4c2353..750c232 100644
>   dnl it does, we get path names containing '//' which is both ugly and
>   dnl can cause trouble.
>  --
> -2.6.4
> +2.7.4
>
> diff --git a/package/python3/0031-Add-an-option-to-disable-openssl.patch b/package/python3/0031-Add-an-option-to-disable-openssl-support.patch
> similarity index 73%
> rename from package/python3/0031-Add-an-option-to-disable-openssl.patch
> rename to package/python3/0031-Add-an-option-to-disable-openssl-support.patch
> index d437520..784320b 100644
> --- a/package/python3/0031-Add-an-option-to-disable-openssl.patch
> +++ b/package/python3/0031-Add-an-option-to-disable-openssl-support.patch
> @@ -1,4 +1,6 @@
> +From d903da1181cedb76d8191b33aea0519844f85b22 Mon Sep 17 00:00:00 2001
>  From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> +Date: Tue, 7 Mar 2017 23:25:12 +0100
>  Subject: [PATCH] Add an option to disable openssl support.
>
>  Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> @@ -6,9 +8,11 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>   configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> +diff --git a/configure.ac b/configure.ac
> +index 16a827c..65c0ce0 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3027,6 +3027,12 @@
> +@@ -3027,6 +3027,12 @@ AC_ARG_ENABLE(unicodedata,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
>           fi])
>
> @@ -21,3 +25,6 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>   AC_SUBST(TK)
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
> +--
> +2.7.4
> +
> --
> 2.7.4
>
