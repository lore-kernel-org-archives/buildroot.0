Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0549106FD9E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BB3823A0;
	Sat, 14 Mar 2026 20:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMbQdo6Ue-vq; Sat, 14 Mar 2026 20:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F11823AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773520150;
	bh=n+RD7uMB9j17kvQC7jkQQZfQy7KxRe3rOlWvN3uaDUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HPngAR7GE3bh0d5GY015vBB83MlM5jUO2mLNlwzBqV1I21KRM6WowhnqFpYo8K3DL
	 k7J7aKEXDHkTj4AGotyA3HyUrw1ArbQpils/P4X/grjJAj2PltdD120GtrvZ0GriD6
	 GRFRtdr7llOwstQEhMOxGGrYkVlqoyRuaTk+3VbmL5QJN8iTd9rzg/t5QoFB250jCo
	 aen1tiRoYkF0QrXdPXCR6i1mRZStZhHJXVk3X1OIRCJmSRhmYIWJepf+zD8RCMoozt
	 mvfj+27goucs0H37Y2SLDcuEfFVn+1olAV3eGC+b5KYSD6D+NSLsHR8WTZs4jRiTpi
	 bLp4gHclv+pdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F11823AB;
	Sat, 14 Mar 2026 20:29:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93CEB118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 882E360F7C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dv6-r7d2zLmH for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DBB260853
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DBB260853
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:29:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5B48869CB; Sat, 14 Mar 2026 20:29:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 21:23:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1bc1a7a617b31b997ed113b57cdc72faa04046c
X-Git-Newrev: 4d4dc5f54235c83ce3bc676edc674cae68b66371
X-Patchwork-Hint: ignore
Message-Id: <20260314202908.A5B48869CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump version to
 2.15.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d4dc5f54235c83ce3bc676edc674cae68b66371
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
