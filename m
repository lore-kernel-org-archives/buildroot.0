Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4346C606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MKz4kHPq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF8660618;
	Fri, 23 Oct 2026 21:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdyKRwRgmRYP; Fri, 23 Oct 2026 21:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 17BF360A7E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792346;
	b=JeRpVAl3J928mz3xfebQ2SOL5lN+irYHoM5xQmxhnrLOzAEV/c6D+/2kk5cT3XRC2HpY
	 9riHdbCOAmGpnO0oMw1en9S5AoEPLkhZNmOE5NVL+lJn3Z/AJ+V5LKo1CSLP+fOCJ37gq
	 OR3xxCZLpUcX8kY7hsUKh29NQ/yRl0rklFSQZiVT8eKXnthEVLASf7BO8+JKA/12GQPVv
	 dxJnIt5NU+loK4X2RwRB9zcmaAcczeSsqAJlQ+o6qYvxpo+m30JSVRB5LfdKL143oDwQV
	 GiywHeZExReS2qEkTmGh0Vp7cEKOgn05RAEka8c83aX1G7XHm6O5jXcZmn9RQtQWEtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792346;
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
	bh=dVcyBdmxK+wScO6dsnXT/BF4LTYXFjjTLulorzEf0jw=;
	b=X+smM1GyS/dvbzuUq3G21rjFj8dYtFnCbKZiJ+GaE6483HknCwkbllXZWzLQj6zAx2+Y
	 y83l2EZ434zKyPuFMhM+gZBOIZZ/t2DZL2iYCPKO+PCm7PLVAkj9CFRcL2R5NetoLft4E
	 +lYuaYClmMQBZKNynQvUSAFBfbVj8wtt32cOGx0dvvrQL8P5xU1VfUHuZ1g0qzaWHcSmP
	 qFmP1QHr5Ym+rTSbOwc2kPuYFkKwxpTCFYEStIdGW/rRQzpuVW2FcN35hBGjVwJBI6jKB
	 GMn3RR44Rp66La1hbNCP/YTWEzcLlu1ekk46qF6KhcNbi5TyYZPfbcmeAGwP5bUVIzg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792346;
	bh=dVcyBdmxK+wScO6dsnXT/BF4LTYXFjjTLulorzEf0jw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MKz4kHPqifNoUT6rpfCW9eMdg+RTNwXi7a8P0jg/2dyeKIEUvQrCq9Lfynpdyxoua
	 pxbBz1YrmXB+Obara/ufHu3b6bH+8tS3onKec5oeNLCqpcnOqzv3j/VSauE7WxNCaS
	 c1XqTNZyxrQFSOhfvDWcIvp7qtPz4QIrI2Fhiod7Rwyk8yRvwgtaMZzDijpLn0SGpZ
	 5eN51aFEkrjuh6eOdvQ1/aQTUCP0Q3KqFBKMbfa35ynJpN1AiIF8Vm2g8wbgrasni5
	 TbEHA7hc5FF7kPrYnX2z3DB5FqOaoUE8bAidzpg1Ynworj/rYo59CFOMEBFA3kzxX5
	 396Qrukz/wWsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17BF360A7E;
	Fri, 23 Oct 2026 21:52:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F0F3D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C1728168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxjFNq4WyL-W for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23F7881696
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792342;
 b=mRzL9m3jvBe7bMX4Uw0iC4S4C4jOp9zunoYin0hSU/asYtEwHr7KFTpI9+zktIyEdHaY
 ZETNrhwSCVclOyPsGzj38bDbTX3yBSsy3FPIZll5WJpQOAofpJv6I7eHLbGJyFL4fIK28
 K2HoRUdAdl/1upyMK75OAOtKBlmU2nXF+T/K39M66z6iUlR4hPiUsqbjYrELInjJv3zXX
 32np/bw84CXkoFnuRpycmEZLqEuhUaJGfGtBLWBX7uIZ66CClUBw/g9KNnBxtrGuF9NWo
 2GWdvkBUTnAzaHnIn/DPmc/s5g3GTnp7tWv8HKsef5pQvtsYHIzbSTq/myAZUMOqB9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792342;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=5j6UFTCqgNr7D9a9vSw+nNuu4B8nAv3IJHn5MjwOCUE=;
 b=ihwUtkAA7JLmSEoe0xblNviAUo859B8YzqvEJMBFbzHAkJomrHFku53BEB70el5B1Vzr
 ytmWmLcYx3HGMwNEXoAgIyV1zLDLcrWeK4WFD9U9v/3ryoEktnksu6P7icbuGixTeZvSL
 obpo5sTrgUGg8LA9tDG7x4kmGlfERQIHBRBmNbVqllzMqGWYNdIpN+J1dY88W4Ne6qXir
 guzItwtn1mSkGtZmdCbqkIkpoZjbjnYtvqLV8od0GLJdxIDkirOYb6uJD7cX4gceSRlyS
 iFnqYm1XXsmxdMSSEXPNlMDfdBo2EgtNLeO/tH3LWjpU96b9AemUwy9AG7/kEgL+Zfg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=gtIimXtR; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::664"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::664; helo=mail-pl1-x664.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x664.google.com (mail-pl1-x664.google.com
 [IPv6:2607:f8b0:4864:20::664])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23F7881696
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:21 +0000 (UTC)
Received: by mail-pl1-x664.google.com with SMTP id
 d9443c01a7336-2ea138a3497so7849125ad.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792341; x=1793397141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5j6UFTCqgNr7D9a9vSw+nNuu4B8nAv3IJHn5MjwOCUE=;
 b=zYUcI0o71KLSn3gx6FBu56hFeX+tkA8jvHqKzuiUpnOS1DYlf3qhq6XehuZb37dAB8
 tJFejqDOLfwgRuoN4AkbZ3uzmqCwMlAHzlFoPadgbs62kuMTnS2nqh/+eif/qdTXP9uL
 YRz6TW8S5Zl8QIFRaxv6bR341MMNRl4cjw4isUB2gmfEBR3j6CKPSO/NTGokDV7KRZaU
 bEcM1yM7yrV3REKWxya8CHUam25rL1hbZLrHdTO+fyNNjbaxPUnHPAKeCCuzykyL05fL
 hXfc1NYcaHx/fzIisvRZghEO5L89PU2q51gwsoQgllgEOAiXuKvgodViFHvusvTBFJI5
 jpxg==
