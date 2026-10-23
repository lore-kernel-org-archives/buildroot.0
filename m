Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C957F606A325
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TgRtDvkW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D7140ABA;
	Fri, 23 Oct 2026 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6evlaLa5tEm; Fri, 23 Oct 2026 21:52:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35A8040ABE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792332;
	b=QaEFzMwbVDvGJOBmvLtt0OiId25M8O5+1CRU+svaCLCFmt8gkaBpVYNRJ8+8/+sesnpH
	 Ba8R27oyXEfFc59MAmJG/fQLF489sT+16D2S8yz9L94Zd/6KWk+Xwsv7Xe+Qa6m2KPESU
	 mOYm0BpVFZcdedOktYxSnvwI3xW54xYzASaUqxfYm6pwEtRxWMCdLjEEXyWyyI2Rpi7FE
	 O6DFU38PqT1KmVPSoq2Cld1tEInOG6cM5gSBaN/ScpAR6jVw6wbpj3yq/pOQUdcihAvQ5
	 BOYMpVuCL2m6WuduGHsYVl8p+WEiIzxyk6PUks1ZtIKNcNMqWfTedokIeRs1bZUTUog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792332;
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
	bh=UPu3yG0z7eHDwGEUy2pu23Id+JMNiWNd7EXaRjWuOZs=;
	b=nGwp+Dc/qPiNNobX6gA23hVHPGFwVdBUQWR8KLfVL3Cf932A61cHA9/qmzcfjpJJoTDa
	 ijyCxKwls+qtx4NIAokugjFE+BBMlOqVi854TZTEvcx3h4zoZtn2nFFZe7pkMYqxmRJO2
	 pXkvaRwVAMWsH0ubOB37CtSDtA0zOHohduXZK8RG50h8i62TxT7xQpYlw0pv1d4ieVzjc
	 QETXlH7fLyl9XHGMzmlLE6fuBHi4OG81cy6XfkLsx/46MyDviF0R7dY3kkO6jir2J4ENR
	 J/sJI8rAZRlHyzxWLU6jNBUtZT4G2hjuvGTFcLvm1QYi9/f/KKA6RoXi2qVWqQD6L8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792332;
	bh=UPu3yG0z7eHDwGEUy2pu23Id+JMNiWNd7EXaRjWuOZs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=TgRtDvkWncGSTwDR8v2WzIpGQke+J+G2DciKgM7T4KrfZ7OqtxsJR340stTAPCyW6
	 WgsavIKGMghRDeYj2HBtOyxx4n0hIwUpnDoN8teyoWfB3ksB/hK/lD20IQ4eBENNEz
	 lgKfiWIsEdB9CiLVmCU9RBvj46ZeGkGr16jrCvnCFHIHx1q8sGNApxdkgerr+2mDgq
	 z4O4nj2Jx9664Meq/pesNJ5SmVx6ynvGy2+pgSVi4TRy8cEl6LEg14t6qN4pyA6G+R
	 4N/NqF8/pIE37ZdJQhJVekPaDcG371OnzjSB2dKeBRrIK463BkEHXQYXMYVq5r56BK
	 2k897Mvzvp00Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A8040ABE;
	Fri, 23 Oct 2026 21:52:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD623D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E19040AB5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atBg6STWkz2s for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 78A4C40AB1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792325;
 b=dceqla+X7NRCEXyt2yWhvHN/xyxWp5BBcts89CM24edbBXuPTsVNh3tJDBNFPJDqCkDP
 ddBO+mLSLhUxRC1X2DzMzZKHEzgmlesesQ8D6WqsHkp6GMYtuZ59ZsCMqlTmW8lk4nBlN
 QPPSXySCOJdCTqryIMR4d/ydLC66ypINPeCdPP2TjPtoKsHMqRnVmEYMyKSBPK3WfANF2
 1S5gSi6atPeTqQK8LjlbS0sFMRLBHqI8Ezle7m12uTwZ50ptkaSKMW1gGvmJjve157D6A
 aHN3DBTiboNEwAsfdWpchq4RKzMGd2morTbROpxjp2n6Pwge9uWvOc5F89IO3sIxcWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792325;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=LLU/jj8g+FJ5d9nCMwKZZuUUgscn9NVE/ZHcqE8/3X4=;
 b=rgNHoPM8Tc27VHlM8AWkT5uzWrCN7ceEWGqTPmjV3BMHGmMEHPI3pCYala998srJ6BAO
 +8pRwsQxa1CFtSt9/Mn8iTr9IV5Uh1gJjm78v+osmsEeQCVnvLmPPYoRwPutyAkO4Jckz
 mG3gwW7JthjjpkyT//KYmwEm1B3jzd39fyUlBkzzPP7BnIpIzoowFA4FulpsJaMif1KEP
 19G9AeY5zGg6R1PnbdxPNlLjpFiQw66mEx3RPK1bX/5KxlYgRu/zl71k0H/GaLv1ebK0x
 18ccCnU7yA8vF4SWor+sodfN3fY1s9XjPm2cIX5kQ+IpBOPmuMHnpStNgwOfvRVVIFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b="W/pynkVc"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::762"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::762; helo=mail-qk1-x762.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-qk1-x762.google.com (mail-qk1-x762.google.com
 [IPv6:2607:f8b0:4864:20::762])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78A4C40AB1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:04 +0000 (UTC)
