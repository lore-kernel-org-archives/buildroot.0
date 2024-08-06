Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE44C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884C060792;
	Tue,  6 Aug 2024 22:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psz-nC0Y4w_b; Tue,  6 Aug 2024 22:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF1B608D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF1B608D6;
	Tue,  6 Aug 2024 22:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D97A1BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A3E6061C
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-h1X-gmbP98 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E1760874
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39E1760874
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D825584344; Tue,  6 Aug 2024 22:45:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 00:37:53 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 6c6f6eb44a12ac56a596bd030620465bdd45cd11
X-Git-Newrev: 26db1f8ef5647c6d2d1d7c5f5334be667bc83820
X-Patchwork-Hint: ignore
Message-Id: <20240806224505.D825584344@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] docs/manual: standardize
 references to the generic infra
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26db1f8ef5647c6d2d1d7c5f5334be667bc83820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Currently the text for each package infra that mentions the usage of
variables already provided by the generic infra diverge from each other:
- some (golang, kconfig, python) add a cross-referece to the generic
  infra chapter;
- kconfig does not list any example;
- some mention _LICENSE as an example, others don't;
- some (cargo, golang, python) add an 'etc.' at the end of the examples,
  giving the idea that can be more symbols provided by the generic
  infra than the ones listed;
- most have the text 'works by defining a number of variables before
  calling the +<macro-name>+ macro', except golang and kconfig;
- some actually list 'A few additional variables' but keep using some
  old reference as 'An additional variable';
- some say 'First, all the package metadata' and other only 'All the
  package metadata';
- most mention _SUBDIR as an example of variable supported by the
  generic infra, even the generic infra manual not mentioning it.

Improve the correctness for the manual by standardizing the text among
the package infras:
- use the same text "All the package metadata information variables that
  exist in the generic package infrastructure also exist in the
  <name> infrastructure:" for all of them;
- add the cross-reference for all of them;
- remove the examples of variables inherited from the generic infra -
  this also solves the _SUBDIR problem, there no longer is any reference
  to _SUBDIR;
- wrap the modified text at 80 columns;
- add "macro" to golang and luarocks infra;
- use "A few additional variables" for qmake and waf.

At same time, add a missing format on golang manual for
BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.

Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout:
 - remove the examples;
 - add "the" where "macro" was added;
 - rewrite the preceding paragraphs for kconfig to make it more
   consistent.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4286c89f9d987f5f3bcbb14dfd58ba440944f4c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-autotools.adoc |  9 +++------
 docs/manual/adding-packages-cargo.adoc     |  7 +++----
 docs/manual/adding-packages-cmake.adoc     |  8 +++-----
 docs/manual/adding-packages-golang.adoc    |  9 ++++-----
 docs/manual/adding-packages-kconfig.adoc   | 14 ++++++++++----
 docs/manual/adding-packages-luarocks.adoc  | 10 +++++-----
 docs/manual/adding-packages-meson.adoc     |  7 +++----
 docs/manual/adding-packages-perl.adoc      |  9 +++------
 docs/manual/adding-packages-python.adoc    |  5 +----
 docs/manual/adding-packages-qmake.adoc     | 10 ++++------
 docs/manual/adding-packages-rebar.adoc     | 10 +++-------
 docs/manual/adding-packages-waf.adoc       | 10 ++++------
 12 files changed, 46 insertions(+), 62 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.adoc b/docs/manual/adding-packages-autotools.adoc
index ad96957f3d..c2b90f31eb 100644
--- a/docs/manual/adding-packages-autotools.adoc
+++ b/docs/manual/adding-packages-autotools.adoc
@@ -76,12 +76,9 @@ Just like the generic infrastructure, the autotools infrastructure
 works by defining a number of variables before calling the
 +autotools-package+ macro.
 
-First, all the package metadata information variables that exist in the
-generic infrastructure also exist in the autotools infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+,
-+LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+,
-+LIBFOO_INSTALL_STAGING+, +LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the autotools infrastructure.
 
 A few additional variables, specific to the autotools infrastructure,
 can also be defined. Many of them are only useful in very specific
diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index e18fd9ce23..a2a15ed996 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -64,10 +64,9 @@ Just like the generic infrastructure, the Cargo infrastructure works
 by defining a number of variables before calling the +cargo-package+
 or +host-cargo-package+ macros.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the Cargo infrastructure:
-+FOO_VERSION+, +FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+,
-+FOO_DEPENDENCIES+, +FOO_LICENSE+, +FOO_LICENSE_FILES+, etc.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Cargo infrastructure.
 
 A few additional variables, specific to the Cargo infrastructure, can
 also be defined. Many of them are only useful in very specific cases,