X-Gm-Message-State: AFq9FYLlMX5avxi9+iofmu1BA8kFWF8I5OIB3wPpxFt7LQBHL5WYcna6
 Y4Ryh+W9lfX8CsP/feX+t16BHYp8KFWq26p9ysoMno6Zf9TI4xFb5x+hOPyUJKxim6c2+iEVxhD
 pNipC4SV5MnM44N94mMZOJW18qznBJDrXhXOoBl1rir6hkgV6m1YXmFbDqzOoJBOiYHDz1d33WS
 jQqlzUjOYMq/feYT8rDhJb0HZa3mtLjuBVrZMk3LbKGa+DiwzosoCkfOPSwZy+y8rC4rT0+Xosc
 hLaQ6blrpq7hHpDfsTx
X-Gm-Gg: AYBFou04WVZLm0cn7KpxYBKOqO9DipeSaY/5brD3+jPQVYcX1sFj3b/VPASSAXZD8/q
 vi2Kl816dZXEgY39nowSkOdlhQTsvfLvgnh/IadF6p8hj7d19QPcY+nMX+vLpndPdnLbjGT5iGU
 18EonXFYc1vxHpxN4wswQyWOkVhuNSJll2sfK3uLXK+rnscPTTWCy672ZenYheShdxxnK+Lf0qV
 QdkOlH8ZIWpkZzDtOyS0csAXR5LM1R8ENbeZneFQV86HYVsiYESWOw43Dw7H8b1/FtUSENwVsBw
 PFGjHZSpLQoCx4JEP1wcFQGJTUK+QF9xHOuONaOpwaWC0orKOyqEqFYiCQf2kmGWYC3EEqWqDjq
 apHvNx3M2WS9tm9V6f1vhL196hNrpIgSqA0XC5QctcLVw1JL7XaAHTPLtEi3o9RZTtVzXoQmasK
 JcWdidabKRSG9+Pc7VEfS20JpYKhh5FX/kCzOOE6d9lJk=
