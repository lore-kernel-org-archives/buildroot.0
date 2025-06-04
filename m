Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB8C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 09:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59F941FAB;
	Wed,  4 Jun 2025 09:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5THuLBJ2Kqj9; Wed,  4 Jun 2025 09:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E274196A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E274196A;
	Wed,  4 Jun 2025 09:07:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CECB61A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 09:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD18E811A1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 09:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n012W1N44nfD for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 09:07:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B34781045
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B34781045
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B34781045
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 09:07:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.246]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwfac-1ulhtX15v0-014aZw; Wed, 04
 Jun 2025 11:07:41 +0200
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Date: Wed,  4 Jun 2025 11:07:32 +0200
Message-ID: <20250604090732.29376-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:LffcNMg8HuAwHxnbS1TXQnbvnU9AdF3a824dRw020WxxxqK7YEi
 DmZiRbc2do7rr/DRJSTn53z8UJczrAkXJStP6dy4mJuEY2kJo83+xPWPwSluEn4PknVQm7L
 ueaIKUW+E7Eoba1lynVsArwmM8szIj5mT2SaBK/zsyUFv1TWuH5dvd5yEtXfjaEZ1ZdlNgq
 JYg2WMhiJyJWnZ5S6ARFA==
UI-OutboundReport: notjunk:1;M01:P0:/qLYnsL9S8A=;TBZa8k9EWGnx7Q9dtjbomyS3V84
 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
 wWp5qmnbqSVpSye3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1749028061; x=1749632861; i=ps.report@gmx.net;
 bh=d7drz6oDXWsb9m7LgKUBqfxgx8iKQz3r6yhhdSVHLXE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NsCrG9NHanVkQusDK0bO+mPOIKxkbIQt6srUkUBZawqjyHafLKAzPp/VKY232pGh
 06Tif7v9gwr74ZTik4jNAq0SW5sL/g7n+Q8rZqOZlVNDjVL53wi/Qzdc98+hdd6sn
 5jfRCunLtZh1y9bViayrKrbTN2Z5XYX69985XorAxWc/sqkqRATA6iohRn7/FLDxb
 raPvjgkjeSBH3p9mZyLWjksf9wmL/Wr+3CiA9flPNoWJNh1/b08w8iE1zS9v256gM
 m2qshLV8IXUeXTTpRn97dGzrbBdjvjNx7YumndS1o/NtQHwjsF4m3Wdr0naJDEQrM
 25Ldi9CwILHR96XSTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=NsCrG9NH
Subject: [Buildroot] [PATCH v1] package/mongoose: fix openssl/mbedtls support
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

Since version bump to 7.12 (upstream commit [1]) the openssl/mbedtls support
defines changed from MG_ENABLE_OPENSSL/MG_ENABLE_MBEDTLS to
MG_TLS=MG_TLS_OPENSSL and MG_TLS=MG_TLS_MBED.

[1] https://github.com/cesanta/mongoose/commit/0613cc62f4dbec6beb76e9ddece60d52171585c0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mongoose/mongoose.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index b41f6a054d..8316a8d59a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -17,10 +17,12 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
-MONGOOSE_CFLAGS += -DMG_ENABLE_OPENSSL=1
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_OPENSSL
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 MONGOOSE_DEPENDENCIES += mbedtls
-MONGOOSE_CFLAGS += -DMG_ENABLE_MBEDTLS=1
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_MBED
+else
+MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_NONE
 endif
 
 define MONGOOSE_BUILD_CMDS
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
