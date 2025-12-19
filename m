Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D6AD78770
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 18:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3008605FA;
	Fri, 19 Dec 2025 18:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rSo1Xbq3k3K; Fri, 19 Dec 2025 18:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E6646060C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766167307;
	bh=EHNdghoswYkzzF7ubzN9EwJxDBmH/9+af8E8y8VBdLk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VmYAmPc+7OZyT93imCQ+IUuEoY9VtjPDZEuKrnHg86HNZhO9rZmhJ1i2RavJxav8E
	 zl1lPNWDk9RjR1vlvmCJAqXpq8xpyTxnIT1gp/rv6DoQwc0Wwv2RNXpSpmtrJI+Pxx
	 hTBh127cxdjAb6Lmz/uLZ8g6IXoHt8n2jzYVLSexgxG2M6JcjvhJ4H/jrMksMYSniv
	 lTJgav23nvgzKqo3J1WzNiYqcp/5BzvCwRe7maXzM5RVsbPkPKmGqIc5zSZpSlHA+H
	 WbhXId+Rsl+P86GY2zk38YHdAgPtNqvLcEihMPaeuXScqaDtEo8s1e0TuOvu66gp/m
	 xnJlMpK45QUkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E6646060C;
	Fri, 19 Dec 2025 18:01:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F76C293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759DF6060C
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taXcqpQ2LRgK for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 18:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D70A8605FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D70A8605FA
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C5BD81840; Fri, 19 Dec 2025 18:01:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 19:01:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ce452ed71127070f64a0834086d81b1e2eda907
X-Git-Newrev: 11d6d10debc81a64de901ec0217b8103c0f366b0
X-Patchwork-Hint: ignore
Message-Id: <20251219180140.9C5BD81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl: bump to version 5.42.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11d6d10debc81a64de901ec0217b8103c0f366b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://perldoc.perl.org/5.42.0/perl5420delta

Note: the release notes mention fixed CVE. Those were already fixed in
Buildroot commit [1] and [2]. Therefore, this update is not marked as a
security fix.

This commit also updates the `utils/scancpan` script, in order to
update the messages about the host-perl version.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/61f5e2efcae5ece840a561ad56cdec04dad3a25d
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/164c84ee9b820f5b21e79b4d52c07a613925d3f2

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl/Config.in |  2 +-
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  5 ++---
 utils/scancpan         |  8 ++++----
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 0ead1c4a46..6c9bf1e0da 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PERL
 	  An interpreted scripting language, known among some as
 	  "Unix's Swiss Army Chainsaw".
 
-	  http://www.perl.org/
+	  https://www.perl.org/
 
 if BR2_PACKAGE_PERL
 
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 0035c448c5..3aefdd05b6 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,12 +1,12 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
-md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
-sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
-sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.42.0.tar.xz.{md5,sha1,sha256}.txt
+md5  7a6950a9f12d01eb96a9d2ed2f4e0072  perl-5.42.0.tar.xz
+sha1  3b557f28dcb412b115d9628c37fc94b2fda08384  perl-5.42.0.tar.xz
+sha256  73cf6cc1ea2b2b1c110a18c14bbbc73a362073003893ffcedc26d22ebdbdd0c3  perl-5.42.0.tar.xz
 
 # Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
 sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
-sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
-sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
+sha256  8979e6dd61852041643c5c5c40ea63b2bd1b438a67d114e62cbaef808c514315  Copying
+sha256  189e9d6ac7743ed4e832f14c9edb6f782c92d8868b447fa2684f7fe5a81465c1  README
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a301b93e46..c31a368b70 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 40
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_VERSION_MAJOR = 42
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -28,7 +28,6 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
diff --git a/utils/scancpan b/utils/scancpan
index e7739a8ad1..276c79b4e4 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.036 should be aligned with the version of perl actually
+# Below, 5.042 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.036;
+die <<"MSG" if $] < 5.042;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.36.0
+    perlbrew install perl-5.42.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -967,7 +967,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2023 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2025 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
