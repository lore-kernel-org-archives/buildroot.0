Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6542C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F95C41B5C;
	Sun, 11 Sep 2022 08:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F95C41B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bww2ZK973Xw6; Sun, 11 Sep 2022 08:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E62B419F9;
	Sun, 11 Sep 2022 08:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E62B419F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A761A1BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA153409BB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA153409BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGBYV6_5LLsb for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C101141477
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C101141477
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF0F183622; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 09:32:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2beb090ec81862da500dff31804f4d2436b388d3
X-Git-Newrev: 36d00aee880a1276ec3bf3f47ee24b81f555e5dc
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.BF0F183622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stella: bump to version 6.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=36d00aee880a1276ec3bf3f47ee24b81f555e5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- drop a patch (already in version)
- update Copyright.txt (changed from 1995-2021 to 1995-2022)

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stella/0001-configure-add-CC.patch | 30 ------------------------------
 package/stella/stella.hash                 |  4 ++--
 package/stella/stella.mk                   |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/stella/0001-configure-add-CC.patch b/package/stella/0001-configure-add-CC.patch
deleted file mode 100644
index d4b29e39b5..0000000000
--- a/package/stella/0001-configure-add-CC.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 143cf9fa13a07b827de7065a5e919631406b0941 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Dec 2021 22:46:52 +0100
-Subject: [PATCH] configure: add CC (#854)
-
-Add CC to fix the following build failure when cross-compiling which is
-raised since
-https://github.com/stella-emu/stella/commit/771b5b44e31de1b81a552ee47b65014fbc338776:
-
-out/src/sqlite/sqlite3.o: file not recognized: file format not recognized
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/stella-emu/stella/commit/143cf9fa13a07b827de7065a5e919631406b0941]
----
- configure | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure b/configure
-index df666b377..0101d2567 100755
---- a/configure
-+++ b/configure
-@@ -899,6 +899,7 @@ echo "Creating config.mak"
- cat > config.mak << EOF
- # -------- Generated by configure -----------
- 
-+CC := $CC
- CXX := $CXX
- CXXFLAGS := $CXXFLAGS
- LD := $LD
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 8aa5118165..17d059226c 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d481efc6d27b5294565dfcc10983de2dbc4db8a59932a678ffdb4d2404b8c207  stella-6.6-src.tar.xz
-sha256  d5e5897578c2590e48328986cebd950ff215653f7f506ef93accf981870366a6  Copyright.txt
+sha256  babfcbb39abbd1a992cb1e6d3b2f508df7ed19cb9d0b5b5d624828bb98f97267  stella-6.7-src.tar.xz
+sha256  e82dd017fea2c70a16726aa1d7c05c5b7597e10f7229511c1b110bf84cb507c0  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 198a1134dc..aa5da1996e 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.6
+STELLA_VERSION = 6.7
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
