Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B610D729E7
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 17:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DD3240791;
	Fri, 29 Nov 2024 17:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUDZsAH08G3N; Fri, 29 Nov 2024 17:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54BDF4080E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BDF4080E;
	Fri, 29 Nov 2024 17:04:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D57F2712
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 17:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE8240A99
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 17:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erFDDVnH9yyF for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 17:04:06 +0000 (UTC)
X-Greylist: delayed 416 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 Nov 2024 17:04:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CFE340B1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CFE340B1E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.154;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CFE340B1E
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 17:04:05 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 9E41920B367E
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 17:57:07 +0100 (CET)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id uxEQi4Z2VdEj for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 17:57:06 +0100 (CET)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id D7A2920B3675
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 17:57:05 +0100 (CET)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id CB9AB3118135
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 17:57:05 +0100 (CET)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Fri, 29 Nov 2024 17:56:56 +0100
Message-Id: <20241129165656.184507-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1732899426; x=1734713827; bh=9j8UysYYPm3HzwQ/qQv
 jFIiy5727Cv1Sy9cuzUFp1e4=; b=lgiSk/fqDbRbDXYq8GoetwIoYwP5su7K0Vw
 PSxtk97XxAW8o18L1tlbGzShAG8Jbdd3u28LPhWppiUTBx1ggnPowpDrzrnw8FQC
 E6Xd9BQJWZ5Gz9ynw1kg5CNP6QNh3NYyVwX8J2wweqhbUYelSznQfa19ReLzjPfV
 x7uiUh1UIQp4Izk9m+mCaIzD5AIeuq1SYPFopCgsTmvT9pPblULQ9vXK3b16NNZD
 CJlbiaT1qSmvedsvYaNIXyEBevv5j6VisbrKr8J1EzFAsoZU18SLwI3DNByjnrIZ
 yW82b5U+bve5ESZ4VJu93CmYxc9hD1IEGm6+E8Mhj/ZHYtajO+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=lgiSk/fq
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/simple-mail: version bump 3.1.0
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

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/simple-mail/simple-mail.hash | 2 +-
 package/simple-mail/simple-mail.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
index 4de1525b53..ba4d36c2b3 100644
--- a/package/simple-mail/simple-mail.hash
+++ b/package/simple-mail/simple-mail.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f93e93843d11da5c4ec44225eba46ccb3e9710fd594a27b966901745429ed4f4  simple-mail-3.0.0.tar.gz
+sha256  d4a46b5c3f706669ffb3c9e4d2ff5e2bd892eda639f80784d862fa94a2082eb2  simple-mail-3.1.0.tar.gz
 
 # Hash for license file
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 82bea45f21..7063e9dd0f 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIMPLE_MAIL_VERSION = 3.0.0
+SIMPLE_MAIL_VERSION = 3.1.0
 SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
