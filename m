Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC08DC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3397140AF5;
	Tue, 26 Dec 2023 21:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3397140AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6R5rvzDixqfo; Tue, 26 Dec 2023 21:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D235E40AB7;
	Tue, 26 Dec 2023 21:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D235E40AB7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BC111BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 126BD40A87
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 126BD40A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Np4LSb8_eB7B for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0025041553
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0025041553
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC8D883602; Tue, 26 Dec 2023 21:06:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 22:06:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66a77af985ee6e8be917abfe428fa381294115fc
X-Git-Newrev: c13199c9326fa2daa574f08ec8fc063a48d0eb06
X-Patchwork-Hint: ignore
Message-Id: <20231226210640.DC8D883602@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: security bump to version 6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c13199c9326fa2daa574f08ec8fc063a48d0eb06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Fix CVE-2023-50269: This problem allows a remote client to perform
  Denial of Service attack by sending a large X-Forwarded-For header
  when the follow_x_forwarded_for feature is configured.

https://github.com/squid-cache/squid/security/advisories/GHSA-wgq4-4cfg-c4x3
https://github.com/squid-cache/squid/blob/SQUID_6_6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...8-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch | 32 ----------------------
 package/squid/squid.hash                           |  8 +++---
 package/squid/squid.mk                             |  2 +-
 3 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch b/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
deleted file mode 100644
index fcbdcc1749..0000000000
--- a/package/squid/0001-Bug-5328-Fix-ESI-build-with-libxml2-v2.12.0-1600.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c9b3edc1396925aa7eca3d3cc6c798806286a974 Mon Sep 17 00:00:00 2001
-From: bkuhls <bkuhls@users.noreply.github.com>
-Date: Sun, 26 Nov 2023 15:09:21 +0000
-Subject: [PATCH] Bug 5328: Fix ESI build with libxml2 v2.12.0 (#1600)
-
-    Libxml2Parser.cc:147:40: error: invalid conversion from
-    'const xmlError*' to 'xmlErrorPtr' {aka 'xmlError*'} [-fpermissive]
-
-libxml2 recently made xmlGetLastError() return a constant object.
-
-Upstream: https://github.com/squid-cache/squid/commit/c9b3edc1396925aa7eca3d3cc6c798806286a974
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/esi/Libxml2Parser.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/esi/Libxml2Parser.cc b/src/esi/Libxml2Parser.cc
-index f03752885..236a37433 100644
---- a/src/esi/Libxml2Parser.cc
-+++ b/src/esi/Libxml2Parser.cc
-@@ -144,7 +144,7 @@ ESILibxml2Parser::lineNumber() const
- char const *
- ESILibxml2Parser::errorString() const
- {
--    xmlErrorPtr error = xmlGetLastError();
-+    const auto error = xmlGetLastError();
- 
-     if (error == nullptr)
-         return nullptr;
--- 
-2.43.0
-
diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a163bd9ad3..4a8ea5d550 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.5.tar.xz.asc
-md5  da2797d899cf538fab7f504fdf3c18bf  squid-6.5.tar.xz
-sha1  07a08394625948750264778c82e19cf24ea7cb1f  squid-6.5.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz.asc
+md5  5a41134ee1b7e75f62088acdec92d2ca  squid-6.6.tar.xz
+sha1  f05e06a9dd3bf7501d2844e43d9ae1bd00e9edcc  squid-6.6.tar.xz
 # Locally calculated
-sha256  5070f8a3ae6666870c8fc716326befb0a1abe8b5ff3a6f3932cbc5543d7c8549  squid-6.5.tar.xz
+sha256  55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318  squid-6.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c1477b1adf..3a9edac71e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.5
+SQUID_VERSION = 6.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
