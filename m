Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3546606A323
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K1ZeITam
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1EA40ABA;
	Fri, 23 Oct 2026 21:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTlawbz5cSTH; Fri, 23 Oct 2026 21:48:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 65B3B40AB5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792114;
	b=llwXFzHLGvDdGt71kPJ0Ga/Dczf3mcqaJMLIErPalIW4dksFXrsqTbHM0L0iOUOKyeIS
	 Ie1xr48VLwytfgCq1mSG7ihCQXFIaQKL1c0h/ZnKXJ7dUsM017d2QAZhps/FLYH7Chqj+
	 BGi6mOqeprCStnWKwZWGBLKq9uoqKynapAWg/y8G5M3v3oVV6RtS+ANm9nMR/ldLRYTFc
	 QDX5TnBzUGHoLWU2L3cliJfgUOGsdEER71Ex8EJlvdfNRfT+0TgXehAYoTyxl0FQliTPz
	 GQZ8PypXS5Y/78VVBJ5X0y8XYroxfTaLGvibvzqckHKL1nIvBxb5vi7szzGJY058m5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792114;
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
	b=ZK9865Ob/R3w3uP9qVAnmNh+j2v/9rKHvLoeb6iNkL2uz/MH8mtOoSbdsf6MT6OrhQNI
	 eehq1fWo6kctv7LH6XIntyG69YkwgU4FWZmU+qNyS0fkhF6GS9cBxCdM6FDzkj6MfVuU8
	 T7VSaK94Kb5YpbPWlS2N7G3BbnWgb7V6tf9AApK4GwpMNZnqE2CzQykgG4ZvdaWLX6tA4
	 g/vONtA549jWLrUpDfX6YsF5VGWsD/2ooz8MkVDnJnZGaCGp1gj37eO4PPzxT0/ZPUREw
	 2kvJezNDMMeupqUXrMFpLwy1uhp1YSqzZG/b8bIMCH6Ijq1rL+Rcm0A/cOxiHvnBgMg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792114;
	bh=vxcZOFFY9jWfaVmGyXufc2bLpU+GnZFGgs1qMBlIS+o=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=K1ZeITam23PWVotvEK6aMl6PlTp4IbWPSTKvTBhFZhSUL9ATwsJue787Q2uDIkmhj
	 yFetu3WMRWHX+Jju7fh3nmLnDYuO5agTKR21i7AVyCWngtqITrrnX88rEbuYB6bBBS
	 Oyec04Xt13ORPZEvbpYxPf6Wr/Wq+ebDoL0X+z9gbYZjj8zJmk1D7UjohoXjjJKY/3
	 oKFJd7KrvVs7hljZmL+9Wx46fyckVDdIU12HoYNr2l28F7UXLcnXlyDLsrOEj/EXLH
	 ZZ98Y+9fSr+zi6Eg+GB/AYApSAlh9JYeH00nMPexSalt1Q29SaNqaGGdGLj8e7Kepl
	 9rk5vGGJXu8mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B3B40AB5;
	Fri, 23 Oct 2026 21:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 729943D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6394C60A7B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQg9uksM8dv0 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 01DCF60A66
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792112;
 b=R0P2J5i87h5A5/echYU6ZH/iyw1mnOeLPQ03WnZrJEE/THhUVv7j1//PyxKALG2+5Ee2
 bbK968VF01nBqmRlRk+Idd6jz/wwbPvp4Mn2kJHnbWgaXwRemHr1/u8uuB3cc2aEBPpZ+
 UJXonDtwzSTZ+NHY4DejFc+3vjxQh+cr1YZtflTL03zmOoDdvCWWnVCjk1ZSH/Ix2ri+5
 DxMg3b+fQ0rqaCjVABXV6mHrO+6WDhlJAWtXNdeTaiQzz2Mx3ptiLUJTWRc3OU8QOlERr
 I8sGn71Cgkhjp4j3HSXmBBxDQFA82CXEXXzRrGIbCwPie7sxpjVkzzchsTuDrwchq4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792112;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=c2eam90CVYr6FpswKUqt17dhkgOL+QLnjOyX5U9/eto=;
 b=m4msfO9lON9KHa2RJ100OTt0sg0+0A55h0/6nSc6l1isD8F76wjV88uo42fP75qEn74T
 stxkgBvuxgtRC7gIV/xvIizbPttot7dM0AVkAeq6mO538TskzktFrSwd+t1QuI2bQdjKG
 QYjwfWh1T4WB2//KzghGZBLUhFlzPkqNjaoa0yIseZwZKNXudBfIjGnZ9VvIrTuKEnygM
 J1SIXfiFeGN9uIFxzfDt/k2CjMjycIqZkd3+Ie3eqBnuBl11T1Gcg00AVPGmUdzkURfcF
 UGucTEVRRXygR4XWdYGfd5PxAfEJk95fGSCdf2tm9QW3hwLudN78z2g5VAuDJuYTOFQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=JZzS97Tm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::763"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::763; helo=mail-qk1-x763.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x763.google.com (mail-qk1-x763.google.com
 [IPv6:2607:f8b0:4864:20::763])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01DCF60A66
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:31 +0000 (UTC)
Received: by mail-qk1-x763.google.com with SMTP id
 af79cd13be357-93f079a63b8so119226885a.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792110; x=1793396910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c2eam90CVYr6FpswKUqt17dhkgOL+QLnjOyX5U9/eto=;
 b=CSRNFLv3FplG+lsA9FfMDPjNsob4f0IvmWKc3+uYDxjY7yGVyogRkqEbGhFUhP4wRR
 yW5KM5bblKsOx7rLCMaM0qrALmuXUqRWf+cid7tXfPzZH8GUi21ajWNODtlp8uBbyvFF
 awszMbgdv9UHBKz9jdONxd6giS6cmKX0EgTKygxw3Ob8KiGBRlh92xIX3TlTnnBYnSNc
 NfXkP/BTQhTASoFvWoM41z1UrvBMwuSLjss4ure2k5YcEae0lgSjugi8arKvhLDObfWS
 WqmaVu9aDLYNBsKW33L5FzQbwqcH0/yBO9cai5EKel7tZB9MFrNZnxOqODsIgCQcC26y
 EFMg==
