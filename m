Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30597C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 20:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B0D60AB9;
	Fri, 21 Aug 2026 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQI6RPTNZAjF; Fri, 21 Aug 2026 20:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787344315;
	bh=yabzY17TxyZYHh1tiUavry9BjbjZ+wHrmLNowj0iD7k=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=a/phTxtW9tXlvZhwfBywPYLii+R+C33+v5rPj27eBOF5pmGsnMtuWyDopzQwMFjVP
	 ZKpWVtFhoAwndMpExwLP3g3C4knWKlKCOiZjsMS1DpsrYrAn4Mnhnup7X0DeNFetsV
	 mvbBgEsJ+dNF2V8nIoKNuhiwU5RuxalI5FqG6xPgr2g/xYVofp+5H8sGlzehBuoZ6p
	 eTWlOJemM25P9iCIQgJDH0/Rf4mp9hwZTvwLZFykb4HfRpNOkX0fBfSSWgZDXhl+Ab
	 e+qkSXBqxTrxbc/A0nkBTeubDbFqDHcZrnxZehqeCGZg2nv4xKU60Ih/3TevMFjInC
	 8NClvmobPuIWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AC060ABE;
	Fri, 21 Aug 2026 20:31:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5DC4B8
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55A2181311
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaY-whLxfoLb for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 20:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6329B8124F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:31:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AF7DE1A178F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:31:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66F60604AA
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5235211C77615; 
 Fri, 21 Aug 2026 22:31:44 +0200 (CEST)
Date: Fri, 21 Aug 2026 22:30:37 +0200
MIME-Version: 1.0
Message-Id: <20260821-doc-typo-v1-1-70429bfa1a19@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyND3ZT8ZN2SyoJ8XeM0yyRzS5M0kzQLYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQCvMM2CbAAAAA==
X-Change-ID: 20260821-doc-typo-3f9b794f4f83
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] docs/manual: fix typo
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix significant -> significantly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 310fe8058511..a0002ce18873 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -664,7 +664,7 @@ Creating a basic test case involves:
   advantage of using +infra.basetest.BASIC_TOOLCHAIN_CONFIG+ is that a
   matching Linux kernel image is provided, which allows to boot the
   resulting image in Qemu without having to build a Linux kernel image
-  as part of the test case, therefore significant decreasing the build
+  as part of the test case, therefore significantly decreasing the build
   time required for the test case.
 
 * Implementing a +def test_run(self):+ function to implement the

---
base-commit: 4788039a894ed8a8041a5719c6acf1c2b3faa8d1
change-id: 20260821-doc-typo-3f9b794f4f83

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
