Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D486C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF63A417FE;
	Tue,  1 Jul 2025 19:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zEgCk12lrMb; Tue,  1 Jul 2025 19:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F042541A34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F042541A34;
	Tue,  1 Jul 2025 19:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51CE7197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43CB260DCE
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcoGo9mFrLa0 for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 027D760BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 027D760BB7
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 027D760BB7
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgLSuTx4S8eo9WgLTuLwxY; Tue, 01 Jul 2025 21:08:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  1 Jul 2025 21:08:38 +0200
Message-Id: <20250701190841.714026-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPaetpRX+Y9vzvURDsmOV4hcOQ/rzwSKlnxnMojitVJLGI73DfFBWuqTnjko41fmInFHdC7WqWwYU7QZHD2PES03qJyTqw+Lpm0S84XOEeiTYb4k0lP4
 /Uj7r1Gj/dxsYILd9irGIJB0xbpyGViNujdpRCQZ8iIntgv6X5EtyU+1NRNVeG86C910NJ1g45q20tyteoFcpImBUmk2pB4+dY6T8zlXvsJn39Ykl+TPVHty
 wVuv0V7jOcfIYwSC1RCNCCJqGswl1q7mH02ZhlGrtdoXLkpfIUJGEq0oIHW6H108tgpv9J92WUUBNTUa5PsJWy/3gUhEMt78uUdGG9Q9XOviuf83HNuNPcfv
 551DdfuINBRJN/R7m0+0ThEpSXT/DJ0kbHf7MejDzv/4CVVQ1QxkqK3upQnKk6UC7hoghr0m
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751396923; bh=xq9l9XkoZCcw8M4DkbXha1cERsOE/+p0RBs/9sx2zFc=;
 h=From:To:Subject:Date:MIME-Version;
 b=R/xsLX1izdMsapaA08xBFCP3A+nR7a5ejdo+B2q/zrz28TS5SHsytiFfMjplqzlkQ
 ukVYzIsAhlPG/QVF0nmzTSMhk6ctCtJvmxm48kP8u/Fy8su+EPDbPty+UJTgsefhJk
 E2cT868KIw78hOXLIksNcGAxfkBYk3p9Eo9oq2SSdWHmM6dFnobc77ovHmcVmLklUm
 hq+HGFW3+yEXSTkF/Kcu7Btt3vbHiVY/6ZPPBab1aYPj2Bfr4UbJev98zp1RlvzcLQ
 7GJ9wHmL8N0xM6+ioN+pfy8CB13RC78N3cfHiNz4xYIbK3dxrKsuzAXdAcDgwmpEu/
 ewIR5P1/phHcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=R/xsLX1i
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-06-09 version
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

This version allows to build with Linux 6.16.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 0c6009f05e..847a0d4fc6 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  04cd204046bae15cfd64643d1f2d15d215acc0bd0b6b3da2404f001d5e172557  rtl8192eu-c014d0970c8052e8b2306e24ccc92f6fe738458d.tar.gz
+sha256  6cb82ae3c5c5cf783b9150035459ecb4a13aaa614d0a8bb3ab938d54f4feeb74  rtl8192eu-0a170fe9a9cd75ea4df3c209fa4a02f9858483e5.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 48c1217300..ebd376c475 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = c014d0970c8052e8b2306e24ccc92f6fe738458d
+RTL8192EU_VERSION = 0a170fe9a9cd75ea4df3c209fa4a02f9858483e5
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
