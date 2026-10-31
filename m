Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72BF606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p+DVR4N8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFvsr3uX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF8460779;
	Sat, 31 Oct 2026 17:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm-4eIm3kz4a; Sat, 31 Oct 2026 17:20:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9E79160677
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467236;
	b=YFbhd8PJTEpRT8xepgQAGKIH/JDJtcK3VBiJCcu/bU6cP7G7eyhqqNvXGzaLc0LXsWVg
	 qJmVyF4FgTUF9cBn1Zu/YXtaaIoATtWW2SSLlaYBZsLnijFn8KQJmUkMwTaQ4MoeKzVbW
	 3NeppT0Czzp5NA9u5Ya82tuJ3TggkbGu9mapSwNOY7DcqwCUwIFR4+nAcfsOvRDNRlhSM
	 yrbas+0qfSVVNUdf2NQvEQL0YxL1TVvSoDwD74lLaMMtXBK+XEukZYH3HWq+wLGi5WugS
	 sTsGzXiPJCeW7RnsqqdUcG6tIcRuyoFyOlaPB5dOn54C9YH19/VP/bmuZc7u1AhAtIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=l1xBt/HOl/akemmyem4kYN2lZiWCS0uQKtmS2B7LxyE=;
	b=tXy26cefGkdPWzq1OmRG7OEBeaRnI0bWf2BAowpRugVJ+xhzTz529VW+MdZ8rvow9e7n
	 Dyf4yCSy8F/8/TTUIQnxiAvcJTX/BSHDjGi7YO81CAUum6rw84/xEOm+HAWR2U6sXMXMd
	 7gmXxFey9Upmc3c7BntcNpMxVCDA8QGeoVn/VJMSe0QxioHFLxLG+Nv6KOSSTRsW9B4Kn
	 HVl8k2MjjUyOQSVk6a3ht5lNrlEww/am47oOMgTsUpRhzPMB7gUADQcABwBhvy2BHlNbZ
	 YKZTca4SjLMN29wWckLmOAghvZKraPhF/xPOMwJhZHTIfJmuuYDWNLbhNKrwTFmi8xQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467236;
	bh=l1xBt/HOl/akemmyem4kYN2lZiWCS0uQKtmS2B7LxyE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=p+DVR4N8/LYzUJrDvXzgSVxyWFaHhpgd/lrbhDnBDPc+pwVFjBiX5SXWVCbdaqEpw
	 7FVaGTmqaCRW+c5aF7sZ37K5IjmEM+V9ojxxklLcq2ILJF35yQaZ8cyN/oC9Mp5W7P
	 +pOn24dhTkmGf7F0tsgQoMFLT1P9E7wS8573/+WnZDu14vi2CHJuRQvBh5EG+42At4
	 7vDU+zqY9fSGe7jxVHtyruBjo4Xx5nmWjztUL5TPRmUIWvgmfSeXH0B+6Y5mIzP/Nv
	 NIp6II/xrGqpn7k6/JG23JuaqB4Z4O3ZV2sp4rls2+zag+CZIlNE+gGAzBqui4m9y6
	 RlY2onp5XMjtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E79160677;
	Sat, 31 Oct 2026 17:20:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF9C54E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C61B140269
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0Ca-X9Hc2yL for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DC87440012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467230;
 b=GMA7f8TC6IGB7bFYaUzn7RxUZkvfgx6p3wH1EnhyeEe5SXoMZaGNu2bEKU2+sLqhoDu1
 Qfb26/G92EvzkK0lQf5MEuoR0a869V9uLCt01zhm7GZSFkTyjFfcjxrVeh9gx1aaWC052
 nCt4h7O+FN5hgieQfYA2ndZgMTdBQuObdpFeydNh5LdoMWoGO80kV0ukdZ2OLfMzRc9IK
 nrghv0UZwlJPJLud3dWGnQP8wseUVRx5mjK9KLnrcQ3oOuLq1bYtYOOVMq3iGs1HAsStG
 bmZHRbo97nfv7kGhNAev9YJvUCXJ5IA5/zcpt8/B1c2xHcZxIvrVbUIy2vqBkToko0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467230;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yxEaFTq4zAYOaGQjBs6kg99TjrQXJy0dhGOFN5jdk5E=;
 b=sTPYyTEMBSGHwb6BMWNrWLtqRbUEuUxhh0Demdp0GHHHnhk8WjF4EBZsyO+LBsZSa1Cr
 iz55TMtq4orGAFpWZ1yeCO6fbVjKtTvAD4MbDOTuue+Ci68iRf0OuayFOPLJBj3FaFtAl
 Gs8Uo7ROn284aQHTIkHSwX4B196KL9bEigRVsFxyR4WY2jqM68+/38VawfINahXaOUQ2m
 siLLWZkYTtjqDRlZKenCCw5rJHAT1Dw72Eifbmb5JHIQBdP4Sp1WAyWxQ3Dyd4kxzw7IP
 mFsDqnSuvMSenlKVDjl9Nt2egXCCogH7Qyq0b+Z5bwzF4viqkqdNoaItsyoxAmxcqxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=lFvsr3uX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=lFvsr3uX
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC87440012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:29 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6b8e2d8df4fso1283255eaf.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467228; x=1794072028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yxEaFTq4zAYOaGQjBs6kg99TjrQXJy0dhGOFN5jdk5E=;
 b=lFvsr3uX5D8G6RQzdM4LA7fXLzag8RfnNrVVxSnQ5aceElppQjCxvrEETcZibfznrY
 MID9vWr8WS7gcIe/3BLdK+7jbzIEdpchDqGElnPg+XK9ZiRRWdlVOnXQF4IqNisf+U/b
 YqdRW459hPRBRE5S+NVSoTKxPLKntpLNsxCQ7DeXVQEgDc4KU0CvAZwBw+N3fcztKDnY
 xAjKgR68mi9TXcQydp7N8KKg/r1EnUjEXQ7hNQ0AJukX5LcVK/TftQ6I5VJkI/A2W45o
 hn/4hfgpDOESTMBKGXRAHHgtT8uzcIP0o7VBMVivOMv/kqXC+nsmajZSD+eWvI+zubTm
 OTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467228; x=1794072028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yxEaFTq4zAYOaGQjBs6kg99TjrQXJy0dhGOFN5jdk5E=;
 b=MVYW9igJpqJIk/KyPKesEMwYW3DPwao/PU7feCpLX/+aEcBXcXWp8xsXQ9EhWCPz5j
 j3XEomXQSmWWqk624m+AwpcMCwmlfpE693LA9PMATDvnVJ31mRgYQjXORhIY8bH7F6Sr
 0c5cX6q58K4096T8o1x9y2Asv40SkVQhJ0PP0ljPJe95t7II9g2n0bkNuDiPDc+TFcE+
 AkJc1Ajn60HHb17HEIvLEXU8VRcUQKqIqt325nmwqfuRov2jwEBP582DE/2psvRAkdha
 5zR3SR7YNogqb55/bJva+h39x/34t2d6t37HE9fzn4rfgKJRfjrl3b1fv42LjrV9DClQ
 WHrg==
