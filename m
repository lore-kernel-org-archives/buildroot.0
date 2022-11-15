Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943BC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B016560E2A;
	Tue, 15 Nov 2022 13:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B016560E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFFOlpGDxHWj; Tue, 15 Nov 2022 13:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1F0560DDF;
	Tue, 15 Nov 2022 13:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1F0560DDF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A590C1BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8131660DDF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8131660DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0zs5M-ObkRV for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6776060C14
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6776060C14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56ED783CB7; Tue, 15 Nov 2022 13:29:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:25:39 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 442fc84e8f32fa45477dd336fc9c9605375c5ded
X-Git-Newrev: 1d74a06d627d181e254344b1f553576557f3f21e
X-Patchwork-Hint: ignore
Message-Id: <20221115132927.56ED783CB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/perl-net-ssleay:
 bump to version 1.93_01
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d74a06d627d181e254344b1f553576557f3f21e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

- Refresh patch
- Drop -lz from Makefile with libressl as this is the only solution for
  now: https://github.com/radiator-software/p5-net-ssleay/issues/399
- License has been clarified to be Artistic-2.0 since version 1.86.11:
  https://github.com/radiator-software/p5-net-ssleay/commit/aa4a0206d6d2a5ac2998dd9d6a8c5b88902c04de
- This bump will fix the following build failure with libressl:

  In file included from /home/autobuild/autobuild/instance-11/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/perl5/5.34.1/armeb-linux/CORE/perl.h:5748,
                   from SSLeay.xs:141:
  SSLeay.xs: In function 'XS_Net__SSLeay_SESSION_get_master_key':
  SSLeay.xs:5569:37: error: invalid use of incomplete typedef 'SSL_SESSION' {aka 'struct ssl_session_st'}
   5569 |      sv_setpvn(ST(0), (const char*)s->master_key, s->master_key_length);
        |                                     ^~

https://metacpan.org/release/CHRISN/Net-SSLeay-1.93_01/changes

Fixes:
 - http://autobuild.buildroot.org/results/71337cc496727f2b1173c055d706c5bfc2f5d2bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 191fa1718f7f61ad9846a37c6f0c86a3b713e81c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../perl-net-ssleay/0001-fix-build-system.patch    | 30 +++++++++++-----------
 package/perl-net-ssleay/perl-net-ssleay.hash       |  6 ++---
 package/perl-net-ssleay/perl-net-ssleay.mk         | 13 +++++++---
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/package/perl-net-ssleay/0001-fix-build-system.patch b/package/perl-net-ssleay/0001-fix-build-system.patch
index a6cd0f9ceb..a5ccf464ba 100644
--- a/package/perl-net-ssleay/0001-fix-build-system.patch
+++ b/package/perl-net-ssleay/0001-fix-build-system.patch
@@ -8,29 +8,29 @@ paths, since they are missing the destdir; Buildroot compilers
 and linkers already know where to search, anyway.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Fabrice: update for 1.93_01]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -durN perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm
---- perl-net-ssleay-1.64.orig/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2014-04-01 08:08:37.000000000 +0200
-+++ perl-net-ssleay-1.64/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2014-07-13 00:38:46.281380282 +0200
-@@ -37,14 +37,18 @@
-         exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
+--- perl-net-ssleay-1.64.orig/Makefile.PL	2014-04-01 08:08:37.000000000 +0200
++++ perl-net-ssleay-1.64/Makefile.PL	2014-07-13 00:38:46.281380282 +0200
+@@ -192,12 +192,16 @@
+         exit MISSING_PREREQ;
      }
  
--    $self->check_openssl_version($prefix, $exec);
+-    check_openssl_version($prefix, $exec);
 +# Does not work for cross-compilation.
 +# In Buildroot, we do have a supported version.
-+#    $self->check_openssl_version($prefix, $exec);
-     my $opts = $self->ssleay_get_build_opts($prefix, $exec);
- 
-     $self->makemaker_args(
++#    check_openssl_version($prefix, $exec);
+     my %args = (
          CCCDLFLAGS => $opts->{cccdlflags},
          OPTIMIZE => $opts->{optimize},
--        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
--        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
+-        INC => qq{-I"$opts->{inc_path}"},
+-        LIBS => join(' ', (map '-L'.maybe_quote($_), @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
 +# Buildroot already has the correct include and library search paths.
-+#        INC => join(' ', map {"-I$_"} @{$opts->{inc_paths}}),
-+#        LIBS => join(' ', (map {"-L$_"} @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
++#        INC => qq{-I"$opts->{inc_path}"},
++#        LIBS => join(' ', (map '-L'.maybe_quote($_), @{$opts->{lib_paths}}), (map {"-l$_"} @{$opts->{lib_links}})),
 +        LIBS => join(' ', (map {"-l$_"} @{$opts->{lib_links}})),
      );
- 
-     if ( $self->prompt(
+     # From HMBRAND to handle multple version of OPENSSL installed
+     if (my $lp = join " " => map '-L'.maybe_quote($_), @{$opts->{lib_paths} || []})
diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index 7502a60ad1..9caff68edd 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  d602bdce4e0531c6efc276e3e429ca69  Net-SSLeay-1.85.tar.gz
-sha256  9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8  Net-SSLeay-1.85.tar.gz
+md5  c73821e9790b3bdb3471d9b8faf48bbb  Net-SSLeay-1.93_01.tar.gz
+sha256  876d022fbc719631b11d6bb4b6e78db3c19bbca578093c376c8f9900a4432aa3  Net-SSLeay-1.93_01.tar.gz
 
 # computed by scancpan
-sha256  b55065185a2172d9f2ea2dd87c18c206ea3dc45a64e5f3deb3eee34d839dc822  LICENSE
+sha256  685e534b60d4e2b4fbb1a259a83b5a86e877a919bbb9efc95994276f706a3a71  LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 80ce8b9cc7..8b7b2b973b 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.85
+PERL_NET_SSLEAY_VERSION = 1.93_01
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
-PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
+PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
-PERL_NET_SSLEAY_LICENSE = OpenSSL
+PERL_NET_SSLEAY_LICENSE = Artistic-2.0
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 PERL_NET_SSLEAY_DISTNAME = Net-SSLeay
 
@@ -24,4 +24,11 @@ define PERL_NET_SSLEAY_FIX_MAKEFILE
 endef
 PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
 
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+define PERL_NET_SSLEAY_DROP_ZLIB_MAKEFILE
+	$(SED) "s/-lz//" $(@D)/Makefile
+endef
+PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_DROP_ZLIB_MAKEFILE
+endif
+
 $(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
