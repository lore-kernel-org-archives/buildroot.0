Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC76606ACE2
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oZfzFQVA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Z6PcrM2N
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178F281176;
	Thu, 22 Oct 2026 15:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrQGkpEMYPzg; Thu, 22 Oct 2026 15:14:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2DC5E81195
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682058;
	b=qX2Lc7y2a3mTNDN9bd/5eUv0ykkrK+FexvHAzw32Jzk2niTvs6Th5jQOdnrdPspMS1bZ
	 YSx9f7En1t1mkIYzjxKqJrQaTpVrKJO73Yl2KiAc/BUwgd4OgrCcg6yUyeft0zHWl7bfc
	 AbAj/87gEeBMeRXsG/ykWlEIRD9Ctt/VUmor/c8okjSU250Lt7NpMkxx945SlEflfty6Y
	 CPuXtMHKp2XXB4orLSYL89vWfy+8yHMQdbrDX9YCJBp91mcsqIOjxqC6DgJC1CgZahgcp
	 YPZRJXkTc4gUS50y1BsDVFQEwZ5JY8qVlzTWPrrhT9R3XuJJANj3dcmKfNbgWjU4VRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BOxR6UMCeQMFK4YV4/waEf5AWLe+XEftx9dvaWmKk8g=;
	b=MQtxDup+DGACbtvnnKABXkN0XKu9otp85l/nA+wN53leC0j+H04nHFWfWDpYHeSS4eNx
	 zRJNM6CWEG8rwKiy5S2VwPC3MtxYxg6Nid9FxpsjVB5icEbBBEeb8eHSONbRyXYSzciG0
	 LsBCyqPuXuP1j4lmIclRMPglk/6Qrw9oQRbKLUJuE7uyyv0US6NHUP/PFzmGWTLb0+IWo
	 2TY4PsjviYEHupLm9BT5QqdKhFR8R9Js1/sm06MqyP41Iib8YRnZj0oZyVZ71fWkXDl+o
	 QerDCPsCg2+3J+GVxOuNPp4AsAXbSn7sLNixEoTVQon0nnVWqsPSSeFCcBl4/FRN6FA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682058;
	bh=BOxR6UMCeQMFK4YV4/waEf5AWLe+XEftx9dvaWmKk8g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZfzFQVAaoST3kGJVmMK12cOtNNVJ8Mjua2gNgyyBWjOI737BUt9lDCq6FCC+UMnO
	 3P7JvwxgTI0bg9+EMPmrHwlW1E+b7HYswEznu777J/Pym7vZ/adhjwPSJLBeNaDt8R
	 B8vJFkLIepzgBklK/ku9QocK0iXSvX2vW8RgW7LuTQ1LFDibTp6I4oEYpI9XCbD+aE
	 cDL/mO2ny7hxl3RAGujdCvFl0LGxBDkwzXxdrzFRfPxG1b8XCnn2e7Ay3P9n5uCdAo
	 mWEEO2W3Z+h99z3iUIAdVR/KnoFK+mg+xhjFgOTePY2JI8eO8Qr1mfDjeyx1LINeHd
	 xjHX4KTf5vNsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC5E81195;
	Thu, 22 Oct 2026 15:14:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B4C395C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C42C40082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-BWKZW9fwuE for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 18E0640024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682052;
 b=rNOqLltdoM534FQaYrLpFY/UWfl+XN352J0ikSfqXJudUZ/wOM7sWeZ/QQQ7aI/V1FVk
 ectOcqVgpZfnYyZ82BG4QJDNEjakApBgPhmk2U6Kmm0kNgh911juHBtITm2LoAA+6AOIO
 ZZBknTIKw4CZHucmXahr6lBM0NMjHmMu9S5uDHfEpRAdesNFnHHBe0+C2EkGsnBHtpTjD
 flws/aHGXEU1PYZ6Zz3pwgNTSNdmT0RBiU0NYZOEce3j56JoqePp9E4CpJe6pquWuIZhu
 za13mRZ0sXXIB1JqXZ0C0SLhj83NLku/E4rLpHD5MZGw0U8Q583bazjihWZ2EcQzIEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682052;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=aZaCQ6E7EXHvsmGLiC61CHxEKa/F8E9Z4HMnUXR+3go=;
 b=ewOqxEb7E+zEkq0d692VFikREo+d7JyBlVUPrwERcDBaTHtlMrBAalWKl0yiXqUKzoK1
 LH14PtGJ2KEPz6eeovoSrV7mzCvF5bqstj3YvUDThPEbnJvL+LO3lxgYy+nGF0Lif7dTX
 bX4TdJJ3RleZsaIxc3vMfKsBZBGy962EV94zbJUIoHnOC5fDhTvmh9vh5eFJUwLVo46Rv
 a6mG6BaE+iEkCJGtGK0uCDzYFX6MijnhzG9q6mR/RL5Rt0tSyatrTfpJ9uLIIQbGycZNn
 jN/LnIQiVSMCMbax++ISJ3xK/ZGdWlv/QlWyczrukitF7IMDWoFTSAf0NQXq7OvcueQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Z6PcrM2N; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Z6PcrM2N
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18E0640024
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4956869750eso13408195e9.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682050; x=1793286850;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aZaCQ6E7EXHvsmGLiC61CHxEKa/F8E9Z4HMnUXR+3go=;
 b=Z6PcrM2NKnMLtFnwc9HoMWnH5+E1gFhHVexeoMTlYI4AyAyjnIVb5lXaQZ/CjlCfij
 BjZbz3/nYHlkGEqmXqBJ+jdtMuxM6KX2msGFKHi3lT8NM0C/eAYCXzTCxtfn4jePCQ/o
 X7PVlwSqXQsrwOx60yjn2X1qF0HwAzCltLlGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682050; x=1793286850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aZaCQ6E7EXHvsmGLiC61CHxEKa/F8E9Z4HMnUXR+3go=;
 b=EP7wJ50nCg5oYo+RJMWeqoLFN7uIIbBgd4If8sH0wsv1AoJjz8UzLdon6lXNIahvNB
 MTFfMHhQ44a6IChVEo6SXrUJi2L+C1N2zXmVPtJkDLshs8SgiJAjZHWBlW4tpivsfeRy
 6tA8yNAbmfJw4jl1yd0YOucW+LNGKpjTt4rDoK9P7xSparxs5XPA1Wzdhhyca5/D/uU5
 EYJ4k13HH5ky4rxX8VBwaNZLUGx4wWFkzTfXGw+RlGEjMzbkRAAXaGjgwquAY8nnk5Nl
 nUC3aWjsvDOlDXpwJ6/pwa40iterTXe9lfGONo7KaaMNJRF+V8XpATDAHAMQSFNcW2TJ
 iHQw==
