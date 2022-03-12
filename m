Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10320C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C9D81A3E;
	Sat, 12 Mar 2022 17:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmeF03FzbeLy; Sat, 12 Mar 2022 17:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3907681DAB;
	Sat, 12 Mar 2022 17:02:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AA8A1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F5C4023D
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbMgQEttUVq7 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:02:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A940D4048A
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:02:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dr20so25145215ejc.6
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tS+ERDtTptL7Mb9m9xWNN0A1ZUwSRA4wdB+JBD1bMQA=;
 b=LDwQ4JhFEFEWEdp6J6JY90efT1rcBT33l8PipmM6JS+y5dwFiI2pADem8aUahBMup7
 kC0Csgqz0lxZGcjaNyVysRPXqE1zFxys6tAQWKWA8QIVHyrHMwDR5hlHeka1vKuNUrdU
 sDYuQSEJdOi5OFwbEH3u8iNdL9sH838gawDnh5n+lNmIdpkGbLKDiLg0YfMNzDUQDhFW
 Tf2/PikdzMJZ5j9MKSPli3hp5KqE0Z1n+WsGPCqasMv0ljgX5YJulLJ5QNJ2QHdW1Lfl
 65/v+w/2F6fCqNGn9xk0hRMGyoZR1fyX4LbGA2guo9OPRfyy/cP/76JGdC7CFC8rvySh
 ljMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tS+ERDtTptL7Mb9m9xWNN0A1ZUwSRA4wdB+JBD1bMQA=;
 b=rSBbCwGZy7PkLeTvDdh464llVjPekrxptNL8zJvClHr87MNNKE/4Efwv9e9LEpLVLt
 Xb0PyNUb5/SPd8wSBt5ZBHi4wGUOpw3RoZIgvs5llLL4I1Wpsrwh+igdAJjyP9su8RUi
 ulwHvhXucI5xBl22KP47yh5hoFBiloVHh1aSj0QuDo8+Njh4Tf94P7RkVhibVzj3yjsa
 aRB/7HqeAEoT6ifQTdmG0Yjo7EZuRLm7iUQG1+sMueWZDimmPJZ1KwDzBsbGQ4kHfZ65
 3kYMo7dx7Q+gUUf5axc7S+zf6JpNoEyCn8yacXroh+rSQz3mSe/ivu185sZ7fEXY7JlC
 OFsw==
X-Gm-Message-State: AOAM531oBBjDK8SLK22EPpMV+TdKXPeZ23DdHlP9PfSxc8J9M0rz0Gw0
 wKK6pnXolVwhTqE6Hwlda71Fcg==
X-Google-Smtp-Source: ABdhPJys1CELzrDPR9zpMFJ7OzXuiOidwEFDrWrikcx9KH8+ZOZZqKMds2frHCBAKgI0YZNvnpdkaw==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr12649756ejn.437.1647104545573; 
 Sat, 12 Mar 2022 09:02:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 si13-20020a170906cecd00b006cded0c5ee2sm4662888ejb.61.2022.03.12.09.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:02:25 -0800 (PST)
