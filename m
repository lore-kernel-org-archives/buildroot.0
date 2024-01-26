Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF42AC47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EF184EDF;
	Fri, 26 Jan 2024 08:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62EF184EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi-Klm7Xwqad; Fri, 26 Jan 2024 08:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF7E84EDA;
	Fri, 26 Jan 2024 08:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF7E84EDA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 433A21BF98E
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D1F86FA16
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D1F86FA16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id caGa-ZhOVioP for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:43:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58AB461AB0
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58AB461AB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 251D0864F9; Fri, 26 Jan 2024 08:43:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:41:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb71ff12c691e98028d0123cc573a6c9817100d2
X-Git-Newrev: 6116963df34ed8c64393b0ce1cfa117db7936bab
X-Patchwork-Hint: ignore
Message-Id: <20240126084352.251D0864F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwpe: switch back to version
 1.14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6116963df34ed8c64393b0ce1cfa117db7936bab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The versioning scheme for libwpe uses the middle version number to
indicate stability: an even number for stable releases, odd for
development preview releases. As such, Buildroot should be using
version 1.14.2, which is the most recent of the stable releases.
While at it, add a note in the .mk file about the versioning scheme.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwpe/libwpe.hash | 6 +++---
 package/libwpe/libwpe.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 226b4f3295..554b1f2b0e 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,6 +1,6 @@
-# From https://wpewebkit.org/releases/libwpe-1.15.1.tar.xz.sums
-sha1  0082ceb475175bfecd1172f2c0b292824d31561b  libwpe-1.15.1.tar.xz
-sha256  14d36a93a05ab7ada9bec581720b8057336fe681bbbe59bda7d50cb8f3eba3a6  libwpe-1.15.1.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.14.2.tar.xz.sums
+sha1  70a2b894af2b50d7082260158a89524974a480f3  libwpe-1.14.2.tar.xz
+sha256  8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef  libwpe-1.14.2.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index f8c6b0fc76..1fbdd5fcc3 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.15.1
+# The middle number is even for stable releases, odd for development ones.
+LIBWPE_VERSION = 1.14.2
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
