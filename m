Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF5606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y6CBG8Sl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f/Nq36tk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40707607A0;
	Fri, 30 Oct 2026 12:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnS8vHj7TJPM; Fri, 30 Oct 2026 12:03:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6292E606B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361820;
	b=lTXePZbpC5fAsr05pHJHq1HFu+ef9QrB9qK3+JnJmiAPYOeqRi96C1GZGXjkwCcWdu1y
	 tvtV19NsXIHVsXaLf102TKhI3rQ0fnnWJfxgNNovj/RVy1eLX1GbjChhRh2LZXQehSX2z
	 CIpHDKK2E/IThHhcvZQXPIX//qlC/WPTzjxiEHxoLXOoq2jf9nEtUNm1XtO/b8ovXkhgD
	 oeo9+67Q2mFT7e2T0KvVCeqr0Dsuf5vMM7k4HjTxfIS77mk8tPVN7NqugMRaD0ytr4NgO
	 7M5VljWZDtt1M+leMXC4roGWjN4gTl7ko2UhIonJQHiLbR3rtLcbQqurvTMi+okENJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IXPvo1ta7cKl1hc0QsoLc0oRzh8dPVFwZRgWtzSh5nA=;
	b=HUipS9hwThAHqNPJty8Ok+YykZWXx/cvj3o9IaGdZh8VtDVRtmd4tO5bJp+fmRhNrD6P
	 QVMtc23NDEW+YUuHUjfFZMp33hCZ6CiR2W9QmFvLWEEXTNmpumLSO/yU6n7Ok3BuWCF26
	 M9lhIEEy9SXEvz9+yY9KZKUhq76pyxQEiAZddjQaWflK/5wXN/FEtwgp5FtAt/XkKV9H2
	 doO1/ZzO/trLkKhUzshc5cq/n+KhwKFX82z5xedkVd7f68coEJWpMeuD+UNQaUl21O6pg
	 Wqpu/M4w+q9+SRbQKPe31xWqYxcf4ZS4VOjQlE3p4lJ+b0QD45Op8jEPQf1kSleNuig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f/Nq36tk";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361820;
	bh=IXPvo1ta7cKl1hc0QsoLc0oRzh8dPVFwZRgWtzSh5nA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y6CBG8SlXiYZGNEqunJLo4VKTr0xN90WRI8eiBLl8H6S/W4AEZzG/BK2RvcTVO9e9
	 ++GE6zz+1txUiEbTHQRmwbnZrNYbLBTJDWPbflkXVzu2LKZHklSGPeZcW8FiZtkSmA
	 4e2MD9JbhMLQbLVYMeJTDfzXPs3NzTTPHU8upIiLU6xNUV8AgZTJWSZW7fH5sxrrLZ
	 qpNQ+sE1iTcf0V7t8GW+HKcfnls1d8DL1Tu6SOe4VM2xB3oUJDTaYCJBD6vKi4tw/d
	 kvcDvyllAsyLr6lR2lV2cOei/bz3cRVfJfIXqOX7LX8stEbYTHaWq4r8MCb7j4hI5k
	 i+yU5BEhJRGAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6292E606B0;
	Fri, 30 Oct 2026 12:03:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C17D362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5226D606B0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGxTIfEQmCD6 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:03:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4A244605F7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361818;
 b=fIcTjgsTG1ZQzYxPWUrjToew/+b9nA36EsS7RabERHrKqo4OystwZ9bddhg5Zsh3fvG5
 ZbRNmpAkhwi/aol5+IWpsRg/XD94PO0Ym+4UqELyGscCtA2xr0Ub4iV0VwIrCZTUSBr2P
 OVScD/DF6Iw0tr6njUOJtv6se297QOmql0yjoZLMhSpIHXunKM7Fjmi5nz/YUYbnOrDGz
 irroGjLwz4YFR/NIOKLxhSjXVsAZQ5e6EEsGwiJaLIPyLOcqwmGeDgRTmqqPEAlI61x3p
 78Q6EcPgrZP5CPm/oJoCfPiTx0Atum5eznltOmZuXZleIg06cl/x+R/TveztRohz0cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361818;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=A2LqYbhRe2aDRtxOFFM7FzIyNnHyoujh98hwKn1TUzY=;
 b=jmfYbXu8uafCmmTtPexiCP9HsRchiZL08pKHt1lexnz28AThg2l9zCloRU0cWVrFYTTJ
 oB7hFG2ajqlxpGbYWPj9ZvGSato9xLNnKwZWT5wpyBud7nO7c4qFlPA715W3jqNtSJi1Z
 05nLS/q/TvoRBrUn4b7FzbMWqqV2dzvJNDivNX/9l1kTGL+xx95NtwWy3xthWf0mj+7Yu
 R3sKEFlogBud48SUVaMC7xlO56l+PY189kLIdMRJjUtaPABsQZdrCe+my5bmjmfXQeBAh
 SU+TYbfn8GuNqxCpOEnlfmTFDDgk6SPuI2xq/veORBaSxMnY98/YytskIZ210+kFO2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="f/Nq36tk"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=f/Nq36tk
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A244605F7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:03:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso4160555e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793361816; x=1793966616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=A2LqYbhRe2aDRtxOFFM7FzIyNnHyoujh98hwKn1TUzY=;
 b=f/Nq36tkeWr1X/e4J1K2nLjCQtEyQ035VSgLCMnCre6UaAccqTH4lnzBLpgK51exkG
 Y0vXN7c510PfkSz7ccu7LLOI6X/5ZdXXwZ07wpSMnYABHtW+VpblICZkgBtXHGYSXF/K
 skcIbPK6ZL4EpdNTYg+PxOsmwLH5gxwTftfgTh0wIdlwNUtbV2/dH9CcqEnMYdtar1AL
 apxD8kVuZGdZ8xnXygxw9jt7ybm3RBS+Zye5UVn6P4LSAvQuDku3GOg4zNuSAPL9tjpw
 ytOAjYxIbrywGzXpL/KtH+P4f8WS42u6vjTTrfGQqvbzzEUoZM9Sln2yNco9UGA2WqwF
 Rmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361816; x=1793966616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A2LqYbhRe2aDRtxOFFM7FzIyNnHyoujh98hwKn1TUzY=;
 b=vR7xDOMjYulgPAT6ghy0EbJgRNurHK/MfYxgc7vBoyT0siVT52dLrkQv8Ne0dhZFYd
 qhf9390GadSn5pPn7AK9OV4NdNpDNcjs0OQuLVYodlc5QpkTmm9wW/NgtkwrUG1BUPTb
 5CIM25/w8VBtebsLTqwjoXSQM9Kvi11C/dl50iJL87KWgPKVHnwFkJseSdThOZWntyNM
 UuqtHKo/CC3pHdA2cWfNPF/6QnsnjKS/uL875S1418keR2dEaW5LVWCAxCQQVDgigafD
 2UNzdAFsL2TeRPB7VQWKV2sbCFowU+QJ1RRqn6XOPCwZM7fcE/ikDzb7jZDD/Sna+nqh
 bUeg==