diff --git a/docs/manual/adding-packages-cmake.adoc b/docs/manual/adding-packages-cmake.adoc
index 4f336db737..e375e17d74 100644
--- a/docs/manual/adding-packages-cmake.adoc
+++ b/docs/manual/adding-packages-cmake.adoc
@@ -75,11 +75,9 @@ Just like the generic infrastructure, the CMake infrastructure works
 by defining a number of variables before calling the +cmake-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the CMake infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
-+LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the CMake infrastructure.
 
 A few additional variables, specific to the CMake infrastructure, can
 also be defined. Many of them are only useful in very specific cases,
diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index c952cde577..00b8bea285 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -56,16 +56,15 @@ The main macro of the Go package infrastructure is
 ability to build host packages is also available, with the
 +host-golang-package+ macro.
 Host packages built by +host-golang-package+ macro should depend on
-BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS.
++BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS+.
 
 Just like the generic infrastructure, the Go infrastructure works
-by defining a number of variables before calling the +golang-package+.
+by defining a number of variables before calling the +golang-package+
+macro.
 
 All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
-exist in the Go infrastructure: +FOO_VERSION+, +FOO_SOURCE+,
-+FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
-+FOO_LICENSE+, +FOO_LICENSE_FILES+, +FOO_INSTALL_STAGING+, etc.
+exist in the Go infrastructure.
 
 Note that it is not necessary to add +host-go+ in the
 +FOO_DEPENDENCIES+ variable of a package, since this basic dependency
diff --git a/docs/manual/adding-packages-kconfig.adoc b/docs/manual/adding-packages-kconfig.adoc
index a35681775f..f2c40ed7a2 100644
--- a/docs/manual/adding-packages-kconfig.adoc
+++ b/docs/manual/adding-packages-kconfig.adoc
@@ -15,10 +15,16 @@ expose the package's +menuconfig+ target as +foo-menuconfig+ in
 Buildroot, and to handle the copying back and forth of the configuration
 file in a correct way.
 
-The +kconfig-package+ infrastructure is based on the +generic-package+
-infrastructure. All variables supported by +generic-package+ are
-available in +kconfig-package+ as well. See
-xref:generic-package-reference[] for more details.
+The main macro of the kconfig package infrastructure is
++kconfig-package+. It is similar to the +generic-package+ macro.
+
+Just like the generic infrastructure, the kconfig infrastructure works
+by defining a number of variables before calling the +kconfig-package+
+macro.
+
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the kconfig infrastructure.
 
 In order to use the +kconfig-package+ infrastructure for a Buildroot
 package, the minimally required lines in the +.mk+ file, in addition to
diff --git a/docs/manual/adding-packages-luarocks.adoc b/docs/manual/adding-packages-luarocks.adoc
index 70f48fc02c..9ced6c5504 100644
--- a/docs/manual/adding-packages-luarocks.adoc
+++ b/docs/manual/adding-packages-luarocks.adoc
@@ -73,16 +73,16 @@ infrastructures in Buildroot, respectively.
 
 The main macro of the LuaRocks package infrastructure is +luarocks-package+:
 like +generic-package+ it works by defining a number of variables providing
-metadata information about the package, and then calling +luarocks-package+.
+metadata information about the package, and then calling the +luarocks-package+
+macro.
 
 Just like the generic infrastructure, the LuaRocks infrastructure works
 by defining a number of variables before calling the +luarocks-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the LuaRocks infrastructure:
-+LUA_FOO_VERSION+, +LUA_FOO_SOURCE+, +LUA_FOO_SITE+,
-+LUA_FOO_DEPENDENCIES+, +LUA_FOO_LICENSE+, +LUA_FOO_LICENSE_FILES+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the LuaRocks infrastructure.
 
 Two of them are populated by the LuaRocks infrastructure (for the
 +download+ step). If your package is not hosted on the LuaRocks mirror
diff --git a/docs/manual/adding-packages-meson.adoc b/docs/manual/adding-packages-meson.adoc
index 029c8c2488..8c0f84709f 100644
--- a/docs/manual/adding-packages-meson.adoc
+++ b/docs/manual/adding-packages-meson.adoc
@@ -76,10 +76,9 @@ packages is also available, with the +host-meson-package+ macro.
 Just like the generic infrastructure, the Meson infrastructure works by defining
 a number of variables before calling the +meson-package+ macro.
 
