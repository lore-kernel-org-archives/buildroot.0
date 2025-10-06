Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB50CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 15:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1AD8040E;
	Tue,  7 Oct 2025 15:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eb4YUbEWpuYJ; Tue,  7 Oct 2025 15:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4136804C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4136804C1;
	Tue,  7 Oct 2025 15:38:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A9F1119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 15:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BFA1804C1
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 15:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuKD0NEnQxpM for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 15:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E3668040E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E3668040E
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E3668040E
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 15:38:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 69ldvKuzrlGps69ldvorYb; Tue, 07 Oct 2025 17:38:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon,  6 Oct 2025 21:33:47 +0200
Message-ID: <20251006193347.3064754-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDlU7fK2gFKCbl0kuzgkk1KujEubjcyjUwtqORxbcl5v+AkWtDiJHLzFhFk5RC1LpIMICzvulrGCKYm7nGXM9KXRL0Rt4h8BfeWiTcNjYTFWWmeu8NQp
 kzSNOrS0Qr9BZdpuELsFawntcxBoJsT1fAhAJLa3mrYc6+3ILvP1vxrUZ7TPMFjxv0+WuLSxjtCKDPxmIoQB8dcLcVRV1namj1QPP4GkOCLreJnjuXIbKbKY
 5d7AZ/hv4Inc12plu8GgAaZ2P6Nt6BlWg4GJ+2RAgQp82m85525xv/N9fVd9K5dDoVKydSCnfOLgI7HrZu3ZHw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759851501; bh=aZSq4UHbqdkSE3ewTF1I6djJYj4W7OtVzbsGfyZAaIQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=iwTrdMguRmp8wEQYjqAM6CoLf7ygX5slAttU0Bivr3YeY199D1wP20+YQ79ajXsPy
 EgVC5m6uypDfzqSy1w8s1dBebPw05keTmLz3ULx4zANBdXA14nIXZ0ahJsks3OJfF0
 LXtmemYBfFBkvEqyduZIsaJ1yylKCqXaDYv27qlWYgINYMERyfN6OIyXE8DfrJu4/a
 mDwF+OOoGoiap7T+gcLE8HnasWeKfVPS85HmlWHBwf+3v6WfjsdNSso9fUIPtk/ndr
 qlAdoMzVREkC2do5Ejrd1B9tMMSkzNMTgHqQdPJtA7H8vR6DXsHZJbuavAjLaBO8Iu
 aMybMARFJwu7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iwTrdMgu
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.117
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_117.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index c839d58b80..cf339697ea 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_116_RTM/src/SHA256SUMS
-sha256  3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73  nss-3.116.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
+sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b0f15a6317..9b85e86ac6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.116
+LIBNSS_VERSION = 3.117
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
