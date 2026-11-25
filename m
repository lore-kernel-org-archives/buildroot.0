Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04B606A32D
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aOuWUC57;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MwlrMdbN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 290DE4081B;
	Wed, 25 Nov 2026 16:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RezKkwcGu214; Wed, 25 Nov 2026 16:41:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 269D440843
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795624902;
	b=HP8RKZOFPlEgqR1/LPHyqGGA8RJKwlOiTu9FeBIwdRd52qK5y3orDYgg0zkkyYrfKA9q
	 U8mqao2Tzs5aXN5Dk+urpp8t3rI2MwEiQjZk3n20i2JM5bT4HOVIYJjfSF/97xTJT1TLL
	 DMK1tYgwHfTX7nfzpJpwoM5upNfgskp3BOL2sMVEgmuq3NBxqBSejOtf0BQZdGj/owiWT
	 o0zD9z+7AtJv7F5UIJL6AOE5G51J6LIx0h++GBgaMsJXX6N7vV59p4mUE8iGBRTkJ+NYm
	 F+sTsF7wliQCOLnlCd5LHd7lqdIzFasM+vdRJg/M9cGS9tSZ5Vc5UbUhKvzj7bGrAcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795624902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=xkV3Bd3taTL/EFOMWDZPR3+HP6UzmOR5iuH5HBk1t3U=;
	b=Qt6WWoW5oHjE2fVIS6JlPF8fmtsmhNExnyqJDr9g20nyE3RaBL6tV9sed0BOT7FjrD1o
	 qCk2oMyTV0/3Sw3nxIeNZWJUa8mj6fJ0MpTNk+wAL9IjvFrFo7etN+KtO8j60hYWB6DM3
	 xl5q82myqHbcPBrTAHA3D+g/+JZXIaBMmqnLcQXu+Su0NepcUCa57DFxJ9DIFcUAiJx4G
	 fdTInrBg5dn86VqGtsqUAz6Rg8+tFpJKEwnCTAZU0sHAfYHoHI2rAmGWAkTcHFa7yjnZA
	 aSok0jg75IPdlgm5bVJfP0UMcra7tlduDwlCeNiELKnTxajS49mWPQzHlpakzPmW1ug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MwlrMdbN;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795624902;
	bh=xkV3Bd3taTL/EFOMWDZPR3+HP6UzmOR5iuH5HBk1t3U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOuWUC57oNxpacG3JGV+IwZC+97/Lb96/FSPAGjaJ2Z87FgtY9McuLxm1YF81405J
	 Y/BFrBpBBtDoY3HH3trdif4Y6skdaLcPdUjjhz1J0EugeOd+O79CmuAbyFDIZgXipb
	 BjOdfNfR7NPaTJvAL0SmCRVqglJ48Vy6DwERgCXxuJ1G7h8oS8yJkkDEHEVed9AN9D
	 3Ir/k7gPj4UcpHysYppSAlcdDorY6U3NOgV0xBlUmUfh9L8awSSEZCMXuDSfpq+Mc5
	 V0RqXfZF3U3JdRIsNnGY9VkkXexZ32DZW/wWzzJhLq5ryWQ5gfippBQW7+3Fl1h8nI
	 HQ3tavPalYRZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 269D440843;
	Wed, 25 Nov 2026 16:41:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4019743
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3274A40820
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15ViXhnUV_w9 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:41:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F79A4055F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MwlrMdbN
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F79A4055F
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:41:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4a7b8abe209so4653572f8f.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795624897; x=1796229697;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rVY8Oh6u/++lIbEzLpXR0lIc+i+UH+C/tFN00Q+6PPk=;
 b=MwlrMdbNAh+IKKP8g7zYtezfV0zmi5gphPDmhRBlFwcu/bUhOijjsf4X2PL0xpObeq
 pOBGcSdFKfgd4lmnIjkVLemLzgTdJ+v/NalLJMBRRP6uEpBpbagUmyK9JUgyDcGZxySc
 lvXi8w8br9zsoaM5D2cuq8C2qwlM1bjwKTwIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795624897; x=1796229697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rVY8Oh6u/++lIbEzLpXR0lIc+i+UH+C/tFN00Q+6PPk=;
 b=dR9C7BTBoyasBFIFSsuymlvMNMxGtoTpkvhrmKTaqODT0IqwgHEF2vUgSwUWNfYb2F
 Lir4Utznbt+UXEgyIB1jJflKrJcl0QnRDNC2hXXYM63MJ2ef4XjOo+t/TKlVbFjuurXZ
 gP0y/qsLhLiALG5E7xB6WmRUecyaxoHt13+FBNuOXCHfzbBbw52ADfWs6/aJbpQ8/cWn
 xRh2dr0ZemOQWppST8RiHL7+lqGtHgcVCYWfFZloTawk1z2t4JMJFFDrFZG4F0+njgbU
 2KoDpO1F4AWAxOCQa87fp5bhXFV0fqs9onzde2zuhiR3K69Xk2voFwmQ5b1pSU/UZlPo
 4Sug==
