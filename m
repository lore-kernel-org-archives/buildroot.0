Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44013C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E653840680;
	Thu, 12 Jun 2025 09:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhpQRWM8N7mp; Thu, 12 Jun 2025 09:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF7640769
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF7640769;
	Thu, 12 Jun 2025 09:42:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 215051BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F26CA81455
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTHi0tokIkP3 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 09:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E138B81434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E138B81434
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E138B81434
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 09:42:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.170]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1vAo1m2gTU-00foXj; Thu, 12
 Jun 2025 11:42:02 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Jun 2025 11:41:56 +0200
Message-ID: <20250612094157.680899-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:O9AHlNSqRr8iAgBbiLBcvX7RONgQM9Yb+8mdgrHCKYrsCraTdjX
 Zd2MDmByOPoOt+aGCz+L8duOze3vkacEhs7B6XSjmcORqhmKjq1tpfAoBHF/Up89tBhBwvQ
 W9Jsuzz/M12DPIFPCn1TdYhq75qLsrF+C3JXaQ8N/NsDmsX3Udt30xWZje5yYxDvinOnmCt
 BsAYbTbNucHrXsITMVx6A==
UI-OutboundReport: notjunk:1;M01:P0:Gnql2IhE6iI=;0seYHN980YRT4iI7bljxBUh9P/6
 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
 UDaNu/2ZDpLw02G0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1749721322; x=1750326122; i=ps.report@gmx.net;
 bh=+YlYAzV1LdssW3VBVVanMXUVbQGu833V6xaGjJIT4pw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KFc/7IeC66BUtIo8xTsQ7LKAwsftwKfthhywaygtS4fx2FF51S/hVYOQ2XRornPK
 S4gvmHMaJHnViri2jT3jG8lakK+G/eBXJRZI2cw/I12wYcsv/m5/iwUyvaTZwSX3C
 IRXkuWwkyaM5zmvPifmN4kBkkdqUVCemgFxBAsYolqPmSBAIHIjvCilEwSLSigQtV
 MsAPxmgzkrdXXHrVZDXF3JTPI35gqxK+OlA1IcHoO+BHtNF79Zj+a8OQmHy22TjiG
 Ra7K0t/YaWpc4Y8upinWOfuw1l7tXuQ/2biCZ+s5kJ0bpALws57bjvu8HIbeeGJiZ
 f7Veoqs+0AAoQ8xirg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=KFc/7IeC
Subject: [Buildroot] [PATCH v1 1/2] package/mongoose: enable IPv6 support by
 default
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- enable IPv6 support by default

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index c74330e5fd..02dd04f327 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -13,7 +13,7 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99 -DMG_ENABLE_IPV6=1
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
