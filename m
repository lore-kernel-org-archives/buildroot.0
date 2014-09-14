From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:50:51 +0200
Subject: [Buildroot] [PATCH 16 of 20] packages: rename FOO_BUILD_OPT
 into FOO_BUILD_OPTS
In-Reply-To: <2ca4e88d36346390979b.1406668363@localhost>
References: <patchbomb.1406668347@localhost>
 <2ca4e88d36346390979b.1406668363@localhost>
Message-ID: <20140914145051.GN3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_BUILD_OPT.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-luarocks.txt |   6 +++---
>  docs/manual/adding-packages-perl.txt     |   2 +-
>  docs/manual/adding-packages-python.txt   |   4 ++--
>  package/pkg-luarocks.mk                  |   4 ++--
>  package/pkg-perl.mk                      |   8 ++++----
>  package/pkg-python.mk                    |  14 +++++++-------
>  package/python-numpy/python-numpy.mk     |   2 +-
>  7 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff -r d98d25de70f2 -r 2ca4e88d3634 docs/manual/adding-packages-luarocks.txt
> --- a/docs/manual/adding-packages-luarocks.txt	Tue Jul 29 21:56:34 2014 +0200
> +++ b/docs/manual/adding-packages-luarocks.txt	Tue Jul 29 22:11:15 2014 +0200
> @@ -20,8 +20,8 @@
>  07: LUAFOO_VERSION = 1.0.2-1
>  08: LUAFOO_DEPENDENCIES = foo
>  09:
> -10: LUAFOO_BUILD_OPT += FOO_INCDIR=$(STAGING_DIR)/usr/include
> -11: LUAFOO_BUILD_OPT += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
> +10: LUAFOO_BUILD_OPTS += FOO_INCDIR=$(STAGING_DIR)/usr/include
> +11: LUAFOO_BUILD_OPTS += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
>  12: LUAFOO_LICENSE = luaFoo license
>  13: LUAFOO_LICENSE_FILES = COPYING
>  14:
> @@ -86,5 +86,5 @@
>  * +LUAFOO_SUBDIR+, which defaults to
>    +luafoo-$(LUAFOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+
>  
> -* +LUAFOO_BUILD_OPT+ contains additional build options for the
> +* +LUAFOO_BUILD_OPTS+ contains additional build options for the
>    +luarocks build+ call.
> diff -r d98d25de70f2 -r 2ca4e88d3634 docs/manual/adding-packages-perl.txt
> --- a/docs/manual/adding-packages-perl.txt	Tue Jul 29 21:56:34 2014 +0200
> +++ b/docs/manual/adding-packages-perl.txt	Tue Jul 29 22:11:15 2014 +0200
> @@ -105,7 +105,7 @@
>    configure options to pass to the +perl Makefile.PL+ or +perl Build.PL+.
>    By default, empty.
>  
> -* +PERL_FOO_BUILD_OPT+/+HOST_PERL_FOO_BUILD_OPT+, to specify additional
> +* +PERL_FOO_BUILD_OPTS+/+HOST_PERL_FOO_BUILD_OPTS+, to specify additional
>    options to pass to +make pure_all+ or +perl Build build+ in the build step.
>    By default, empty.
>  
> diff -r d98d25de70f2 -r 2ca4e88d3634 docs/manual/adding-packages-python.txt
> --- a/docs/manual/adding-packages-python.txt	Tue Jul 29 21:56:34 2014 +0200
> +++ b/docs/manual/adding-packages-python.txt	Tue Jul 29 22:11:15 2014 +0200
> @@ -122,9 +122,9 @@
>    setuptools target packages) and +HOST_PKG_PYTHON_SETUPTOOLS_ENV+
>    (for setuptools host packages).
>  
> -* +PYTHON_FOO_BUILD_OPT+, to specify additional options to pass to the
> +* +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to the
>    Python +setup.py+ script during the build step. For target distutils
> -  packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPT+ options are already
> +  packages, the +PKG_PYTHON_DISTUTILS_BUILD_OPTS+ options are already
>    passed automatically by the infrastructure.
>  
>  * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
> diff -r d98d25de70f2 -r 2ca4e88d3634 package/pkg-luarocks.mk
> --- a/package/pkg-luarocks.mk	Tue Jul 29 21:56:34 2014 +0200
> +++ b/package/pkg-luarocks.mk	Tue Jul 29 22:11:15 2014 +0200
> @@ -33,7 +33,7 @@
>  
>  define inner-luarocks-package
>  
> -$(2)_BUILD_OPT		?=
> +$(2)_BUILD_OPTS		?=
>  $(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
>  $(2)_ROCKSPEC		?= $(1)-$$($(3)_VERSION).rockspec
>  $(2)_SOURCE		?= $(1)-$$($(3)_VERSION).src.rock
> @@ -59,7 +59,7 @@
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>  	cd $$($(2)_SRCDIR) && \
> -	 $$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPT)
> +	 $$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
>  endef
>  endif
>  
> diff -r d98d25de70f2 -r 2ca4e88d3634 package/pkg-perl.mk
> --- a/package/pkg-perl.mk	Tue Jul 29 21:56:34 2014 +0200
> +++ b/package/pkg-perl.mk	Tue Jul 29 22:11:15 2014 +0200
> @@ -127,11 +127,11 @@
>  # Build package for target
>  define $(2)_BUILD_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> -		perl Build $$($(2)_BUILD_OPT) build; \
> +		perl Build $$($(2)_BUILD_OPTS) build; \
>  	else \
>  		$$(MAKE1) \
>  			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
> -			$$($(2)_BUILD_OPT) pure_all; \
> +			$$($(2)_BUILD_OPTS) pure_all; \
>  	fi
>  endef
>  else
> @@ -139,9 +139,9 @@
>  # Build package for host
>  define $(2)_BUILD_CMDS
>  	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> -		perl Build $$($(2)_BUILD_OPT) build; \
> +		perl Build $$($(2)_BUILD_OPTS) build; \
>  	else \
> -		$$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
> +		$$(MAKE1) $$($(2)_BUILD_OPTS) pure_all; \
>  	fi
>  endef
>  endif
> diff -r d98d25de70f2 -r 2ca4e88d3634 package/pkg-python.mk
> --- a/package/pkg-python.mk	Tue Jul 29 21:56:34 2014 +0200
> +++ b/package/pkg-python.mk	Tue Jul 29 22:11:15 2014 +0200
> @@ -32,7 +32,7 @@
>  	_python_prefix=/usr \
>  	_python_exec_prefix=/usr
>  
> -PKG_PYTHON_DISTUTILS_BUILD_OPT = \
> +PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
>  	--executable=/usr/bin/python
>  
>  PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
> @@ -95,7 +95,7 @@
>  $(2)_BUILDDIR	= $$($(2)_SRCDIR)
>  
>  $(2)_ENV         ?=
> -$(2)_BUILD_OPT   ?=
> +$(2)_BUILD_OPTS   ?=
>  $(2)_INSTALL_OPTS ?=
>  
>  ifndef $(2)_SETUP_TYPE
> @@ -111,13 +111,13 @@
>  ifeq ($(4),target)
>  $(2)_BASE_ENV         = $$(PKG_PYTHON_DISTUTILS_ENV)
>  $(2)_BASE_BUILD_TGT   = build
> -$(2)_BASE_BUILD_OPT   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPT)
> +$(2)_BASE_BUILD_OPTS   = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
>  $(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
>  $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
>  else
>  $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_DISTUTILS_ENV)
>  $(2)_BASE_BUILD_TGT   = build
> -$(2)_BASE_BUILD_OPT   =
> +$(2)_BASE_BUILD_OPTS   =
>  $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)
>  endif
>  # Setuptools
> @@ -125,13 +125,13 @@
>  ifeq ($(4),target)
>  $(2)_BASE_ENV         = $$(PKG_PYTHON_SETUPTOOLS_ENV)
>  $(2)_BASE_BUILD_TGT   = build
> -$(2)_BASE_BUILD_OPT   =
> +$(2)_BASE_BUILD_OPTS   =
>  $(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
>  $(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
>  else
>  $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
>  $(2)_BASE_BUILD_TGT   = build
> -$(2)_BASE_BUILD_OPT   =
> +$(2)_BASE_BUILD_OPTS   =
>  $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
>  endif
>  else
> @@ -228,7 +228,7 @@
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
>  		$$($(2)_PYTHON_INTERPRETER) setup.py \
>  		$$($$(PKG)_BASE_BUILD_TGT) \
> -		$$($$(PKG)_BASE_BUILD_OPT) $$($$(PKG)_BUILD_OPT))
> +		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
>  endef
>  endif
>  
> diff -r d98d25de70f2 -r 2ca4e88d3634 package/python-numpy/python-numpy.mk
> --- a/package/python-numpy/python-numpy.mk	Tue Jul 29 21:56:34 2014 +0200
> +++ b/package/python-numpy/python-numpy.mk	Tue Jul 29 22:11:15 2014 +0200
> @@ -16,7 +16,7 @@
>  PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
>  endif
>  
> -PYTHON_NUMPY_BUILD_OPT = --fcompiler=None
> +PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
>  
>  define PYTHON_NUMPY_CONFIGURE_CMDS
>  	-rm -f $(@D)/site.cfg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
