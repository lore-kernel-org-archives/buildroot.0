Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14395606ACC6
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GvoP6zgw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=WclcjOC1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D7D80FC6;
	Thu, 22 Oct 2026 15:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00dCJ97N9ejS; Thu, 22 Oct 2026 15:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 101F281124
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682052;
	b=O7JjXbSbgZ8kO8YVfiRTXN3OBsjwPidbTp4VIbrc4axQGIZyOPPhbnLZg5B4Ynnrae/V
	 05eaMsNmbQFJEGlDZbr/Cc7lc+J0CzFOpc2y+MlulLYJo/cd8YMvFcjilDsJEjWedAKVB
	 /uewXPzftP2NZLOCF0I+D3uv4Yqp17OYMWbwf8W13Lxk34dcRN67om9hGP8NIHzas+K+8
	 fahO7Zxe6uytmti6z3znGkddiGJJQEKOoaMz62BuznUI1O5GI9Bgoh8PPvn8o0Ve9XsHy
	 6XO0hZJ4XyRQceatafEcOVrdZYcnsO8nXSABXYglo3STJEYmFO5lPiOzGRuIH10lrew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/cBLkVtGGXwRYVxcarFqcknMFLAKOdFskL0zmaQUA1s=;
	b=re/clgERy80gBcCFMAKEMlWyW0tFB+JmywT0X8xzVfjcnUT6b9BwOIIFgbv4Goqdj2d1
	 H6euSey7AHG4vG6/YQn240OMMmPLjrqAJqUFxy7NFM9aqM91HqQ8S2SwWea2efq//En1/
	 w9RdFSsfSMvmQKziZ00ZVft4Ro9laO1op7DzDzJgXzfNcZS3rNhdHOoJYNRV/fFRVi23M
	 PFJRSsPFpT4+8O5c7XAcd4bHkiJnAOxkw43qXEhtMM3sENkZ5BdKU4wIXMS19ZlP0iuyn
	 bXRLXuxCLmj8ieH2AN94YQmdkM9PtS4n8OuHR7foAosVlNiw1dCfdjvdSm1CwOXt7Kg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=WclcjOC1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682052;
	bh=/cBLkVtGGXwRYVxcarFqcknMFLAKOdFskL0zmaQUA1s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GvoP6zgwxSPADIe4HkCumGWmUF7T0o4O1QWgdHyE5YNGK1NW5/nfWzSO83uB+p9yc
	 r2XatMXPWOB+wFG/x8TeCMm1HXUttktdzqIVHtYVwz0qbpgqrHccQtPGGeX/JuxAuA
	 guKzEDr5UxdAbMzEpxbJlTYGrAvlK4u4KI13SsiM9O+smAHDiNBpn41jQPGNC5im4R
	 61ilEkPkra02lV/uvurx/s9HICgAbeZ8/CbL7NWO/QIgGy0d4gdPPHlMtuajbip2xD
	 SVnIsQVAMZrnlQZyuRe4jdDJoT0FGueiNX04p9itr0+okEdjJYw6VBhhz3xqtOXFFR
	 o0vJxOGcq9izA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101F281124;
	Thu, 22 Oct 2026 15:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B5F13A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 418E580D66
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kC9srqe8BVGH for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C15280D63
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682048;
 b=Z5DtrpWodb0tW6olo0kmC1/LRhA1Hfo2lzgDTHOvO+2iH2QDHOvR83OfmOv2SF5cu7Xq
 1LIF3GuzXPCBfd9IUZZI20j1tOWDqzGwVZvUsjkO+9HdKa8H7TmQgkM7XaSKLrpK7J32J
 NP8yJWeg/y1BbDcg3FsnXxBKvNpe2j+4pEQbwYMOV4wd2lyi8LO7+ylZyw+HjJkteAPzS
 F2ONXBGMMEU3yLNszddfO8ZoUgwkl+MjvorOtA8Wpa05Yjp5o9p0e5Wko0IF+7R3doYmc
 Ni5tRNh0rNODxrYiTGE7Q2E63pcIKKQxTDMJZ4cmYRD0LMzgYjBL3RQZGCZ5BmB9QRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682048;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AVS3DnEp3/xm+3HOnOu/BmiM3hVKcN9XwfmHDIHVOgc=;
 b=Gb4ilwzAXo4BwMtmtBqgFJ+Wa39UgkTMJgJi0BT+kCSpjIS1AHznLGWOIK0YaQ9nDQLV
 cFotMf/nTpEqFZx+GzIXd5mesKOM/tYZLCHOivirHo1qNbFJEfVuWK9zcpIfQKSc523fo
 apgw4njaXF42ivbMuyF1GKEdeQhc5l8f+ah+IrF5qPaiGdKyqs+9y+ELEjQCFPY4Nvf3H
 D2l1qZwXwp1aK8kHJdPzF536YIysYR1PUP9hZcBSDR8FTLLoK6EMNNRrnuxieqv9Hu9Im
 k2BFsAwjxs5/8PvnjSO1r+y0fQ69CX7EDs2Rfdu6jOqJqpi0FqcyEh+xCmZg3oeg7eQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WclcjOC1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WclcjOC1
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C15280D63
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso758964f8f.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792682046; x=1793286846;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AVS3DnEp3/xm+3HOnOu/BmiM3hVKcN9XwfmHDIHVOgc=;
 b=WclcjOC1FbdjhcF2hp0vfp53BSt11DyDeBMXrgqBERTDgPpA3nfEt1RSqn/VM1cPOH
 b6peaJBGngjtm5jMhhFavZYdJRa8HN53clnylDDuEH3Hct6HRFoSk8fuHdMG/RQcqQkP
 OLtmdrBYr354skZa4XfvxQLseZViouS4xeSdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792682046; x=1793286846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AVS3DnEp3/xm+3HOnOu/BmiM3hVKcN9XwfmHDIHVOgc=;
 b=EEv5aS++jFxD05arVhbTL8o9QZNWT32R3rOGN8ojS6MPrPGcQ9O0VCmn1iwg1FUX+g
 xuz3rw8P1qtMkBycHKPIL4ekdD9Ns+qshjlWd+/OE2As/PMUpS7Fl3eOBVNZBUv33xf/
 nnZ923LNaT4xIg8jVYFHX6r65640uHtS3qSql4hChl2UZj4p/5k++c+lLLH8/LPo6dCS
 AGUfEbipSpfmwfUUNHx4xGMs6umquwJee1dmlFqmFqK7tG3jbtJ97jmb/xhvq55ao0eY
 aI9dnyabBwnC89jelZl3bezFa61RWetKtEk8ikfm1OCUMtqiW/TVR6XmOtFX286B5O5m
 a7hg==
