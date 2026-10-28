Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81E606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=in+KmXqJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B966240AA0;
	Wed, 28 Oct 2026 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PToCoir2_cnk; Wed, 28 Oct 2026 21:40:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CCCC40A8E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223632;
	b=CyIYBve5pp0Fn0PjpzdXmq2PAi/Hc1Hq5QNmICx2VbNAL/zxLZ4EQWzWL9kVDc4RCVEA
	 sRs+n41gxMHw3AFSFSY6B1N5W6UrlsJYIBy4VsUvCRK5kJh8Fnx/wVp60oQEqZ6AhpSph
	 r8OHsvDUPrAl20niaK9D24M44VKaZ+nxZX+B8I7gdzpCP57VZ+2jq6JO/Yco4IItWqH0f
	 Qa7sR++Ua1dKq/jLas+csTM0SsLAw56CHOC/pChKE8Oc16NKoRpaYT1WYmaM9wpw2ZV9E
	 NLfbLJpf9mlwwzrj0zzmIYZDucGk6vXIiYvAqpdl7OSryBDXyGMxC6I1n+phwV0c0UA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VCAGnvR0oRSL+ihimIfQhKKWT7t02nKRzW4+pMAa9DU=;
	b=IsLewDjrB/qQmbSpHDkILFk8z6DX+jLNf3P7NIhwU5tGJg34OtXKZjq8K1d8nbkpKKdu
	 ziVJlhdvT3EpXV3oZkZPPggHDNTyI4wu7kZDiEQ2qEnjIpHxw0OWlGa2VY2IR8Ubtq21Q
	 BmHZyJy1998jizfJdEsOQ9WxKskfnCAULxymWmNMXInT4WTilJChxCmO7mVXgLstvowpy
	 UqzUIfdvDfY+NwceUHC0lJAryzz2OpTqMTepNrU6EYZKKpcRB80tm591ebWdHZAui5+bg
	 I/XnM8L2M5e9oNzAe1Ok5jVdGv9/3pHdPLeypu1NpPYSMfDcgRf0BoRh0YJPcAL5Fxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223632;
	bh=VCAGnvR0oRSL+ihimIfQhKKWT7t02nKRzW4+pMAa9DU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=in+KmXqJWC7BBzG9DcXuNlYxknBPL3XK3/1U5qNt6H1NJ0DSPZbSVeng626Gagf/p
	 yp+3ZuH0RG5P23K7o+ZMZM4ATMnLi4du6HynjQx/CWAEGjpjE4Uts8AvDDDGT/5zbf
	 zdpADtOuTGEPSGBdhCHdExImqAp2KxwQ8h60HE4DSd/6wy0DUdg0IXaQLSBq2W/+RT
	 ObRCc4HcIo1FN4YCxRxFGW74OKCQ/5vJ1TcvbXU5CQ56e3TCh1fXaYxGV7iD3cDeOe
	 Yrv+kyTny9bwUJCQuei46qdO5ORtQ6/ld+5t9v3CRjRJq+zBLmrvQiYICiqz/YSWjf
	 PGr7Lx8NbsTtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CCCC40A8E;
	Wed, 28 Oct 2026 21:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A50182A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96EAB40229
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3_e3ALYbVwO for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:40:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BB366400B5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223626;
 b=hDt5RyvB4V/bEc5PvUvi6tJMS8cCj3hl1fbfVgjC2gt1fnnen96Lly1RphsKtSWHdfMl
 tV2zAMU4FFeV1qrh1P8eAquQq8QQH8WlOtAKqTp7tElVo0WDZ1zUqeiqye0Hrj/8MOTew
 wKtOm6EiTyQbMsIcoYUWQCdZgSaTfdeAHWLP/BkereByaLfErR/6Lzv4arSYlIx89cmly
 088xnGXbV/MSYwCnrJQisrmXAf7cAjNdxf9+VMKl4GSqRFwWlJz/kuMRSG2OnQqYrmbKL
 qBAvpRvpY23UVN//vQP3RXKof7wYRwgwaQrnBS5USTRmXkN6Dq3BKUUCE+n4kbhA8PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223626;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=V5zXa+RWLTznikvBxVkCr7qr7WE5npX3hH3k8/FaSkQ=;
 b=D8O0mOAXw8oeiOocSU46OzcyiCXxYs1dbU6XjtgIbMBsD0po474WAMaBBzC0ebM2EYTu
 38HOV6GO8N/2Ot0f95m36jyQMb9y3u+lwFoKmYyloEksQdEQ1LXRkZ7O9ASwTP+mAOMUI
 gAXCSmFExwGEZB39OzlU+ZYTOQ6vzRf1l1FgKAGGM9yuKaX6B1z87F6Mcf8BDuyhRftnA
 OktOZ6Pd8e5aFXLoHWaQaXG2DDWBvROm0GD/aEOAlJWDYd1bYfTEreMvWKvSA09S5dMGD
 iz0duEN7JXGsOw1awNv2Cp06olEUT6Tjxzr7b1GDGxkia2eEE6SGO1zohaMV5E2ZNlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=e6uAceU5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::564"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB366400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:26 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-cd8ca57ef64so58482a12.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223626; x=1793828426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V5zXa+RWLTznikvBxVkCr7qr7WE5npX3hH3k8/FaSkQ=;
 b=1xHUUa5Fie3IiNuBOy+xgnYSkay527VTlmLCCipPG5VFBZizODAuCYa6NzTy5Ml5+r
 8GfiRaEcHNfTguHi+muxeJ8hdC3381+B2vGBTOIKkrrwnRZR3/tKcEwMO3D61c2PflX6
 +Tbk4i2odDvCGF0Xe76vN6BzzJQtwCJ7F/fDq2xYc+8kKTtgcYz8MvClEm4H33QsvhHc
 CTRlLTKNEpx19Qn6j3YuAKeebBsEsrArcN3xWRen98oguQW+lPsSIK3Z1wjk4vPKg3S+
 VTjkzdCX11a1MDlke6oDmzMNJg6cXaTvKUwn9t5l95BrTG94g2F/4rA338cfpk9MhADt
 fPQQ==
