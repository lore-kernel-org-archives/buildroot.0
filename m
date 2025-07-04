Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB2AC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9BB64111A;
	Fri,  4 Jul 2025 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqTmednMlqWc; Fri,  4 Jul 2025 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5584111B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5584111B;
	Fri,  4 Jul 2025 14:48:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 262501EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC634023A
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFZmsEZca67X for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 14:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72FF440123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72FF440123
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72FF440123
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:48:33 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id XhiIulC7MWAxHXhiJuZFCt; Fri, 04 Jul 2025 16:48:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  4 Jul 2025 16:48:30 +0200
Message-Id: <20250704144830.1682903-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <5b3010b4da5429b622aa62077e167215@free.fr>
References: <5b3010b4da5429b622aa62077e167215@free.fr>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ9JpKMJTZv+xTXX+Aiuk4K+eFHeRGDOExh7P+KRyEymdvD0M0OPc8CrxRp69Y3LNZOZNEJF/7WFwT6jLT2LK3kz31NK7eOfz6XPO+q5oM5+kIgJoZuB
 2rqtqQ8LJE+q1jkQHLOop1+9Wn6G9+IHEfzQWh39PJ5lywQVQRXtkBdSgTsYurOdeR50Yuzjh1GXX77oLkVjDM22SWOOXHhC2+awvCufHul8rqrLICeSmFjD
 9HBux3DJiTPUprCLrZXP3q/g7rCRqecLRePovz8JeCxlQZml6gHHJbPm7YqqnfEGFp8kK0tk8kWWNK00bbattQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751640511; bh=RurXiDXacGUoUuynmDh+JHv2cMAw9g1uHJuqCHmTHXI=;
 h=From:To:Subject:Date:MIME-Version;
 b=IZU5ruojnL004CpUL66qETTiHC7SmhNP1760qkkP5MmLGEUOgwvod/6SbnRGHxwcA
 EDUq28FIEafSwvOLxQLX52U33KpcotsE+gcIlG81VJAavJi+tMj5lT4N/pjH+tCb2X
 IVq+qigz2qweyyU2sZZ2+L5fFPxxlAyHH912Vsm6ZQ7/1xbysxebWir9y/ntLa1a02
 FfoimKhrdNr32s6ghD856TjHCQnyM9eiYFpPtF5n/wT/RIeP2cx/pFTXaV6a0Q+p8/
 PaQBqYknjxzlYzCOKPrW25XCWeOpS2dlMf43HvVvoqnb8VW5KJruulh1M/i+gMVZGm
 6k0YRTImu8WbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=IZU5ruoj
Subject: [Buildroot] [PATCH v2] package/libnss: bump version to 3.113.1
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
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_113_1_RTM/doc/rst/releases/nss_3_113_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* this is not a security bump so let's remove 'security' from subject as pointed by Julien Olivain
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 7fcb75e6ba..e0bbc82413 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_RTM/src/SHA256SUMS
-sha256  acef06b512d3bd81c87a63b3c8653d258bb689d2191fc0e64decf5a1efa01c0f  nss-3.113.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_1_RTM/src/SHA256SUMS
+sha256  b8c586cc0ac60b76477f62483f664f119c26000a8189dd9ef417df7dbd33a2cc  nss-3.113.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e7b90a75a6..d6a9e9e2b1 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.113
+LIBNSS_VERSION = 3.113.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
