Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAC5C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53E4F40437;
	Mon,  8 Apr 2024 20:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfwK3Lh2fI-7; Mon,  8 Apr 2024 20:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5168A40490
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5168A40490;
	Mon,  8 Apr 2024 20:50:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2B261BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF6B60B63
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NlDn7gRFm9C for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 242BE608A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242BE608A5
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:49:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC8D385C77; Mon,  8 Apr 2024 20:49:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 22:39:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea2f45148e1f83f6edfa512f5922e2f3ac38666c
X-Git-Newrev: 1a40adf355c1d03d643d7781d68009e7f67a60a2
X-Patchwork-Hint: ignore
Message-Id: <20240408204957.CC8D385C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtommath: bump to version 1.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a40adf355c1d03d643d7781d68009e7f67a60a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtommath/Config.in       | 2 +-
 package/libtommath/libtommath.hash | 2 +-
 package/libtommath/libtommath.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtommath/Config.in b/package/libtommath/Config.in
index b2ffc722ac..7447fb9eb2 100644
--- a/package/libtommath/Config.in
+++ b/package/libtommath/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBTOMMATH
 	  LibTomMath is a free open source portable number theoretic
 	  multiple-precision integer library written entirely in C.
 
-	  http://www.libtom.net
+	  https://www.libtom.net
diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
index 4f5dd40231..4ce6057e0b 100644
--- a/package/libtommath/libtommath.hash
+++ b/package/libtommath/libtommath.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  986025d7b374276fee2e30e99f3649e4ac0db8a02257a37ee10eae72abed0d1f  ltm-1.2.1.tar.xz
+sha256  296272d93435991308eb73607600c034b558807a07e829e751142e65ccfa9d08  ltm-1.3.0.tar.xz
 
 # Hashes for license files:
 sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 7b5305faf6..66b258641c 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMMATH_VERSION = 1.2.1
+LIBTOMMATH_VERSION = 1.3.0
 LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
