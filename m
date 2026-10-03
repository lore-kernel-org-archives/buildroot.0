Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976D1CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5483C813AE;
	Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPXL3RIPuPGf; Sat,  3 Oct 2026 01:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B60581398
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991232;
	b=H/Ln/Geh85f5AqAb0X7EpzuSnU8w/9lGdDvoGllGjDPrOi8P7VNo4GPjPuRf984RbZqC
	 Q1i8PG3kn38YZWW8SQOaal7h8G90JhcWzqm7EeiUCitrdMsAS5/h8LJ0jevkTQ6o0WLXW
	 e7uazshHbjdEaakrqXZmc3pKSnomhnYZgTv3yYKmdu/TO7CsUNyNKgvcNi846WLus6hWZ
	 xHPwEB/QQWBss95SXU+Puf+sIL6CVTSfynAfGS8uyVCkUNKljiHueAx1I87TCc2V6TC2I
	 yEnfNpM0Gp8oPTui8qVPUPMdOJHZdGFSSvEr8JyXxGlAY2RSiKF0Nx9jmm2iBMSu+nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PwQS9ioOADAVwke0Xvv17MFY5ZDLWR6f0iCRb2y6w6c=;
	b=tFivVkT5THKiq+uNc6UidfP8D/hDeDQir2lejrmJm1Ym7hhcwq3XYXTdS6r1MKglcJoP
	 czCF7qpq/HJ4m7HYOYHwYhY1cLV9FVFcTq9ekBcU/l0Cx4ppN7RvXgFeRfhKwrYOrPB1I
	 3I9UOB8cgTsmIpp7bfkpYOP7/33B0B9peyAvPhH9zNCx+L1VuJIXVhSUX78/tEhaloDJS
	 OD9QpdjOv4f9nVoxvmjA6ezWfcvvnm3S+X46LC4MjDrhssUQhYLIJs50Pk33xjwERpKGk
	 1OuKGr5/iglf61kX0NqPaeFqGUP5XvCxbhhrT7WGbeDwbaccs20IDV/P32JLA/JzA6w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991232;
	bh=PwQS9ioOADAVwke0Xvv17MFY5ZDLWR6f0iCRb2y6w6c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YcLu5lr6EjBtl32ylwVmhwWeV1lWU5iObJrP0vXX39p19FGcnjzsLKmxXIl3BEBi8
	 5JZR808KNtFnE1ai6ewSyjiKpOFd1s7edU3wd2Xb0H64cWnEt5r16/2noWURKDP46s
	 i/YaVkrIqytnrXicx6a7FhMkvb/Fr/S0PeCuZh9gl33J7PxQBK54GvgOgQ+vIH02KJ
	 IHSmrHlKwROYyd5nvtpRJpc9ursYEfHA1pbG/F6FBht1ni9syE4K1ce56pvTqdNrDz
	 6egOcbASzLH+v1cx242f42luQTR89CoulP1IUpyvdvwl8cJZqF0cXzKXABx95J3Ocx
	 fYWcSY0jLhjdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B60581398;
	Sat,  3 Oct 2026 01:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77F511D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A08B400C5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0TxG3qSlMXc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 918CD40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991229;
 b=NxX/E2Ji80y2KgXGZoy310j3g8OaTyDjvulC8RGKjR+erNAOW1yeYyLsjRMuQ38Ojq8e
 Xnotv2bgWDaAQ5rSozMXZvOIw+lPmMyxGgdMai4bd4i7c+e+qeJpN/EO8VNndsvbfOxeZ
 7sa0vg5e+g5SzeeSccbvpXFZuerJj0++sCvb0P4OUi3zayfVFPk6pKSRhkWi2+escAIaU
 5AFk55WKadrrIS02lkYfVJSRLUQDPEEmQKU29+aq87j/5Ek2YZLoukL7zBEnTNEskObX8
 nZq+rQ1gQ4iraeJTZq+xach1SDUO0/wiuS3TXB7n6fK5u0kL9AiZTHMRCdv/QjJpLWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991229;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+VQJUPg9t2aOrzGG/Tcp2fjrp1zDjZlYx5NgdPhsZ9E=;
 b=oFga5zIV52ajnQv+++O10yq1Q2ETUR85ceAzk6aUTs953y3yeHtMuonPEl1nvWLXEf4S
 8IOJP+6vnJ9k9LhN9RkRJz8tHteJehTAy8D6XitAUdU1amOrJoIzURsxggQ/IldZQ4XvW
 CS/zqc2EhLpHAb0cYdU/vkSPbM71DBnQsNb0IF/HaU2Z9SW549s8T0LCTzNE8XN+TaSoN
 XyzOfaG5zG+bJGEfHBCVsc0NpeSD1iahGwU9vPJvXSUQCqgLb4JXVrJ37R4GHVm6Kqrt3
 9D/JmKtUfCGPZ826RXJJ8188D5zsLHWzMqtVcPzqmdLfT2qamOtqv/BEgqmxfgpvjyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eLAeTtnQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eLAeTtnQ
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 918CD40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:49 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6dfc4510440so190635eaf.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991228; x=1791596028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+VQJUPg9t2aOrzGG/Tcp2fjrp1zDjZlYx5NgdPhsZ9E=;
 b=eLAeTtnQ2BjbjDS6d9H7UUPgQXYm+AEKMhWl4SIq+vd3vK3EdSaBgwO+UFSEH3LJ9O
 yP6PO0C0wo/Yli80y+U/kp+zoZ7JXpRx5DYcISqoQ/f3DvJWg2ZzkRRhzk8un3nRYZ+M
 RJv9LL9OMlbf7/DTjP6XXBScf14auUFIr3ZwXER4OuZuMC6J3imjg2/hjcYKXplvku/E
 2sJq6JH4PO1dEbOupjnoRbBg3UGh4Z0pSy0/BHsLftZ8t6qXlsUs8DOfuwINKO50Piol
 UKiC9XEwFeh1DBmG3nFDSLJ3qSOdPfGXZrsWsSBkw5Od/PFpsCF+dwjl902t7x/4Oy7S
 NBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991228; x=1791596028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+VQJUPg9t2aOrzGG/Tcp2fjrp1zDjZlYx5NgdPhsZ9E=;
 b=laOhIKKZJHyYcQ5obq4gJQdEq2BH4bK4H3DyK/aMnwLgDTTo2ij9YZ6wK8gC+VfOrY
 0/COVs9BZ9EnDd2g9pQGKTm9pZSjkRMLd6qm7mx7DxGiqGzzxkaLXC5WdQqj5Q1KVM5/
 T9dIKcH4Plkxld/rRMAQZ9IeqdgcwOvBmYSSBRfwKk+/M6zyl4/IBXqpp8hC2NxPKOBU
 PjSLCepE+xuU2qLukbH2Ib5tDLMQKsVAlu0VXQpxmuW5ImHp16r5N5X4l77FA/R5RNZj
 eg6GXEuRNKjrQtGuTZMHjQyvB0pv60DhWZ+ZxpxwD9NhXYn+CDsTTXEgUELwVNZKsMyu
 0Iaw==
