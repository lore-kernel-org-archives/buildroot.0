Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA9606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jzytkWiL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=cfdkp+Mm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05E0E405B1;
	Mon, 23 Nov 2026 17:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJimgCmST-WF; Mon, 23 Nov 2026 17:10:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 16A58405CB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795453813;
	b=ohDZXkuLpGJF4797lFg4YLzOVeGm1iA1OVLf7gqyptfaCWn1NeYLZfRzDcBJlgF2/wLm
	 /HHee4N6BXCabo+zScJwqqcEWxyzuNQ1yquKHQjAqt4FSt1wUm6KLjoyJ1pJOaF1uhjj5
	 +SUQPARvcnXzHUy+4EeKNe9+yyDgvo3UMBCjTCZ9gYG+RY4EPlbAIUpJyq4CBgpL6c8JG
	 DasK1XF9VvtzWgb4soQtkxnc24pZ+US7L2wEK+Ij6FNYpQIT14FnpTIQb6LPnjoatIOUO
	 XjISfHlTZox+LEI+dXbsZzk1SsaQ/4lA/M/suhk/ievmOX57OpuXPCRhGwWZQum8H2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795453813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gwrik11MIpUdoeo7kHQ2U91Prw2xVOcBbDUsaEb2fBg=;
	b=UkZ6g2ALxeDCgb9hPQqAZ8IFWC5Mepsjll30Zc8nJqmYUMUdIGHWy7EuBIQZjxPetW7O
	 ru+BWHE3RNMECbW0VbU1Rsfd2adKH6wIQWgNxRZ4QAv9zO3W7YrxrF9y2DIv2gc1GSBYS
	 oDz6lskPVBw64NdlCB2Vqg0s6MXegGAj/2TAAFfOrnL4oGqekwYhMsxUnXbidHht0T5Wl
	 0JryN/3gFvCcgiQnobnyr+pw9VVzIjOm2lx3r7Yi3ajQCm2aMh/d0DFp84ymX1v00JXwI
	 SudtgIpva8+WrmM1myWL65H85KFvamuFOmWRyxOzHlZ4sZmZMW+5L+DGOhfdCWj/1Mw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=cfdkp+Mm;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795453813;
	bh=gwrik11MIpUdoeo7kHQ2U91Prw2xVOcBbDUsaEb2fBg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jzytkWiLptyeAbWfnTSpIsMLci3kM2guyvgZ+P5nb/BabITd5w2v5aHEqbmOZqRvv
	 AM7cllvtk4ONV6yFkYly5sj/yMS+HpCYMk1as+mIcptYbxBRPAh3jG3BXDa6sdpd7Y
	 Vl7FnrrWNCXvw6A1w6n8MGolX4h+6VNQoswy4m5kOjtRdW+5H+SQ8fjddoDU9MX7ZG
	 HcCVvRsOnnjvu2fuiXkYYfyeTwpZ3A4SERGr0DhaC1Re1f34n79SP/v+VawojzZFAT
	 gd5CC8pMhuUX7mpK8lWg9fH6V5J5BI1IPyO/PMhXUS1AMbw7zBXbNFmO69/KWh0hpH
	 QR7TffD4qp5aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A58405CB;
	Mon, 23 Nov 2026 17:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6669E759
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58485405AE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNIHr_VugB5B for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:10:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E6D1A405B1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cfdkp+Mm
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6D1A405B1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:10:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso43528945e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795453807; x=1796058607;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uNukO4TTdViyaH1W7ihd3dRwU/A17flhqzfHrV96IXc=;
 b=cfdkp+MmPlN9+QmUVzXxzWWgwNxmE+fZ8ujdAMqUiF3fPXs3CwT6rWXbLXGKL4ktO0
 w4yUGssCgvTAfQ5/1ePAPqwzw5O73NtJsxupgOMjoLmoPUODXpQQtxzzmZ+5vzP7CM51
 lU/qb1tC1CAvR1CwrM8DOv6DWzLZMyar17eBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795453807; x=1796058607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uNukO4TTdViyaH1W7ihd3dRwU/A17flhqzfHrV96IXc=;
 b=Xl4VVsrQEXT0hryz9nrkCfaqHvPuTUpnu4fO0NplG/nno01IDQEr8czOl5g57qO9RA
 oTGPoTOxcc0SBIfJC56MgtSXb6eRz/NPIv8Fz1EKy84aWMNejf2nLmPvPUJIPv5bnXv2
 s/hP3Mk50/D4iCSjrO5m4SPrG8jz+yOTDEr2fllcH+204ip7yfWGyo/8KiN7arELaqN7
 XvyFT4p9F6elUHvzAoHezaO7VIMVDKd/N9UOAFp38Hz6Mkr6qMzLh9B0a1IqiaLrd5b4
 iJic70z8NeweyyKtJ8ulnM7rgdgELLZH9rPBdjl714OYM2gqudHqN3Ggdz42HRyXIaVG
 DgfA==
