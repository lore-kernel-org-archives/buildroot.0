Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7F606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gqnxHMNI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B2680BBE;
	Fri, 23 Oct 2026 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSm9OiUEx3vN; Fri, 23 Oct 2026 21:48:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C26868168B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792119;
	b=ro4X+uAC6GUlFaWMBaUJ9llltqQHUIJmZe6DFBqcHXivsYHWq2dcr0Vm48T+SFcWraDS
	 MFuRkI2+vNJo91WrIvtr8vbuvYhrgwaFW1P9oSB7ghCVSq6/D4fCs57Y709OM9gVnXp8f
	 3/ZbpQtYisNAsMsx/guKVqjiOvktfR9vQSvKfv36c+p8wWsmGrUutTRBbgi1IaV8WFTEp
	 JaDYejF6UbYLlOFRDLVExrldaEj4i1Jm0KENiEgrVveZPXXFg78d4IeGHqRUMJ0+7TYwB
	 L5eABon0dK1A0CK+vW5Qm5avXse5bcykaeIgRTUVfTCVGMqVkSaJHsXsGx+ZNnX2SuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792119;
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
	bh=eaWSkoqv6DfNogA8//yc66ko21/Q7sLSvuxeunev6Yk=;
	b=VGNLEIK/Fvn+r/LM3GMjB6Gmb2cMTmuoOA0DcCPy3Uce3Z+RQ/b/TlrIx7e2FAgq3f2a
	 NLX+m/ZEzGj3Wpv5vahOrjQ6nbv2YQIHDzJ3zgGZtESwI9I7Ed/0yJgiFaS8T3YJTtDQI
	 Y4yWxlwOI+Q4nky/4v3yd9vaoU5Jh/phua2ga3jHmcmQpXk82BvHH2eJAXnutkVZ0Mc6U
	 ReQd8qV1UKMXGayj5YzwBA2Rv7vVL94sqOXPA2S0bLuCZ+RwjfyKn79+CZ6uRaK0bEvTL
	 nNXZXr3qchphkEIiH1rraz1qucbN+eJ8+gQkRJU1U51TuPbtz/UGyoJ5qMZ7BxKARxw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792119;
	bh=eaWSkoqv6DfNogA8//yc66ko21/Q7sLSvuxeunev6Yk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gqnxHMNIs+nVk5lvOTZb2MapjFitHDvDjKcsg51nNFY3W6yE9w41D133YNYtM9Q1L
	 y6rvfN1mUIEsFy35Tz9vGjvjhN6gZmgdR4fup+kgKLIbnU5/zHAMNq2w2H05iLtPlr
	 H7PtDt7D3Ppt3o/tXQdKGjPnvM1LeCM609fcS0a0OtuS05PKb+pS6IA56fTacgSIgt
	 kx48Epqe9Z4DtV9Go3rWyWRf2YgsuVc7BBqUEunbVTl+tztuejP6FPxuyW670zF1zO
	 zx9ncR9ANnJMKIiapk7Om7i83uMdnkLpRugHLps/n5Ii+gkN7xXK1VSpLuPZ9/v2cB
	 ejbYECqt+7xDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C26868168B;
	Fri, 23 Oct 2026 21:48:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE62D33
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D0BB404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ds8LSmt7Ayyt for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 82D9C40488
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792117;
 b=bVT3HJeqxIWvt+Gk3s4WVf987N13r5BPTTY4tc4rAh1SyYgXCGF1ajOlJopAH4Ik2HyP
 gFJViY7DiONXR8XSZWr+e70CJkiss+VVJtpiXqHqY5S5BuHFmMkkqYUdj2ArHWXTgBUI4
 Pl1VGRGOjoz13V+evG+AzBpk2PuqzMZk0II++L+aUHj6a7/T7GB4mi3uAhMcKxpP3NbW5
 SqDASl+MqOMW3vHppWUuUulV8lWL+Qda0+FSFXLDqXrFm+7PEq+UOJ/4O9ppYOvnUd0eY
 mMs0/T66SLB6/oRhLhv6YP4dYvUmud6H+0vAVI2CTUF58mGICpDLMfox0mA3ET9hoYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792117;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=dX1xF2yAMsyFKjGasdzWWJMpoe2rPAOpzlH2cPDIeo8=;
 b=K5DrItU2v3AgEdtwGGVBLVmkzGE15FSrT7eUobO+tTKRo3mNt9RZdlmB+JsK1LGEKNLG
 cZ9YFSxS9vZUu+Yq/fWoT/3BJm0xVcVAW3g5TioDzM5CWw5fFCiHbLoA+TAgxkyATRJVr
 EZJV8W1UOkYsabKZJtri3jwA7ZUvM1u+LLPZDAikz9wX5fTu5CSefrtLaRfK5yK9CImHQ
 nvcY0wlB+k0mupxFBUIi8GwFfo00WNvAAwn4v/Hq4do0ShFTSPkv7o6FIczJlKL2SPKwH
 CP+jejyN0AmHmGTbdkGpjBaSAcRae7zEcRMu0HnUQn+RyKlM9pj4LPs5mZIfUV+8Bcw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=MxrD9aJI; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::564"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82D9C40488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:34 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-cd633ef819bso603133a12.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792114; x=1793396914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dX1xF2yAMsyFKjGasdzWWJMpoe2rPAOpzlH2cPDIeo8=;
 b=OEBCEJtjAtDUC+BD5JWFYzoaeqpVLNDGrW6c4cHsLdf7tckvyt7bn/FcZX7xQ0rTJw
 M561VaJ4RS7jIVYUpU37EKeyeMoiV9r9iCgB3DLGEu3qCgdy/IGhnP59d+7vnhuDqrMe
 O8QaIyj4cQY0K+iwk7y5ChJKH2R6C0/ZxzM3PQPQSLqELuGAhKJYEQVmqIpit0zAaX/E
 nQPwLfUZHpVcds7h9TJxk+IM7dmdHIMNPI+Qe/i/nqbyiG9Pq0nkimrVi9NT+CnhD0s3
 uny7Y8ZegMw1yQsxpIsqnkMkqWByvYtTTMEwLpt1HA6+v3TsLlM3P4SssSzxP5Dc8PZZ
 BcYw==