X-Received: by 2002:a17:90b:3141:b0:3ac:9a54:e3ce with SMTP id
 98e67ed59e1d1-3adeafb073fmr426142a91.63.1792792341059; 
 Fri, 23 Oct 2026 14:52:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebab0050sm358350a91.0.2026.10.23.14.52.20
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3510d0baf63so3212322eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:19 -0700 (PDT)
X-Received: by 2002:a05:7300:dd49:b0:35e:a225:3ba6 with SMTP id
 5a478bee46e88-369e842b438mr699130eec.13.1792792336920; 
 Fri, 23 Oct 2026 14:52:16 -0700 (PDT)
X-Received: by 2002:a05:7300:dd49:b0:35e:a225:3ba6 with SMTP id
 5a478bee46e88-369e842b438mr699057eec.13.1792792335478; 
 Fri, 23 Oct 2026 14:52:15 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:35 -0700
Message-Id: <20261023215138.2301146-14-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 20/23] linux: support custom logo and devicetree
 files in out-of-tree builds
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
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
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A custom logo and custom devicetree files are added to the kernel
sources, which must not be done in a source directory we do not own.

When either is configured for an out-of-tree build, build from a shadow
of the source directory instead: a tree of real directories containing
symlinks to the files (support/scripts/symlink-tree), where files can
be replaced or added without touching the original. Packages opt in by
setting <pkg>_OUT_OF_TREE_SRCDIR.

Custom files are copied with --remove-destination so that a symlink is
replaced rather than written through.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux.mk               | 34 ++++++++++++++++-----
 package/pkg-generic.mk       |  5 +++-
 support/scripts/symlink-tree | 58 ++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 8 deletions(-)
 create mode 100755 support/scripts/symlink-tree

diff --git a/linux/linux.mk b/linux/linux.mk
index ffec32154222..ab1ab4efe400 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -226,7 +226,7 @@ LINUX_DTSO_NAMES += $(basename $(LINUX_DTSO_LIST))
 define LINUX_COPY_CUSTOM_DTS_FILES
 	$(foreach d, $(LINUX_KERNEL_CUSTOM_DTS_DIR), \
 		@$(call MESSAGE,"Copying devicetree overlay $(d)")$(sep) \
-		$(Q)$(call SYSTEM_RSYNC,$(d),$(LINUX_ARCH_PATH)/boot/dts/)$(sep))
+		$(Q)$(call SYSTEM_RSYNC,$(d),$(LINUX_SRC_ARCH_PATH)/boot/dts/)$(sep))
 endef
 endif
 
@@ -290,14 +290,18 @@ endif
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
 # defconfig file.
 ifeq ($(KERNEL_ARCH),i386)
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
+LINUX_ARCH_SUBDIR = arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
+LINUX_ARCH_SUBDIR = arch/x86
 else ifeq ($(KERNEL_ARCH),sparc64)
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/sparc
+LINUX_ARCH_SUBDIR = arch/sparc
 else
-LINUX_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
+LINUX_ARCH_SUBDIR = arch/$(KERNEL_ARCH)
 endif
+# Build products (images, dtbs) are in the build directory, but the sources
+# of the kernel, to which custom files are added, may be elsewhere.
+LINUX_ARCH_PATH = $(LINUX_DIR)/$(LINUX_ARCH_SUBDIR)
+LINUX_SRC_ARCH_PATH = $(LINUX_SRCDIR)/$(LINUX_ARCH_SUBDIR)
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
@@ -355,13 +359,29 @@ LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PAT
 ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
 LINUX_DEPENDENCIES += host-imagemagick
 define LINUX_KERNEL_CUSTOM_LOGO_CONVERT
+	rm -f $(LINUX_SRCDIR)/drivers/video/logo/logo_linux_clut224.ppm
 	$(HOST_DIR)/bin/convert $(LINUX_KERNEL_CUSTOM_LOGO_PATH) \
 		-dither None -colors 224 -compress none \
-		$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+		$(LINUX_SRCDIR)/drivers/video/logo/logo_linux_clut224.ppm
 endef
 LINUX_PRE_BUILD_HOOKS += LINUX_KERNEL_CUSTOM_LOGO_CONVERT
 endif
 
