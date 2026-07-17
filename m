Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB20C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B337440A44;
	Fri, 17 Jul 2026 15:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoJkExgy8PVC; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD13D409CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303062;
	bh=zNrYeaglmm5zcUC2hMrc/+H2OOTSe+O3l4MQIQDyQ9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oEAKzBGVWmaRB9eIzCqkc2SeFER5FLYFJ2adfiZ004neN4/bB6358G98cz3cqk0ne
	 hrDE2w07WbXzepPn7VBw3nGAZTUU+XNgbg62xF3uuvZr5e7oXbnriCmXMPbTqPE2w1
	 b+9g/Eryq/gJ0n8Lfl4idUiGX48W8JQy0INcih92mZrQe+YbTHFPEBYcbtY9oLeuBo
	 G5sw1xTPHHX0MpQ/k4ycwtEuqcDrG9Y5sWqxJPWyQRr6mXcBmNyFtOV7X6qsrshUxt
	 jvbJP4Os3peXp5+IVk3JFku38D+Z2wQt+i0DG/5ikEnTaYx24NF1msl36uFIqy5FIq
	 DRkAllu4R1cyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD13D409CF;
	Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DBD01F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33CD7409CF
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6ev0VBafdAn for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DADFE40626
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DADFE40626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6F2288E52; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:03:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c336c3c7494fd1bfe33c29172de585a3ab0d4f3e
X-Git-Newrev: 0923a07dfd94e123e46a3b2d523703a5f0627288
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.A6F2288E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/screen: security
 bump to version 5.0.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0923a07dfd94e123e46a3b2d523703a5f0627288
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Rebased patch 0001.

No CVE entries are found but these commits are part of the bump:

TOCTOU + chown-follows-symlink in socket directory creation:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=3dea5ff20c58ad497062d094b6a9b80a7535a7db

fix potential null pointer dereference:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=ff9d98b8e39f33b07156995188ca55f3459f4d53

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 4b4a8f0ffff5b83ac5d316c3677ec948a7295e64)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
