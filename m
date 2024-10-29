Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9EBD3A661
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 15:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47307605D1;
	Tue, 29 Oct 2024 15:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbDKEMBctg7P; Tue, 29 Oct 2024 15:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD3D60835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD3D60835;
	Tue, 29 Oct 2024 15:49:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDA55E4E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E63280507
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id strNGwMymgU0 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 15:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42CAA80EE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CAA80EE6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42CAA80EE6
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 15:49:15 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A40D82C8301E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:49:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 16:49:10 +0100
Message-ID: <20241029154911.3268784-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730216952; bh=64860t86lKj6Ctz+BGYdVUP/HHk9LI2pYwDeXqDixBg=;
 h=From:To:Subject:Date;
 b=hXjmp2y9ZBZXOpG7Djr0Xq/yLZI0RXflncVsPg/6QA9Rg7NVvyLGEBlXYLFnblC0v
 5+Bw/qlk3EDSOAbYy9iIdVjXqIiFNE02iPVUi8t4RfsSTabrSh4EufvWKtsQfCgs1n
 S9GKeWMKB7fd5PqWjr9O/2sPmYS69hjx5+2S7uCc1T4UPfBDaoOCp0g+x9vxaCcPbv
 LufdOp+0P2o8VIa0l7JH4SGnoehN2WRYRVEXUPI2qlNAQseYLnAPgCGtYx2wH0dXSk
 CXrdyKr+ACRwOBBPT8IZz9UPfMTZxxZP7I7i0Y+iKDtZcsiS4KvUzeu4S9yPllBMtU
 B4YBBJYdEWaNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hXjmp2y9
Subject: [Buildroot] [PATCH] package/nghttp2: bump to 1.64.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
* https://github.com/nghttp2/nghttp2/releases/tag/v1.59.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.60.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.61.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.62.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.63.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.64.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index dddf6fe1bd..4b60d6d143 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0  nghttp2-1.58.0.tar.xz
+sha256  88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd  nghttp2-1.64.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 7a05e38fa9..98f837e28e 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.58.0
+NGHTTP2_VERSION = 1.64.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