+# A custom logo or custom devicetree files are added to the kernel sources,
+# which we must not do in a source directory we do not own. In an out-of-tree
+# build, use a shadow of that directory instead: a tree of real directories
+# containing symlinks to the files, so that those can be replaced or added.
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH)$(LINUX_KERNEL_CUSTOM_DTS_DIR)$(LINUX_CUSTOM_DTS_PATH),)
+LINUX_OUT_OF_TREE_SRCDIR = $(BUILD_DIR)/linux-custom-src
+define LINUX_SHADOW_SRCDIR
+	@$(call MESSAGE,"Shadowing $(LINUX_OVERRIDE_SRCDIR) for custom files")
+	support/scripts/symlink-tree -F -l .git $(call qstrip,$(LINUX_OVERRIDE_SRCDIR)) $(LINUX_OUT_OF_TREE_SRCDIR)
+endef
+LINUX_PRE_RSYNC_HOOKS += LINUX_SHADOW_SRCDIR
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
@@ -560,7 +580,7 @@ endif
 define LINUX_BUILD_CMDS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
-		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
+		cp -f --remove-destination $(dts) $(LINUX_SRC_ARCH_PATH)/boot/dts/
 	)
 	$(LINUX_COPY_CUSTOM_DTS_FILES)
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 066396332099..38a254af1edb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -575,7 +575,10 @@ $(2)_STAMP_SRCDIR = $$($(2)_SRCDIR)
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 ifeq ($$($(3)_SUPPORTS_OUT_OF_TREE),YES)
 $(2)_OUT_OF_TREE = YES
-$(2)_SRCDIR = $$(abspath $$(call qstrip,$$($(2)_OVERRIDE_SRCDIR)))
+# A package may need to add files to its sources, which must not be done in
+# the overridden directory: it can then set <pkg>_OUT_OF_TREE_SRCDIR to
+# a shadow of the sources (see support/scripts/symlink-tree).
+$(2)_SRCDIR = $$(or $$($(3)_OUT_OF_TREE_SRCDIR),$$(abspath $$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))))
 $(2)_STAMP_SRCDIR = $$($(2)_BUILDDIR)
 endif
 endif
diff --git a/support/scripts/symlink-tree b/support/scripts/symlink-tree
new file mode 100755
index 000000000000..6c51022dddad
--- /dev/null
+++ b/support/scripts/symlink-tree
@@ -0,0 +1,58 @@
+#!/usr/bin/env bash
+
+# Create a "shadow" of a source tree: a tree of real directories whose
+# files are symlinks to the files of the original tree. Files can then be
+# added to, or replaced in, the shadow, and objects can be built inside it,
+# without ever modifying the original tree.
+#
+# Usage: symlink-tree [-F] [-f NAME]... [-l NAME]... SRC DST
+#
+#   -F       shadow every top-level entry of SRC (default: a single symlink
+#            for each top-level entry)
+#   -f NAME  shadow the top-level directory NAME
+#   -l NAME  only symlink the top-level entry NAME, even with -F
+#
+# DST is wiped and re-created.
+
+set -e
+
+all=false
+farm=" "
+link=" "
+while getopts "Ff:l:" opt; do
+    case "${opt}" in
+    F) all=true ;;
+    f) farm="${farm}${OPTARG} " ;;
+    l) link="${link}${OPTARG} " ;;
+    *) exit 1 ;;
+    esac
+done
+shift $((OPTIND - 1))
+[ $# -eq 2 ] || { echo "usage: ${0##*/} [-F] [-f NAME]... [-l NAME]... SRC DST" >&2; exit 1; }
+
+src="$(readlink -f "${1}")"
+dst="${2}"
+
+# Refuse to wipe anything that does not look like a previous shadow, or
+# that could be (part of) the source tree.
+dst_abs="$(readlink -m "${dst}")"
+case "${src}/" in
+"${dst_abs}"/*) echo "${0##*/}: ${dst} contains the source tree" >&2; exit 1 ;;
+esac
+case "${dst_abs}/" in
+"${src}"/*) echo "${0##*/}: ${dst} is inside the source tree" >&2; exit 1 ;;
+esac
+
+rm -rf "${dst}"
+mkdir -p "${dst}"
+
+for path in "${src}"/* "${src}"/.[!.]* "${src}"/..?*; do
+    [ -e "${path}" ] || [ -L "${path}" ] || continue
+    name="${path##*/}"
+    if [ -d "${path}" ] && [ ! -L "${path}" ] && [[ "${link}" != *" ${name} "* ]] &&
+       { ${all} || [[ "${farm}" == *" ${name} "* ]]; }; then
+        cp -rs "${path}" "${dst}/"
+    else
+        ln -s "${path}" "${dst}/${name}"
+    fi
+done
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