X-Gm-Message-State: AFq9FYJB8r/QFYOvH48g3PW9e3tN4GjHiLg1huKaKmIvRdVHYhOp4mxq
 kbUVCkxdN2ozX5npz1Sf8OJKACHiXdn1K8+iTt9uBgzcvtqWLgZCGE3ftnI/M8BmFOfyiAkOme+
 zoHAn
X-Gm-Gg: AYBFou1WXsOFj8PDEgQ3H6DR96FX3J1VclA8VuZ0EZ88YSDLrm9pFd7xyR8EyQe5Jxo
 8mgcYS56+hSil/WchSHdA5KdIYbqItLcnzBRKLabk3GRNO82Q6YnDM0KtbBzCp5XzSjGbQyesBD
 bvGT44+m8nmNDi3HOuLsZkVTS+uJFeIqADPWsZgNGBt31PPlki/nV7sZ7lZjpTBgJtd25J5Nowb
 StBW2hCxLKIOZDUz4HVO7AofhAV4wDtIpdvy/9w7FncnBTHq22JKqN3Thi6/qUwRZxHwG14SBVp
 Tkvh86OXgL7PaHrXkW7T0S7sv33u3eQCrwLvw2GLE23ZzU0rsujm10nTg0vZqGiYwY2r7cI+JCE
 EfkZ3/b0YtIreW6m4ibZBRhfGfFD0B24f1uwIq7aNCfiPLtan4upBjBaZM0yDPdFCTbJkCDWTMB
 b58WT0P+Obf3zVKVayHIi6rqdouM6uNnrTlfnT0diHh9rty3un+B95B6C1jx0jV9sKZpocXpY0o
 KmKUXykINH7x63DnKTKg0O02LsjeFTsiRO5oDKSBIUxCDqibDLOyZTuYfy7aVq9Kw1mIQULVl+8
 xurrG0EWn+SmNT8diq1A+MNT7XVruy4N5M9m+/+HnN8Tkc7/nTfJlWZNN92mUgPa4qMKPxhtVYV
 iF2lLUsXI4P271VueZVBBDLUL7VIMvITax7Dhz2ua7hLBiT998MZHLg==