X-Gm-Message-State: AFq9FYInjoRvs2hd+ZN4qYj+dqwfeGWht0tIrw16qb2lsYx3DnHvYRMR
 0reKLYEVf7a8RKztztmeJd82cYQQnw3Mg6TvxbTmEDcLl5kEq9Zt6a2K8rtYfbiX9GlfIjVb+9x
 EhzB/j9jkoRUama6z8G+2peqDGhrOCnYsMAwalICy+keHHeucuSUFCOa+UTOQ509FQn/ydI2yz+
 HpCKHvy/4gvSzYiu0Pl+AYwOghKMDAjqr1d772qsD/nEmDSG22SInPErhx5l3h7nRvzZSSC4fbd
 tBDv8mJtqLt4klv754Q
X-Gm-Gg: AYBFou12ulCTzbAzd4qPbYL/yOixMVH/ONgX63XVMOb2fPwiLi6gHA3Xhi9FQCicYO7
 yiI1mAc81By620bfO3Hpf5Do4Ki7u9vMskJuHKcyXhPg0rSYIG0dYlb6rQDoeY1vZRwT6fD0kI0
 2vinBh2YjyYb15OxmuIfiDHDL7EcRihzcQulyen9rOYIu0od9agSc7w3EQkOGbOjHz0Dh6lhefG
 tw4ZapoDX6c6pZIGTMLGAC/b19o/Pz1Ki8OeSr0UCziwx3NNszIzjbu5NhjiRKvurSveOB2Hup8
 UuDo6tbiaYzqwc7wpo19Fd0m1GzDmXjB5uOUUPB6S6/ST5QhjHax3VeXAWRwxgTIngtKdrlnvgz
 xKiXCyDfJX3oMebWUozsrZzJLAsA9VJzwyb1HH6PYoounwesvOg4mdvDWxTuM9/SZiGO+3wH1AS
 DeP9B35neDhrDtHx0l+5ZWj9vEKPlDs4Cjhcpb/flCofQ=
X-Received: by 2002:a05:620a:2b82:b0:93c:7d49:7b69 with SMTP id
 af79cd13be357-940ef97b34amr51330385a.60.1792792110226; 
 Fri, 23 Oct 2026 14:48:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f0677243sm2879585a.9.2026.10.23.14.48.29
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f13c143c8so242279985a.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9b:b0:93f:1936:b229 with SMTP id
 af79cd13be357-940ef9be6c0mr51060085a.77.1792792108890; 
 Fri, 23 Oct 2026 14:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9b:b0:93f:1936:b229 with SMTP id
 af79cd13be357-940ef9be6c0mr51054485a.77.1792792108195; 
 Fri, 23 Oct 2026 14:48:28 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:48 -0700
Message-Id: <20261023214807.2151753-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 04/23] boot/boot-wrapper-aarch64: needs
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