X-Gm-Message-State: AFuF++nrJj/YYWBLcUzXzTsbhUV7YTbWsTHd0ZF09pYF4oIqMsRdLmfu
 y77BkTsuATEAUg2bY6G/heiBIOawhAcE0lQ4/Ytamnm9D62meujZx3d/1VuEEA==
X-Gm-Gg: AYBFou3QMvTYs4ufML0MFd6PLnl4ikdMRZs8BuPHgSsfLuOEyAk+Gh7Bx/6hbmcewYX
 Jpr/3uX3/6tk5sGD+8EgD5Xhequ/UpzPNY0RP13q8Qcf6NJ0oWNpGLw1ngeP8ffnbSOhCpNvmXW
 20owlplninJkvPA0RKTuaSckmFsa8tfc0ttfDcKcVBPVqn9H3U8N7R+nvf+sDAAWwgyjrkybKpi
 B0ka975/6J6mQucqKtnJB9WFIJAvLVrXa2xOYPX1yBh3uPDdD0rcMachdAmDenT/Mdm5Q5ewU5F
 GvD0ue/wfHZDaOnjRtZnaeNpzIzyfa2POoPLvwENc8/4N3bqQ1O25Pn52EyErfcGojB40Ad9q+6
 pdnukKCnMn/FXZS4BOof2Rx2x7eAO5DqPaUhv9QCVoe/S6BTAxRq0VMaQOU2SkUZ8SQD6lTv3DH
 YEgQgInkF8o1Z0TIQxyIuXV4ikQNZrMcpYLBqIUljSq0SSbX3fQN6jDsIsC3ylTZzOaN7eJf0SV
 ki7FWso0f4b7koms05lgNounlgHi+cgerwBQbdYFmDFIkOD3CnOX5Ir+qRuzGHujNFy2bh6BmQA
 mPAW7zd+c7SNnrVBsnsiHqmDxnlCBbY1DGOJS0S017U4/uDA9oeqycRs7SkvKaiVY9d59zwoCKB
 H5PFNHHbRnXVKlntvPp01EZ+yb8CQORbAYLbSF5LKCXqvUoks1wkd
X-Received: by 2002:a4a:e910:0:b0:6d4:1423:721f with SMTP id
 006d021491bc7-6ddbd47d33bmr5767978eaf.64.1790991228277; 
 Fri, 02 Oct 2026 18:33:48 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:25 -0600
Message-ID: <20261003013304.400979-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.71.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index f1d47352c2..322dd2cefa 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  05b3bf19415d54f831e52d83e4371ce9  sentry_sdk-2.58.0.tar.gz
-sha256  c1144d947352d54e5b7daa63596d9f848adf684989c06c4f5a659f0c85a18f6f  sentry_sdk-2.58.0.tar.gz
+md5  079f53404c6f8059a7ae6e39842548d0  sentry_sdk-2.71.0.tar.gz
+sha256  7beb27a22f06396f3a05510c3da6ea10e1c79e02e859993c27ce4ff074e296d6  sentry_sdk-2.71.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 585a1c2cda..645b2665a0 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.58.0
+PYTHON_SENTRY_SDK_VERSION = 2.71.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/b3/fb8291170d0e844173164709fc0fa0c221ed75a5da740c8746f2a83b4eb1
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/67/93/9ef70bfb7346c778caf09b7cd10c17c33f601f2d17019fa1aedcda738b5f
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
