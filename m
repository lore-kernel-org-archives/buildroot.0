Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0128D637DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D96A40B4D;
	Tue, 16 Dec 2025 22:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SytVGkXGX2qq; Tue, 16 Dec 2025 22:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AAF140D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765922584;
	bh=xGzBwv/T2sta61m43MyimjB+E5TqyrmHao9GQeb3t4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=alvOiqCyaWd/3INjyDTi43h+6aaX2IxVZEenDGTQl+0SWLSifgGoLHdVTwNBgbHKS
	 FC0OOrv9wBQunn4OvX0YoThfOgbjWvKjWDTliHj1iGBDUFmn/ECG7EvLa1Yoa76B+o
	 YEKt6bP30xeWuAuHGdiKv5thYmzXU7LPSF6O+eSMprfdAgKHXPo/HnPu2wNqfaobWL
	 qiJ9hx91FpHgoIjWX/YbRudC/oZmC392jFRHX0owZgW/6Op/hpG/7YC3VtBn3vP7HT
	 9Lfa7L7g1IKdEe/Ib0w+/MT2+vnXYiWTc0AgkKHMvZlBi8GV2nWljARtU1EZ1RWZ2L
	 MxMioNyJSOEvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AAF140D06;
	Tue, 16 Dec 2025 22:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A9E372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEEC160761
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WzgluQd3pk3 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 22:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938BE6074E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938BE6074E
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 22:03:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8329C86ED0; Tue, 16 Dec 2025 22:03:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 22:59:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92e1a15522347c5e092496f8603c50d86f62de74
X-Git-Newrev: b393bff8c44be37f0b56bee61fdd1fef29f16e43
X-Patchwork-Hint: ignore
Message-Id: <20251216220301.8329C86ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvmtool: bump to current HEAD
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
Content-Type: multipart/mixed; boundary="===============2743715256095508846=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2743715256095508846==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b393bff8c44be37f0b56bee61fdd1fef29f16e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By doing so we can also drop the patches for musl which have now been
merged upstream.

Reviewed-by: Jesse Taube <jesse@rivosinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...rdsize-h-inclusion-for-musl-compatibility.patch | 52 ----------------------
 package/kvmtool/kvmtool.hash                       |  2 +-
 package/kvmtool/kvmtool.mk                         |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/package/kvmtool/0001-remove-wordsize-h-inclusion-for-musl-compatibility.patch b/package/kvmtool/0001-remove-wordsize-h-inclusion-for-musl-compatibility.patch
deleted file mode 100644
index 3128a23689..0000000000
--- a/package/kvmtool/0001-remove-wordsize-h-inclusion-for-musl-compatibility.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0592f8f829c843ff5cb2d108c309e32f4f6f5379 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Thu, 1 Aug 2024 12:10:54 +0100
-Subject: remove wordsize.h inclusion (for musl compatibility)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The wordsize.h header file and the __WORDSIZE definition do not seem
-to be universal, the musl libc for instance has the definition in a
-different header file. This breaks compilation of kvmtool against musl.
-
-The two leading underscores suggest a compiler-internal symbol anyway, so
-let's just remove that particular macro usage entirely, and replace it
-with the number we really want: the size of a "long" type.
-
-Reported-by: J. Neuschäfer <j.neuschaefer@gmx.net>
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
-Link: https://lore.kernel.org/r/20240801111054.818765-1-andre.przywara@arm.com
-Signed-off-by: Will Deacon <will@kernel.org>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/commit/?id=0592f8f829c843ff5cb2d108c309e32f4f6f5379
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- include/linux/bitops.h | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/include/linux/bitops.h b/include/linux/bitops.h
-index ae33922f..ee8fd560 100644
---- a/include/linux/bitops.h
-+++ b/include/linux/bitops.h
-@@ -1,15 +1,13 @@
- #ifndef _KVM_LINUX_BITOPS_H_
- #define _KVM_LINUX_BITOPS_H_
- 
--#include <bits/wordsize.h>
--
- #include <linux/kernel.h>
- #include <linux/compiler.h>
- #include <asm/hweight.h>
- 
--#define BITS_PER_LONG __WORDSIZE
- #define BITS_PER_BYTE           8
--#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
-+#define BITS_PER_LONG           (BITS_PER_BYTE * sizeof(long))
-+#define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_LONG)
- 
- #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
- 
--- 
-cgit 1.2.3-korg
-
diff --git a/package/kvmtool/kvmtool.hash b/package/kvmtool/kvmtool.hash
index 63bbb7167c..8df6f929df 100644
--- a/package/kvmtool/kvmtool.hash
+++ b/package/kvmtool/kvmtool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8504d8b184cae4e65ff5555cc84a436f3fbbc832a8017e3ca59d997dd5581db  kvmtool-4d2c017f41533b0e51e00f689050c26190a15318-git4.tar.gz
+sha256  18841c414e82b405a0bd6f5c546bc088becd298c1145a2bac97563e699231925  kvmtool-1117dbc8ceb21abc6e8cd9861450695995852290-git4.tar.gz
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 7fec6643f8..f5637e5384 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVMTOOL_VERSION = 4d2c017f41533b0e51e00f689050c26190a15318
+KVMTOOL_VERSION = 1117dbc8ceb21abc6e8cd9861450695995852290
 KVMTOOL_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git
 KVMTOOL_SITE_METHOD = git
 KVMTOOL_DEPENDENCIES = \

--===============2743715256095508846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2743715256095508846==--
