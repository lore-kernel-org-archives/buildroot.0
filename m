Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3051BCA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 16:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C651D606EA;
	Mon, 28 Sep 2026 16:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-IIGmICDuKV; Mon, 28 Sep 2026 16:18:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C6EF8606C2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790612314;
	b=X3cCQ/huHWch5/SUVA0X2jAohv00ZdJCgA0h6ceL0t6zuFc4hTaGO42GvPoazR4VEIKe
	 fHUCtLTtSh2Q9rJfg1DOSXdh4aw2UavNzPUZBgZFGxHJzWw7GP2RR4LoeX95HujxLfs3s
	 Y9e7jeaK0SY8e5ELcgc3Gc3aWhUgI52WrHDiHzPDJ04z8XhLJJ8tAI+AIhipTkFGgUsJE
	 Fa/CL1ACYmo4GCIllXHlRaqQwlrFhikxa/+FTyX4xPLUWNetjY0V1JJlThMmQLT7aeFnx
	 i6YJh1Cy025h/d4WkArm5Q13rIuDsbl3ZiCq8OCCRFeFSbPugzoNZHQmMLcCnweNbLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790612314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0pV3Eq/hEGF1XgHXg2DxEob9b9WVpEcPKnIC3VmvLVU=;
	b=Wy/YLj9lmkILIEGEHIMCdSrqScly92PG/gTRLROAyBUYquXmgHRRn6chWiSQi+jQzpR0
	 YFxwItCe+PeVs1TmA2XkSIPbz94++PlzLUGPci2mO8jQwaluaiIQa19GncSutp/o9es20
	 MFLl2sKczcWhFPDAkYAe9eNJbzhpDQSh2U1VZxMkSdu4+cOrV449K43U+SmgINuPOnLdu
	 +bBn0P2/l5wlFdY4RJL7/o89nLr8+axgkGObBSkPzBylVr8oowzcqS39FzMSXcaleFWsu
	 4ilbw05fwbhpXUiUnxjIwOxCkle1hHNeW6u0MKiAfLTAJxA/3YqezpQs8oTZ1zK16hA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790612314;
	bh=0pV3Eq/hEGF1XgHXg2DxEob9b9WVpEcPKnIC3VmvLVU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c600ck+N4ZoYvFRJXKEo2KJhK/N1EHh4leE/XH31Ouvne24YMOBy7dpGSdt/YD16a
	 mdWgWmT4hZ6KV2v7v2EjkcAGrDNU4mUiPdRY1QynjbFA3uU9TLkJzZ7vtIRPWN0dKV
	 tfz79os5Bb/otX+/qR2jYCiD2VYxDpGZKtPdb/080G9CXVi18ZAUZ9Qxbx37JV7oVZ
	 wJvj/WufXRIhDfZn/9lDizhxk5QRH+80doUUgpWOwcUISnEWEunYWQewKtZZALpeHr
	 RZWNs5pm+gjQwqhe10LKSZwGSAIQy9I1CNpFznifa1lhTKayxUb9193a8juxib1ow0
	 rmNFBYDQSq4Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6EF8606C2;
	Mon, 28 Sep 2026 16:18:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E11F3A0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07E5280DDF
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0RhtmlOaFDC for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 16:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B1CF080DDE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790612312;
 b=r8sNPxm+Sz43/TJRmrpFhLQQna3q5dENPtuNIz/LsnCA06JBR7u93w/WWN7SuFT05On0
 Yzh9yziER1ptuyDPI93d0/wg4ett0QyNTa/kqe4+ysBg3HRKVqyyR+tUzrsuxE3niKxdH
 E0R8rf8oZTKupG5s5q10eBNIi8NWn4FTb2tpjmigQI+QXrg3Ds7yjCUwp6UFghzOuvuev
 WAjjX09AGgoMONsS+o8VKkiueILaNH11KrY4cWNPOifo6Ffc75d3qeo+tXa/nZjrVelpT
 9k6m9nvJ6nezb7zISEcUOUinbQ4jbwH7/wpKE+O1chWkWRGoorUBpObwvRLG6rouOjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790612312;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ag/YLLfEoy+4nUe0bebgrBiiJMhf+9q9uY8chH2W6Xg=;
 b=iynD82KiLm5DTFWNOhHfBliTCfONb4r4wqT2FBXf1iLdSiwmJyGpSfyoaPJl7Fe7vEdt
 voypkGD0XbrdCsQHEQTj/V52zDbTLWAoXRb9oHHYP6hxPN/i+ET+s08gJ2tDbfFZyr6Nm
 lgLZt3rhoARUvOpy1ndGoqHu07clFxSNNuvhUWcFFMLHt1pcon7tginrX5TKftHRqNsKX
 S2420A7J4FDkLvhcZZ8SWRn1y9F1toNX1hevO2n9NiQ/bFYv2rkJ9sMEAv8SiG026TFz4
 BKRzVA7HCGtqWclYWvaskvgCakIksP3ovV3VhgNt/OLh2NwN6m06UceW0f9+sfwY95g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b="JizA92w/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JizA92w/
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1CF080DDE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:18:31 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so23956125e9.2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790612309; x=1791217109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ag/YLLfEoy+4nUe0bebgrBiiJMhf+9q9uY8chH2W6Xg=;
 b=JizA92w/VugsuPseJS3r5ysCgOz0Lqm60AiWWQ0DalZhlhMiKmjsYZiuuuA84QGklm
 rJaA0xUxG2r/AG2TSy5XyAZiIQIuNDphBjkUOhyR3oS7TUmlIlUjJOeuKzZcL3X/YXnm
 5aInrq2lDeAEbjrXuDERAiWxzWLRv4xIZ6hV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790612309; x=1791217109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ag/YLLfEoy+4nUe0bebgrBiiJMhf+9q9uY8chH2W6Xg=;
 b=WG79t37Lmv9EQrrzXDPBwH1Tnvhv9+3KhZ5fOfCo+mg+Kqcm+Ym2BRR9Bd7CcLtmUz
 71+kwrKvNs+v0xvHPdAGpXJ/lcROPfEJgrOPi6X3dmMhlBVavdShcxtPjLEinBXAUhmp
 arr+zILLLzaRXDIqKQ/D4+MWXsi74sofUDwKAyci/HBaRtxWTIroTS6IcBPvAJzSs8Py
 FQWu51de2wY3hqb+2/NkmUvk16l+cabZqYwgw3GpxmVklE4TnpEF9lVEjXQxwkfk3FDu
 76m0NWOWlAhHlbsdyH4T8y/njEkxsvOqEoS7ks8JWyq4oWFjGPBvO7/+t/8++qiXF6nf
 UZDA==