X-Gm-Message-State: AFq9FYKbhelqDpU9zRI3MKsaw+M98Prc7PUZ8LTaXFlcre01oynZb2h1
 O71KPHIAsoCKeATg51Eq+gto8k4MGB8N7TFL8Mg0wixLmb/0sPDRPr79N8a6OjhTqs11/mpBLA4
 nb4LdjsiWbxYFBRud/Q9+AxnVHVdZL58NT+Y8EHvESykFUoyH5b3VPg6wzK3eJi7z3+pQKQ8hkT
 MGXLNrjG2Cpr1VJu5Cwy6X8cB/3hxat9C1LmC/wrx0XWWxuDOBgMeSjFw84XrZy/Ua0TG1tvARA
 Uq4u3yJNhT/tV+AvA==
X-Gm-Gg: AYBFou16OZKiqaTIT3Rv2vLFTncWj9YxgeJfqg4D4a4YU5vAzX5TR9CoF4JDQ2C7+YC
 XMrnAHCz34a9ai+RZXy+YvTMRs1ZX39yVdKZsh/1BjCYFUDlRj2+LAWpsNbPLH/fJcAL489jVGS
 OvF1inZwbSoBrec4yYQTS9WDvItiV/9CyQGTXyjlZ9JxCsFH8Vp+/Jc4zjNCaieubKAEaX79gnn
 P5umpMxyeq+rUTKGpNQ348IaK4YQzvYJLMfga3Dt9crWN203ZL7qvmWnW688SbfV7CJO27y7w1A
 TKJax2PSaqXX77jiSDh8D0SoKf5PSP1PQcDPUyL8c4fWve+PCcniW6yY5+DGS/UciKGixWh733n
 qOgWZAQRSWnDHyiLiWvdHT14sckb2s5wv219wpvWZug52fZui3gtC9ZlmedVUcbMjLJGkjaJiZD
 muriZsAGIgUx7kgs4+RBwihYtijvSCAKWMxoRTFcVP
X-Received: by 2002:a17:90b:1d0a:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3ae6ed2b1dcmr356014a91.20.1793223625583; 
 Wed, 28 Oct 2026 14:40:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae55d4f7e0sm875501a91.1.2026.10.28.14.40.24
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:40:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5364f562140so3040541cf.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:24 -0700 (PDT)
X-Received: by 2002:ac8:5c82:0:b0:536:68ca:af3a with SMTP id
 d75a77b69052e-54119aa394bmr14149941cf.0.1793223623722; 
 Wed, 28 Oct 2026 14:40:23 -0700 (PDT)
X-Received: by 2002:ac8:5c82:0:b0:536:68ca:af3a with SMTP id
 d75a77b69052e-54119aa394bmr14149361cf.0.1793223623028; 
 Wed, 28 Oct 2026 14:40:23 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c16569sm140994586d6.18.2026.10.28.14.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:40:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:40 -0700
Message-Id: <20261028213744.511429-20-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 19/23] packages: replace $(PKG)_DIR with @D
 where possible
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, packages that use $(FOO_DIR) (with FOO as the package name)
expect it to be unspecifically either the source or build directory,
with some packages even expecting that it is both. Because it currently
is both.

But when we introduce out-of-tree build and shared host-target source
trees, FOO_DIR will no longer exist, because it can no longer be both.

So, In preparation of that, replace all occurences of $(FOO_DIR) with
@(@D) which is always the dorectory that is the destination of the
current rule.

Note that in some cases, $(@D) is used as the source of a copy or a sed,
and expected to be from the source directory. This will have to be
carefully identified when source and build dirs are separated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr:
  - reabse on master, convert new packages, drop old ones
  - add a commit log
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit a7e38cf17ada495c3abc1f9bbb377c883a9b4c5a)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/linux-backports/linux-backports.mk | 2 +-
 package/ncftp/ncftp.mk                     | 2 +-
 package/pciutils/pciutils.mk               | 2 +-
 package/php/php.mk                         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 8513a84487a8..e14cd4a1706b 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -33,7 +33,7 @@ LINUX_BACKPORTS_DEPENDENCIES = \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
 ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
-LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
+LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_SRCDIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
 else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
 LINUX_BACKPORTS_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE))
 endif
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 4075449c53e1..1f33270adb92 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -37,7 +37,7 @@ NCFTP_DEPENDENCIES += ncurses
 endif
 
 define NCFTP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(addprefix $(NCFTP_DIR)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(addprefix $(@D)/bin/, $(NCFTP_TARGET_BINS)) $(TARGET_DIR)/usr/bin
 	$(NCFTP_INSTALL_NCFTP_BATCH)
 endef
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index ad32713d579f..52f92db78505 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -46,7 +46,7 @@ PCIUTILS_MAKE_OPTS += SHARED=yes
 endif
 
 define PCIUTILS_CONFIGURE_CMDS
-	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
+	$(SED) 's/wget --no-timestamping/wget/' $(@D)/update-pciids.sh
 endef
 
 define PCIUTILS_BUILD_CMDS
diff --git a/package/php/php.mk b/package/php/php.mk
index 1bb25d086370..1dd979d7a2a4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -343,7 +343,7 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
 define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php/build
 	rm -f $(TARGET_DIR)/usr/bin/phpize
-	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
+	$(INSTALL) -D -m 0755 $(@D)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
 	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
 		$(TARGET_DIR)/etc/php.ini
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
