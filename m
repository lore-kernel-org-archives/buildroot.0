Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0797ACD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 08:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07B08343E;
	Sun, 24 May 2026 08:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PATYvqzpdxbU; Sun, 24 May 2026 08:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00CD83415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779612676;
	bh=LCMACcK9EejPjsbPumqYcrKO1Q7DDCniSVPjlZYW0cw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SPSzvBiuJVhtCRJa//qAsXfdVURt+0ZXtHYfDzp1T/Zk/gCtEegQ3TOff5cYUU3rW
	 QuH0m3MocKIFDNr8Mzp7IS+XJGPprGsopIDcA5VhYGxEGS4/a+6XPYr6ZEa31orCdT
	 rGKq/PvCd3C/g5o0AcIE0wm1onGWAkK7h8KZtbKQo/N69m9Xy+rpK4XEz+F7exfTWc
	 UlHU0T7IfmRIyPkSaWNb0Ibv0hvCqGS0zNDCFuUMF6g4UoUEl/emwsKBkdR1GFcOuA
	 O7stKHDIXbTTYzN96qSlLNvdm6pepqa1lxeLRrJLx8V7QIg4x2+Dq2FzweH5UueyuI
	 fhINf3GeXwKgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00CD83415;
	Sun, 24 May 2026 08:51:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F3C2263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 08:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2888160E4A
 for <buildroot@buildroot.org>; Sun, 24 May 2026 08:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJf-y6Y-RIQa for <buildroot@buildroot.org>;
 Sun, 24 May 2026 08:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88EF960E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EF960E49
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88EF960E49
 for <buildroot@buildroot.org>; Sun, 24 May 2026 08:51:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpSl-1wyBEt3VsX-00cwhd; Sun, 24
 May 2026 10:51:10 +0200
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 08:51:05 +0000
Message-ID: <20260524085105.16377-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AlhOaYue7m8kW1jusQ0oSgVJTy+mMP4tvnO6oE34V3iIoaqdYQ9
 ALoqMU2Q5hZI2PL2PvxQzsbT/+5Gmrrk26MTpYU2pdosOp8RbEHnueujHTE0D5lvNuBy89Z
 Q2ZEgbB7vzKfcpzcz8uJYTCgsPW1qYDsTqREZJDGv2iY0z+2eIUq8Y+oGnWTDdmO3CCYKfT
 Qj+y3uBZHL3q47nLltXRA==
UI-OutboundReport: notjunk:1;M01:P0:qRnpdHkThnc=;IbS9fk88iqNeuVRiCEKrJf7pBVU
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779612670; x=1780217470; i=and@gmx.li;
 bh=1Puk/wU0MFeuuaX6jjyGPpLW1oyafh+mXkfP90StKN8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZgLcJN1Tqv5dq0m8ab8tJNtlATsPIgXO05B9WF6n2RZDo0tf2pCwj7U2s4yHEiyr
 GDCWEyTWURYUr4TGOjLKAaY/kQjnPwELQ8XU2E3qSH78gSdInmgOUdOglGldhulWj
 5cAAxAp1n7Qzxc24jTvQesWuWZPrhwcpU9WlChELi/mk22cvUma0kABTnAE8+qTFP
 LrrK9cxColvhY6Q07m/w1o2kFvRxed+S7uWT7YqFodckHJTwr54azaTQVdzBRsmG5
 rf/+bdpVGQwzVDDN9nOTa8/sAtDCardcUIGPxtpQ/fXF3psbA9TZRi6CDrBQaUEjy
 ll0OIrHCfiGfwhI9XA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=ZgLcJN1T
Subject: [Buildroot] [PATCH v2 1/1] package/tpm2-totp: bump version to 0.3.0
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tpm2-software/tpm2-totp/releases/tag/v0.3.0

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/tpm2-totp/tpm2-totp.hash | 2 +-
 package/tpm2-totp/tpm2-totp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-totp/tpm2-totp.hash b/package/tpm2-totp/tpm2-totp.hash
index f7cf06162c..54de933e8d 100644
--- a/package/tpm2-totp/tpm2-totp.hash
+++ b/package/tpm2-totp/tpm2-totp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0b2b63cc7ea74f5a6952f2cd689896c08f6b94ee6865f48af609f9a8ac247dc1  tpm2-totp-0.2.1.tar.gz
+sha256  1a8c83dc0d0dc58bd85a3fbfc9da6e39414c0d33f1a19886cde20f063f0c527b  tpm2-totp-0.3.0.tar.gz
 sha256  67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE
diff --git a/package/tpm2-totp/tpm2-totp.mk b/package/tpm2-totp/tpm2-totp.mk
index 42607c0b73..1fd0a30d03 100644
--- a/package/tpm2-totp/tpm2-totp.mk
+++ b/package/tpm2-totp/tpm2-totp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOTP_VERSION = 0.2.1
+TPM2_TOTP_VERSION = 0.3.0
 TPM2_TOTP_SITE = https://github.com/tpm2-software/tpm2-totp/releases/download/v$(TPM2_TOTP_VERSION)
 TPM2_TOTP_LICENSE = BSD-3-Clause
 TPM2_TOTP_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
