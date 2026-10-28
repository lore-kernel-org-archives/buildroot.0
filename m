Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B2606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pJlyoe9A
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42E4409B6;
	Wed, 28 Oct 2026 21:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WN0FV7I7Z8tz; Wed, 28 Oct 2026 21:38:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E6EFC409AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223523;
	b=UhIGvsu4pJswgkPcsODvJWEZPk5WqyhSz0SUaYskUlfAVIzB5Y9rkrp5NvK/f3hjekr8
	 9HiJSUjMJ35UkWGnbiZ1N2DQVnRLoC0n8yNMcRPJ+jphOpFqiV7ysLqR57njz/oKD9pMS
	 anRE6wEY1vGqszivWCS5o/ankdqM8zzWOVWl8LiK3nsegnQL1tOVh+nP9ALF2rB02QC+Y
	 mcMf6Fs9Vwg5aKfPO+uLEiZT/vqLlEXMfB/lM9AslwzMxMVHtKeaLvAx9POjI5Xy7GuVt
	 Ag1qJM+HeGN4R2fBa32yuuHCizkPck/VGX3mRFqbvh+Ss65lYqlDuSjSi11BQ4bvYJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223523;
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
	b=E0EOxqIvqK0HG1mJ0B8wyF+3eAniu2cmfGsmtUSmHwhGJkN0TCvqGCXmQS3Ey1VDOcAF
	 QY/vWVN2zZF4G3j7iDcI5HRX7FeXoFU2wPrQOCuIYgCHuT0n90SAenN7D4pcVAZu8zkFh
	 iy5FsAtAiDlmIwIr/k2aYsEoJX2obKtXNY7X+KbGYZncZuui87a5OWiEuNbMEe9uhWEFX
	 JCznN0gz9F1x3+o7Th6qBIVMDxypslT6gTg42hVEGkIemmlVZN4wt6kO9XE/EaOkkNIaO
	 z5/JUiK3Es3lot+zE5sx1KHleTxRIfKA9YwODAmTI2Y8nzrvwFg0Ux2CvJSRSl3i0jg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223523;
	bh=eaWSkoqv6DfNogA8//yc66ko21/Q7sLSvuxeunev6Yk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pJlyoe9ASgh8gtugRvTUIspBih1DZapIejmSPEaEcWC4k96p7bMb40PDrj2ms1iZ2
	 TxG4MH/0RLCC46gHSWwBZJHsn55ZiFrh2tWpUGS9AkxnNxXYrtVI+fs/xbsedktsPd
	 XEmxTN/taB0SSQ/FmgMicb5gMa03nfYL5zSxQCzcMWfM1l5sdW+slncLq5WRAWGV/J
	 IHuPs1nisqBMsAWZGbe0guniVP9e8poT1Ozl9nN6rdjQe+/76cBQJT9D1uLLz3XlWf
	 WMc1216m12Zj+1QuuMTC0PCvrtPMM1Q2ZfVo/+v/oHvFW6q7k8+rTzecKo40Q0OKD7
	 rzfE/BtFah5pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6EFC409AE;
	Wed, 28 Oct 2026 21:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5290E235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38D0260782
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fD4ovmNkgf-x for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87ADC60725
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223520;
 b=MhgFvfRZqLvw+woAi249RBwMNHfL6hX845re79x9Nv4kBzl0ULVqcD+3XQhJakPTi1cx
 x2k4gDM+xsNAKUxY4Ya+AksFV7GGwwLhSNLtDWxx1zeX+tsFspiWyGkEh2syZW8f+372T
 3KzsXFgHJ6m3GNHhx16JMLe6OLfaLlB+uXipC8Cj7nYn829OBRHhmlukevQEddcN6WUlu
 Toki9lcaRLXUyBgcrLJKx/SLupzY6mkicEMjUnrDMNyuRn/HT2yupGd+ebCu+jKmr7isx
 IeD6fON+tZ0cioDuZiWrWP0RYOhb8FpC6Qah5tkgKfWLiHLkU95B0Nj53dloAO+Gsag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223520;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=dX1xF2yAMsyFKjGasdzWWJMpoe2rPAOpzlH2cPDIeo8=;
 b=NH3c8vFRLtvNEBRZSyWkUwQEIC2KSRTlmM/XiB/x9svjL4QOVkH97AskSAkuTLz+Hd/H
 Rg6u2Jkw2u9On2bmsRpxhGbFpbVySezz6VMQ+4QtjD6m5NBK+UO3jt1IdY0DrSdm2jUVU
 SZsOa35nW2LiqbC5DRIu/SPsPzz+TCqeYLvd17876EVUZ27n074abGOTWu6DuHkMl6O5n
 nzsP4relRVSHjvsD6uuPg5wdSNcqm02IiX5oOzVwmA5hS8jY72rsbGRU/IPCR26OF/6rI
 t1upVMKKD6Xgx4apl7aCcRBgjyrjT2WHU842IvPqmzoxyLh7KWhWKcjiKzcsGNXkMKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=KgiC4mh1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1262"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1262; helo=mail-dl1-x1262.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-dl1-x1262.google.com (mail-dl1-x1262.google.com
 [IPv6:2607:f8b0:4864:20::1262])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87ADC60725
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:39 +0000 (UTC)
Received: by mail-dl1-x1262.google.com with SMTP id
 a92af1059eb24-188406bb948so1383213c88.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223519; x=1793828319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dX1xF2yAMsyFKjGasdzWWJMpoe2rPAOpzlH2cPDIeo8=;
 b=IHfvs3dXqQ17KzxqbWOZvAzvWVGgZan+E/RGCX4eLUGQzCewzvvlvTDYm/Q4aqqM5I
 hSeNDvmNbBk1EvUqJKscB08veVdpqQvZ3xB2wa/PQ5ozZN9zbutSQKMRE8nH9Jniyanq
 Gje+aDrrG180R37LWlpcclT0o0kDJG34e1713XeCSfHKZ61UFrT9bJrgFoHDx/eaarYv
 E2pwBwDI/PP5fPlIsRGi44REjE83mpMPMmlveDyWovwJQCQuURdMqctqu6ZlHkDiHDGx
 No6k9mtwn0ar4bQ/gilSomud2Cn6xegCI0MApwlqW1wtyPrh/oRVB/wV8sqRIG1d63wZ
 TXwA==
