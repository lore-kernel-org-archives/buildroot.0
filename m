Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37122606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gPOq46hC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07213608FE;
	Fri, 23 Oct 2026 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIIfoxhyPwNi; Fri, 23 Oct 2026 21:48:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1817F60A6E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792123;
	b=mTTX4PqIZGcPdSEoos2BT7dTHXz21e498T12fcHPiFjdzXV/+qg1ymB0DbPtStO8qo7v
	 9Y7DMhesmJ6uhnZE3HFAYVJ/NSMLMsMYyDVdLWxFfccArWONFjE4MKQ+sn1hfUfyDGTM0
	 qUhtaEo4ydweqcrvoPOz7nBQsIFqlqSQUXgz9uNKMJaynDGxJqGfZsikn38DWPsTtn4Sq
	 dTajHUdmsT8bdTXbhEYHrdaP+bCCJ6PyhTNfTd5IaJPsE7lbxEv9YnMWPbM129h/5+Ldk
	 ZCmrbJNIduYytf6EkZ/oYm146yo9IoRTs9fFBHmeLG1Ga0JYqxq//ZQLSXwrAkVe73w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792123;
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
	bh=Jcm7I27wuyHtg0ht+hSH9FlhHch12a1IRDRu8exWZJ4=;
	b=T+4ukH2hlOeK5y2Gz6gx/sevEr+PJCbxluJaNj/HczBayLFJCeLgGo3sSNJnfJvKTYmM
	 lRP+bqj93YrusfMEPa6LTwapQr0U9nH0VfLvn8kVqb/Kg7p1Hdkq0LT0264UMROizgGzt
	 6JZhF75GLzykInj+GwNIEvfvxX1VYfJP0+6PTz19vSgQVNsBux/St9R46NjxMwpEPRFc7
	 DbQMNR8gvjVaT97r+ilNuRwe9fJENqcX0AZXByH1iYeQAUMv1nE1GGuQMOXUlZthCD+Ci
	 M3y2lqkaSgqKh1S6OsKFVrEwWkyOU99XBHxmfUcpT5fHPz4dHEOGPTuAqc/E2a1cNFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792123;
	bh=Jcm7I27wuyHtg0ht+hSH9FlhHch12a1IRDRu8exWZJ4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gPOq46hCv9H9QlwsD2Q5sd/hVdlAcyjm9CpK2tBbjGo2VanckLuQLUsawoeeBnCXs
	 zwn4mUlq5bvFEPZ5CvWiXEtEFBjJdaPhKjssxbf7GQ2bAoiCT59LGPJVNRHlj+oj+L
	 IALMrl9GjxhY7a+6ozSQT9z3naz3bdW0cacvjxI+QMLjK710BwuUh6JvXUJXDTISeP
	 D5EzjAPWIupLnjpwBSLHrAbvBCGRluSrRBRDeOxS2IJEVi9MXOV43oQuDLRwThywbc
	 2XOv1JA1QDLuLQcybcqMCkv5iNn1KPxw6YNdDkVIVwAQ140xcuqqPeq7CroDrL+gnQ
	 IT6yisATsVOug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1817F60A6E;
	Fri, 23 Oct 2026 21:48:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C5E479F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E0E060A78
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dAfQfOKnnny for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BCB660A82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792118;
 b=XBG8DXdXTbku3H5KxnNO+x9H6Kvo69FMB+zLCQ5N6djY2ErLjHVYl5V9nIh4T7uyN3mD
 +TKEjb9cFQ4D/Gj8QP2kJOeUawVj+xKcoUZ48DAGf0vhjHuH3TiGm5+ASDA+zjk43L+R0
 Uuf+J8xPKrNYPZxiE0Ux7zzijzByEQI/5C9e/fR7SrETcFpoTYKxIVxvXsK9tnEGuC2re
 VUJlMjIj+czV5IRt3HKvdoPcCU1zWJHJnio1vyfpfamvKiv75J+bsDre38+7bSbQFrQNB
 ZOHQ3Ep/FeQtE19tjiTocsK0oLwVBc/7iZj8v8F9KvRkBLo0ZuyJ8S3YaRdedat2czA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792118;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=h7tFvN0m6SnePsvzoN5sRt8FjLEuxKDeQQeKamwroyo=;
 b=KeuWRtQAvMCryHkHu1OyhAzXu4w31R/L4Hdt3FhwyoCfA6nAZVuohuUu0x9b/QDfIR1r
 XKgbWckC9VXOdmcf2LLzO3LdnV2CVpN18Gr/xVjti5LCO0iJg3QZLbma5qq1mA9yVOIWT
 0QGvuRdekXUJowuzHw/9FF7RoqAwL0IObIXW2XtahDK6BtOMh8q3MKFlDeDlDjIRoPxk1
 Qxf5Mh4ye5q4O23LWENifjVBbn7oRLeN2yrIR3yR9JZh722tInGbQpNY/LZG8aGXBGf47
 3eDUMBzC8G09HqQ1NheT5npkcm6I5jzbiTTCQzjmqyKR1araA6QlMlLgxoBPga0+9dQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="gg/0wmTG"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::661"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::661; helo=mail-pl1-x661.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x661.google.com (mail-pl1-x661.google.com
 [IPv6:2607:f8b0:4864:20::661])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BCB660A82
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:37 +0000 (UTC)
Received: by mail-pl1-x661.google.com with SMTP id
 d9443c01a7336-2db80fcdf8bso7506885ad.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792117; x=1793396917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h7tFvN0m6SnePsvzoN5sRt8FjLEuxKDeQQeKamwroyo=;
 b=pqxA917cAeG7KgE6tijgbyYpF4M4mw/e/CfQ7S6VSNTxKEMzpBgX3kjj8mjVzVYkib
 fJ3qfDgUM7WOsaYfSiSbBCkU6/ot4e0crXsEvTeGytVws9BQ31W+esl/w3tz5csw7ljU
 Wco+WWkwJPnqnY1+BcdriAj80AnLumBOwwR/TPpChDlDTBvEAVga9G6R/ExOS/l/LIV6
 mQzuBVslUR4PNtIK1SW7Fge2algLrDBVCfDMNWO1Pcmv3Mhn1AG7lbKOwMPXJmQ942EL
 +mQcjS2XFYIBo27smhSUCtA7k0Ot6gdNxqhE9uHULlgFBewZB4fVgqTN4zahv3wOcwE4
 EluQ==