X-Gm-Message-State: APuU4Z9pHpgnTsoiAyxsWWWLMvtxvxiuLJYw1K92RVA7u7Jg0eLteuwb
 J8wLSy4BrgRD5V+b860/wn/7eaLy5LDyYxtjOiFMuJv4IQHD2OyqbkyDnD2q/vYXhGxhXexPhYY
 tA5us
X-Gm-Gg: AZFdTZdFEsYlgHLVke4w16NNUg5Ydg5tQ+3QmWb/dAiX3fKq6la5wlOWqnHfiUY/S7B
 KnJ3H5dndCTQzB8T4UCAUTn2eWeeXgi0r9JJ8gYn5XsETfb+pN9r3+Gq3APwypEgcKWvyiC3WMk
 6FGLuCLSmShLup1hrJOy1den3+p3uHIlCiP7HEE0Sbc0nNKmpgiBXDVF0tWMMyxZrsqvY7BfZJE
 JvTGLX/qM4Fq3rOozdBFyXJ4mZcBzSyt59jE9ef+L43nI+zWjAPrt3DUmldZfCIWVQzS71ik/Mz
 e2zuO6CvneNKqIvG/ahZHlcBxYZMyOp5fLBgJGgq1rnxqJX9NV1kqnct1rB+nZkVBmc/fFN5Anu
 WTs4qcrs+Ku+N58zZyW8vMZHxDDyA2zhNoPkjqX40Q1lzqRr9JHtkmeNNdMmhmFApynkZXFccnL
 c/W23G6F1rNrdy5MrXXhdAIrTJL2IGL9wO6xh/Komcmw19e1mu3+NVfLZoR/Anln3zAN09xqmfi
 9+q/WE06iWyGRxr2G9u9gxPsEP2k5B0f3jjzNY09V4QVWPezQzoYYRPwwCiORfn9XPNUNv1l2/o
 qucUxlYqz383LYW49I3vuqwrY4P8abPkkJ36tz6yrFBtaI92qhJt3dKMaiu+UesgMZ+Rnoyfjjp
 1vqCZZTL7Bw8jWWwj3DAgykUVWsq4mLYxSHHzeDaSTQgEaMlvWtGeAfUdhOS/hoLeteTozOZUn3
 fowZUUH3D0cI276YSKeFYT
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id
 5b1f17b1804b1-4bb88818955mr450496065e9.23.1795624896968; 
 Wed, 25 Nov 2026 08:41:36 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067a0e6sm247988765e9.4.2026.11.25.08.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:41:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:41:23 +0100
Message-ID: <20261125164127.863713-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
References: <20261125164127.863713-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/5] package/uboot-tools: add host mkfwumdata
 support
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

Add an option to build and install the mkfwumdata tool on the host.

mkfwumdata generates the raw image of the FWU (Firmware Update)
metadata, which is needed for the initial installation of the FWU
multi bank update on the board.

The tool is linked against libuuid, hence the dependency on
host-util-linux. To avoid adding this dependency to all the users of
host-uboot-tools, the tool is built only when explicitly selected.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/uboot-tools/Config.in.host | 10 ++++++++++
 package/uboot-tools/uboot-tools.mk |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 622070405db7..e7251ca8bd54 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -39,6 +39,16 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
 
 endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
 
+config BR2_PACKAGE_HOST_UBOOT_TOOLS_MKFWUMDATA
+	bool "mkfwumdata"
+	help
+	  Install the mkfwumdata tool on the host system
+
+	  The mkfwumdata tool from Das U-Boot bootloader, which allows
+	  generation of the raw image of the FWU (Firmware Update)
+	  metadata, for initial installation of the FWU multi bank
+	  update on the board.
+
 config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 72b387c41c1a..a508e61c53c8 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -157,6 +157,14 @@ define HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_MKFWUMDATA),y)
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_MKFWUMDATA=y
+HOST_UBOOT_TOOLS_DEPENDENCIES += host-util-linux
+define HOST_UBOOT_TOOLS_INSTALL_MKFWUMDATA
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkfwumdata $(HOST_DIR)/bin/mkfwumdata
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
 
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE))
@@ -241,6 +249,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 	$(HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
+	$(HOST_UBOOT_TOOLS_INSTALL_MKFWUMDATA)
 	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(HOST_DIR)/bin/fw_printenv
 	ln -sf fw_printenv $(HOST_DIR)/bin/fw_setenv
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