X-Gm-Message-State: AFuF++nF7p9DOSJwysZBL0mvsqCHyDVktvUTqX178BsA+I6DMAeNF8b5
 WvHhOMKtkmOgRAVomqHg7u2/BPH1khKgMzZXnFVlWpraVGecfZN26nsFsGE9kLFe/8KVXk+gYTs
 kRZUB8Bs=
X-Gm-Gg: AYBFou1p1f0gs4fjAncsM9PSeFIXeCwbG5qDhDM0UP3uwuC2dK9Q99TysUI//PRPvW3
 fgrYN8OOoxZxyDNQpoJQeRpV/lKaE4rUWwABNEOnmDS466D9NIfiqJ0T18xeSlie7upWCkoLHeH
 ApcT9p2TmtzbgA4bWQ4/nl85H8Y0YBOpmBDqYea5Gen8mJ/Q+iyzyNyhaBm0GHtESr+p0vCTzCl
 reCgHL2JUBLnRB2qiYDIiFjkBCPAOh9QZST+wbVLpVEqc8meamUgo8dCaIiNQ2O2Ew1ssJ8z5sf
 lzVDvJrJjQgIBaSQTD4IPvhf04jORgcFdDBpMRnFP8ojR1XILDMLUtL0gjv0g9l/El2mylC52wz
 XBDdyEQlQfo+xQwx+wbRtBUhUKDKM8fO6eDwzU/AM2JdwRppwgMjvmNc0A2rJAGoflgE42+qlXs
 EjZHCscOo1vKLkeRyU/rgxvR6UzKDCDkOA6eqFoV0VSDaTumdTJWAZazJwMjOa4rT9dfBH7kn+F
 /XjklgKdzUAtqcThzh4Yq+E3ZqEOKSea0UrSXPU/Tz6pXgIQXk5A59uDlNsxsrEBJ00y0lc7qQF
 BEUOW76uCvBWBhv7IslvqcDN1KpQb/FY1CSRBpqc8nyunsXweva1PMhZjwgl13c0AiZbhmhtZVS
 lOZRVIg==
X-Received: by 2002:a05:600c:19c6:b0:49f:ce72:e930 with SMTP id
 5b1f17b1804b1-49fe66ff2a5mr251823845e9.34.1790612308779; 
 Mon, 28 Sep 2026 09:18:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfb479asm2751585e9.15.2026.09.28.09.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 09:18:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 28 Sep 2026 18:18:24 +0200
Message-ID: <20260928161824.3463035-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: bump to version 8.14.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v8.14.12

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index e32275950229..9f497633121f 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96d15ce4b0990049d812d24afc2a62240c1a4aa534ea6aebb5aebd34dccb2dac  ufs-utils-7.14.12.tar.gz
+sha256  ccbeb98c8a83a95267a96e98600e8d41c6ee860f20ebc17be02c97376802e99a  ufs-utils-8.14.12.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index 1de7615a924e..5f805e559477 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 7.14.12
+UFS_UTILS_VERSION = 8.14.12
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
