Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE40BD2AB1F
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 11:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 875A060869;
	Tue, 29 Oct 2024 11:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQYSKIrXUiiE; Tue, 29 Oct 2024 11:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C70160851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C70160851;
	Tue, 29 Oct 2024 11:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79005112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6717B4064B
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfH45pBRaSu6 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 11:30:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.110;
 helo=cvsmtppost22.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5EF84064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5EF84064C
Received: from cvsmtppost22.nm.naver.com (cvsmtppost22.nm.naver.com
 [114.111.35.110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5EF84064C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:30:57 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo030.nm ([10.112.20.49])
 by cvsmtppost22.nm.naver.com with ESMTP id ChuivQirTPawd26aGwdP0Q
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:30:55 -0000
X-Session-ID: J9WCe1OHTf+VcPynXuJWKw
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: ZqnrKxgqFqJZ+HmdFxgl+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp001.nm.naver.com with ESMTP id J9WCe1OHTf+VcPynXuJWKw
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Oct 2024 11:30:54 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 29 Oct 2024 20:30:51 +0900
Message-ID: <20241029113052.1243078-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730201455; bh=bCCDIzdV18Q/T49d0vc9PG+yTPy3+u+cv0RFwy6157g=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=ugsh/89oXzMrFEr4eWrfCM60SOOmjuNCVMdQMtjpfUKB2TBMC1Wi6zEsive+Q3xeA
 svc/HnK0vu/UJzIJhu3gPfnOyoG8PNiAy3hZ3IcD7IXewlE+hdRVyq+10ktasQVFvL
 4rI0cDmt8TYTp68u7QbCGESlTP39EKyKpeKzcg8TvNncSowbpJkRQMEMtRf40euMSU
 YZ58tmKgKkg5h/H0TByNU4Sys9cRiR2KoSAlRae3zkRM962b5lw9cHHO+cADhTkwqG
 H/OvVY9DJ8T2fHhGT+Jf0L7mz54DpCVCvTSPN63M0BcLAy8hr6SzNe1QwuY35neqJb
 eBME1PnUDTY4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=ugsh/89o
Subject: [Buildroot] [PATCH] support/kconfig: fix linux header path
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

Usually you will never have "/usr/src/linux"... For example on my Ubuntu 24 I have "/usr/src/linux-headers-6.8.0-47-generic". My change makes path universal.
---
 support/kconfig/README.buildroot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 76808f85b4..c08970c87e 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -2,7 +2,7 @@ This is a copy of the kconfig code in the kernel (currently 4.17-rc2) tweaked
 to suit Buildroot.
 
 To update:
-	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
+	cp -r /usr/src/linux-headers-$(uname -r)/scripts/kconfig support/kconfig.new
 	cd support/kconfig.new
 	# zconf.lex.c and zconf.tab.c needs to be generated by 'make menuconfig'
 	mv zconf.lex.c zconf.lex.c_shipped
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
