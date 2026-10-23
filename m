Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E86606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UjeeTa8v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Opf2aaZT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3ABE81655;
	Fri, 23 Oct 2026 18:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j2FLQagXcTK; Fri, 23 Oct 2026 18:18:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA9C9811BF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779535;
	b=aOBUTYlXEEavhyEhQ36U59bFgmd9z1y8VbHzPDlCgV4VFwyWzDkzQHBM95ewFEsqS8cY
	 +uiS6RtI94BVAaMVZr/jaEDU88Q9EPUaS80Q9AE5Ptu0Bh+EQjB6zy8EhiliAxtvlV57b
	 Wv7aQZQnhaXLCEYzCfGdLFuUg3snx8zMvXB4THKS4WimCoa6zs/ZYYVnoB+dJ87wzkVNv
	 UV67kiZEDnPOp2OO9fCHPCyWX5ax8RdF9nUeXF83FwhiSjrNieeX3cb11/psvSRGsASBC
	 91x+lGHBhRu1ezDfq4e/bMI6IxSXI+bMSCXjlmPm1JVxs2VLFv++sxBxcnhURRpHmCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pKOmBXeu8h/e6w0cca6SLwl+hH/tx34biwIAm1dNYVU=;
	b=X4Z80+3SgOuWKtLAtsayMh/FWPCpUjbaZLkeIgNiXPrGf5Kja/E4PrgmsCgBV1/y+vwy
	 BbxCpt9r4fvpILgXcDx/7B9z1ANn3Rn0M9BR5vnR4Qn59Z1fEoAwsjc4pn7qRV3HZg454
	 IBbxiF56CgITKDjpQoq9LfGpbol+IZd+AnK2NBNLm2MCwn+THYx3JY/eMA8NataUuIYJ6
	 8wEf36wMrtVBrhrOp+UaGPzn38PKRkESQb4PpJT+SgHXn5iiodPDn7tnIv4gBcsZOxDrG
	 Hbwg1KskbPuo7Yavzik+PhJvxAc+uYUrx6fnWbNQllk7OHOPi3QotITJ6B4P9aapVVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779535;
	bh=pKOmBXeu8h/e6w0cca6SLwl+hH/tx34biwIAm1dNYVU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UjeeTa8vir254Ly5YCx4Io+PftBdNUrvWP1uqGfcsUGWzsrb79IyjaRhcIOAcLVp9
	 9+/LzjtSYUn0jJp7uF3+buGSOCoLqDAbY7xRS9/57wgImf28rMGXGBcf6+cjzXP6MB
	 uvhtGQ2jdvmG/lprT7cZC2UrdTe/kj9v6sXu4yZI0T3I2KnrFx8mFnVIHZ/xcuxfKR
	 onQ3DxFlW51IKGIkLpSUFZWzd+9F+hK5+pgg5PzFBh+EasSlVl+U8Jk3BNsxsUaDR4
	 yPSOvV8bEkLgk3w1Npu/Dbzu2ixrh0deLndArJesyY5OgCuGD/lnu6dYlz13AkGseb
	 QRscKlr28JsoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9C9811BF;
	Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A3E12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3733460628
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_yhYwvfcSeo for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 49AA36067B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779526;
 b=nwMp+kxKn4a7gCNWO5MNdCRgmEW8li4UmWzuT0McLbtz+Ejj4eVo4FLW6POVObDnMAfq
 ViJiRReVH+TQZ03iv/EjxT9OHDr/ZolLYCiZzRzjzrf9nEHjwnCIbzc7eRWO633LAytbc
 /fGBiJ+JU1Exjfb8IDCDJR+bRkGrmPVUbpLUU0iTuHD92G7YY8gsn77nGuOBjeJssMYzT
 cwNdorJ7LggotxqvJ8Bbuwgj9WKr36PUIXnoqeJLVtZsag64hslMrdLaJxI8bn5WBbqXL
 lrJ4tQet+b96syZfdcHbPEcNoy2G6m7bSQNGhhS7kA9+BuBT3kQIa3r2xNWx8Rbz9IA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779526;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qUm48y1fkbnTsX8t4VpBqmP1p/RxgGv6nvndgy9lljw=;
 b=qswpEJj7XOz1h1NO4p47pRY4J49aZ3wTOguynZ71F2yG3uCK81Acr5oTWZ5UYyEuMqBg
 2EFDHVDIJgtuiTeu1Wmx9dvKn0qXrF4RHEqrqD6RKJ3+4+VTonJqbg4vI1z6XvDPZF5z3
 AOn42/ezYmFG80rd/xMD02j9KBgnnfoZou8DB3Mo+eww/LL7r+bltOusbtvnG5TZOSpTO
 zl4tRZ4RcdRpJOkcgzu0qCaPKFfRFWcVgfIT8hG1Iq5JvxLGvVayJgGQEH9/4O5apYMIN
 gn/dVWJa2Equjrhw1jlu6WU52FLpLLoIsJxdcj27z4pbYrd6ruvGfR/D3C+mJppQO2A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Opf2aaZT; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Opf2aaZT
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49AA36067B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:45 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6dd7070699eso842724eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779525; x=1793384325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qUm48y1fkbnTsX8t4VpBqmP1p/RxgGv6nvndgy9lljw=;
 b=Opf2aaZTcDSCdsozUWt5N8/hhbgAwkmdVFdUI9q/27tA8BejSlIVlMuVDwitYPrp+z
 Gha5FXhEC9nZi+Cn20gQni3tWTadooQBdgY+py2B5J7vuu0xmef1uijlccRUqc5ycoB0
 5VN3Ds0fW/1IiSI+j3mNu2PNZLi+wLY96rO6lY5FoT34MhfdW+NeCcWWHOtB4Fr8+B68
 hwNKHVphAR9FmLhAOhhXq/eXq8kb4IwmgRwZOCpxuviCD44g0IvZBiASUMZoFJLXg+Qr
 x4RxCyNeMHy4joHNrp30T5iFzqn+jbcUaLgt7Cxw/I5JWH3bj7BBzdHCs5u7hwO/wckI
 9+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779525; x=1793384325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qUm48y1fkbnTsX8t4VpBqmP1p/RxgGv6nvndgy9lljw=;
 b=Slb2BUJvgep1PrZvMdHe+hc6DN5L1lrQUiwLTGi9udy/tL4fCultFWl12tQCSfO2Sv
 c6gCWBmATgMO4VKXLzXi9rq9tXfzHmoo/x3HP6wYe+xTk4WrbiDc32v0M+mDAFUkJVin
 7S1P5paokofHfdQ4O6KlddIiPD81ywfe7mAxkbKJkxYti4TWHkXrqG3c9ubDecU5boQR
 kUdabN2FrZBqdkRAI9TPaSfSQFldhbZSjSqQG1PzGLVSvR8fHGPbEdl44H86U9ueo+St
 IgSmpOKu+dIrq7qbBTXVzI+2lzd1IUIWXpKJthfmDaxCjBVUtlz+m8C4ez9S8b83EWWD
 UifQ==
