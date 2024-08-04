Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7363C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 10:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ACDC4042C;
	Sun,  4 Aug 2024 10:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVsMkQNmTiLM; Sun,  4 Aug 2024 10:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB1E40163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BB1E40163;
	Sun,  4 Aug 2024 10:02:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1892E1BF59E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 10:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1368A605BE
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 10:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqBxWgT6EL1E for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 10:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79C49605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79C49605AD
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79C49605AD
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 10:02:52 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8A4C03535FBA; Sun,  4 Aug 2024 12:02:49 +0200 (CEST)
Date: Sun, 4 Aug 2024 12:02:48 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zq9RyIKN5dTsJ4C4@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722765769; bh=8Jpsxb5W2tE3ipNgUtjmvcW+4Nkt2d672I5WAt1Gm/M=;
 h=Date:From:To:Subject:From;
 b=Kl/T2AxgBiqV1lMUSlWz3/UQ2msh+muF7todEwfncFL9h9WBmtJQ5GMzkxTL3Not1
 bpB9UytlO2+3tKyIUK0aR6eAiDgVg8yDcahEkYKuB1BDqxgDfjn2AeKMR4e5jXhUIH
 oO/60EOPCObTXGmSRr8GGw0QpI/i2xUwEZ6E3tmnEz/b3OrPjWYYhHiNzoxzr3J6uW
 qSfAPit2QwxYtR+pVx7732UIjPt/kAxBsJ1z69u0tcQ103HbkH1qfV1chfqwWcjTxH
 nCr/8NlvF7v8vKXHoekCFcSROfpdN/a/e+7xsINfAvP3Bey3s/qpuqE8c7YGjo4eSm
 BZFk28evtBSjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Kl/T2Axg
Subject: [Buildroot] [PATCH] package/libgpg-error: update to 1.50
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index f87accdd97..be5202584d 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  28668dc3f693dfd8fa6724c702559e45ab5b15c0  libgpg-error-1.49.tar.bz2
-sha256  8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9  libgpg-error-1.49.tar.bz2
+sha1  6790fc3d6e7bbd7576654b43971bbe15e953ccc4  libgpg-error-1.50.tar.bz2
+sha256  69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a  libgpg-error-1.50.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 9245e76531..8dff6a612d 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.49
+LIBGPG_ERROR_VERSION = 1.50
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