X-Gm-Message-State: AFq9FYI9LRosVTSKgl14eZQXz+eL0++h1ZLrvgn5EOO3G92o7UkdgTRE
 /7zEmJDmomPPaaxpRa4VNVoxShe12gNeXZtzerMKZZprjX4vKVVER72zelJdEw==
X-Gm-Gg: AYBFou2AWlOyM/rM9nOVpR3m1gPY/3nnzrghXRAB5DFne+N5PIsYUSFqCY1P1CqLTEX
 ye1tGMAYi0QujV0FWKdqitFArkMquwaRUBg/XXFFbTOfoXfr9GbfWtIGBRI6b25/4RrvUElViFV
 36b5PZ3zs+ol1qJjchzr2SSdtkBhOcz86HcET5/YbiyWTXrJfgGTOFusL4xdOP3g3dPvNqfnQjs
 26EvlQ9hkgcTqlF38dCSSwaf2d2QBL2kLqcLVnpp7iWsVIig7BIxqA0OCbmvesDFYTvehSwNiYS
 HbHh7lER8UUvEST1ARU4ntLivnd3VGUw1l4g7uV/nOJ7rUfXJxWeZXuAoVJCkhmpiM9QOdG3yrp
 v89RBEepuhLaNp7qzqXou9WsE5YxWB/zZhHRHDgYZ18aePJJ0lgfk2cXEySbQHA4EMUdLJnVPMH
 x5S/0isP1DW1djTOA0ZD5i9H5mWQdHitBg23azKuQmv56mXNnk54txtOdDhbrOsiGNI8dPfwoEO
 1eiv6DQnmoIqTb63ktB4u9Z+Js1XRflItctnQQyS7ca5EtfpPEsL6b8iIxSk/a9feWbpGxaNhW+
 JjYHJUCfR7xsPzNNEtZ+gb0qWffZ/dVgJj9I2msygszEFw+rKojLHP6O2G1PM4rXAl7Nz54mA+v
 J1qUDDfMPCkom4KcDl8w9I5gGoOjiLbv5jbaqmUjftmGVRGxEYjuPOVSwonk0NWyBl315RXcasN
 dlMt/2dy00Dha0328lIPdaTpjQQFEZo4YfCqGIeSM8vGzav1og+xG+NVFM4kO4evkMV6EnmzYtP
 g==
X-Received: by 2002:a05:6820:c449:20b0:706:50ad:fd7f with SMTP id
 006d021491bc7-714f2b05806mr2446270eaf.87.1793467228234; 
 Sat, 31 Oct 2026 10:20:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:34 -0600
Message-ID: <20261031172019.2683287-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fonttools: bump to version 4.68.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 23167e17d8..5a3d92735a 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  95a2a896db1eb6f319ec454d1d9490fd  fonttools-4.67.0.tar.gz
-sha256  3cb57e6600ca77c0b1729cf8adc23bc0652633a37f18cfa934d9c7bc3de25519  fonttools-4.67.0.tar.gz
+md5  e8b5caba01e81bc70a28f3a64c5943f7  fonttools-4.68.0.tar.gz
+sha256  73294e233070f71e2b3653b6bd8564af676d57f26d075761fb06d1ab2e4a7a5d  fonttools-4.68.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 0c82bbd62b..902b166206 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.67.0
+PYTHON_FONTTOOLS_VERSION = 4.68.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/94/36/102e180f8f5dbaee88b26595b01ca8aa80bf4e62128d9aa94265b3996c96
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/0c/b5/672312ae80ce8b8eb9779c56052a24c8f36652aa7293a1a420553bcf03e5
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
