Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59422C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E099540377;
	Fri,  9 Aug 2024 11:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFFR-YEFyDU0; Fri,  9 Aug 2024 11:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC80A41268
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC80A41268;
	Fri,  9 Aug 2024 11:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B15C1BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 795B881BFA
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IDTxAcoROJR for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.154;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D0FF81BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D0FF81BF5
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D0FF81BF5
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:24:13 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 8B28F24A33F8
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:24:11 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 2k-kmZC78G0o for <buildroot@buildroot.org>;
 Fri,  9 Aug 2024 13:24:08 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id A6AD524A33F7
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:24:07 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id 3B0C33125B26
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:24:07 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 13:24:01 +0200
Message-Id: <20240809112402.737525-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1723202648; x=1725017049; bh=/qLGrBoRnIPeWX2B3U4
 63oDSYUf1qFWSpCSylZAULyo=; b=gQPh9kst2mvKIkFeN5uV6R8uwe+/dW2R8Gc
 gykeRn+P3Em+rfLrXaIl/XpxiTVyWKMUV/SrSAwRuhf8UN8joet9keptqUAO9cWC
 /q1oZ3orm/1zwQ5jqB+scLqUQtuze5sJTx1/HtIc5f3GXWzUrW4OpvV+f8K/4hiy
 19q88fFFbxEfVNNldzDZb6sL43w/S/k+7XKjeugKz45kUrP2KMGwthLtdkS3YwWS
 n+Y7upRgzmqilu1GBYY/hx97+iG/OsXMBRpIkz44YVo32QmsfzypLa+/yxwYGb+w
 AAMx0KGdUqVmH871x2ADWiS5nUKznm3onKVqTp93MQvLGTXEghQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=gQPh9kst
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH v2 1/2] package/simple-mail: bump to 3.0.0
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/simple-mail/simple-mail.hash | 2 +-
 package/simple-mail/simple-mail.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
index 67d6caff87..4de1525b53 100644
--- a/package/simple-mail/simple-mail.hash
+++ b/package/simple-mail/simple-mail.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2026f2017662508b0f25da72694f1dd13ab3ccf82c0454f7c40f8a6cc450c410  simple-mail-2.3.0.tar.gz
+sha256  f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  simple-mail-3.0.0.tar.gz
 
 # Hash for license file
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 68484f79b0..94f2369816 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIMPLE_MAIL_VERSION = 2.3.0
+SIMPLE_MAIL_VERSION = 3.0.0
 SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
