Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA46606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=km3ETMZ/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Fxec1+lM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA0B4089B;
	Tue, 10 Nov 2026 17:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v96zOPBlyzlY; Tue, 10 Nov 2026 17:15:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5726B4088D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794330943;
	b=VxuGSG11gcaGAak1MfZQXp0mGy/BbYYuDGO6y7v2FEKFtq+2kPyB8eXCky/qYy/wXywZ
	 Nqk3S93QhwlBE12XRu9nAFQriTobktN/2RSI4GwKYhwYBI7/ndgufr8Km8TExV9ZJ2/6v
	 PBpllUK9TervEKaCIQYIC/jFYzkxpy+TgaXAIIw9X5hFT+TbM8xbmoiPJLe72DCi1w+xR
	 mXHd1YoL35byPo1KbN+6/PLzzAy1VZMNsviAIc8b7F1sBBliEGJekbiWq6G7EJRVbm1HG
	 4YIK6+BkZFtusbkfRQnc5Osh5/8Sg9DjpU5rwm4oc9tVAMuVCDxj4dKSR+30Ipl/rpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794330943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=syBAGnk6uV5PkmdMWJWJupGdYAPqDlCFoj7wrO2F6Gs=;
	b=fxwNXE17yykiMdH70lNJT7ERRM0qInHiwLOAIeyrGz2Ew65PtpYCkEoisMy3wPZ8PcqJ
	 JuaP2gZ90qzBUYOAfpNCzXGlDNCrVE390g97fWiwp8hGkD+4XfdA+IZynJDEOH76E6KJr
	 3WsmLMzUbrFivHnVrjRtXNESCJM/uAi7+iZMJzMEs6ObxyrJJrCxr8/v6fx5cUfsCfuYV
	 fNFDHKLewkspbwbengfGNQ/qGG8d6Qt0GloehwcP3if8l3lDeCy4DJKcoFabhSLkGKEFi
	 NSMvlumziqqkYI4iS17X6hkOCV6NfY8g/p9AIq1IBbIuLlEmsHn881djJhR9xw7piGA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794330943;
	bh=syBAGnk6uV5PkmdMWJWJupGdYAPqDlCFoj7wrO2F6Gs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=km3ETMZ/o8q/HNLhp6pg+QxO1qO5SIi7QH6DOlLI3r5pmk3AKpCMENWkZBWb4lg+O
	 Ej4t2XR+FwHzaJlXOKbd7CGFauE4qVtDyquXKh5KVLMhZm8cbHQ/03wT3Pus7hWg3p
	 idJD5Su+3B49cdn0XfomqqSAWL58cj5RRwOgYeYEuG5I5lUS1a60zmxCi9lGNHyZUk
	 TshPkuWI7eENqYUQ4o4a8pjqps39MlpoPOGpp3iAXeQcHuGKl3MJ6dDuAw1ZOWKpJ2
	 rIAMM3OWxEZYi8RHYGr41ugc2KvfXGtHReDZq4eQ3hpaWYLLHhwyKAzOHihIEroiY+
	 RHYZ8RBkNmr9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5726B4088D;
	Tue, 10 Nov 2026 17:15:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 666CF1A6
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A29400C7
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-RhaIrEUAUu for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:15:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0FA3240048
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Fxec1+lM
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FA3240048
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:15:39 +0000 (UTC)
Received: from localhost.localdomain ([79.7.167.199])
 by Aruba SMTP with ESMTPSA
 id QpRYxigQq6VShQpRZxf1Fc; Tue, 10 Nov 2026 18:15:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794330937; bh=EkSJpjLi7RC2jIw/tJkxKqldI3Z4Rx6rV5/QnROCOfA=;
 h=From:To:Subject:Date:MIME-Version;
 b=Fxec1+lM4BkLrQaSiCJf1IfG4QHUPSjseAStjmrN/VSUU1gabw40zQuS5RvUSBOtZ
 EQsAZjP2XLMxDwJ473g1FmtkrSGyyfqdXFVIwIPDuip1zGJIO8guS2bCXRNcvqSGOP
 LPOSJXvqrvxD626uo2DwMJjysEX7/F1JDdRTdYWZtRPE8Wwy4VePOpytMBM2oD+eJ4
 fz/LlWovqv3spFm2S4NPrgxaqCBVa6DtN0Fqb7b8dgr9o6EvhitaJClrGT3aBPwgUD
 5Kxld76ju1uGpyR2oHVyTDhjesVm/1RHKW/UxjDDgl+xM8fOsT2OcPvdKj8nlYqG2v
 Kjm+vpiW/bfHw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 10 Nov 2026 18:15:35 +0100
Message-ID: <20261110171536.877183-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGBchwpCY2hTCpNjZ3gaPCHyPjLbeSC8uXGD9kuDwOptKYNWawhof1LSRVpCAO0JIgRDAB/LOwydfv7+V3X3EkS1LVjYrjzoF/WagDf44mPFQN6ksI+h
 yjxl9y3r6hcGXD5Rd2p5tbbCJ8UI4Ii+T/LO8aDwECbSnZqMqvIGiOliJnAvjB2I8VlPTcbH3ceCmsB+sMtJqXEXkXBye5AmnZzoPNDPE9W9s3Q5RTM90VSN
 k5lAwzs89McmR3SWQk8J9xEkREZh0Bw1F6wb3w6x2wtKfVMWjqKvxLWae1CLnK/ea8K54bSS6rS6dCprqCEn9w==
Subject: [Buildroot] [PATCH v2] package/pulseaudio: fix build failure with
 64-bit time_t
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Let's disable OSS support that causes build failure in subject.

Fixes:
https://autobuild.buildroot.net/results/f45/f452fdf42509d56555b31b148edbc2bde2624af3/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* changed approach by disabling OSS subsystem as suggested by Thomas Petazzoni
---
 package/pulseaudio/pulseaudio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 254e05348d..6817806b49 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -17,7 +17,8 @@ PULSEAUDIO_CONF_OPTS = \
 	-Dlegacy-database-entry-format=false \
 	-Dman=false \
 	-Drunning-from-build-tree=false \
-	-Dtests=false
+	-Dtests=false \
+	-Doss-output=disabled
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile libglib2 \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