X-Gm-Message-State: AFq9FYL5KOTcm3JkrpTDUgt+28ZdVDmTgaTNfQQaVy7DCd0jGRh6trh8
 PXepLTxbw1W7Kh2Cb+m6VP0Qmu8eXFdsNcd48MdrGG1nMGjkqFvxZb05WdMa8Lw+ouVXl8JtaEK
 ujPsVt82RWsuYLtEcE9pg08JFaNgI/IcuOhhQHhH82ek+XIdP5Sl9xkhmV/Z3xWp+AawPFe0YUR
 8yW8y1M+Yw4y9dFWs+zI38/NtODKL/diC4ObqiRexUoh7wxZJaI6ecRBEZZ7HjJRj0lbnNTqRiu
 +Dx0adaMS6tdJz34A==
X-Gm-Gg: AYBFou1eZxyYIZk8P0nkrR7Qv8EQMScVbwyvVUegWay4esMfUSNPkYKhtoia3bzFdqf
 8Ty9zz2fBdk71uyeRNiaIw3nLDI2kiy1GEh782JAJdc5QQsWnTksqyMX5v8pSlfg3YfqLHDx75A
 zXDtHTztGCPp6p81M/Rb9WCC8p1/8kkltC1pZXKxTGeUyDov4eDNmA0OXwoPIiFfcCq0oYd5b6C
 Ls6OzlTlMU4W1/vSTTpHzIs9xegjpnC+m/BnYNzNfBJUNVDc8LKQzIMGjvNPAC3EOmI8RDtSJN/
 xT67PBRnpIJGde125D7ewGsb7ltgqxceKiAyTI6jswA4CUbsk5+ce3WAMSyVJVXRP3Mpqcelzw+
 Kdt9ArxsajUWYevREW8EtDLgoTh14GlWmVaNkTc1sLjM3kjRCxiQ0b6OPcvFxLTZ8NmyLUl1Qmb
 6al1DADjg9TskkWfYmXKBk6y+cb5sCPtMoXbYQ+oypW9E=
X-Received: by 2002:a17:90b:4b82:b0:3ac:8af9:4a73 with SMTP id
 98e67ed59e1d1-3adead249d4mr418010a91.28.1792792114168; 
 Fri, 23 Oct 2026 14:48:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebd531f0sm339536a91.4.2026.10.23.14.48.33
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93ce7a85f04so269389085a.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:33 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93f:22f1:97be with SMTP id
 af79cd13be357-940ef9a6db6mr48457285a.72.1792792112703; 
 Fri, 23 Oct 2026 14:48:32 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93f:22f1:97be with SMTP id
 af79cd13be357-940ef9a6db6mr48452485a.72.1792792112044; 
 Fri, 23 Oct 2026 14:48:32 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:49 -0700
Message-Id: <20261023214807.2151753-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 05/23] boot/mxs-bootlets: needs (BAREBOX, LINUX,
 UBOOT)_BUILDDIR
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In preparation for the split between the source and build directories,
make mxs-bootlets look in the correct locations.

mxs-bootlets wants to access the generated images, so it must look in
the build directory of each package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 23a452e42840d5536dc1a24cae859da608003e29)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index adc22767f7e3..e2dc14e90ac0 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -56,7 +56,7 @@ endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
 define MXS_BOOTLETS_SED_BAREBOX
-	sed -i 's,[^ *]barebox.*;,\tbarebox="$(BAREBOX_DIR)/barebox";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	sed -i 's,[^ *]barebox.*;,\tbarebox="$(BAREBOX_BUILDDIR)/barebox";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
 endif
 
@@ -67,13 +67,13 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
 endef
 define MXS_BOOTLETS_SED_LINUX
 	sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
-	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_BUILDDIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
 define MXS_BOOTLETS_SED_UBOOT
-	sed -i 's,[^ *]u_boot.*;,\tu_boot="$(UBOOT_DIR)/u-boot";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
+	sed -i 's,[^ *]u_boot.*;,\tu_boot="$(UBOOT_BUILDDIR)/u-boot";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