Message-ID: <dce43b44-0b9e-f11d-39bd-b12edbabee79@mind.be>
Date: Sat, 12 Mar 2022 18:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220221153151.1780107-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221153151.1780107-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/apparmor: bump to version 3.0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2022 16:31, Angelo Compagnucci wrote:
> Updating also the companion libapparmor library and removing upstreamed
> patch.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/apparmor/apparmor.hash                |   2 +-
>   package/apparmor/apparmor.mk                  |   2 +-
>   ...deprecated-distutils-with-setuptools.patch | 244 ------------------
>   package/libapparmor/libapparmor.hash          |   2 +-
>   package/libapparmor/libapparmor.mk            |   2 +-
>   5 files changed, 4 insertions(+), 248 deletions(-)
>   delete mode 100644 package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
> 
> diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
> index 88280cbfcf..497491b6c9 100644
> --- a/package/apparmor/apparmor.hash
> +++ b/package/apparmor/apparmor.hash
> @@ -1,5 +1,5 @@
>   # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
> -sha256  153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59  apparmor-3.0.3.tar.gz
> +sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
>   
>   # locally computed
>   sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 43bfa05308..76c9f2cafe 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version here, please also update the libapparmor package
>   APPARMOR_VERSION_MAJOR = 3.0
> -APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).3
> +APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
>   APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
>   APPARMOR_DL_SUBDIR = libapparmor
>   APPARMOR_LICENSE = GPL-2.0
> diff --git a/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch b/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
> deleted file mode 100644
> index 5aed31d0b5..0000000000
> --- a/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
> +++ /dev/null
> @@ -1,244 +0,0 @@
> -From 21e5a721ab2abe26bb12b9da7accc39d4fff9804 Mon Sep 17 00:00:00 2001
> -From: Georgia Garcia <georgia.garcia@canonical.com>
> -Date: Wed, 10 Nov 2021 19:50:35 +0000
> -Subject: [PATCH] replace deprecated distutils with setuptools
> -
> -Adds python3 setuptools as a build dependency for libapparmor
> -
> -Fixes: https://gitlab.com/apparmor/apparmor/-/issues/202
> -MR: https://gitlab.com/apparmor/apparmor/-/merge_requests/813
> -Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
> -Acked-by: Christian Boltz <apparmor@cboltz.de>
> -
> -[Retrieved (and updated to remove changes on .gitlab-ci.yml and
> -README.md) from:
> -https://gitlab.com/apparmor/apparmor/-/commit/21e5a721ab2abe26bb12b9da7accc39d4fff9804]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - .gitignore                                    |  3 ++
> - .gitlab-ci.yml                                |  2 +-
> - libraries/libapparmor/m4/ac_python_devel.m4   | 36 +++++++++----------
> - libraries/libapparmor/swig/python/Makefile.am |  2 +-
> - libraries/libapparmor/swig/python/setup.py.in |  2 +-
> - .../libapparmor/swig/python/test/Makefile.am  |  2 +-
> - profiles/Makefile                             |  2 +-
> - utils/Makefile                                |  1 +
> - utils/python-tools-setup.py                   |  6 ++--
> - utils/test/Makefile                           |  2 +-
> - utils/test/README.md                          |  2 +-
> - 11 files changed, 32 insertions(+), 28 deletions(-)
> -
> -diff --git a/.gitignore b/.gitignore
> -index 78a06fdf9..4782a351a 100644
> ---- a/.gitignore
> -+++ b/.gitignore
> -@@ -160,6 +160,7 @@ libraries/libapparmor/swig/perl/libapparmor_wrap.c
> - libraries/libapparmor/swig/perl/libapparmor_wrap.o
> - libraries/libapparmor/swig/perl/pm_to_blib
> - libraries/libapparmor/swig/python/LibAppArmor.py
> -+libraries/libapparmor/swig/python/LibAppArmor.egg-info/
> - libraries/libapparmor/swig/python/build/
> - libraries/libapparmor/swig/python/libapparmor_wrap.c
> - libraries/libapparmor/swig/python/Makefile
> -@@ -204,6 +205,8 @@ utils/*.tmp
> - utils/po/*.mo
> - utils/apparmor/*.pyc
> - utils/apparmor/rule/*.pyc
> -+utils/apparmor.egg-info/
> -+utils/build/
> - utils/htmlcov/
> - utils/test/common_test.pyc
> - utils/test/.coverage
> -diff --git a/libraries/libapparmor/m4/ac_python_devel.m4 b/libraries/libapparmor/m4/ac_python_devel.m4
> -index 1da29d873..f21f70ce7 100644
> ---- a/libraries/libapparmor/m4/ac_python_devel.m4
> -+++ b/libraries/libapparmor/m4/ac_python_devel.m4
> -@@ -66,17 +66,17 @@ variable to configure. See ``configure --help'' for reference.
> -         fi
> -
> -         #
> --        # Check if you have distutils, else fail
> -+        # Check if you have setuptools, else fail
> -         #
> --        AC_MSG_CHECKING([for the distutils Python package])
> --        ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
> --        if test -z "$ac_distutils_result"; then
> -+        AC_MSG_CHECKING([for the setuptools Python package])
> -+        ac_setuptools_result=`$PYTHON -c "import setuptools" 2>&1`
> -+        if test -z "$ac_setuptools_result"; then
> -                 AC_MSG_RESULT([yes])
> -         else
> -                 AC_MSG_RESULT([no])
> --                AC_MSG_ERROR([cannot import Python module "distutils".
> -+                AC_MSG_ERROR([cannot import Python module "setuptools".
> - Please check your Python installation. The error was:
> --$ac_distutils_result])
> -+$ac_setuptools_result])
> -                 PYTHON_VERSION=""
> -         fi
> -
> -@@ -88,8 +88,8 @@ $ac_distutils_result])
> -                 PYTHON_CPPFLAGS=`$PYTHON_CONFIG --includes`
> -         fi
> -         if test -z "$PYTHON_CPPFLAGS"; then
> --                python_path=`$PYTHON -c "import sys; import distutils.sysconfig;\
> --sys.stdout.write('%s\n' % distutils.sysconfig.get_python_inc());"`
> -+                python_path=`$PYTHON -c "import sys; import sysconfig;\
> -+sys.stdout.write('%s\n' % sysconfig.get_path('include'));"`
> -                 if test -n "${python_path}"; then
> -                         python_path="-I$python_path"
> -                 fi
> -@@ -108,8 +108,8 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_inc());"`
> -         if test -z "$PYTHON_LDFLAGS"; then
> -                 # (makes two attempts to ensure we've got a version number
> -                 # from the interpreter)
> --                py_version=`$PYTHON -c "import sys; from distutils.sysconfig import *; \
> --sys.stdout.write('%s\n' % ''.join(get_config_vars('VERSION')))"`
> -+                py_version=`$PYTHON -c "import sys; import sysconfig; \
> -+sys.stdout.write('%s\n' % ''.join(sysconfig.get_config_vars('VERSION')))"`
> -                 if test "$py_version" == "[None]"; then
> -                         if test -n "$PYTHON_VERSION"; then
> -                                 py_version=$PYTHON_VERSION
> -@@ -119,8 +119,8 @@ sys.stdout.write("%s\n" % sys.version[[:3]])"`
> -                         fi
> -                 fi
> -
> --                PYTHON_LDFLAGS=`$PYTHON -c "import sys; from distutils.sysconfig import *; \
> --sys.stdout.write('-L' + get_python_lib(0,1) + ' -lpython\n')"`$py_version`$PYTHON -c \
> -+                PYTHON_LDFLAGS=`$PYTHON -c "import sys; import sysconfig; \
> -+sys.stdout.write('-L' + sysconfig.get_path('stdlib') + ' -lpython\n')"`$py_version`$PYTHON -c \
> - "import sys; sys.stdout.write('%s' % getattr(sys,'abiflags',''))"`
> -         fi
> -         AC_MSG_RESULT([$PYTHON_LDFLAGS])
> -@@ -131,8 +131,8 @@ sys.stdout.write('-L' + get_python_lib(0,1) + ' -lpython\n')"`$py_version`$PYTHO
> -         #
> -         AC_MSG_CHECKING([for Python site-packages path])
> -         if test -z "$PYTHON_SITE_PKG"; then
> --                PYTHON_SITE_PKG=`$PYTHON -c "import sys; import distutils.sysconfig; \
> --sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
> -+                PYTHON_SITE_PKG=`$PYTHON -c "import sys; import sysconfig; \
> -+sys.stdout.write('%s\n' % sysconfig.get_path('purelib'));"`
> -         fi
> -         AC_MSG_RESULT([$PYTHON_SITE_PKG])
> -         AC_SUBST([PYTHON_SITE_PKG])
> -@@ -146,8 +146,8 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
> -                         PYTHON_EXTRA_LIBS=''
> -         fi
> -         if test -z "$PYTHON_EXTRA_LIBS"; then
> --           PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import distutils.sysconfig; \
> --conf = distutils.sysconfig.get_config_var; \
> -+           PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import sysconfig; \
> -+conf = sysconfig.get_config_var; \
> - sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf('LIBS')))"`
> -         fi
> -         AC_MSG_RESULT([$PYTHON_EXTRA_LIBS])
> -@@ -162,8 +162,8 @@ sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf(
> -                         PYTHON_EXTRA_LDFLAGS=''
> -         fi
> -         if test -z "$PYTHON_EXTRA_LDFLAGS"; then
> --                PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import distutils.sysconfig; \
> --conf = distutils.sysconfig.get_config_var; \
> -+                PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import sysconfig; \
> -+conf = sysconfig.get_config_var; \
> - sys.stdout.write('%s\n' % conf('LINKFORSHARED'))"`
> -         fi
> -         AC_MSG_RESULT([$PYTHON_EXTRA_LDFLAGS])
> -diff --git a/libraries/libapparmor/swig/python/Makefile.am b/libraries/libapparmor/swig/python/Makefile.am
> -index 04edff003..bf05fe0fc 100644
> ---- a/libraries/libapparmor/swig/python/Makefile.am
> -+++ b/libraries/libapparmor/swig/python/Makefile.am
> -@@ -21,7 +21,7 @@ install-exec-local:
> -
> - clean-local:
> - 	if test -x "$(PYTHON)"; then $(PYTHON) setup.py clean; fi
> --	rm -rf build
> -+	rm -rf build LibAppArmor.egg-info
> - 	if test $(top_srcdir) != $(top_builddir) ; then rm -f libapparmor_wrap.c ; fi
> -
> - endif
> -diff --git a/libraries/libapparmor/swig/python/setup.py.in b/libraries/libapparmor/swig/python/setup.py.in
> -index 32abd46b2..b23e40746 100644
> ---- a/libraries/libapparmor/swig/python/setup.py.in
> -+++ b/libraries/libapparmor/swig/python/setup.py.in
> -@@ -1,4 +1,4 @@
> --from distutils.core import setup, Extension
> -+from setuptools import setup, Extension
> - import string
> -
> - setup(name          = 'LibAppArmor',
> -diff --git a/libraries/libapparmor/swig/python/test/Makefile.am b/libraries/libapparmor/swig/python/test/Makefile.am
> -index 7287819c9..9dccfdef6 100644
> ---- a/libraries/libapparmor/swig/python/test/Makefile.am
> -+++ b/libraries/libapparmor/swig/python/test/Makefile.am
> -@@ -11,7 +11,7 @@ test_python.py: test_python.py.in $(top_builddir)/config.status
> - CLEANFILES = test_python.py
> -
> - # bah, how brittle is this?
> --PYTHON_DIST_BUILD_PATH = '$(builddir)/../build/$$($(PYTHON) -c "import distutils.util; import platform; print(\"lib.%s-%s\" %(distutils.util.get_platform(), platform.python_version()[:3]))")'
> -+PYTHON_DIST_BUILD_PATH = '$(builddir)/../build/$$($(PYTHON) -c "import sysconfig; print(\"lib.%s-%s\" %(sysconfig.get_platform(), sysconfig.get_python_version()))")'
> -
> - TESTS	= test_python.py
> - TESTS_ENVIRONMENT = \
> -diff --git a/profiles/Makefile b/profiles/Makefile
> -index c471e58e8..0b7f2655d 100644
> ---- a/profiles/Makefile
> -+++ b/profiles/Makefile
> -@@ -41,7 +41,7 @@ ifdef USE_SYSTEM
> -     LOGPROF?=aa-logprof
> - else
> -     # PYTHON_DIST_BUILD_PATH based on libapparmor/swig/python/test/Makefile.am
> --    PYTHON_DIST_BUILD_PATH = ../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import distutils.util; import platform; print(\"lib.%s-%s\" %(distutils.util.get_platform(), platform.python_version()[:3]))")
> -+    PYTHON_DIST_BUILD_PATH = ../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import sysconfig; print(\"lib.%s-%s\" %(sysconfig.get_platform(), sysconfig.get_python_version()))")
> -     LIBAPPARMOR_PATH=../libraries/libapparmor/src/.libs/
> -     LD_LIBRARY_PATH=$(LIBAPPARMOR_PATH):$(PYTHON_DIST_BUILD_PATH)
> -     PYTHONPATH=../utils/:$(PYTHON_DIST_BUILD_PATH)
> -diff --git a/utils/Makefile b/utils/Makefile
> -index 1f08f259a..91a15107b 100644
> ---- a/utils/Makefile
> -+++ b/utils/Makefile
> -@@ -72,6 +72,7 @@ clean: pod_clean
> - 	rm -rf staging/ build/
> - 	rm -f apparmor/*.pyc apparmor/rule/*.pyc
> - 	rm -rf apparmor/__pycache__/ apparmor/rule/__pycache__/
> -+	rm -rf apparmor.egg-info/
> -
> - # ${CAPABILITIES} is defined in common/Make.rules
> - .PHONY: check_severity_db
> -diff --git a/utils/python-tools-setup.py b/utils/python-tools-setup.py
> -index 30ce0cb05..2cbde8fc1 100644
> ---- a/utils/python-tools-setup.py
> -+++ b/utils/python-tools-setup.py
> -@@ -20,14 +20,14 @@
> - # Note: --version=... must be the last argument to this script
> - #
> -
> --from distutils.command.install import install as _install
> --from distutils.core import setup
> -+from setuptools.command.install import install as _install
> -+from setuptools import setup
> - import os
> - import shutil
> - import sys
> -
> - class Install(_install, object):
> --    '''Override distutils to install the files where we want them.'''
> -+    '''Override setuptools to install the files where we want them.'''
> -     def run(self):
> -         # Now byte-compile everything
> -         super(Install, self).run()
> -diff --git a/utils/test/Makefile b/utils/test/Makefile
> -index 90354aa50..9126bdd71 100644
> ---- a/utils/test/Makefile
> -+++ b/utils/test/Makefile
> -@@ -32,7 +32,7 @@ ifdef USE_SYSTEM
> -     PARSER=
> - else
> -     # PYTHON_DIST_BUILD_PATH based on libapparmor/swig/python/test/Makefile.am
> --    PYTHON_DIST_BUILD_PATH = ../../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import distutils.util; import platform; print(\"lib.%s-%s\" %(distutils.util.get_platform(), platform.python_version()[:3]))")
> -+    PYTHON_DIST_BUILD_PATH = ../../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import sysconfig; print(\"lib.%s-%s\" %(sysconfig.get_platform(), sysconfig.get_python_version()))")
> -     LIBAPPARMOR_PATH=../../libraries/libapparmor/src/.libs/
> -     LD_LIBRARY_PATH=$(LIBAPPARMOR_PATH):$(PYTHON_DIST_BUILD_PATH)
> -     PYTHONPATH=..:$(PYTHON_DIST_BUILD_PATH)
> ---
> -GitLab
> -
> diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
> index 6a19aef77a..9fbfe3b92e 100644
> --- a/package/libapparmor/libapparmor.hash
> +++ b/package/libapparmor/libapparmor.hash
> @@ -1,5 +1,5 @@
>   # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
> -sha256  153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59  apparmor-3.0.3.tar.gz
> +sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
>   
>   # locally computed
>   sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
> diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
> index 7bb849ab94..fcd3a4389b 100644
> --- a/package/libapparmor/libapparmor.mk
> +++ b/package/libapparmor/libapparmor.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version here, please also update the apparmor package
>   LIBAPPARMOR_VERSION_MAJOR = 3.0
> -LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).3
> +LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).4
>   LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
>   LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
>   LIBAPPARMOR_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
