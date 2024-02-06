Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED443C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CDBB41585;
	Tue,  6 Feb 2024 15:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDBB41585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-u0uzckcymC; Tue,  6 Feb 2024 15:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FEE9415B0;
	Tue,  6 Feb 2024 15:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FEE9415B0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3521BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12F3D41FBD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F3D41FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hncnxNZ5tS78 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:51:49 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6C2441FBA
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C2441FBA
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso3769707f8f.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 07:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707234706; x=1707839506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXvzOwPtVmCzhjA/zGhu8kjSWzPP8u1tdsdWrm+cP08=;
 b=O/xaQ86oSGFjBYja/1PhgQcmHSoqG+5FqdNdbz3npVkNzDAdzA7DHwG9STgp5nGel7
 W89ng96kDjHIMqVF1ejtM7oXpcrmC8oxTQCh10QTFhhDWY1FGIQ3oPTmUlewck457QiZ
 bE/0g11bl5wRxfP1/SPWg/VsUDnxjj/rpBJBU5GN2Ok6PEn+SQUqakKNY9I3APDJ9F9t
 A0EjrxCwuNjCiMxQXXIOwZAhW1vrYLL8yFPCMvXYKkpLuOjnyhXuw+/jiDKT8o13SORY
 W6vcLwBBBfMoXdYmA7OpOUqvbJAjpZCTQfENAUD80yiPENX2mp1fBl+hEZbSR4Sfu0xd
 wLnQ==
X-Gm-Message-State: AOJu0Yy4imec+3HqvzQPahtXiYLo2dI38UX1s5JCZUz+w7yCzhKfIeNk
 dFyiC6vOOL3KsLAL5dUz6+e3Iu5YD8/1IY+N1MAOMWr/FXJBYUqYprhHFpkmvbITpLNwW/CYAvG
 jmqo=
X-Google-Smtp-Source: AGHT+IGoCObA6xB7dE56eIt6Rv0XCCf0cc2d61Eb6QPSmLhZoBLnTkNk+o2Pc2UaFaqfb8FPrUJweg==
X-Received: by 2002:a5d:674e:0:b0:33b:4164:5fbe with SMTP id
 l14-20020a5d674e000000b0033b41645fbemr1679204wrw.20.1707234706356; 
 Tue, 06 Feb 2024 07:51:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWQcOIECW+uhRLUfMBS3bHA6xkaaLmmXZhe5WDiYO4bY3/u4BcuWmKE8S91hLpH6FsB4Q6RdiWLjJUlQmAiDAJtf71v0c8djl4X
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 q29-20020adfab1d000000b0033b46111d7csm2048627wrc.6.2024.02.06.07.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 07:51:46 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 16:51:40 +0100
Message-ID: <20240206155140.2351424-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206155140.2351424-1-romain.naour@smile.fr>
References: <20240206155140.2351424-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707234706; x=1707839506;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXvzOwPtVmCzhjA/zGhu8kjSWzPP8u1tdsdWrm+cP08=;
 b=ZhKlmb2VdQoqEK8/rT+/ZVAWX3M6MpNUVZrLmjaDiXNB7zIb0mOhms5wOYlLD9q7YA
 1tLzg1PkmVN3c+SL3GCYD4Fv3Aqf2gj7LjFmtZeQWzOGSOWpfnc52rec9HCi8zgkyQcZ
 +AJN2h8c1Rr3DA/i1XY//o91w6A0nOqqv19fl0Ln+35V9teQsZh1w+8iwwCYekC/dByf
 NzfQk11sGRmBT5As/RCmt4iCClEcAUvzrm1JnEV6fQA1OsgpDndlghqcIqeN8Rb/Djva
 1u80PXkj4xcPDZUJIVHCA/5Khhr2WO5z6r0woBpi2fJotm63o0n9rvqGVGXobE4nr++e
 ZQpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZhKlmb2V
Subject: [Buildroot] [PATCH 2/2] package/python-bitstring: add missing
 runtime dependency
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-bitstring require python-bitarray and python-zlib at runtime
since 4.0.1 release [1][2].

python-zlib is now needed for the "Experimental support for two 8-bit
float types".

Intended to fixes (fixed locally):
https://gitlab.com/buildroot.org/buildroot/-/jobs/6104227183 (TestPythonPy3Bitstring)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854810 (TestPythonPy3Crossbar)

gitlab-ci reports another issue at build time not reproduced locally:

  *** Error compiling '[...]/TestPythonPy3Bitstring/target/usr/lib/python3.11/site-packages/bitstring/plugin_test.py'...
  Sorry: IndentationError: expected an indented block after function definition on line 6 (plugin_test.py, line 8)

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.1
[2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bitstring/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-bitstring/Config.in b/package/python-bitstring/Config.in
index 93d7682577..82d0bb29c6 100644
--- a/package/python-bitstring/Config.in
+++ b/package/python-bitstring/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_BITSTRING
 	bool "python-bitstring"
+	select BR2_PACKAGE_PYTHON_BITARRAY # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Simple construction, analysis and modification of binary data.
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
