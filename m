Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC11C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 13:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0450081395;
	Sun, 12 Jul 2026 13:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iQtqagvMUCa; Sun, 12 Jul 2026 13:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 796388134D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783862427;
	bh=gZlb8nOVzTpZniQriCdIEtRe7wfrCUXESexgJmGyPyQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EBAmYpibZ8pC6pxAWc7B3UO9n4HKbLd6KXW7V5xvN8/oxZ0cZCah6DSP+831on5vx
	 NDG6FNaqOM94Na5FOvISVcIUreeVe/F37nuhqLb2h33bQvpoVpmSoB+4nXb0p3yvvU
	 oQuz3CdAKgENcUvcquB9jDC+D5WfKb8WtxDhH1Y9GgAwdA/569eo0vWD5/EMxupbZx
	 g8EgSUp8/3clb+3yWq32tfpPuueBAL4Y/bOkV3njMsIhr8dgaFMFanoTrDm9SzDqk4
	 1h70XJkh6MxsIgk8bvlrBlg+tA+IQv75sEOVnqu6jQYpq6Vn/4XTUbeppw1B9H+pq1
	 flNWkJkPz4tuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 796388134D;
	Sun, 12 Jul 2026 13:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFBB8359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F5160634
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKx9kiebIvtr for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 13:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F241D6062B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F241D6062B
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E69D8872A; Sun, 12 Jul 2026 13:19:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 14:34:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec402e6c8e8638b55a178815d72c8585954673d8
X-Git-Newrev: 4b4a8f0ffff5b83ac5d316c3677ec948a7295e64
X-Patchwork-Hint: ignore
Message-Id: <20260712131951.2E69D8872A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: security bump to version
 5.0.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b4a8f0ffff5b83ac5d316c3677ec948a7295e64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Rebased patch 0001.

No CVE entries are found but these commits are part of the bump:

TOCTOU + chown-follows-symlink in socket directory creation:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=3dea5ff20c58ad497062d094b6a9b80a7535a7db

fix potential null pointer dereference:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=ff9d98b8e39f33b07156995188ca55f3459f4d53

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .../0001-Do-not-create-backup-of-old-installed-binary.patch       | 8 +++++---
 package/screen/screen.hash                                        | 4 ++--
 package/screen/screen.mk                                          | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
index 4a8a55dcec..36a8c9a2c2 100644
--- a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
+++ b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
@@ -11,6 +11,8 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [Julien: rebase on top of 4.9.1]
 [Julien: rebase on top of 5.0.0]
 Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Bernd: rebase on top of 5.0.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.in | 5 -----
  1 file changed, 5 deletions(-)
@@ -19,8 +21,8 @@ diff --git a/Makefile.in b/Makefile.in
 index 92f434a..860ecd7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -77,12 +77,8 @@ tests/test-%: tests/test-%.c %.o tests/mallocmock.o tests/macros.h tests/signatu
- 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@ $*.o tests/mallocmock.o
+@@ -85,12 +85,8 @@ tests/test-detach-cli: tests/integration-detach.c tests/macros.h screen
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@
  
  install_bin: screen installdirs
 -	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
@@ -32,7 +34,7 @@ index 92f434a..860ecd7 100644
  	rm -f $(DESTDIR)$(bindir)/screen
  	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
  	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
-@@ -107,7 +103,6 @@ installdirs:
+@@ -115,7 +111,6 @@ installdirs:
  uninstall:
  	rm -f $(DESTDIR)$(bindir)/$(SCREEN)
  	rm -f $(DESTDIR)$(bindir)/screen
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 61bacd88ff..f030e45490 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz.sig
-sha256  2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d  screen-5.0.1.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-5.0.2.tar.gz.sig
+sha256  ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332  screen-5.0.2.tar.gz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c85abaf411..c279fed8bc 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 5.0.1
+SCREEN_VERSION = 5.0.2
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