X-Gm-Message-State: AFq9FYLXOs3tyPMwdrAKFJEOnyjF0SU339Vr6rVxxRnhXSkuCeBhoqS8
 ryqzXa8vGD20wyoIn4wo61nAeITj1Skb8tnu2ySUJ3dG5giCUUz7f7y69np3hvxqZAyRHMYFEWp
 nopVfbcTb4Kav2KxJ4woPxLjTv98qrsvL4WLWMT1Ps+iC5iGG8wttnqDpXI7XI9HHI6Iyo29Wwi
 +EZDMbx/dnDpY7fKS/jS8X8Gy535SVFJQ4lnkBUuwDyWmD0RhFRTRCjFPKlKHGjink2/wqLSvCh
 Yd+f/fBLlgXj4RQqg==
X-Gm-Gg: AYBFou1U/QYoKmk3qnGvpuECT5yJwiZ00vof9OcMnqdLrMqqelmsMzeBJVN3eG6f5gn
 2h2yQCq494uUbWDrGtz4G1c7NIBmkk9Du9TqEYEDPFI7d/hDDH5IOrkM0c8NjlR+tBZW5HDM5/b
 jCst/tkbvwmUgntB8U1QskiJRz1fVlCF2HR89/MahgHVzV1I3oqgmpegOsbvVXJOtVtuN/GAGTw
 1ar6EkTRPa8iXGqMOrbLHlOhufWqlSnbUl/+DzSl6tfBNMneaaE5HE882iOpcjACiiUMIiDCDr3
 jgkevCN9yCPUz3VRjmhQmBLodemT5An+XCq8HVsKoW91/hxo3kwrYC+B/UKZYGzDjDN7sscPxha
 xR/OPESdPvVYUsBI4a6xeK/wZMyyW85whYtHJvWTsDHRVYHsz/CLalBaWqlEcMq49J2y+PmfRiS
 Uf/IH++0JMqNmgzZad1JhGeYU7V0VcOsvwbzPCcOtQYFc=
X-Received: by 2002:a05:701b:2511:b0:1a4:fac9:aeee with SMTP id
 a92af1059eb24-1a6c87bc707mr4002291c88.4.1793223518564; 
 Wed, 28 Oct 2026 14:38:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 a92af1059eb24-1a75457afd4sm16127c88.0.2026.10.28.14.38.38
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5376f1853bfso31954321cf.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:344:b0:533:370c:7600 with SMTP id
 d75a77b69052e-53fcb20df9cmr66779161cf.27.1793223517175; 
 Wed, 28 Oct 2026 14:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:344:b0:533:370c:7600 with SMTP id
 d75a77b69052e-53fcb20df9cmr66778631cf.27.1793223516548; 
 Wed, 28 Oct 2026 14:38:36 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c38easm114397821cf.7.2026.10.28.14.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:38:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:26 -0700
Message-Id: <20261028213744.511429-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 05/23] boot/mxs-bootlets: needs (BAREBOX,
 LINUX, UBOOT)_BUILDDIR
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
