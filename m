Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049A606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bWx5+K8d
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700FE409E9;
	Wed, 28 Oct 2026 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw3O977kjKbf; Wed, 28 Oct 2026 21:38:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73656409EA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223489;
	b=FbMQrYyqD9n/1JGOvsXrL/WDpvMta1utyL0impR+LCKXssV0Z2jT3Zbbogt29ymvXUzX
	 4PImsXsaSFrpkrpABjJJfK8xQKC/Lz9Q1grEnBGL+pNJdzdYrto5zV1qBTdwBwyM3G5Tz
	 22DgLsZIbohVEdEGfLz4cZe4ni3gLbIHcljoe4pXwUDs/WmHKPwONfwrDyZuLTD7Yg7G/
	 0oeCActMVdZHYVAfqq7qiFO5e8j3S99SQYe1yPfwov9IFqWwdzDUca8bEW+PxKfS9oIke
	 Z1B2s3B6CDXnIAfmRxRU8/sHJ50a0Qy/z6jqFLObJhpvYSe4dNLlim92n98aHFQTQeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223489;
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
	bh=vxcZOFFY9jWfaVmGyXufc2bLpU+GnZFGgs1qMBlIS+o=;
	b=VXkRTjxyu7bJjglupxLZ/QhByvlKXquqeQ2bcq222u2ylj1nB/A/m8gs/uL3A+6rFeUO
	 L3tc74i25USuozKjnuXSRCZL5CzvJiIs3H0EccVCTnBVVZi9lTGqv5UzfVoiHWKevXJS2
	 tIXT3T+BeSejydcmD1XdT5gVv5ZHh8Tw33kAlaY0eTWO1J9wy3z4ez92pNB1Hb2lc6vYm
	 +ODDGwTC8DKhpkMkQy++rOp6e8GyQ6/scoxRy6aKTtb46BurW/8pQq9Sy5Efby98dlrSZ
	 f5phRdC20mVe32uIN1sZssEr2Y7rzDHVqVXWNsEV2mtk/JrXM96UZmOEuhkySESecRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223489;
	bh=vxcZOFFY9jWfaVmGyXufc2bLpU+GnZFGgs1qMBlIS+o=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=bWx5+K8dKBb9SlEU0/ShEZJ/R0CfpjqoeG+YBSO5p7fvAtjVcQrvT85z607AyFYyJ
	 7OYHyIxmaoXu6Be4r+KZvQBmAsjgvnAlDKEo4LOcKBQ3lrJYSsAFLBt/ty0aKnSeF4
	 ZA4WdvXQ3elY+o69GEMKWAq8G0xM/NN7fEdbM7L65VvPtL4uUuxDlmpBykPv5+Uynb
	 3UYRELzuGiA9k4V2wOi0poXpAGrOtVWk1QcoCKFycznO7AoxGdK3Y29iVWpKA3chP9
	 TcNagIXrTNQFGq5cy4JhTsj4l2yxuKeC/bSiFydMXVlwl/dPJECi1qxPef1VmIshr1
	 VxvjPYtBGjhLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73656409EA;
	Wed, 28 Oct 2026 21:38:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D46BE2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6D7C409C7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6DHS1HTlk1F for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DC1C5409D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223486;
 b=TCnLH5jZs5sEUGOVzwFuxl3CKFjDVTB7FV5TH85vGIHirO4bAYFnCMaK7JEld1jckrZ8
 xvrAZnVHjfJnbiGvdihqSCjONWFR7YJS4n2Jk7qNLHbyWIwvw5KnMEoi9ZPuWvQXfamsK
 sJ1Z/nQUMJLYbyElS5U6DYGCorUZEpqCpKpVDZeBesvZi5BKtuxaEZlR60i4ZmEElDZvV
 Psc5/qGelteRTIFFZSTBEMtfKYP0H1O5UhFckKr6weZ+PwXR50n3lHgB6nhJK5kTTBgr5
 nTzyL/9BnR3EsrFUh6yqAOwgwd29pJWucWxf9FNeWbWkCI8C/nU5n+6Yt//CImBK5wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223486;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=c2eam90CVYr6FpswKUqt17dhkgOL+QLnjOyX5U9/eto=;
 b=Dl1/91cWcKZGoNnDO7y5B1Rk4fBjWN01rNIUe6kOY2rE9zCcN4o/AaU1jxCwjZlEosyR
 IkEoHupgu+BMgNL+FWDPXY47fzkBaOnIKHaN1lNDo6EcY2L2Qc54HLB8hwCinFaOVZeH2
 wtg93SkV/MBd1tbeuO9c8PbnSHF6hhTVkNMIO0R9+W2vyYxTJjgI9aQZdPON/bIQSPx53
 DBx8va+TNZM/3tY6tvwvGgt/BRX8ZN6F91CZVoSdLT1EpdZr2/vOdBBVIe5Z+Kwm3YEC7
 DeEPIwz89d3LfOP0PYj2MyQfWy3JD8II9uz2heoLKaynXWqEEKdHezVgLV9IQRx8iCg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=hBPyRxKV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::564"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC1C5409D7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:05 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-cd6a7b62ce8so731916a12.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223485; x=1793828285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c2eam90CVYr6FpswKUqt17dhkgOL+QLnjOyX5U9/eto=;
 b=qts7o0ScfMJQRKvcHDRQUPhXI9VXJ5/5QuPfz13sF8IPQnkgLdbgQuO96WILwvC2+H
 K6AGL3v5t8/JuE5mM3fhh/itWO4lwkDepzhF/TZt/3y8gyvD7iGGfsbP2LirMDuguDJM
 0xk8wOeRUxrZPjJDDax5gWyJ1nlZ9HRionB/GPIvXRuuVb272NEx/ryiuJcq9C6gdi8G
 6Ft3TlI/TU8EmIU/1G8GVlkcoHj9aHY0cfK0m8Jbcx4Ctwnnp9DmKuSkDVHGFMcTat5l
 meUx19K4CvgvEbRyif5C5FEIAsp+fDsEVWdVmCi7M5fYHo6JFZRLu6XI3z3kKEJGZ3U7
 CHkg==