X-Gm-Message-State: AFq9FYKWD2DiLlceMqrkVLhbH6h65H+NPL1dO+lCDSjzn+KvrMo0vW8+
 tHJUAZBknczZ31QsgfzELkcGMt8SjVczhE5z2redFeBiBRVUTVy58Dp3R++RRdgaYMuvIWHoSY6
 9QpfEM/MRAIkycR9lprztP6M86DmHnz3j6uyXTYxHOmMjW4XdMWhQNxUpBHZaLfSv7AqNI4ffAZ
 Pknh29glhtqok1zJwo9VZjvVFzkhTeKAkuqBGg+4a6H7tEbINZetMiilFLyZkUhyVtCpIjmCxLQ
 o3zXY+PuKHSfBO8mw==
X-Gm-Gg: AYBFou2vRh6AYzqX57wmXFBJMeGGzLkx3sVXLRM9FSHIzZ3Nuii0ueQxGMkaGldSG/I
 WFC2JLd6y2HRQzPvsMzssL50u6161FHjmHNsN+Wesn9PSW3o1toJp0Q/1P8+aKZxGjN5CggKr4T
 TtrYGr2jUz6fxS5ST77+K1H4Yanqt4J57xhh5bugGY+LaCBLywWc2akj01wTsAqicepQTipBpyx
 B53mJstOvA3yDjzcUbKHhzWeZ45U0ps+Yx3B8uebsDW8K7sfZbreNFEBJ8MeNa+o5m0ZHs+JUFV
 ySDqNxB+KdxEcjYlCX2pumtAXFME579A68XSTffWJBHmymlVz2L8Ix82czu752o47nt9+3KzPET
 knxcNv2BSwXxI6MOq9DYdZ2Z3cVW52wGBtvGdIEmzqeVhzVkGwmwBoa6hVdRMYP56PCscFPM2Y5
 JbmA6y0X1mqugKH51gkEVPnIcT07eyqJRlUWZGmvjcaOE=
X-Received: by 2002:a17:90b:57cd:b0:3a7:a6bc:9d58 with SMTP id
 98e67ed59e1d1-3adeb0f1869mr386695a91.54.1792792117064; 
 Fri, 23 Oct 2026 14:48:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebb97dd8sm357402a91.2.2026.10.23.14.48.36
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93e92aad34aso270909985a.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:939:ff85:8067 with SMTP id
 af79cd13be357-940ef938c52mr50629685a.30.1792792115589; 
 Fri, 23 Oct 2026 14:48:35 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:939:ff85:8067 with SMTP id
 af79cd13be357-940ef938c52mr50624285a.30.1792792114954; 
 Fri, 23 Oct 2026 14:48:34 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:50 -0700
Message-Id: <20261023214807.2151753-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 06/23] linux/extensions: point to proper _SRCDIR
 and @D
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 David Lechner <david@lechnology.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
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
make the linux extensions look in the correct locations.

The patches or scripts are located in the source direcotries of the
extensions, so look there.

Also, the externsions are run as part of the various infra hooks, so
they have access to @D, so use that instead of LINUX_DIR.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc Christian Stewart <christian@paral.in>
Cc: David Lechner <david@lechnology.com>
(cherry picked from commit 301dfb34380dfaeb5c32e71758aa1c3706140301)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux-ext-rtai.mk    | 8 ++++----
 linux/linux-ext-xenomai.mk | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 50f79f8d5047..d7f55cf55f41 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -18,10 +18,10 @@ endif
 
 # Prepare kernel patch
 define RTAI_PREPARE_KERNEL
-	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
-	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR) \
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ \
+	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) --no-print-directory -s kernelversion` ; \
+	if test -f $(RTAI_SRCDIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
+		$(APPLY_PATCHES) $(@D) \
+			$(RTAI_SRCDIR)/base/arch/$(RTAI_ARCH)/patches/ \
 			hal-linux-$${kver}-*patch ; \
 	else \
 		echo "No RTAI patch for your kernel version" ; \
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 5ec6891bbf20..0ebb771d8940 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -27,8 +27,8 @@ endif
 
 # Prepare kernel patch
 define XENOMAI_PREPARE_KERNEL
-	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
-		--linux=$(LINUX_DIR) \
+	$(XENOMAI_SRCDIR)/scripts/prepare-kernel.sh \
+		--linux=$(@D) \
 		--arch=$(KERNEL_ARCH) \
 		$(XENOMAI_ADEOS_OPTS) \
 		--verbose
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