X-Gm-Message-State: AFq9FYKZVycEJCaODl6RF5qQyIwM1qgwooFVDQeIUORp8EdUZ9q392CG
 R3Kze/kifGMA0hrQ9BthenrlqOdeDZbmbbHkajQKyt6kunJ0VtGSUKfF16GFJx9ygQoe5/onI/d
 yEmpG
X-Gm-Gg: AYBFou3QlvvjXSdHdjar1gxxoxpa8wV5/W+LhK1s7aelAjr2NJn5QTRJE2K3nLCIu+u
 9Y4fld4lKg1QBaCHwko0K7XWlhOuq+Zh40vuEF57tQkabLLqWQEr2MMZ6JbPPafZ8SfFGh3J8/V
 LFycw2xztrDUXaL148j/D5LWuDsziXWACXPk1Amt3LF+s+7p0ch5NrYti9qPthpdBzTir3LY3un
 9xSNZOBLMjPTdY4jG0Wl90yjbiqPnzXmAHGoC6s2ISZtASZWIdvLKMpBjrnxGoMEmQKTyT/c8uO
 uPsVWUOJyhBB2zTPG7oWTWR4QC6U3hVhlulGmIBepBVoHapg18jlgWGGcSgyQFuMqaRF2S2GOEE
 /oMj13bkCcToo/f//lrTxvb0zLMwTxf9BBtF+XMHL+VEOwKx+Ae5Ctav2q5xbb4r2iUClw2j1qZ
 Gi6u+Ubf/m4V24IEfKf0vmSGHQNmkA2vgmhNNNxRr41BGMrR7fhDpazBNIrMFt7Z7AS1A97SGev
 KHXcMeoLVk0ZGjUiDvzF5xyPrg7r+5uY3Voqj8KPJw+WIggLcfk++sVZrnCUpHsuIFYHEIVYQPq
 W1yerWH2R1bbUZK1PHe3UqZ0DUArzrRXd9Yakfz7W6UoZ+BQtWQuydi15kiNDa5Rb1zqTagtDQ5
 PBPnL3KM+Lt1olWF7FDtykECJ7rFRSMhT/lADdajBi8P/i9rc+ph91RYK5S286MiCG5soYUHQPg
 ==
X-Received: by 2002:a5d:5e08:0:b0:48d:efcb:1fea with SMTP id
 ffacd0b85a97d-48e2d0a1100mr5998089f8f.0.1792682045965; 
 Thu, 22 Oct 2026 08:14:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm12732367f8f.21.2026.10.22.08.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 08:14:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 22 Oct 2026 17:13:53 +0200
Message-ID: <20261022151358.2260712-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/uboot-tools: add host mkfwumdata
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
index 87b708ac5c8b..7c6ee0f3c467 100644
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