X-Gm-Message-State: AFq9FYKiu3+vRlUHO8CCjbjxL7hrgD+LXZME3TOJqmvphZHlYq+c/rle
 Sp0TXki6g69GZ11GMf9a5TCQjxqqGZj6BzqQz/87ztbwfyV61SgdGa27Xn8IMA==
X-Gm-Gg: AYBFou1EXUGXZYKCqJn1eALd0D4uAueBCmKhy9RIOxglOCM0KWgCzyfZI9cd4VgodRS
 GVvu5kJPin18CKADRyeEU2BCZ2YhMQtyW6iIqg9Q2Pjw5I03HdMyNev4ZdnVlz01oJ++aN6Zn6A
 agFdZ5G4l3Yeo7bkkZ+9YcFkC3C1cyAynJKnnfTnS+rzpoucWJPNt+8XcwEtNiYeTvVNS1hv20t
 ymJJv6ZZmj9lepqb6hS7DzWVaIxuGFVGZYIEWGDjYcyp64XFJhcGYXtK/D9F9doTGxvNagQphYa
 qldxp0WV0skGBqu9GzFSw0+XiYTBaD88nAOq4gB1bGJB1La1nA8yEZyyyHezt6cBvVC95N8OC4a
 qg7KWSbESfcnudOCn5tp43I2QI0mqPQuo6TBymZgFBUYR9rEVPjMoCbF3Bv7Baiw09FWJu3D62k
 msM7gHV5oRTQtPwTuRBdei62WzamWNnH91ZKVZ12wY2BicV3DcY7dwqacpxRb5Mhiy4nYCkHMJt
 z3ibQjV6CNbV7dJ3fW0pylAG4nxTnxOzKpD6ctOKuYcRLlMQM+l6EfyVVC3wmiwOXsAaqGmcVxr
 nygq/BvLTICTEre2HyOXtj2CA+dM33qsIBlUUXI9bv821zbEoUiLgdA9ipMPsuPYiw44XaKtppf
 W
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id
 5b1f17b1804b1-4ac17b2c396mr42622635e9.26.1793361815686; 
 Fri, 30 Oct 2026 05:03:35 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80f047bfsm132576205e9.3.2026.10.30.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 05:03:35 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 13:03:32 +0100
Message-Id: <20261030120332.3169390-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sam-ba: bump to version 3.9.2
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Version 3.9.2 is not available on the Microchip website, download it
from the GitHub releases instead. Use the build linked against the
oldest glibc, to support as many hosts as possible.

Use the sha512 hash provided upstream.

Release notes:
https://github.com/atmelcorp/sam-ba/releases/tag/v3.9.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sam-ba/sam-ba.hash | 5 +++--
 package/sam-ba/sam-ba.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index 252a60dbb8..38716e0ce5 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,3 +1,4 @@
-# sha256 locally computed
-sha256  d295567701914e21318f4c48ff3a57374c7c91f65f0814158e84bb07dd4d07c2  sam-ba_v3.7-linux_x86_64.tar.gz
+# From https://github.com/atmelcorp/sam-ba/releases/download/v3.9.2/sam-ba_v3.9.2-linux_x86_64-20.04.tar.gz.sha512
+sha512  f703720a93f9c22c11fd3cda0d1344defdbebd66c37c8743669c1560a7d1a779923a16b389ee8a38f4beea556ed2d89c30714e83f44a76dc53ed50a369abebe4  sam-ba_v3.9.2-linux_x86_64-20.04.tar.gz
+# Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 0928c8f9ca..cdd806c76e 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SAM_BA_VERSION = 3.7
-SAM_BA_SITE = https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/SoftwareLibraries/Firmware
-SAM_BA_SOURCE = sam-ba_v$(SAM_BA_VERSION)-linux_x86_64.tar.gz
+SAM_BA_VERSION = 3.9.2
+SAM_BA_SITE = https://github.com/atmelcorp/sam-ba/releases/download/v$(SAM_BA_VERSION)
+SAM_BA_SOURCE = sam-ba_v$(SAM_BA_VERSION)-linux_x86_64-20.04.tar.gz
 SAM_BA_LICENSE = GPLv2
 SAM_BA_LICENSE_FILES = LICENSE.txt
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
