From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 8 Mar 2017 14:03:29 +0100
Subject: [Buildroot] [PATCH 1/6] python: move to Git formatted patches
In-Reply-To: <1488927631-21945-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488927631-21945-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1488927631-21945-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAGm1_ku6TvaeTDC56OFUvGynWpg4MPfUF1uKpc4ZYJJ6cqyxsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 8, 2017 at 12:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Now that the cpython project has a nice Github repository, with tags,
> it's much nicer to handle the stack of Python patches with Git. The
> python3 package patches had already been converted, but not the python
> package patches. Therefore, this commit does the move.
>
> There is no functional change, only reformatting of the patches.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...p.py-do-not-add-invalid-header-locations.patch} |  18 ++-
>  ...Fix-get_python_inc-for-cross-compilation.patch} |  18 ++-
>  ...he-install-location-of-_sysconfigdata.py.patch} |  38 ++++---
>  ...compilation-of-.pyc-and-.pyo-conditional.patch} |  29 ++++-
>  ...st-getaddrinfo-test-for-cross-compilation.patch |  29 +++++
>  ...infrastructure-to-be-able-to-disable-ext.patch} |  41 +++++--
>  ...brary-header-paths-for-cross-compilation.patch} |  50 +++++----
>  ...-t-look-in-usr-lib-termcap-for-libraries.patch} |  18 ++-
>  ... 0009-Fix-python-config-for-cross-builds.patch} | 121 ++++++++++++---------
>  ...-Remove-the-python-symlink-install-rules.patch} |  25 +++--
>  ....patch => 0011-Don-t-add-multiarch-paths.patch} |  17 ++-
>  ...tch => 0012-Abort-on-failed-module-build.patch} |  17 ++-
>  ...build-when-threads-are-not-used-availabl.patch} |  17 ++-
>  ...nd.patch => 0014-Serial-ioctl-workaround.patch} |  15 ++-
>  ...t-the-shebang-of-Python-scripts-for-cros.patch} |  18 ++-
>  ...n-to-disable-installation-of-test-module.patch} |  27 +++--
>  ...h => 0017-Add-an-option-to-disable-pydoc.patch} |  37 ++++---
>  ...=> 0018-Add-an-option-to-disable-lib2to3.patch} |  39 ++++---
>  ...Add-option-to-disable-the-sqlite3-module.patch} |  65 ++++++-----
>  ...0-Add-an-option-to-disable-the-tk-module.patch} |  31 +++---
>  ...d-an-option-to-disable-the-curses-module.patch} |  27 +++--
>  ...h => 0022-Add-an-option-to-disable-expat.patch} |  35 +++---
>  ...0023-Add-an-option-to-disable-CJK-codecs.patch} |  17 ++-
>  ...tch => 0024-Add-an-option-to-disable-NIS.patch} |  17 ++-
>  ...025-Add-an-option-to-disable-unicodedata.patch} |  17 ++-
>  ...h => 0026-Add-an-option-to-disable-bsddb.patch} |  31 +++---
>  ...-Add-an-option-to-disable-the-ssl-module.patch} |  17 ++-
>  ...-Add-an-option-to-disable-the-bz2-module.patch} |  16 ++-
>  ...Add-an-option-to-disable-the-zlib-module.patch} |  16 ++-
>  ...h => 0030-Do-not-install-the-idle-editor.patch} |  26 +++--
>  ...option-to-disable-the-ossaudiodev-module.patch} |  15 ++-
>  package/python/006-cross-compile-getaddrinfo.patch |  13 ---
>  package/python/018-fix-add-gcc-paths-logic.patch   |  27 -----
>  33 files changed, 587 insertions(+), 357 deletions(-)
>  rename package/python/{001-remove-host-header-path.patch => 0001-setup.py-do-not-add-invalid-header-locations.patch} (78%)
>  rename package/python/{002-fix-get-python-inc.patch => 0002-Fix-get_python_inc-for-cross-compilation.patch} (76%)
>  rename package/python/{004-sysconfigdata-install-location.patch => 0003-Change-the-install-location-of-_sysconfigdata.py.patch} (72%)
>  rename package/python/{005-pyc-pyo-conditional.patch => 0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch} (68%)
>  create mode 100644 package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
>  rename package/python/{007-disable-extensions.patch => 0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch} (58%)
>  rename package/python/{008-distutils-use-python-sysroot.patch => 0007-Adjust-library-header-paths-for-cross-compilation.patch} (75%)
>  rename package/python/{009-no-termcap-host-path.patch => 0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (67%)
>  rename package/python/{010-fix-python-config.patch => 0009-Fix-python-config-for-cross-builds.patch} (81%)
>  rename package/python/{011-remove-python-symlink.patch => 0010-Remove-the-python-symlink-install-rules.patch} (65%)
>  rename package/python/{013-dont-add-multiarch-path.patch => 0011-Don-t-add-multiarch-paths.patch} (68%)
>  rename package/python/{014-abort-on-failed-modules.patch => 0012-Abort-on-failed-module-build.patch} (57%)
>  rename package/python/{015-fix-sqlite-without-threads.patch => 0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch} (72%)
>  rename package/python/{016-serial-ioctl-workaround.patch => 0014-Serial-ioctl-workaround.patch} (66%)
>  rename package/python/{017-distutils-scripts-dont-adjust-shebang.patch => 0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (61%)
>  rename package/python/{100-optional-test-modules.patch => 0016-Add-an-option-to-disable-installation-of-test-module.patch} (79%)
>  rename package/python/{101-optional-pydoc.patch => 0017-Add-an-option-to-disable-pydoc.patch} (70%)
>  rename package/python/{102-optional-2to3.patch => 0018-Add-an-option-to-disable-lib2to3.patch} (71%)
>  rename package/python/{103-optional-sqlite.patch => 0019-Add-option-to-disable-the-sqlite3-module.patch} (59%)
>  rename package/python/{104-optional-tk.patch => 0020-Add-an-option-to-disable-the-tk-module.patch} (65%)
>  rename package/python/{105-optional-curses.patch => 0021-Add-an-option-to-disable-the-curses-module.patch} (62%)
>  rename package/python/{106-optional-expat.patch => 0022-Add-an-option-to-disable-expat.patch} (75%)
>  rename package/python/{107-optional-codecs-cjk.patch => 0023-Add-an-option-to-disable-CJK-codecs.patch} (58%)
>  rename package/python/{108-optional-nis.patch => 0024-Add-an-option-to-disable-NIS.patch} (63%)
>  rename package/python/{109-optional-unicodedata.patch => 0025-Add-an-option-to-disable-unicodedata.patch} (58%)
>  rename package/python/{110-optional-db.patch => 0026-Add-an-option-to-disable-bsddb.patch} (72%)
>  rename package/python/{111-optional-ssl.patch => 0027-Add-an-option-to-disable-the-ssl-module.patch} (57%)
>  rename package/python/{112-optional-bzip2.patch => 0028-Add-an-option-to-disable-the-bz2-module.patch} (58%)
>  rename package/python/{113-optional-zlib.patch => 0029-Add-an-option-to-disable-the-zlib-module.patch} (58%)
>  rename package/python/{114-remove-idle-editor.patch => 0030-Do-not-install-the-idle-editor.patch} (63%)
>  rename package/python/{115-optional-ossaudiodev.patch => 0031-Add-an-option-to-disable-the-ossaudiodev-module.patch} (65%)
>  delete mode 100644 package/python/006-cross-compile-getaddrinfo.patch
>  delete mode 100644 package/python/018-fix-add-gcc-paths-logic.patch
>
> diff --git a/package/python/001-remove-host-header-path.patch b/package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
> similarity index 78%
> rename from package/python/001-remove-host-header-path.patch
> rename to package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
> index dfb84ff..3b2c983 100644
> --- a/package/python/001-remove-host-header-path.patch
> +++ b/package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
> @@ -1,4 +1,7 @@
> -setup.py: do not add invalid header locations
> +From 3dc31a435b67de2ba3dd3457f0c939e20b58e8de Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:17:06 +0100
> +Subject: [PATCH] setup.py: do not add invalid header locations
>
>  This piece of code incorrectly adds /usr/include to
>  self.compiler.include_dirs, and results in the following invalid
> @@ -17,11 +20,15 @@ cc1: warning: include location "/usr/include" is unsafe for cross-compilation [-
>  [...]
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Index: b/setup.py
> -===================================================================
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 54054c2..64001e2 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -480,7 +480,7 @@
> +@@ -496,7 +496,7 @@ class PyBuildExt(build_ext):
>                       for directory in reversed(options.dirs):
>                           add_dir_to_list(dir_list, directory)
>
> @@ -30,3 +37,6 @@ Index: b/setup.py
>                   and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
>               # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
>               # (PYTHONFRAMEWORK is set) to avoid # linking problems when
> +--
> +2.7.4
> +
> diff --git a/package/python/002-fix-get-python-inc.patch b/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
> similarity index 76%
> rename from package/python/002-fix-get-python-inc.patch
> rename to package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
> index bfee03a..b28ef24 100644
> --- a/package/python/002-fix-get-python-inc.patch
> +++ b/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
> @@ -1,4 +1,7 @@
> -Fix get_python_inc() for cross-compilation
> +From 367ee7d103cf9f670c3925d555edf6f6a5b9d8d5 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:17:25 +0100
> +Subject: [PATCH] Fix get_python_inc() for cross-compilation
>
>  When we are cross compiling, doing os.path.dirname(sys.executable) to
>  get the build directory is incorrect, because we're executing the host
> @@ -21,11 +24,15 @@ This patch allows to fix the
>  incorrectly added to the header paths.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Index: b/Lib/distutils/sysconfig.py
> -===================================================================
> +---
> + Lib/distutils/sysconfig.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> +index de7da1d..d72b6e5 100644
>  --- a/Lib/distutils/sysconfig.py
>  +++ b/Lib/distutils/sysconfig.py
> -@@ -79,7 +79,7 @@
> +@@ -79,7 +79,7 @@ def get_python_inc(plat_specific=0, prefix=None):
>
>       if os.name == "posix":
>           if python_build:
> @@ -34,3 +41,6 @@ Index: b/Lib/distutils/sysconfig.py
>               if plat_specific:
>                   # python.h is located in the buildir
>                   inc_dir = buildir
> +--
> +2.7.4
> +
> diff --git a/package/python/004-sysconfigdata-install-location.patch b/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
> similarity index 72%
> rename from package/python/004-sysconfigdata-install-location.patch
> rename to package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
> index 2998364..db5bfe1 100644
> --- a/package/python/004-sysconfigdata-install-location.patch
> +++ b/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
> @@ -1,4 +1,7 @@
> -Change the install location of _sysconfigdata.py
> +From 0ef0d4ddd3f2261e381f22061a9a451dfbb1dc9e Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:17:59 +0100
> +Subject: [PATCH] Change the install location of _sysconfigdata.py
>
>  The _sysconfigdata.py module contains definitions that are needed when
>  building Python modules. In cross-compilation mode, when building
> @@ -16,12 +19,16 @@ this directory gets added to the PYTHONPATH of the host Python
>  interpreter when building Python modules for the target.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Makefile.pre.in | 12 ++++++++++--
> + configure.ac    |  2 +-
> + 2 files changed, 11 insertions(+), 3 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index e288964..5367df7 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -462,6 +462,9 @@
> +@@ -529,6 +529,9 @@ pybuilddir.txt: $(BUILDPYTHON)
>                 rm -f ./pybuilddir.txt ; \
>                 exit 1 ; \
>         fi
> @@ -29,9 +36,9 @@ Index: b/Makefile.pre.in
>  +      mkdir -p `cat pysysconfigdatadir.txt`
>  +      cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
>
> - # Build the shared modules
> - # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
> -@@ -1002,7 +1005,7 @@
> + # This is shared by the math and cmath modules
> + Modules/_math.o: Modules/_math.c Modules/_math.h
> +@@ -1080,7 +1083,7 @@ libinstall:      build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                 else    true; \
>                 fi; \
>         done
> @@ -40,7 +47,7 @@ Index: b/Makefile.pre.in
>         do \
>                 if test -x $$i; then \
>                         $(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
> -@@ -1012,6 +1015,11 @@
> +@@ -1090,6 +1093,11 @@ libinstall:     build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                         echo $(INSTALL_DATA) $$i $(LIBDEST); \
>                 fi; \
>         done
> @@ -52,7 +59,7 @@ Index: b/Makefile.pre.in
>         @for d in $(LIBSUBDIRS); \
>         do \
>                 a=$(srcdir)/Lib/$$d; \
> -@@ -1337,7 +1345,7 @@
> +@@ -1418,7 +1426,7 @@ distclean: clobber
>                 Modules/Setup Modules/Setup.local Modules/Setup.config \
>                 Modules/ld_so_aix Modules/python.exp Misc/python.pc
>         -rm -f python*-gdb.py
> @@ -61,16 +68,19 @@ Index: b/Makefile.pre.in
>         # Issue #28258: set LC_ALL to avoid issues with Estonian locale.
>         # Expansion is performed here by shell (spawned by make) itself before
>         # arguments are passed to find. So LC_ALL=C must be set as a separate
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 1273465..5f89797 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -33,7 +33,7 @@
> +@@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
>             AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>         fi
>           AC_MSG_RESULT($interp)
>  -      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
>  +      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
>       fi
> - elif test "$cross_compiling" = maybe; then
> -     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
> +     # Used to comment out stuff for rebuilding generated files
> +     GENERATED_COMMENT='#'
> +--
> +2.7.4
> +
> diff --git a/package/python/005-pyc-pyo-conditional.patch b/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
> similarity index 68%
> rename from package/python/005-pyc-pyo-conditional.patch
> rename to package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
> index 1b677df..3bf407d 100644
> --- a/package/python/005-pyc-pyo-conditional.patch
> +++ b/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
> @@ -1,8 +1,22 @@
> -Index: b/Makefile.pre.in
> -===================================================================
> +From 168e6c594e80395583de5ab0d082be119b2061fc Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:18:57 +0100
> +Subject: [PATCH] Make the compilation of .pyc and .pyo conditional
> +
> +This commit adds --{enable,disable}-{pyc,pyo} options to enable/disable
> +the compilation of pyc/pyo files.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Makefile.pre.in |  8 ++++++++
> + configure.ac    | 11 +++++++++++
> + 2 files changed, 19 insertions(+)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 5367df7..96fc718 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1050,24 +1050,32 @@
> +@@ -1128,24 +1128,32 @@ libinstall:    build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>                 $(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
>                         $(DESTDIR)$(LIBDEST)/distutils/tests ; \
>         fi
> @@ -35,11 +49,11 @@ Index: b/Makefile.pre.in
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
>                 $(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 5f89797..4aafc82 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -739,6 +739,17 @@
> +@@ -759,6 +759,17 @@ SunOS*)
>       ;;
>   esac
>
> @@ -57,3 +71,6 @@ Index: b/configure.ac
>
>   AC_SUBST(LIBRARY)
>   AC_MSG_CHECKING(LIBRARY)
> +--
> +2.7.4
> +
> diff --git a/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch b/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
> new file mode 100644
> index 0000000..e0a24ec
> --- /dev/null
> +++ b/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
> @@ -0,0 +1,29 @@
> +From 2d971c3cdca9ecc55f2da8aba12ca89e1a66519a Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:19:47 +0100
> +Subject: [PATCH] Adjust getaddrinfo() test for cross-compilation
> +
> +The getaddrinfo() test in configure.ac uses AC_RUN_IFELSE(), which isn't
> +cross-compilation friendly.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4aafc82..63e6918 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3527,7 +3527,7 @@ fi
> +
> + AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
> +
> +-if test $have_getaddrinfo = no -o "$ac_cv_buggy_getaddrinfo" = yes
> ++if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
> + then
> +       if test $ipv6 = yes
> +       then
> +--
> +2.7.4
> +
> diff --git a/package/python/007-disable-extensions.patch b/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
> similarity index 58%
> rename from package/python/007-disable-extensions.patch
> rename to package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
> index 9365cb1..44a8ae2 100644
> --- a/package/python/007-disable-extensions.patch
> +++ b/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
> @@ -1,8 +1,24 @@
> -Index: b/Makefile.pre.in
> -===================================================================
> +From 977de9474c1fb46359ab6a487e153fbd91a2b568 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:21:28 +0100
> +Subject: [PATCH] Add minimal infrastructure to be able to disable extensions
> +
> +This commit adds some logic to the Python build system to be able to
> +disable Python extensions. Follow-up commits actually add options to
> +disable specific extensions.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Makefile.pre.in | 6 +++++-
> + configure.ac    | 2 ++
> + setup.py        | 5 ++++-
> + 3 files changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 96fc718..33b994d 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -156,6 +156,8 @@
> +@@ -161,6 +161,8 @@ FILEMODE=  644
>   # configure script arguments
>   CONFIG_ARGS=  @CONFIG_ARGS@
>
> @@ -11,7 +27,7 @@ Index: b/Makefile.pre.in
>
>   # Subdirectories with code
>   SRCDIRS=      @SRCDIRS@
> -@@ -477,6 +479,7 @@
> +@@ -548,6 +550,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
>         esac; \
>         $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
>                 _TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
> @@ -19,7 +35,7 @@ Index: b/Makefile.pre.in
>                 $(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
>
>   # Build static library
> -@@ -1191,7 +1194,8 @@
> +@@ -1269,7 +1272,8 @@ libainstall:     all python-config
>   # Install the dynamically loadable modules
>   # This goes into $(exec_prefix)
>   sharedinstall: sharedmods
> @@ -29,11 +45,11 @@ Index: b/Makefile.pre.in
>                 --prefix=$(prefix) \
>                 --install-scripts=$(BINDIR) \
>                 --install-platlib=$(DESTSHARED) \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 63e6918..5d4232f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2290,6 +2290,8 @@
> +@@ -2462,6 +2462,8 @@ LIBS="$withval $LIBS"
>
>   PKG_PROG_PKG_CONFIG
>
> @@ -42,11 +58,11 @@ Index: b/configure.ac
>   # Check for use of the system expat library
>   AC_MSG_CHECKING(for --with-system-expat)
>   AC_ARG_WITH(system_expat,
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index 64001e2..3b51c0a 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -33,7 +33,10 @@
> +@@ -33,7 +33,10 @@ host_platform = get_platform()
>   COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
>
>   # This global variable is used to hold the list of modules to be disabled.
> @@ -58,3 +74,6 @@ Index: b/setup.py
>
>   def add_dir_to_list(dirlist, dir):
>       """Add the directory 'dir' to the list 'dirlist' (at the front) if
> +--
> +2.7.4
> +
> diff --git a/package/python/008-distutils-use-python-sysroot.patch b/package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
> similarity index 75%
> rename from package/python/008-distutils-use-python-sysroot.patch
> rename to package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
> index 7cd7487..c68f1bf 100644
> --- a/package/python/008-distutils-use-python-sysroot.patch
> +++ b/package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
> @@ -1,4 +1,7 @@
> -Adjust library/header paths for cross-compilation
> +From f3e0a677c4736f95338825a022a884f8dc7a5c14 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:22:19 +0100
> +Subject: [PATCH] Adjust library/header paths for cross-compilation
>
>  When cross-compiling third-party extensions, the get_python_inc() or
>  get_python_lib() can be called, to return the path to headers or
> @@ -15,12 +18,32 @@ The _python_sysroot variable is also used to prefix the LIBDIR value
>  taken from the sysconfigdata module.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Lib/distutils/command/build_ext.py | 5 ++++-
> + Lib/distutils/sysconfig.py         | 9 +++++++--
> + 2 files changed, 11 insertions(+), 3 deletions(-)
>
> -Index: b/Lib/distutils/sysconfig.py
> -===================================================================
> +diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
> +index 2c68be3..375b08c 100644
> +--- a/Lib/distutils/command/build_ext.py
> ++++ b/Lib/distutils/command/build_ext.py
> +@@ -240,7 +240,10 @@ class build_ext (Command):
> +         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
> +             if not sysconfig.python_build:
> +                 # building third party extensions
> +-                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
> ++                libdir = sysconfig.get_config_var('LIBDIR')
> ++                if "_python_sysroot" in os.environ:
> ++                    libdir = os.environ.get("_python_sysroot") + libdir
> ++                self.library_dirs.append(libdir)
> +             else:
> +                 # building python standard extensions
> +                 self.library_dirs.append('.')
> +diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> +index d72b6e5..72151df 100644
>  --- a/Lib/distutils/sysconfig.py
>  +++ b/Lib/distutils/sysconfig.py
> -@@ -19,8 +19,13 @@
> +@@ -19,8 +19,13 @@ import sys
>   from distutils.errors import DistutilsPlatformError
>
>   # These are needed in a couple of spots, so just compute them once.
> @@ -36,19 +59,6 @@ Index: b/Lib/distutils/sysconfig.py
>
>   # Path to the base directory of the project. On Windows the binary may
>   # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -Index: b/Lib/distutils/command/build_ext.py
> -===================================================================
> ---- a/Lib/distutils/command/build_ext.py
> -+++ b/Lib/distutils/command/build_ext.py
> -@@ -237,7 +237,10 @@
> -         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
> -             if not sysconfig.python_build:
> -                 # building third party extensions
> --                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
> -+                libdir = sysconfig.get_config_var('LIBDIR')
> -+                if "_python_sysroot" in os.environ:
> -+                    libdir = os.environ.get("_python_sysroot") + libdir
> -+                self.library_dirs.append(libdir)
> -             else:
> -                 # building python standard extensions
> -                 self.library_dirs.append('.')
> +--
> +2.7.4
> +
> diff --git a/package/python/009-no-termcap-host-path.patch b/package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> similarity index 67%
> rename from package/python/009-no-termcap-host-path.patch
> rename to package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> index 781e179..d523b74 100644
> --- a/package/python/009-no-termcap-host-path.patch
> +++ b/package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> @@ -1,13 +1,18 @@
> -Don't look in /usr/lib/termcap for libraries
> +From 87b627d8845e67fd798449b414bece04f18bd450 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:22:40 +0100
> +Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + setup.py | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)
>
> -
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index 3b51c0a..fa32532 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -764,12 +764,9 @@
> +@@ -784,12 +784,9 @@ class PyBuildExt(build_ext):
>                   pass # Issue 7384: Already linked against curses or tinfo.
>               elif curses_library:
>                   readline_libs.append(curses_library)
> @@ -21,3 +26,6 @@ Index: b/setup.py
>                                      extra_link_args=readline_extra_link_args,
>                                      libraries=readline_libs) )
>           else:
> +--
> +2.7.4
> +
> diff --git a/package/python/010-fix-python-config.patch b/package/python/0009-Fix-python-config-for-cross-builds.patch
> similarity index 81%
> rename from package/python/010-fix-python-config.patch
> rename to package/python/0009-Fix-python-config-for-cross-builds.patch
> index b40339b..44ddbce 100644
> --- a/package/python/010-fix-python-config.patch
> +++ b/package/python/0009-Fix-python-config-for-cross-builds.patch
> @@ -1,55 +1,29 @@
> +From e5b0d225f4343e82791cb80e4e0c01a9b49eeff4 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Tue, 7 Mar 2017 22:23:14 +0100
> +Subject: [PATCH] Fix python-config for cross-builds
> +
>  Add a backport of http://bugs.python.org/issue16235 so we can use
>  python-config for cross builds.
> -This basically replaces the python version of python-config with a pure-shell
> -version that's already preprocessed when installed and doesn't depend
> -on the sysconfig import that usually leads to bad data/results.
> +
> +This basically replaces the python version of python-config with a
> +pure-shell version that's already preprocessed when installed and
> +doesn't depend on the sysconfig import that usually leads to bad
> +data/results.
>
>  Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +---
> + Makefile.pre.in          |  13 +++---
> + Misc/python-config.sh.in | 102 +++++++++++++++++++++++++++++++++++++++++++++++
> + configure.ac             |   7 +++-
> + 3 files changed, 116 insertions(+), 6 deletions(-)
> + create mode 100644 Misc/python-config.sh.in
>
> -Index: b/configure.ac
> -===================================================================
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -885,6 +885,7 @@
> -
> - # Other platforms follow
> - if test $enable_shared = "yes"; then
> -+  PY_ENABLE_SHARED=1
> -   AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
> -   case $ac_sys_system in
> -     BeOS*)
> -@@ -945,6 +946,7 @@
> -
> -   esac
> - else # shared is disabled
> -+  PY_ENABLE_SHARED=0
> -   case $ac_sys_system in
> -     CYGWIN*)
> -           BLDLIBRARY='$(LIBRARY)'
> -@@ -1921,6 +1923,9 @@
> - AC_SUBST(BLDSHARED)
> - AC_SUBST(CCSHARED)
> - AC_SUBST(LINKFORSHARED)
> -+AC_SUBST(PY_ENABLE_SHARED)
> -+LIBPL="${prefix}/lib/python${VERSION}/config"
> -+AC_SUBST(LIBPL)
> - # SO is the extension of shared libraries `(including the dot!)
> - # -- usually .so, .sl on HP-UX, .dll on Cygwin
> - AC_MSG_CHECKING(SO)
> -@@ -4588,7 +4593,7 @@
> - AC_SUBST(ENSUREPIP)
> -
> - # generate output files
> --AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
> -+AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc Misc/python-config.sh)
> - AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
> - AC_OUTPUT
> -
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 33b994d..beb0837 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -166,7 +166,7 @@
> +@@ -171,7 +171,7 @@ SRCDIRS=   @SRCDIRS@
>   SUBDIRSTOO=   Include Lib Misc Demo
>
>   # Files and directories to be distributed
> @@ -58,16 +32,16 @@ Index: b/Makefile.pre.in
>   DISTFILES=    README ChangeLog $(CONFIGFILES)
>   DISTDIRS=     $(SUBDIRS) $(SUBDIRSTOO) Ext-dummy
>   DIST=         $(DISTFILES) $(DISTDIRS)
> -@@ -410,7 +410,7 @@
> +@@ -431,7 +431,7 @@ LIBRARY_OBJS=      \
>
>   # Default target
>   all:          @DEF_MAKE_ALL_RULE@
>  -build_all:    $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
>  +build_all:    $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
>
> - # Compile a binary with gcc profile guided optimization.
> + # Compile a binary with profile guided optimization.
>   profile-opt:
> -@@ -1101,10 +1101,12 @@
> +@@ -1179,10 +1179,12 @@ $(srcdir)/Lib/$(PLATDIR):
>         fi; \
>         cd $(srcdir)/Lib/$(PLATDIR); $(RUNSHARED) ./regen
>
> @@ -82,7 +56,7 @@ Index: b/Makefile.pre.in
>
>   # Install the include files
>   INCLDIRSTOMAKE=$(INCLUDEDIR) $(CONFINCLUDEDIR) $(INCLUDEPY) $(CONFINCLUDEPY)
> -@@ -1163,7 +1165,7 @@
> +@@ -1241,7 +1243,7 @@ libainstall:     all python-config
>         $(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
>         $(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
>         $(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(VERSION)-config
> @@ -91,7 +65,7 @@ Index: b/Makefile.pre.in
>         @if [ -s Modules/python.exp -a \
>                 "`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
>                 echo; echo "Installing support files for building shared extension modules on AIX:"; \
> -@@ -1345,6 +1347,7 @@
> +@@ -1426,6 +1428,7 @@ clobber: clean profile-removal
>                 config.cache config.log pyconfig.h Modules/config.c
>         -rm -rf build platform
>         -rm -rf $(PYTHONFRAMEWORKDIR)
> @@ -99,8 +73,9 @@ Index: b/Makefile.pre.in
>
>   # Make things extra clean, before making a distribution:
>   # remove all generated files, even Makefile[.pre]
> -Index: b/Misc/python-config.sh.in
> -===================================================================
> +diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
> +new file mode 100644
> +index 0000000..10db4c1
>  --- /dev/null
>  +++ b/Misc/python-config.sh.in
>  @@ -0,0 +1,102 @@
> @@ -206,3 +181,45 @@ Index: b/Misc/python-config.sh.in
>  +      ;;
>  +esac
>  +done
> +diff --git a/configure.ac b/configure.ac
> +index 5d4232f..183a903 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -905,6 +905,7 @@ fi
> +
> + # Other platforms follow
> + if test $enable_shared = "yes"; then
> ++  PY_ENABLE_SHARED=1
> +   AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
> +   case $ac_sys_system in
> +     BeOS*)
> +@@ -965,6 +966,7 @@ if test $enable_shared = "yes"; then
> +
> +   esac
> + else # shared is disabled
> ++  PY_ENABLE_SHARED=0
> +   case $ac_sys_system in
> +     CYGWIN*)
> +           BLDLIBRARY='$(LIBRARY)'
> +@@ -2096,6 +2098,9 @@ AC_SUBST(LDCXXSHARED)
> + AC_SUBST(BLDSHARED)
> + AC_SUBST(CCSHARED)
> + AC_SUBST(LINKFORSHARED)
> ++AC_SUBST(PY_ENABLE_SHARED)
> ++LIBPL="${prefix}/lib/python${VERSION}/config"
> ++AC_SUBST(LIBPL)
> + # SO is the extension of shared libraries `(including the dot!)
> + # -- usually .so, .sl on HP-UX, .dll on Cygwin
> + AC_MSG_CHECKING(SO)
> +@@ -4818,7 +4823,7 @@ AC_MSG_RESULT($ENSUREPIP)
> + AC_SUBST(ENSUREPIP)
> +
> + # generate output files
> +-AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
> ++AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc Misc/python-config.sh)
> + AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
> + AC_OUTPUT
> +
> +--
> +2.7.4
> +
> diff --git a/package/python/011-remove-python-symlink.patch b/package/python/0010-Remove-the-python-symlink-install-rules.patch
> similarity index 65%
> rename from package/python/011-remove-python-symlink.patch
> rename to package/python/0010-Remove-the-python-symlink-install-rules.patch
> index e021d83..864ccbf 100644
> --- a/package/python/011-remove-python-symlink.patch
> +++ b/package/python/0010-Remove-the-python-symlink-install-rules.patch
> @@ -1,18 +1,24 @@
> -Remove the python symlink install rules.
> +From bddfcbb8a4c011ca2fe471f7a4124cd64b5b0f00 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Tue, 7 Mar 2017 22:23:58 +0100
> +Subject: [PATCH] Remove the python symlink install rules
>
> -The python symlink installation will be handled by Buildroot itself, because
> -Buildroot needs to control to what python interpreter (python2 or python3) the
> -python symlink points to.
> +The python symlink installation will be handled by Buildroot itself,
> +because Buildroot needs to control to what python interpreter (python2
> +or python3) the python symlink points to.
>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +[Bernd: rebased against version 2.7.12.]
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -(rebased against version 2.7.12)
> +---
> + Makefile.pre.in | 7 -------
> + 1 file changed, 7 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index beb0837..dedcf61 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -974,17 +974,10 @@
> +@@ -968,17 +968,10 @@ bininstall:      altbininstall
>                 echo "Creating directory $(LIBPC)"; \
>                 $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC); \
>         fi
> @@ -30,3 +36,6 @@ Index: b/Makefile.pre.in
>         -test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
>         -rm -f $(DESTDIR)$(LIBPC)/python2.pc
>         (cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python2.pc)
> +--
> +2.7.4
> +
> diff --git a/package/python/013-dont-add-multiarch-path.patch b/package/python/0011-Don-t-add-multiarch-paths.patch
> similarity index 68%
> rename from package/python/013-dont-add-multiarch-path.patch
> rename to package/python/0011-Don-t-add-multiarch-paths.patch
> index 94fcb0f..b84c907 100644
> --- a/package/python/013-dont-add-multiarch-path.patch
> +++ b/package/python/0011-Don-t-add-multiarch-paths.patch
> @@ -1,4 +1,7 @@
> -Don't add multiarch paths
> +From 50a243a9c90f95e9248ac720e42e802b5922ab90 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:24:28 +0100
> +Subject: [PATCH] Don't add multiarch paths
>
>  The add_multiarch_paths() function leads, in certain build
>  environments, to the addition of host header paths to the CFLAGS,
> @@ -9,12 +12,15 @@ cross-compiling.
>  Investigation done by David <buildroot-2014@inbox.com>.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index fa32532..0b9ea57 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -445,9 +445,9 @@
> +@@ -461,9 +461,9 @@ class PyBuildExt(build_ext):
>           if not cross_compiling:
>               add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
>               add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
> @@ -25,3 +31,6 @@ Index: b/setup.py
>
>           # Add paths specified in the environment variables LDFLAGS and
>           # CPPFLAGS for header and library files.
> +--
> +2.7.4
> +
> diff --git a/package/python/014-abort-on-failed-modules.patch b/package/python/0012-Abort-on-failed-module-build.patch
> similarity index 57%
> rename from package/python/014-abort-on-failed-modules.patch
> rename to package/python/0012-Abort-on-failed-module-build.patch
> index 4bceeb6..7d952ca 100644
> --- a/package/python/014-abort-on-failed-modules.patch
> +++ b/package/python/0012-Abort-on-failed-module-build.patch
> @@ -1,4 +1,7 @@
> -Abort on failed module build
> +From a131e2ff219872d97eef6585117bd2f8ff9e310d Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:24:48 +0100
> +Subject: [PATCH] Abort on failed module build
>
>  When building a Python module fails, the setup.py script currently
>  doesn't exit with an error, and simply continues. This is not a really
> @@ -6,12 +9,15 @@ nice behavior, so this patch changes setup.py to abort with an error,
>  so that the build issue is clearly noticeable.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + setup.py | 1 +
> + 1 file changed, 1 insertion(+)
>
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index 0b9ea57..9a5c2b8 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -283,6 +283,7 @@
> +@@ -299,6 +299,7 @@ class PyBuildExt(build_ext):
>               print "Failed to build these modules:"
>               print_three_column(failed)
>               print
> @@ -19,3 +25,6 @@ Index: b/setup.py
>
>       def build_extension(self, ext):
>
> +--
> +2.7.4
> +
> diff --git a/package/python/015-fix-sqlite-without-threads.patch b/package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
> similarity index 72%
> rename from package/python/015-fix-sqlite-without-threads.patch
> rename to package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
> index f51c37b..dfc11ef 100644
> --- a/package/python/015-fix-sqlite-without-threads.patch
> +++ b/package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
> @@ -1,4 +1,7 @@
> -sqlite3: fix build when threads are not used/available
> +From 0f0be88526ece7d2f6ee21c1f59b1546ec6dc7c0 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Tue, 7 Mar 2017 22:25:14 +0100
> +Subject: [PATCH] sqlite3: fix build when threads are not used/available
>
>  When threads are not used/available, a function in the sqlite3 extension
>  ends up with a label at the end:
> @@ -34,12 +37,15 @@ Fix that by adding a dummy statement after the label, so that the label
>  is never the last statement of the function.
>
>  Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + Modules/_sqlite/connection.c | 1 +
> + 1 file changed, 1 insertion(+)
>
> -Index: b/Modules/_sqlite/connection.c
> -===================================================================
> +diff --git a/Modules/_sqlite/connection.c b/Modules/_sqlite/connection.c
> +index 237d6e4..cdf69ab 100644
>  --- a/Modules/_sqlite/connection.c
>  +++ b/Modules/_sqlite/connection.c
> -@@ -786,6 +786,7 @@
> +@@ -794,6 +794,7 @@ error:
>   #ifdef WITH_THREAD
>       PyGILState_Release(threadstate);
>   #endif
> @@ -47,3 +53,6 @@ Index: b/Modules/_sqlite/connection.c
>   }
>
>   static void _pysqlite_drop_unused_statement_references(pysqlite_Connection* self)
> +--
> +2.7.4
> +
> diff --git a/package/python/016-serial-ioctl-workaround.patch b/package/python/0014-Serial-ioctl-workaround.patch
> similarity index 66%
> rename from package/python/016-serial-ioctl-workaround.patch
> rename to package/python/0014-Serial-ioctl-workaround.patch
> index 80ed65e..468d535 100644
> --- a/package/python/016-serial-ioctl-workaround.patch
> +++ b/package/python/0014-Serial-ioctl-workaround.patch
> @@ -1,4 +1,7 @@
> -Serial ioctl() workaround
> +From 22e5a4c5d29ddf0856d7f68f5a613aec00e26168 Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Tue, 7 Mar 2017 22:25:36 +0100
> +Subject: [PATCH] Serial ioctl() workaround
>
>  The ioctls.h of some architectures (notably xtensa) references structs from
>  linux/serial.h. Make sure to include this header as well.
> @@ -8,8 +11,11 @@ but isn't actually referenced in modern kernels.
>
>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  ---
> -Index: b/Modules/termios.c
> -===================================================================
> + Modules/termios.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Modules/termios.c b/Modules/termios.c
> +index 57f30dc..a8c9855 100644
>  --- a/Modules/termios.c
>  +++ b/Modules/termios.c
>  @@ -16,7 +16,9 @@
> @@ -22,3 +28,6 @@ Index: b/Modules/termios.c
>
>   /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
>    * MDTR, MRI, and MRTS (appearantly used internally by some things
> +--
> +2.7.4
> +
> diff --git a/package/python/017-distutils-scripts-dont-adjust-shebang.patch b/package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
> similarity index 61%
> rename from package/python/017-distutils-scripts-dont-adjust-shebang.patch
> rename to package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
> index da4dc36..fecf29f 100644
> --- a/package/python/017-distutils-scripts-dont-adjust-shebang.patch
> +++ b/package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
> @@ -1,4 +1,8 @@
> -Do not adjust the shebang of Python scripts for cross-compilation
> +From 70049366ddf1fc9084bb02cf4459380976cdf8f7 Mon Sep 17 00:00:00 2001
> +From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> +Date: Tue, 7 Mar 2017 22:26:09 +0100
> +Subject: [PATCH] Do not adjust the shebang of Python scripts for
> + cross-compilation
>
>  The copy_scripts() method in distutils copies the scripts listed in
>  the setup file and adjusts the first line to refer to the current
> @@ -9,12 +13,15 @@ This patch modifies copy_scripts() to preserve the shebang when
>  cross-compilation is detected.
>
>  Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> +---
> + Lib/distutils/command/build_scripts.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: b/Lib/distutils/command/build_scripts.py
> -===================================================================
> +diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
> +index 567df65..4922d50 100644
>  --- a/Lib/distutils/command/build_scripts.py
>  +++ b/Lib/distutils/command/build_scripts.py
> -@@ -89,7 +89,7 @@
> +@@ -89,7 +89,7 @@ class build_scripts (Command):
>                       adjust = 1
>                       post_interp = match.group(1) or ''
>
> @@ -23,3 +30,6 @@ Index: b/Lib/distutils/command/build_scripts.py
>                   log.info("copying and adjusting %s -> %s", script,
>                            self.build_dir)
>                   if not self.dry_run:
> +--
> +2.7.4
> +
> diff --git a/package/python/100-optional-test-modules.patch b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
> similarity index 79%
> rename from package/python/100-optional-test-modules.patch
> rename to package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
> index 3de6f26..a147655 100644
> --- a/package/python/100-optional-test-modules.patch
> +++ b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
> @@ -1,21 +1,23 @@
> -Add an option to disable installation of test modules
> +From 0eac7789c0dd4aebe9e69d3c73d0c95e96922ea3 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:27:16 +0100
> +Subject: [PATCH] Add an option to disable installation of test modules
>
>  The Python standard distribution comes with many test modules, that
>  are not necessarly useful on embedded targets.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |   40 +++++++++++++++++++++++++++-------------
> - configure.in    |    6 ++++++
> - 2 files changed, 33 insertions(+), 13 deletions(-)
> + Makefile.pre.in | 48 ++++++++++++++++++++++++++++++++----------------
> + configure.ac    |  6 ++++++
> + 2 files changed, 38 insertions(+), 16 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index dedcf61..280cc4e 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -960,27 +960,43 @@
> +@@ -1038,27 +1038,43 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
>         plat-mac/lib-scriptpackages/SystemEvents \
>         plat-mac/lib-scriptpackages/Terminal
>   PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
> @@ -75,11 +77,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 183a903..a1a35f6 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2634,6 +2634,12 @@
> +@@ -2806,6 +2806,12 @@ if test "$posix_threads" = "yes"; then
>   fi
>
>
> @@ -92,3 +94,6 @@ Index: b/configure.ac
>   # Check for enable-ipv6
>   AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
>   AC_MSG_CHECKING([if --enable-ipv6 is specified])
> +--
> +2.7.4
> +
> diff --git a/package/python/101-optional-pydoc.patch b/package/python/0017-Add-an-option-to-disable-pydoc.patch
> similarity index 70%
> rename from package/python/101-optional-pydoc.patch
> rename to package/python/0017-Add-an-option-to-disable-pydoc.patch
> index 143e11a..18582f1 100644
> --- a/package/python/101-optional-pydoc.patch
> +++ b/package/python/0017-Add-an-option-to-disable-pydoc.patch
> @@ -1,22 +1,24 @@
> -Add an option to disable pydoc
> +From 52463745b6c46a46a6f2e2bc17983bb3f7bdac6e Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:27:34 +0100
> +Subject: [PATCH] Add an option to disable pydoc
>
>  It removes 0.5 MB of data from the target plus the pydoc script
>  itself.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |    6 +++++-
> - configure.in    |    5 +++++
> - setup.py        |   10 +++++++---
> + Makefile.pre.in |  6 +++++-
> + configure.ac    |  5 +++++
> + setup.py        | 10 +++++++---
>   3 files changed, 17 insertions(+), 4 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 280cc4e..84d5fc6 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -974,7 +974,7 @@
> +@@ -1052,7 +1052,7 @@ LIBSUBDIRS=      lib-tk site-packages \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
>                 lib-old \
> @@ -25,7 +27,7 @@ Index: b/Makefile.pre.in
>
>   TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
>         lib-tk/test/test_ttk test test/audiodata test/capath test/data \
> -@@ -997,6 +997,10 @@
> +@@ -1075,6 +1075,10 @@ ifeq (@TEST_MODULES@,yes)
>   LIBSUBDIRS += $(TESTSUBDIRS)
>   endif
>
> @@ -36,11 +38,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index a1a35f6..8bab160 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2633,6 +2633,11 @@
> +@@ -2805,6 +2805,11 @@ if test "$posix_threads" = "yes"; then
>         AC_CHECK_FUNCS(pthread_atfork)
>   fi
>
> @@ -52,11 +54,11 @@ Index: b/configure.ac
>
>   AC_SUBST(TEST_MODULES)
>
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index 9a5c2b8..69771e2 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2211,6 +2211,12 @@
> +@@ -2233,6 +2233,12 @@ def main():
>       # turn off warnings when deprecated modules are imported
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
> @@ -69,7 +71,7 @@ Index: b/setup.py
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
>             version = sys.version.split()[0],
> -@@ -2231,9 +2237,7 @@
> +@@ -2253,9 +2259,7 @@ def main():
>             ext_modules=[Extension('_struct', ['_struct.c'])],
>
>             # Scripts to install
> @@ -80,3 +82,6 @@ Index: b/setup.py
>           )
>
>   # --install-platlib
> +--
> +2.7.4
> +
> diff --git a/package/python/102-optional-2to3.patch b/package/python/0018-Add-an-option-to-disable-lib2to3.patch
> similarity index 71%
> rename from package/python/102-optional-2to3.patch
> rename to package/python/0018-Add-an-option-to-disable-lib2to3.patch
> index 100c417..765b05d 100644
> --- a/package/python/102-optional-2to3.patch
> +++ b/package/python/0018-Add-an-option-to-disable-lib2to3.patch
> @@ -1,22 +1,24 @@
> -Add an option to disable lib2to3
> +From d0cf9ebed6d34d820cf594578cf513797fb52772 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:27:49 +0100
> +Subject: [PATCH] Add an option to disable lib2to3
>
>  lib2to3 is a library to convert Python 2.x code to Python 3.x. As
>  such, it is probably not very useful on embedded system targets.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |   24 +++++++++++++++++-------
> - configure.in    |    6 ++++++
> - setup.py        |    5 +++--
> - 3 files changed, 26 insertions(+), 9 deletions(-)
> + Makefile.pre.in | 11 ++++++++---
> + configure.ac    |  6 ++++++
> + setup.py        |  5 +++--
> + 3 files changed, 17 insertions(+), 5 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 84d5fc6..b2a0490 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -967,7 +967,6 @@
> +@@ -1045,7 +1045,6 @@ LIBSUBDIRS=      lib-tk site-packages \
>                 json \
>                 sqlite3  \
>                 logging bsddb csv importlib wsgiref \
> @@ -24,7 +26,7 @@ Index: b/Makefile.pre.in
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
>                 distutils distutils/command $(XMLLIBSUBDIRS) \
> -@@ -986,8 +985,6 @@
> +@@ -1064,8 +1063,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
>         json/tests \
>         sqlite3/test \
>         bsddb/test \
> @@ -33,7 +35,7 @@ Index: b/Makefile.pre.in
>         ctypes/test \
>         idlelib/idle_test \
>         distutils/tests \
> -@@ -1001,6 +998,14 @@
> +@@ -1079,6 +1076,14 @@ ifeq (@PYDOC@,yes)
>   LIBSUBDIRS += pydoc_data
>   endif
>
> @@ -48,11 +50,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 8bab160..270f337 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2645,6 +2645,12 @@
> +@@ -2817,6 +2817,12 @@ AC_ARG_ENABLE(test-modules,
>         AS_HELP_STRING([--disable-test-modules], [disable test modules]),
>         [ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
>
> @@ -65,11 +67,11 @@ Index: b/configure.ac
>   # Check for enable-ipv6
>   AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
>   AC_MSG_CHECKING([if --enable-ipv6 is specified])
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index 69771e2..f51ef8c 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2212,10 +2212,11 @@
> +@@ -2234,10 +2234,11 @@ def main():
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>
> @@ -83,3 +85,6 @@ Index: b/setup.py
>
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
> +--
> +2.7.4
> +
> diff --git a/package/python/103-optional-sqlite.patch b/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
> similarity index 59%
> rename from package/python/103-optional-sqlite.patch
> rename to package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
> index 3a48011..bffe3fa 100644
> --- a/package/python/103-optional-sqlite.patch
> +++ b/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
> @@ -1,38 +1,20 @@
> -Add option to disable the sqlite3 module
> +From 570e1e81484d9bcbd30a7719b07d02785a5cab24 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:28:06 +0100
> +Subject: [PATCH] Add option to disable the sqlite3 module
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |   24 +++++++++++++++++-------
> - configure.in |    9 +++++++++
> - 2 file changed, 9 insertions(+)
> + Makefile.pre.in | 7 +++++--
> + configure.ac    | 9 +++++++++
> + 2 files changed, 14 insertions(+), 2 deletions(-)
>
> -Index: b/configure.ac
> -===================================================================
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -2633,6 +2633,15 @@
> -       AC_CHECK_FUNCS(pthread_atfork)
> - fi
> -
> -+AC_SUBST(SQLITE3)
> -+AC_ARG_ENABLE(sqlite3,
> -+      AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
> -+      [ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
> -+
> -+if test "$SQLITE3" = "no" ; then
> -+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
> -+fi
> -+
> - AC_SUBST(PYDOC)
> -
> - AC_ARG_ENABLE(pydoc,
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index b2a0490..974a052 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -965,7 +965,6 @@
> +@@ -1043,7 +1043,6 @@ LIBSUBDIRS=      lib-tk site-packages \
>                 email email/mime \
>                 ensurepip ensurepip/_bundled \
>                 json \
> @@ -40,7 +22,7 @@ Index: b/Makefile.pre.in
>                 logging bsddb csv importlib wsgiref \
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
> -@@ -983,7 +982,6 @@
> +@@ -1061,7 +1060,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
>         test/tracedmodules \
>         email/test email/test/data \
>         json/tests \
> @@ -48,7 +30,7 @@ Index: b/Makefile.pre.in
>         bsddb/test \
>         ctypes/test \
>         idlelib/idle_test \
> -@@ -1006,6 +1004,11 @@
> +@@ -1084,6 +1082,11 @@ TESTSUBDIRS +=  lib2to3/tests                           \
>                 lib2to3/tests/data/fixers/myfixes
>   endif
>
> @@ -60,3 +42,26 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> +diff --git a/configure.ac b/configure.ac
> +index 270f337..e9e1897 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2805,6 +2805,15 @@ if test "$posix_threads" = "yes"; then
> +       AC_CHECK_FUNCS(pthread_atfork)
> + fi
> +
> ++AC_SUBST(SQLITE3)
> ++AC_ARG_ENABLE(sqlite3,
> ++      AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
> ++      [ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
> ++
> ++if test "$SQLITE3" = "no" ; then
> ++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
> ++fi
> ++
> + AC_SUBST(PYDOC)
> +
> + AC_ARG_ENABLE(pydoc,
> +--
> +2.7.4
> +
> diff --git a/package/python/104-optional-tk.patch b/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
> similarity index 65%
> rename from package/python/104-optional-tk.patch
> rename to package/python/0020-Add-an-option-to-disable-the-tk-module.patch
> index 18024d3..82df405 100644
> --- a/package/python/104-optional-tk.patch
> +++ b/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
> @@ -1,18 +1,20 @@
> -Add an option to disable the tk module
> +From 05fbe2527b6f87edeef11f288c36bcbaa378ca02 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:28:57 +0100
> +Subject: [PATCH] Add an option to disable the tk module
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |   14 ++++++++++----
> - configure.in    |    9 +++++++++
> - 2 files changed, 19 insertions(+), 4 deletions(-)
> + Makefile.pre.in | 11 ++++++++---
> + configure.ac    |  9 +++++++++
> + 2 files changed, 17 insertions(+), 3 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 974a052..f7f025f 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -960,7 +960,7 @@
> +@@ -1038,7 +1038,7 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
>         plat-mac/lib-scriptpackages/SystemEvents \
>         plat-mac/lib-scriptpackages/Terminal
>   PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
> @@ -21,7 +23,7 @@ Index: b/Makefile.pre.in
>                 encodings compiler hotshot \
>                 email email/mime \
>                 ensurepip ensurepip/_bundled \
> -@@ -974,8 +974,7 @@
> +@@ -1052,8 +1052,7 @@ LIBSUBDIRS=      lib-tk site-packages \
>                 lib-old \
>                 curses $(MACHDEPS)
>
> @@ -31,7 +33,7 @@ Index: b/Makefile.pre.in
>         test/cjkencodings test/decimaltestdata test/xmltestdata \
>         test/imghdrdata \
>         test/subprocessdata \
> -@@ -1009,6 +1008,12 @@
> +@@ -1087,6 +1086,12 @@ LIBSUBDIRS += sqlite3
>   TESTSUBDIRS += sqlite3/test
>   endif
>
> @@ -44,11 +46,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index e9e1897..d0f032c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2642,6 +2642,15 @@
> +@@ -2814,6 +2814,15 @@ if test "$SQLITE3" = "no" ; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
>   fi
>
> @@ -64,3 +66,6 @@ Index: b/configure.ac
>   AC_SUBST(PYDOC)
>
>   AC_ARG_ENABLE(pydoc,
> +--
> +2.7.4
> +
> diff --git a/package/python/105-optional-curses.patch b/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
> similarity index 62%
> rename from package/python/105-optional-curses.patch
> rename to package/python/0021-Add-an-option-to-disable-the-curses-module.patch
> index 9e1ac5a..c36942a 100644
> --- a/package/python/105-optional-curses.patch
> +++ b/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
> @@ -1,18 +1,20 @@
> -Add an option to disable the curses module
> +From dba12f15baad06cc7e17a275201cc022bb6c84f7 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:29:06 +0100
> +Subject: [PATCH] Add an option to disable the curses module
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |    6 +++++-
> - configure.in    |    9 +++++++++
> + Makefile.pre.in | 6 +++++-
> + configure.ac    | 9 +++++++++
>   2 files changed, 14 insertions(+), 1 deletion(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index f7f025f..bd537d9 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -972,7 +972,7 @@
> +@@ -1050,7 +1050,7 @@ LIBSUBDIRS=      site-packages \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
>                 lib-old \
> @@ -21,7 +23,7 @@ Index: b/Makefile.pre.in
>
>   TESTSUBDIRS = test test/audiodata test/capath test/data \
>         test/cjkencodings test/decimaltestdata test/xmltestdata \
> -@@ -1014,6 +1014,10 @@
> +@@ -1092,6 +1092,10 @@ TESTSUBDIRS += lib-tk/test lib-tk/test/test_tkinter     \
>               lib-tk/test/test_ttk
>   endif
>
> @@ -32,11 +34,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index d0f032c..ab081bc 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2651,6 +2651,15 @@
> +@@ -2823,6 +2823,15 @@ if test "$TK" = "no"; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
>   fi
>
> @@ -52,3 +54,6 @@ Index: b/configure.ac
>   AC_SUBST(PYDOC)
>
>   AC_ARG_ENABLE(pydoc,
> +--
> +2.7.4
> +
> diff --git a/package/python/106-optional-expat.patch b/package/python/0022-Add-an-option-to-disable-expat.patch
> similarity index 75%
> rename from package/python/106-optional-expat.patch
> rename to package/python/0022-Add-an-option-to-disable-expat.patch
> index 6ebaf16..8253f11 100644
> --- a/package/python/106-optional-expat.patch
> +++ b/package/python/0022-Add-an-option-to-disable-expat.patch
> @@ -1,4 +1,7 @@
> -Add an option to disable expat
> +From 5f0f30bf342cd2b13f98513c39fd8f17351b1a2f Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:29:20 +0100
> +Subject: [PATCH] Add an option to disable expat
>
>  This patch replaces the existing --with-system-expat option with a
>  --with-expat={system,builtin,none} option, which allows to tell Python
> @@ -8,18 +11,17 @@ installation of XML modules).
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |    6 +++++-
> - configure.in    |   18 +++++++++++++-----
> - setup.py        |    2 +-
> + Makefile.pre.in |  6 +++++-
> + configure.ac    | 18 +++++++++++++-----
> + setup.py        |  2 +-
>   3 files changed, 19 insertions(+), 7 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index bd537d9..e5d0dd7 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -968,7 +968,7 @@
> +@@ -1046,7 +1046,7 @@ LIBSUBDIRS=      site-packages \
>                 logging bsddb csv importlib wsgiref \
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
> @@ -28,7 +30,7 @@ Index: b/Makefile.pre.in
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
>                 lib-old \
> -@@ -1018,6 +1018,10 @@
> +@@ -1096,6 +1096,10 @@ ifeq (@CURSES@,yes)
>   LIBSUBDIRS += curses
>   endif
>
> @@ -39,11 +41,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index ab081bc..63ee545 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2298,13 +2298,21 @@
> +@@ -2470,13 +2470,21 @@ PKG_PROG_PKG_CONFIG
>   AC_SUBST(DISABLED_EXTENSIONS)
>
>   # Check for use of the system expat library
> @@ -70,11 +72,11 @@ Index: b/configure.ac
>
>   # Check for use of the system libffi library
>   AC_MSG_CHECKING(for --with-system-ffi)
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index f51ef8c..c68f6b4 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1463,7 +1463,7 @@
> +@@ -1483,7 +1483,7 @@ class PyBuildExt(build_ext):
>           #
>           # More information on Expat can be found at www.libexpat.org.
>           #
> @@ -83,3 +85,6 @@ Index: b/setup.py
>               expat_inc = []
>               define_macros = []
>               expat_lib = ['expat']
> +--
> +2.7.4
> +
> diff --git a/package/python/107-optional-codecs-cjk.patch b/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
> similarity index 58%
> rename from package/python/107-optional-codecs-cjk.patch
> rename to package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
> index 22a2fed..e2c2d98 100644
> --- a/package/python/107-optional-codecs-cjk.patch
> +++ b/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
> @@ -1,16 +1,18 @@
> -Add an option to disable CJK codecs
> +From cb848dae763a3f57e31d734d3be6889f660fa0d0 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:29:31 +0100
> +Subject: [PATCH] Add an option to disable CJK codecs
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
>  ---
> - configure.in |    6 ++++++
> + configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 63ee545..6a854ab 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2650,6 +2650,12 @@
> +@@ -2822,6 +2822,12 @@ if test "$SQLITE3" = "no" ; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
>   fi
>
> @@ -23,3 +25,6 @@ Index: b/configure.ac
>   AC_SUBST(TK)
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
> +--
> +2.7.4
> +
> diff --git a/package/python/108-optional-nis.patch b/package/python/0024-Add-an-option-to-disable-NIS.patch
> similarity index 63%
> rename from package/python/108-optional-nis.patch
> rename to package/python/0024-Add-an-option-to-disable-NIS.patch
> index d19ebe1..877dfd9 100644
> --- a/package/python/108-optional-nis.patch
> +++ b/package/python/0024-Add-an-option-to-disable-NIS.patch
> @@ -1,19 +1,21 @@
> -Add an option to disable NIS
> +From 133776d396b8eaf0243484dc990a53576de9685f Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:29:41 +0100
> +Subject: [PATCH] Add an option to disable NIS
>
>  NIS is not necessarily available in uClibc, so we need an option to
>  not compile support for it.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
>  ---
> - configure.in |    6 ++++++
> + configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 6a854ab..4c2cbc1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2656,6 +2656,12 @@
> +@@ -2828,6 +2828,12 @@ AC_ARG_ENABLE(codecs-cjk,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
>           fi])
>
> @@ -26,3 +28,6 @@ Index: b/configure.ac
>   AC_SUBST(TK)
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
> +--
> +2.7.4
> +
> diff --git a/package/python/109-optional-unicodedata.patch b/package/python/0025-Add-an-option-to-disable-unicodedata.patch
> similarity index 58%
> rename from package/python/109-optional-unicodedata.patch
> rename to package/python/0025-Add-an-option-to-disable-unicodedata.patch
> index 841f2a7..a1255e5 100644
> --- a/package/python/109-optional-unicodedata.patch
> +++ b/package/python/0025-Add-an-option-to-disable-unicodedata.patch
> @@ -1,16 +1,18 @@
> -Add an option to disable unicodedata
> +From aa78e3684c0e8f7a5e910e838f9eca2631262048 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:29:52 +0100
> +Subject: [PATCH] Add an option to disable unicodedata
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
>  ---
> - configure.in |    6 ++++++
> + configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 4c2cbc1..09cb3de 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2662,6 +2662,12 @@
> +@@ -2834,6 +2834,12 @@ AC_ARG_ENABLE(nis,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
>           fi])
>
> @@ -23,3 +25,6 @@ Index: b/configure.ac
>   AC_SUBST(TK)
>   AC_ARG_ENABLE(tk,
>         AS_HELP_STRING([--disable-tk], [disable tk]),
> +--
> +2.7.4
> +
> diff --git a/package/python/110-optional-db.patch b/package/python/0026-Add-an-option-to-disable-bsddb.patch
> similarity index 72%
> rename from package/python/110-optional-db.patch
> rename to package/python/0026-Add-an-option-to-disable-bsddb.patch
> index b8c454c..e3ccd44 100644
> --- a/package/python/110-optional-db.patch
> +++ b/package/python/0026-Add-an-option-to-disable-bsddb.patch
> @@ -1,4 +1,7 @@
> -Add an option to disable bsddb
> +From cfad2bcae8f572a9422ce5a6adb4caa7c0e521ad Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:30:06 +0100
> +Subject: [PATCH] Add an option to disable bsddb
>
>  bsddb has an external dependency on Berkeley DB. Since we want to be
>  able to build Python without it, this patch adds an option to disable
> @@ -6,17 +9,16 @@ the build/installation of this Python module.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> -
>  ---
> - Makefile.pre.in |   10 ++++++++--
> - configure.in    |   22 ++++++++++++++++++++++
> - 2 files changed, 30 insertions(+), 2 deletions(-)
> + Makefile.pre.in |  8 ++++++--
> + configure.ac    | 22 ++++++++++++++++++++++
> + 2 files changed, 28 insertions(+), 2 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index e5d0dd7..2582574 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -965,7 +965,7 @@
> +@@ -1043,7 +1043,7 @@ LIBSUBDIRS=      site-packages \
>                 email email/mime \
>                 ensurepip ensurepip/_bundled \
>                 json \
> @@ -25,7 +27,7 @@ Index: b/Makefile.pre.in
>                 ctypes ctypes/macholib \
>                 idlelib idlelib/Icons \
>                 distutils distutils/command \
> -@@ -981,7 +981,6 @@
> +@@ -1059,7 +1059,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
>         test/tracedmodules \
>         email/test email/test/data \
>         json/tests \
> @@ -33,7 +35,7 @@ Index: b/Makefile.pre.in
>         ctypes/test \
>         idlelib/idle_test \
>         distutils/tests \
> -@@ -1022,6 +1021,11 @@
> +@@ -1100,6 +1099,11 @@ ifeq (@EXPAT@,yes)
>   LIBSUBDIRS += $(XMLLIBSUBDIRS)
>   endif
>
> @@ -45,11 +47,11 @@ Index: b/Makefile.pre.in
>   libinstall:   build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 09cb3de..524614c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2662,6 +2662,28 @@
> +@@ -2834,6 +2834,28 @@ AC_ARG_ENABLE(nis,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
>           fi])
>
> @@ -78,3 +80,6 @@ Index: b/configure.ac
>   AC_ARG_ENABLE(unicodedata,
>         AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
>         [ if test "$enableval" = "no"; then
> +--
> +2.7.4
> +
> diff --git a/package/python/111-optional-ssl.patch b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
> similarity index 57%
> rename from package/python/111-optional-ssl.patch
> rename to package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
> index 956d2a0..3cb823b 100644
> --- a/package/python/111-optional-ssl.patch
> +++ b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
> @@ -1,16 +1,18 @@
> -Add an option to disable the ssl module
> +From 45fcf92ec1e89e0afd0bf2bbc7a1008b56135ba3 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:30:22 +0100
> +Subject: [PATCH] Add an option to disable the ssl module
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
>  ---
> - configure.in |    6 ++++++
> + configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 524614c..743707a 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2662,6 +2662,12 @@
> +@@ -2834,6 +2834,12 @@ AC_ARG_ENABLE(nis,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
>           fi])
>
> @@ -23,3 +25,6 @@ Index: b/configure.ac
>   AC_ARG_ENABLE(dbm,
>         AS_HELP_STRING([--disable-dbm], [disable DBM]),
>         [ if test "$enableval" = "no"; then
> +--
> +2.7.4
> +
> diff --git a/package/python/112-optional-bzip2.patch b/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
> similarity index 58%
> rename from package/python/112-optional-bzip2.patch
> rename to package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
> index 99fe83c..da914b4 100644
> --- a/package/python/112-optional-bzip2.patch
> +++ b/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
> @@ -1,15 +1,18 @@
> -Add an option to disable the bz2 module
> +From 6b10788fa040442ace100c3a28cbfff29c9db471 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:30:33 +0100
> +Subject: [PATCH] Add an option to disable the bz2 module
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  ---
> - configure.in |    6 ++++++
> + configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 743707a..f1762e9 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2668,6 +2668,12 @@
> +@@ -2840,6 +2840,12 @@ AC_ARG_ENABLE(ssl,
>              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
>           fi])
>
> @@ -22,3 +25,6 @@ Index: b/configure.ac
>   AC_ARG_ENABLE(dbm,
>         AS_HELP_STRING([--disable-dbm], [disable DBM]),
>         [ if test "$enableval" = "no"; then
> +--
> +2.7.4
> +
> diff --git a/package/python/113-optional-zlib.patch b/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
> similarity index 58%
> rename from package/python/113-optional-zlib.patch
> rename to package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
> index 652a586..b4354e2 100644
> --- a/package/python/113-optional-zlib.patch
> +++ b/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
> @@ -1,15 +1,18 @@
> -Add an option to disable the zlib module
> +From af2c56aa0a5900272cc2d04ce667d4b38e34b596 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:30:45 +0100
> +Subject: [PATCH] Add an option to disable the zlib module
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  ---
> - configure.in |    6 ++++++
> + configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index f1762e9..291ba35 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2674,6 +2674,12 @@
> +@@ -2846,6 +2846,12 @@ AC_ARG_ENABLE(bz2,
>               DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
>            fi])
>
> @@ -22,3 +25,6 @@ Index: b/configure.ac
>   AC_ARG_ENABLE(dbm,
>         AS_HELP_STRING([--disable-dbm], [disable DBM]),
>         [ if test "$enableval" = "no"; then
> +--
> +2.7.4
> +
> diff --git a/package/python/114-remove-idle-editor.patch b/package/python/0030-Do-not-install-the-idle-editor.patch
> similarity index 63%
> rename from package/python/114-remove-idle-editor.patch
> rename to package/python/0030-Do-not-install-the-idle-editor.patch
> index 512eedc..60e64c8 100644
> --- a/package/python/114-remove-idle-editor.patch
> +++ b/package/python/0030-Do-not-install-the-idle-editor.patch
> @@ -1,4 +1,7 @@
> -Do not install the idle editor
> +From 4b7c45c756dccfd3b5ece36fe572042353d1c2f0 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Tue, 7 Mar 2017 22:30:56 +0100
> +Subject: [PATCH] Do not install the idle editor
>
>  IDLE is the Python IDE built with the tkinter GUI toolkit. Since it's
>  highly unlikely to ever be useful in an embedded Linux system
> @@ -7,12 +10,16 @@ idle and the related Python modules. It saves 800 KB-900 KB of
>  installed .pyc files.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Makefile.pre.in | 2 --
> + setup.py        | 2 +-
> + 2 files changed, 1 insertion(+), 3 deletions(-)
>
> -Index: b/Makefile.pre.in
> -===================================================================
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 2582574..3cfc590 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -967,7 +967,6 @@
> +@@ -1045,7 +1045,6 @@ LIBSUBDIRS=      site-packages \
>                 json \
>                 logging csv importlib wsgiref \
>                 ctypes ctypes/macholib \
> @@ -20,7 +27,7 @@ Index: b/Makefile.pre.in
>                 distutils distutils/command \
>                 multiprocessing multiprocessing/dummy \
>                 unittest \
> -@@ -982,7 +981,6 @@
> +@@ -1060,7 +1059,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
>         email/test email/test/data \
>         json/tests \
>         ctypes/test \
> @@ -28,11 +35,11 @@ Index: b/Makefile.pre.in
>         distutils/tests \
>         unittest/test
>
> -Index: b/setup.py
> -===================================================================
> +diff --git a/setup.py b/setup.py
> +index c68f6b4..8045a9b 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -2212,7 +2212,7 @@
> +@@ -2234,7 +2234,7 @@ def main():
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>
> @@ -41,3 +48,6 @@ Index: b/setup.py
>       if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
>           scripts += [ 'Tools/scripts/pydoc' ]
>       if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
> +--
> +2.7.4
> +
> diff --git a/package/python/115-optional-ossaudiodev.patch b/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
> similarity index 65%
> rename from package/python/115-optional-ossaudiodev.patch
> rename to package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
> index 89335ba..c2aea5e 100644
> --- a/package/python/115-optional-ossaudiodev.patch
> +++ b/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
> @@ -1,18 +1,18 @@
> -From 30351d9b41a03c43d627d52d46e49ab91bfe342d Mon Sep 17 00:00:00 2001
> +From 6af0f179d3db956146bbabac8748675e3abc1f78 Mon Sep 17 00:00:00 2001
>  From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> -Date: Thu, 8 Jan 2015 11:41:40 +0100
> -Subject: [PATCH 1/1] Add an option to disable the ossaudiodev module
> +Date: Tue, 7 Mar 2017 22:31:22 +0100
> +Subject: [PATCH] Add an option to disable the ossaudiodev module
>
>  Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>  ---
>   configure.ac | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> -Index: b/configure.ac
> -===================================================================
> +diff --git a/configure.ac b/configure.ac
> +index 291ba35..8dc573e 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -2726,6 +2726,12 @@
> +@@ -2898,6 +2898,12 @@ if test "$CURSES" = "no"; then
>      DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
>   fi
>
> @@ -25,3 +25,6 @@ Index: b/configure.ac
>   AC_SUBST(PYDOC)
>
>   AC_ARG_ENABLE(pydoc,
> +--
> +2.7.4
> +
> diff --git a/package/python/006-cross-compile-getaddrinfo.patch b/package/python/006-cross-compile-getaddrinfo.patch
> deleted file mode 100644
> index dd44ec1..0000000
> --- a/package/python/006-cross-compile-getaddrinfo.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: b/configure.ac
> -===================================================================
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3353,7 +3353,7 @@
> -
> - AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
> -
> --if test $have_getaddrinfo = no -o "$ac_cv_buggy_getaddrinfo" = yes
> -+if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
> - then
> -       if test $ipv6 = yes
> -       then
> diff --git a/package/python/018-fix-add-gcc-paths-logic.patch b/package/python/018-fix-add-gcc-paths-logic.patch
> deleted file mode 100644
> index af6efcc..0000000
> --- a/package/python/018-fix-add-gcc-paths-logic.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Override system locale and set to default when adding gcc paths
> -
> -Forces the use of the default locale in the function
> -add_gcc_paths, which is called when cross compiling to add the
> -include and library paths. This is necessary because otherwise
> -the gcc output is localized and the output parsing fails, which
> -results in no paths added and detect_modules not able to find
> -any system library (eg. libz, libssl, etc.)
> -
> -[Thomas: patch taken from https://bugs.python.org/issue23767.]
> -
> -Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: b/setup.py
> -===================================================================
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -414,7 +414,7 @@
> -         tmpfile = os.path.join(self.build_temp, 'gccpaths')
> -         if not os.path.exists(self.build_temp):
> -             os.makedirs(self.build_temp)
> --        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
> -+        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
> -         is_gcc = False
> -         in_incdirs = False
> -         inc_dirs = []
> --
> 2.7.4
>