-First, all the package metadata information variables that exist in the generic
-infrastructure also exist in the Meson infrastructure: +FOO_VERSION+,
-+FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
-+FOO_INSTALL_STAGING+, +FOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Meson infrastructure.
 
 A few additional variables, specific to the Meson infrastructure, can also be
 defined. Many of them are only useful in very specific cases, typical packages
diff --git a/docs/manual/adding-packages-perl.adoc b/docs/manual/adding-packages-perl.adoc
index 6ce693fd6e..7c60a1a4a7 100644
--- a/docs/manual/adding-packages-perl.adoc
+++ b/docs/manual/adding-packages-perl.adoc
@@ -85,12 +85,9 @@ Just like the generic infrastructure, the Perl/CPAN infrastructure
 works by defining a number of variables before calling the
 +perl-package+ macro.
 
-First, all the package metadata information variables that exist in the
-generic infrastructure also exist in the Perl/CPAN infrastructure:
-+PERL_FOO_VERSION+, +PERL_FOO_SOURCE+,
-+PERL_FOO_PATCH+, +PERL_FOO_SITE+,
-+PERL_FOO_SUBDIR+, +PERL_FOO_DEPENDENCIES+,
-+PERL_FOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Perl/CPAN infrastructure.
 
 Note that setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect
 unless a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined. The perl
diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index 67f2f6081d..7cb3635792 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -80,10 +80,7 @@ or +host-python-package+ macros.
 
 All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
-exist in the Python infrastructure: +PYTHON_FOO_VERSION+,
-+PYTHON_FOO_SOURCE+, +PYTHON_FOO_PATCH+, +PYTHON_FOO_SITE+,
-+PYTHON_FOO_SUBDIR+, +PYTHON_FOO_DEPENDENCIES+, +PYTHON_FOO_LICENSE+,
-+PYTHON_FOO_LICENSE_FILES+, +PYTHON_FOO_INSTALL_STAGING+, etc.
+exist in the Python infrastructure.
 
 Note that:
 
diff --git a/docs/manual/adding-packages-qmake.adoc b/docs/manual/adding-packages-qmake.adoc
index 699d082aa1..0205f6ca29 100644
--- a/docs/manual/adding-packages-qmake.adoc
+++ b/docs/manual/adding-packages-qmake.adoc
@@ -51,13 +51,11 @@ Just like the generic infrastructure, the QMake infrastructure works
 by defining a number of variables before calling the +qmake-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the QMake infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
-+LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the QMake infrastructure.
 
-An additional variable, specific to the QMake infrastructure, can
+A few additional variables, specific to the QMake infrastructure, can
 also be defined.
 
 * +LIBFOO_CONF_ENV+, to specify additional environment variables to
diff --git a/docs/manual/adding-packages-rebar.adoc b/docs/manual/adding-packages-rebar.adoc
index d78b3171d8..c2a5b0d0e9 100644
--- a/docs/manual/adding-packages-rebar.adoc
+++ b/docs/manual/adding-packages-rebar.adoc
@@ -51,13 +51,9 @@ Just like the generic infrastructure, the +rebar+ infrastructure works
 by defining a number of variables before calling the +rebar-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the +rebar+ infrastructure:
-+ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
-+ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
-+ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
-+ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+,
-+ERLANG_FOOBAR_LICENSE+ and +ERLANG_FOOBAR_LICENSE_FILES+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the +rebar+ infrastructure.
 
 A few additional variables, specific to the +rebar+ infrastructure,
 can also be defined. Many of them are only useful in very specific
diff --git a/docs/manual/adding-packages-waf.adoc b/docs/manual/adding-packages-waf.adoc
index 101cddf1f1..7622c55a7b 100644
--- a/docs/manual/adding-packages-waf.adoc
+++ b/docs/manual/adding-packages-waf.adoc
@@ -51,13 +51,11 @@ Just like the generic infrastructure, the Waf infrastructure works
 by defining a number of variables before calling the +waf-package+
 macro.
 
-First, all the package metadata information variables that exist in
-the generic infrastructure also exist in the Waf infrastructure:
-+LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
-+LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
-+LIBFOO_INSTALL_TARGET+.
+All the package metadata information variables that exist in the
+xref:generic-package-reference[generic package infrastructure] also
+exist in the Waf infrastructure.
 
-An additional variable, specific to the Waf infrastructure, can
+A few additional variables, specific to the Waf infrastructure, can
 also be defined.
 
 * +LIBFOO_SUBDIR+ may contain the name of a subdirectory inside the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