Received: by mail-qk1-x762.google.com with SMTP id
 af79cd13be357-93f1cf92c9eso150263685a.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792324; x=1793397124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LLU/jj8g+FJ5d9nCMwKZZuUUgscn9NVE/ZHcqE8/3X4=;
 b=Ub0/xeEYUbV9vECo/DUSDK2ohZ7zhenKbXDvMSHluOvzqVGumPg00haHjR0VOMd12I
 oZG30gfb6ieMU+yvTWpgZPFtsZJY2V4foGQpHll3QwAcfZ7FmDRtdIsfd4M2Dkavy/6c
 aX6tTFGt2369VrXVqzhBX9HiRG9ryQ2hwZPf245deVx2zwvL0keTNO+J2UvVKaUvzvaG
 wqNwKFprIPPdzv/nK/6epM3velwEk8srvl0pXnOGga6sCnWPrZwzstQ5+RIJfVMlS3Qw
 MLIqwU3b7OwX5fprbCKwmpFowBkLYOdAw4fDe7mkdzoPmzqvZ80LXnvh9zLn/hmP9puj
 ALGQ==
X-Gm-Message-State: AFq9FYK7leICVbbDkV38Ox4N3r2opPmUxV1L3E/7sb4HiePeYnvaO2bS
 s1/f66hoVEikyYEHxqZb2YZPtt5Ptp0kcKniuj+07FzHmwCpg4YpQDxpaxT8Wg+Jv2TaevMIT65
 yCoYWC2FmjA+tqEplXyjTK0L3mmvjDXeBx0gTt1cxBOGesefdTKuaBbktn8kr12kcjlnAhMLEdX
 v47ryiOLYPcgwr/ZLjLT9GoVfCyAflPoHfesHd+QQAFmT+XNXAiQyLprdGemnjLIwAi4msJRXMs
 N15hdXo4KPMwy+disKv
X-Gm-Gg: AYBFou0xq5NIyawe6H/a1EeBX+OdKk2LcekOjwApWWfhyqvsKmTzWSeIe7kpNQtUPTF
 KVPfb2d17Bx7nvi3O7U1PAnti8/rswV4GRKmlO2WARisOx8zyuFOHjporoU+kCp1bTxMvgLEjOn
 jCesd2ofE+GuygGE5KTH4nYGprvlPssLu6RB+L5QCAyspur7C2xZOEceuhsxHniQpjQkXgTKLhK
 oeM3C1l1EXLuPIg2NOMqH5a8j/PsM105dKQg/ch6gNNVLUVU7meaSAdkreeSeKP98A+byyClmFm
 bUK/oDL7Z/q3pyakf+WDwNXmM0bcpl6u0YANq2Nqijg5FMF4WuW3z2R1/9ME23paYXW0rAe5Vs3
 zpi3H+AT7S3HUOJ8n3iBnC0hFdPCiL+su6RcX1l5PBHgkrf/QfyGI7pKi/TEZ7lmlUUy+e7dgX7
 533zTUh0gVdC00/WFhjbhjwyBt5udAwFiJy+j73f1HaTw=
X-Received: by 2002:a05:620a:4544:b0:93e:c12c:f136 with SMTP id
 af79cd13be357-940ef9c6068mr50445085a.81.1792792323692; 
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f06613d9sm3216785a.4.2026.10.23.14.52.02
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3580c07911eso3708364eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:02 -0700 (PDT)
X-Received: by 2002:a05:7301:90f:b0:368:fdf9:6e64 with SMTP id
 5a478bee46e88-369e84dd174mr683532eec.23.1792792319092; 
 Fri, 23 Oct 2026 14:51:59 -0700 (PDT)
X-Received: by 2002:a05:7301:90f:b0:368:fdf9:6e64 with SMTP id
 5a478bee46e88-369e84dd174mr683409eec.23.1792792316428; 
 Fri, 23 Oct 2026 14:51:56 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:51:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:28 -0700
Message-Id: <20261023215138.2301146-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 13/23] infra: host packages inherit the target
 extra downloads
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Some packages need extra downloads, which are then extracted in their
source trees. Up until now, this was only used by target packages.

For example, perl will need perl-cross.

But with the upcoming merge of the host and target soruce trees, we
will also need those extra downloads for the host variants.

Update the three packages that already duplicated the host extra
downloads from the target ones.

There are three packages left that define host extra downloads, but
those packages  do not have a target variant, so we can leave them
as-is.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 01540f0ee0cf07f77ef0dbf99d3d74f95b17f121)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/android-tools/android-tools.mk | 1 -
 package/binutils/binutils.mk           | 1 -
 package/gdb/gdb.mk                     | 1 -
 package/pkg-generic.mk                 | 6 ++++++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 20e26839f977..e30fce8ab7e3 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -8,7 +8,6 @@ ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
 ANDROID_TOOLS_VERSION = 4.2.2+git20130218
 ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
 ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
-HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c6a6380be99e..4b376f393bbd 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -137,7 +137,6 @@ endef
 BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
-HOST_BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 # Hardlinks between binaries in different directories cause a problem
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index cfec0585da9d..f33cc2ed7c57 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -39,7 +39,6 @@ endef
 GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
 GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
-HOST_GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c8f532e1c3e6..066396332099 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -602,6 +602,12 @@ ifndef $(2)_PATCH
  endif
 endif
 
+ifndef $(2)_EXTRA_DOWNLOADS
+ ifdef $(3)_EXTRA_DOWNLOADS
+  $(2)_EXTRA_DOWNLOADS = $$($(3)_EXTRA_DOWNLOADS)
+ endif
+endif
+
 $(2)_MAIN_DOWNLOAD = \
 	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE))
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