X-Gm-Message-State: AFq9FYIzcukrdDqO0U7VcYP8sPnlMIni567WUO1zkMYFNotEpgat9XOJ
 BFdQDHgpKTU+gcWXgbAfg7g72awcKUFmD9ADwDBjR5o7PdOIFLU/cXsB3y673eTnSSajuQEfPBb
 hivp0YufSZGdM5oV/YCzODqmbjzDkguegTVnhJsnB+wQeTIx8nVDv1BOXw0VAyoj2wzQoD2EVXZ
 NdsCLlKna6GknF+tdaq3BfQspEZX44DNaLqdVW2/hfUup0/NsJGTGGbgO8uHbI/UG6KKFi+CC+Y
 m86HaqjSTumyI/iWQ==
X-Gm-Gg: AYBFou1Ev3hmhRzsQ/syw0bJuoZRrN85SPJvhKwBC7HAeiYxv/43yScpmovJWd9TvQx
 yf98/AShCE1Qxg153YdTfCeVfC8ZeHLCMJxtflrdzVdFsBgkWTmu7wuhwHISEdHTB9iWPSNq12y
 pCpwQXl6+JjX/RatA48e80VG5lJcnRYhtwRXw32ph8Lj9WdUq9HJr52vzFXzfo/stgOfZuLzOM1
 IujY2pSioKHHbaj+Xwl8rK7m/3hB5CH1B3L6yAJefV6x0BmNS89xUWq5QnC4O0F08a9GrGTnKq5
 wQN3t77TUClYh/MME4yJF7rVrAoYOEvSWajEvL3dcWyLyN/0qZrr6cVmoKS3Ez1lQ3i0pdwzFVU
 sFSK9zwLBVTeWuaMXthneQU4J9+h8Pt7WH200B9c83ePvoyfGl7POy14oJuVE0U2BTVX81CPWt+
 4EcZ+ihghUyiqV6buTi1XsR1Q3tUBnbJONByBELm34
X-Received: by 2002:a17:90a:e7c1:b0:3ab:f38:2b43 with SMTP id
 98e67ed59e1d1-3ae5811551bmr2369060a91.34.1793223484601; 
 Wed, 28 Oct 2026 14:38:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae57a49b63sm870987a91.3.2026.10.28.14.38.04
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91c84eef313so16199416d6.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:03 -0700 (PDT)
X-Received: by 2002:ad4:5aec:0:b0:914:4464:41a9 with SMTP id
 6a1803df08f44-91c7cf8fb63mr57921176d6.29.1793223482998; 
 Wed, 28 Oct 2026 14:38:02 -0700 (PDT)
X-Received: by 2002:ad4:5aec:0:b0:914:4464:41a9 with SMTP id
 6a1803df08f44-91c7cf8fb63mr57920716d6.29.1793223482412; 
 Wed, 28 Oct 2026 14:38:02 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a69129sm139827476d6.4.2026.10.28.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:38:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:25 -0700
Message-Id: <20261028213744.511429-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 04/23] boot/boot-wrapper-aarch64: needs
 LINUX_BUILDDIR
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

In preparation for the split between the source and build directories,
make boot-wrapper-aarch64 look in the correct location.

boot-wrapper-aarch64 needs access to the kerenl build directory:

    $ ./configure --help
      --with-kernel-dir       specify the root Linux kernel build directory

Make it so.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f22ee04de55cf7a41368a7be905b15df240aa8ad)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 75be23f24333..f9f8e3cf49d1 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -19,7 +19,7 @@ BOOT_WRAPPER_AARCH64_AUTORECONF = YES
 BOOT_WRAPPER_AARCH64_DTB = $(LINUX_DIR)/arch/arm64/boot/dts/$(basename $(call qstrip,$(BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS))).dtb
 
 BOOT_WRAPPER_AARCH64_CONF_OPTS = \
-	--with-kernel-dir=$(LINUX_DIR) \
+	--with-kernel-dir=$(LINUX_BUILDDIR) \
 	--with-dtb=$(BOOT_WRAPPER_AARCH64_DTB) \
 	--with-cmdline=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS)
 
@@ -39,9 +39,9 @@ endif
 # AC_CHECK_FILE tests, which are always disabled in cross-compilation
 # situations.
 BOOT_WRAPPER_AARCH64_CONF_ENV = \
-	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_DIR))=yes \
-	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_DIR)$(BOOT_WRAPPER_AARCH64_DTB))=yes \
-	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_DIR)/arch/arm64/boot/Image)=yes
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_BUILDDIR))=yes \
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_BUILDDIR)$(BOOT_WRAPPER_AARCH64_DTB))=yes \
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(LINUX_BUILDDIR)/arch/arm64/boot/Image)=yes
 
 define BOOT_WRAPPER_AARCH64_INSTALL_IMAGES_CMDS
 	cp $(@D)/linux-system.axf $(BINARIES_DIR)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
