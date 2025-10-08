Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3DCCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 10:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005F64053A;
	Wed,  8 Oct 2025 10:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USShWYPfLsbP; Wed,  8 Oct 2025 10:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294BE40548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 294BE40548;
	Wed,  8 Oct 2025 10:16:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A07EC119
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92A098115C
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrksP-uj5Hrc for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 10:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5482A8114F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5482A8114F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5482A8114F
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 10:16:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.21.12]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1ubU7k1AIN-00lIQ0; Wed, 08
 Oct 2025 12:16:35 +0200
To: buildroot@buildroot.org
Date: Wed,  8 Oct 2025 12:15:29 +0200
Message-ID: <20251008101535.51154-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008101535.51154-1-fiona.klute@gmx.de>
References: <20251008101535.51154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dNjms+DRX+9z79r0CEFwWtx1la0UZwB6eHd20njD93ubngcV2cd
 of+a2b+R6+4o1mP93VeacXs2kuQPikXREYCfBU2hA4Rk0WHOpuf+7cHWokgNfJw8ErGrLMQ
 us2tf3r16++LI8hyOuvCTGbVhOF9UTsssI/Wl3Eaf8wuVUfMi7Ilqt+88Qv2rzpSuxCf4eW
 5KaXO4csOu4Goq6VzS7SA==
UI-OutboundReport: notjunk:1;M01:P0:wSQCTZ3VeYU=;+MKfYkondsrrhJg8m4H8WNMNUB8
 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
 meaHA555vvt27sjpYFrOOUKFJU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1759918595; x=1760523395; i=fiona.klute@gmx.de;
 bh=8PCKr40a8XEUgvmBMjI6f7QrxgZNzbRYoa1S9TNcKC8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VPghFXFk5BM3pE03gTdRpZ18OXl0zFI9bmylj1KNirgQ6GkhwPzlFkxBLnpicsxY
 95Vi2h6kprAFRgWATtxBhXDtOW7p6NxPcr+meIeLEHqr5YOgK6jOx5b92UqcE12ff
 /M5AIsw2JPkl5U7m/t3Wx7KfxcDly+303oNwvz+j2oYRAKAkIWORczfdPyUnjUmDu
 J1ERP/v8vR0TZl9QupvjC37NTTyv6EpBiCzYDJx3j7im3ngaqQWKhshCUTeJiOtBg
 AG3t7AMexjW0RPmk8kkBkuQecr9kJOC6vjrBUcn6hhxAMhCGo1aEpt1c7YpMblBDO
 osgA3J13vxptch5xQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VPghFXFk
Subject: [Buildroot] [PATCH 3/3] package/audit: bump to version 3.1.5
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release, the commit log mentions multiple fixed
memory leaks.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
On my (musl-based) build the most important bugfix is that ausearch
*never* returned any results with 3.1.2.

 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 5743b3a13a..557ccd1f80 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  c0b1792d1f0a88c6f1828710509cbb987059fc68712c97669ca90eae103d287d  audit-3.1.2.tar.gz
+sha256  660213bac2baebabfc32be4d84a4aeb94effbd3e076b1014b78678b4502cf6ba  audit-3.1.5.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index c703acc559..eb0b74b098 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.1.2
+AUDIT_VERSION = 3.1.5
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
