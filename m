Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5E5F483EB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6FF82138;
	Mon, 23 Mar 2026 19:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAz9UBQDP-9f; Mon, 23 Mar 2026 19:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5A8821C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295246;
	bh=tqcoyf4QRCOjZK81ysKvdNfYrhi791rLof55TibK38w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mPfFh6Wyz3L0ka9D6id7+FILEZwrogcoIXxgGcIuRHVWUQjD89qHGM4go85EAC07k
	 hGLJlO0JY9z1wYDoZRnAcHDpiP1SLUvLAslK+CR7RHt5Hr5CR1dH8skkQ2GGnYgB3r
	 BJKsrIs4itpSzZzXH5WrVNqnLCXcWmHsHb0f6q7hqSa3ubuUVAsq6B3lmF0wofdcMG
	 F1+RZUTepxyQF9L9kZkCg3V7HSfrJ/eatQC6zpm2MBIXnklgBi9o8NTIn5Yt9kSghw
	 Hjtxr+qjxEmZp2rx4K+z6MLF7huqo0a1g9jNKEBs1TPmQ1hDVtpuJ+6OReTh2eHHKj
	 gii0Q5kMXNPNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A5A8821C7;
	Mon, 23 Mar 2026 19:47:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6FD353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD99040BA1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0e0G24DXyml for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388EA40657
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 388EA40657
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 777D984BCC; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5ab801853981163bf7a2eb378c0779d583401298
X-Git-Newrev: ac6772493597fc6c44ec8633daa016aa2ed4886f
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.777D984BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxml2: security
 bump version to 2.15.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac6772493597fc6c44ec8633daa016aa2ed4886f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.news

- CVE-2026-1757 fix: Memory leak in xmllint Shell - shell.c
- CVE-2026-0990 fix: Prevent infinite recursion in
  xmlCatalogListXMLResolve
- CVE-2026-0992 fix: Exponential behavior when handling
- parser: Fix infinite loop in xmlCtxtParseContent
- CVE-2025-10911 libxslt related: Ignore next/prev of documents when
  traversing XPath
- CVE-2026-0989 fix: Add RelaxNG include limit

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4d4dc5f54235c83ce3bc676edc674cae68b66371)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch  | 5 +++--
 package/libxml2/libxml2.hash                                         | 4 ++--
 package/libxml2/libxml2.mk                                           | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 75232b6f00..70f1d9899c 100644
--- a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -8,6 +8,7 @@ This reverts commit 75dde50b20215a2a3a445b62f36a67c8ed337cab.
 
 Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864
 
+[Bernd: rebased for 2.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac            | 11 -----------
@@ -19,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index 4eb629bb..150e06eb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1008,17 +1008,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -70,7 +71,7 @@ diff --git a/meson.build b/meson.build
 index 31c73b62..8728852c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -577,9 +577,6 @@ config_cmake = configuration_data()
+@@ -590,9 +590,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 637ba52bb8..35c8810ed9 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.sha256sum
-sha256  c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c  libxml2-2.15.1.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.sha256sum
+sha256  c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d  libxml2-2.15.2.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 35d373e130..0a365fa689 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