X-Received: by 2002:a05:600c:3155:b0:4a2:803:a3c4 with SMTP id
 5b1f17b1804b1-4a20803a77emr41721685e9.13.1792682049626; 
 Thu, 22 Oct 2026 08:14:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:56 +0200
Message-ID: <20261022151358.2260712-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] boot/stm32-ddr-phy-binary: new package
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DDR PHY firmware binaries of the STMicroelectronics STM32MP2 SoCs
are not part of the upstream TF-A sources: they must be retrieved from
a separate repository and are packed in the FIP by TF-A.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                          |  1 +
 boot/Config.in                                      |  1 +
 boot/stm32-ddr-phy-binary/Config.in                 |  9 +++++++++
 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash |  3 +++
 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 boot/stm32-ddr-phy-binary/Config.in
 create mode 100644 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
 create mode 100644 boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4339b37f110d..c188cd301f2c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,7 @@ F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
 F:	board/stmicroelectronics/stm32h747-disco/
+F:	boot/stm32-ddr-phy-binary/
 F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index d73d221431f9..95af63ab9af1 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,6 +22,7 @@ source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
 source "boot/palo/Config.in"
 source "boot/shim/Config.in"
+source "boot/stm32-ddr-phy-binary/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
diff --git a/boot/stm32-ddr-phy-binary/Config.in b/boot/stm32-ddr-phy-binary/Config.in
new file mode 100644
index 000000000000..1a8def0d22ff
--- /dev/null
+++ b/boot/stm32-ddr-phy-binary/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_STM32_DDR_PHY_BINARY
+	bool "stm32-ddr-phy-binary"
+	depends on BR2_aarch64
+	help
+	  DDR PHY firmware binaries for the STMicroelectronics STM32MP2
+	  SoCs. They are not built, they are needed as a dependency to
+	  build the TF-A firmware for these SoCs.
+
+	  https://github.com/STMicroelectronics/stm32-ddr-phy-binary
diff --git a/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
new file mode 100644
index 000000000000..5826a483cbc9
--- /dev/null
+++ b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  519595ae24b44d70b0c0ac1e776bf1b871da00b615b9bffa83573e45b806eedc  stm32-ddr-phy-binary-1.0-stm32mp.tar.gz
+sha256  6b6a3968253466c776a660e916c67c7207c42fcd5bf02895e50215f923dae29d  LICENSE.md
diff --git a/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk
new file mode 100644
index 000000000000..d90980544a8c
--- /dev/null
+++ b/boot/stm32-ddr-phy-binary/stm32-ddr-phy-binary.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# stm32-ddr-phy-binary
+#
+################################################################################
+
+STM32_DDR_PHY_BINARY_VERSION = 1.0-stm32mp
+STM32_DDR_PHY_BINARY_SITE = $(call github,STMicroelectronics,stm32-ddr-phy-binary,v$(STM32_DDR_PHY_BINARY_VERSION))
+STM32_DDR_PHY_BINARY_LICENSE = SLA0044
+STM32_DDR_PHY_BINARY_LICENSE_FILES = LICENSE.md
+STM32_DDR_PHY_BINARY_INSTALL_TARGET = NO
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