X-Gm-Message-State: AFq9FYLUksM+j48q40uX9g9UPTOaZQZKe+VwfhKMxF6D97blP2kbKAEh
 ugoJXln7xOTdrZ+rqXeVui2zpvpGYSl8+C6GuJNYVVQq44onXrWAu16lndHTcg==
X-Gm-Gg: AYBFou1B5VMn9U8OlFvWff86RoATCXaJ/aJZfnxFU/E75FeflKht7yQBDvrPkdkvt4x
 QJGMQ7DDzEGzHre/vGXfBSdAMxv5KSOHZta0PtNHFrYzG8vUddy3/Gs8zvAwJ3MTdd6y7kkHPoH
 z0205MmDyohxSD8r4sVQrqPAf4wENamWiCtgKEYWgxWpFw/U2n5kLXVQY+ASHg6E7kCJWCbbLej
 X5XmhRWz0wY45ySwu7IP/JRlY2wrMtDG97G6AYaVgjvtpXsAjASqAUlE0zBPOSc+kjHtu9bWxcE
 92MuKvnd5MQxtPHZEOZiTHTL1s0KzxokApMDMJWeX99Klbv1GKr7OkEclWr/hA9LDLDO0Mv4SOI
 JXWF4Mu/ytaO4EEteRGcOrFq/V2sDdoJaXd5z0RtDCMxQKiLw2Bdf1ixEAqo957nQ784HBeYwwS
 w5NPLcKtSZQqgQxgwH4sc1p75PvFvrrYUrhmPITT6D3as0U5mj7yvxLJf3FV0am/5NOkqFy1blE
 WehFQGGe6nbFmfu+DLUBy4KEYSHu3z3x4QAFEzAFmc2NeGOfLcNkNAb9D6MxplohesiaEcW5jA5
 XWi92oRipMIURRh8SKmTXzWkZynI/AjBm0+9XNcKMpm2Aj1gOZoB4v2G/Cny574LphTKnPNHYFl
 kHg+EVZzi91osny07wkggPUafIJLgIA6u/nnCDj/duvVNUp7OIUl+AnnTN7HXaHHTErv9md45Ax
 w5FG4QzqXSftz5056JE16NitQ=
X-Received: by 2002:a05:6820:1354:b0:709:244b:b4f8 with SMTP id
 006d021491bc7-70b88b5e714mr2119138eaf.63.1792779524770; 
 Fri, 23 Oct 2026 11:18:44 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:33 -0600
Message-ID: <20261023181818.920329-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycparser: bump to version 3.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycparser/python-pycparser.hash | 4 ++--
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 680a4e4581..4064d46534 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  57e8f58d1a6aaf5e7f829f5e3874258e  pycparser-3.11.tar.gz
-sha256  d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc  pycparser-3.11.tar.gz
+md5  cc06f1510f0304ad53f6b1c70b847ea3  pycparser-3.12.tar.gz
+sha256  f03387877eab82ce01bbdfd0ba7252ee55a90b1c708d5129e2ce915475cf1db6  pycparser-3.12.tar.gz
 # Locally computed sha256 checksums
 sha256  0a9e78156ae8b96caf1b4f11ac2df424b83de29736f9e757630548a6272fdf90  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 973a063e8a..6eae6a65ed 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 3.11
+PYTHON_PYCPARSER_VERSION = 3.12
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/da/a8/c5fdbeee588bb8ada9458774f43adf1bdd30bd59157055142183e769a024
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/cb/27/eeb9f307bf07060f3d9f9aa0fb8c15b01bdfded0a941e4b2719c7f94cacd
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
