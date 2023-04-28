Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDAC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 19:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A1EA40B74;
	Fri, 28 Apr 2023 19:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1EA40B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DikwWY-l3J9g; Fri, 28 Apr 2023 19:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F7F42A93;
	Fri, 28 Apr 2023 19:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F7F42A93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1741BF358
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 19:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 341C042875
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 19:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 341C042875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7uNV6ITK4kh for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 19:47:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1578842874
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1578842874
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 19:47:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id sU42pVFKTe28QsU43pgkQR; Fri, 28 Apr 2023 21:47:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 21:47:29 +0200
Message-Id: <20230428194729.293840-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJytxeCRqx66WBEQ0LUbn9/WbCahq/KWDtrGV930pXQyXfWt3HELhD2+cCfPlLwWdf3SwGd/QOseqM7GN4XFSrClbkx7BPTdZNOYLoYZpCuCcjSXCmql
 Pn7TzifvKQYil1uHFZNpUfXIuVR7JVsDsVMa6WYCzM/yFrjeWToBgQZBI8iWcMy4yrIP534x4CrhxgvqtK/ox7lyggGt9NJqG3JdYB8DhYqszVZWSH5Xpbsp
 Hj2UWYV6X0Hi5c+QnJhyOQo41Fe7jOe04Mlth6MfIzk8fvDTR0V/PSB0BljaILpg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682711251; bh=tgnh31l2YOeW9gD+OCYuBBzD1TLyVwMua8VxdPyD+iQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=SL8NRb+REegZ6xBXOgI39LsFX1v1WETPsU30gAvEt7Gnl8tKIEvhFeTlwJt0DXvKD
 mEzJ7OiLs4z+VABa5Nk70d9yVmkZW6/mUDrizTWs0oF0LADIRgRPSCbh5TFmrxdfom
 TVJ5ALJfYG/ptfmtP6Asiz4Z/qMrAXdZPpkrx2MDZWObg6ZDRFJAVvduV2EFh1fZmk
 ZmsQ7L17zD1MfVvphoJFotm0xz2S7fNyWJRHiMdOgTLiyO0hbBqMyqqiMBlQgRJb+0
 ra1ueAPhwlF5klQJwwiQa07Mwsa/YoleFdSVhySaq6d6Qpyp7j8ja4Av+y/eg9ac5T
 CXrZV9uBuh7Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SL8NRb+R
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 7.2.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1e7a1cf530..88b90c8b39 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b  harfbuzz-7.1.0.tar.xz
+sha256  fc5560c807eae0efd5f95b5aa4c65800c7a8eed6642008a6b1e7e3ffff7873cc  harfbuzz-7.2.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 24c6f3ef27..23741ebace 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 7.1.0
+HARFBUZZ_VERSION = 7.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