X-Gm-Message-State: APuU4Z9ph5KiNiVrxLvF132GSYQrHfAe4lQq+HwhKXyiOB7MU8V4Z+1w
 VJ9kGS+tImT/A6iGDnuHa/Do8xvE9Vv9MJJ0aH96F3vj0lxo8lJ+jDyeTgFOxKbRzQQ3ZFRTGlz
 knroB
X-Gm-Gg: AZFdTZf75b1ittKW4YBHxEG9sIr1JHISF87OP4Id7pO16D280DctTmp7Ycdj+V6wcrK
 eM0hvC77RylyvEJS0dxLfx4o74VITNh1BPosP3NHSPPwRJIJb4v1OZL8gfAuE3DGJGp5EU9dldF
 a8Zx2+D/NmsCAYAaNqst0s+Jy1afjhK80OZEnrak8ywyJ8cHveurFVq1dGsTApZ3M/HZ6P+6vKb
 HUU5CuoCoWJBZSPf1xG3FleTjrQKnpNcsX2sUW4NMmO5fhTsEg2XHbQXCqeSsX/NNr1zmPA+lWx
 tpV0+4v4UHmTcfNavs2WhF3+r4YlVsz2GzwJy7hewUfqIqV0rtOBsWyj/WiToI1ZR+r8/vqI7/0
 6nPpOgaUXJZplIl15dr0obXIPxyZfMpDsooMsXUOUMD1dyKBsbnuxcVeRv27tNX6LCNgyxS4o+R
 z1rZm+fk6qK4XAaxHNmn4YhAvHBhpnnAMc811cMEMRhqTbF5Sp1rtirmK1YSZlOFEh41zzn1Yd2
 nenU521CJNGazdNmYJP2ikSpHycnnSRnuHKvV3rtuQb3z0Oo4lUyIK0bEft3e+6NQoIO5Zg+Af6
 JKOhXWhCkxNXnmRLDjnzDCVT7eRAEEMqwYkA32Z511z6zX+ju79Q3l/t6gLp/7Ivf8jvKXvFCzb
 ojYE2O+g4T1tn8P9KKswQ6X+rv8fEb7CeclDKJ05sqw3xt9pc7z0L0vFOjM53DUgy5DDnye8AhL
 WNWYnPBSkZ4G8sBe2Tp/OAFw+SYc9CoH9POtq/D6Pu8I2QgLLM
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id
 5b1f17b1804b1-4bb887fe7bdmr248548295e9.6.1795453806903; 
 Mon, 23 Nov 2026 09:10:06 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm539380075e9.13.2026.11.23.09.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 09:10:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 23 Nov 2026 18:09:54 +0100
Message-ID: <20261123170954.1060745-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.8.0
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index fa420ae3b264..0daea1f6a891 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  63ee9351b54994dff7b4e2094a86ace48cfb41354cb65893a9dab7c8a16382c4  armadillo-15.6.2.tar.xz
+sha256  84cba6695fa523a7bf9d46bd20d000c4d4f108fbdc15ba45c294d507f5def880  armadillo-15.8.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index fdc6cc39d745..fb787e33ca14 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.6.2
+ARMADILLO_VERSION = 15.8.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
