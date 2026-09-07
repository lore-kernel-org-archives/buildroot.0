Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6829C79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 17:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC0C860688;
	Mon,  7 Sep 2026 17:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwuZ4DwODy-v; Mon,  7 Sep 2026 17:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76388605F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788800920;
	b=Jkj+WkVTFwW3t+wKhm51Kq1GPkJ//df4RPlHuFqNHP9pr5RN50RlPkvb9Mnfu89YpGu6
	 bl+ZDpLGyDBEeOROS+yxf6lDlTlRt2c3QHpEPBOC6fAdzNke39o2Rhk18T4lP4WVthUpT
	 aoGVk2mzNArsV3zXMRij3B14W5xON8iSGQeYJXizOHBfblTae4P6QBor4GUpgwLDX2MhX
	 J3CDr92LibmaLVCJOhAiYN3OghSCMgp0xd7KxgX+YesybU9L4wj6+i8pBo1IepMJGlqX+
	 UFkzyMh0MW3nM7d7f6+nQj7ij3AqPCwPSGiiU2RCu5Z/liXaepn1HQGsT3rSOwZbrYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788800920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e1pU47VRkewo916f6j78IoggezB/myJkE3lRyXTE7SU=;
	b=J/uOLF8OS9DSY1h9F4HYi35N7qL4x0tgm75HFIfNYXAO90pxmj6KQKoH30NJZTiV5K5O
	 yeKfa1OHwFc9igNPodobCfxeHHSAsqOo1PeYQB6r02FjN3F3+0FuA2olUjmPGXACzmlqB
	 rIHWzOJ+bkFaT+HPcV86Y+PAGIfisKurCQzptsRgNfymW76mpFzpp+l38nBBhvxTOhqX6
	 64jC3U7Fxld2eaQc29Vf9BPfMcLtlRyy1002Xty+0WeGKrWvUYSSlCH1Q6vXybnmoTUtz
	 vCu3TGWHXhFBtcvCAE3W4UCacIdyoiQIWO+hs9f/aLhW74DeJRpht68tWWf0U9ueLGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788800920;
	bh=e1pU47VRkewo916f6j78IoggezB/myJkE3lRyXTE7SU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JeMEGLcfDmQB2LQpUZ1by5TDjtJ58a/6GJ0eLwUMmV5B43vg32ZWyuhc9eu2jLysA
	 FSScZavtf6i8GSLcYwcdYpjAmZY30VHKU1rAN81liNsWg5TZpqkCyU8kx6Tuk930mp
	 ueHWhrhZm+z+94QJu3Qck8WJvlwlpfZ4QZ96LtF7g2qw8Nghm5H7jTsmE3OuBhVhNb
	 maFOQXwbE9G/3TAM1P+Nrl28KQHBeiPz30KlUBqsVHksI0UPSzS46F9hLXt1U6prMS
	 za+FqxGQqWYfm9ZLFgtHBEDx1+3ZHLtg0tE5PoCdI2zNDHoLtkBWgk8SOXw+3d8fok
	 E37D0eIXqraKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76388605F5;
	Mon,  7 Sep 2026 17:08:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BE2634E
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14544007E
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-N7RILh_pl1 for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 17:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C044F4005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788800919;
 b=iS86OP23DWWzsdUyb4VIC7GFgXe6zLCSg0ncuDtOWGib/TKlQ1yTRIMwdx5+V9Jp2j7P
 VQ/c5JXzuyFdy87hGcq0pkUAMOcGXyD1cEJ3JPvjQMmbAGr29KZXJjMN2ZwQL2YlrqHJ5
 5ZR4SkivD2ZfLUKl+AnorFAAFZJcHLsdP36lb76o7YYF3v+AtyuuDv2PJVuGuUldotor8
 FZa0GSl/+ji1u0deRXMIMDiuRt0eE1+HCz6gSHv1FyegGlu85F9bTwbUvCsPl2loYVhP6
 0L2jW2JwPPwSQzJZWQHgWhEEg9994wkg7rmwSQe6kgZy/vQ0HYsAn0zZLyLcG3kX60w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788800919;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=UONP9SY8dypI7DIhZSIH039hZnAyp470EHX59FdVcZI=;
 b=b8TgIB7smdQD9IrIagO5Zq1uAj+sUN2k5DlxrQS7zkoiCNHSUcNgOYtLfuKu23Bwi/Y9
 zoWT9bzGkdy3a91gMO8HMZFoLSIso/r9vioW8J3ngVu1C/fDwogdrEECor+90g3nZetjD
 AbMDg2nj9Jo1L/sUHxBnVn9He3CTY0MCmXVY2ZhOIdxiRLSBgvcT4u4Ad7P2dgFcpysqm
 TB/WoJ6XRsdyG2ys31qEx94lkkz1FUNprQp8/5pGcxretlzAC5cB92dFgRW3nA844LzKp
 xzfLdzp019YPWeYbzByvV7/vzDRZ9sApY6Od9Oq/vsGaAgyRLLj3zwsGVUiZhMl2Sxw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Jfl/ch+g"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C044F4005A
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:08:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a082b3671fso4533819a12.3
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 10:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788800916; x=1789405716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UONP9SY8dypI7DIhZSIH039hZnAyp470EHX59FdVcZI=;
 b=p+wCNIND7WHjNEebIsHG/GL2UQQOmVgFruMKCocV4wt64yQ/XQmBVPwEk54lJhC/FX
 qDfhyRWCZWJuxKNzzeEJR5e1HuGP6MJ56v7em7evhFpAsu/sKwfQ68xtmZIPT6fzeZsL
 QxV13X+K4csl/9q36SE1gqCMkf5DXw48xivSjsyWNg0ogFe5mFWlxsLiHoCoi55EJd8k
 bYDKQVS7hZf3aA7V36smcT13EdYTEjQx0n3StYB2DeJRWI799lDQeLhN7PPeJ6+x0Bq/
 Z+kpyGXeu5ORnhSNwpdEUozIejYln/0liMUBJtl9qsqCdvAjZgJFXtnhkIgPrqDZtH1r
 MU5A==
X-Gm-Message-State: AFuF++nIDPKWtRWhahqoqDmcARS5VWP9tcE0VrjVFroKvnuG0/IADe1E
 E8PuMa3T/sQpFd1tXsyYXC113Xmi/Hm43b4M9puMYJC77xVH9g7X/7ti2mVfkYsmMjqx8IAB0Py
 4ifu+WUw=
X-Gm-Gg: AYBFou02wuezPhuph6RW+smXina+7m9jt+4hjv4aTBwfiJFXWEWLPLLzt+8R4B01muU
 p24MvTfnnPnMfiD2Q53aHNn+50ZO3nXZ8eeixryKn38hgwuVUaFbBojS5+vNARI8tVAPcs4Ufyx
 8nhG9by3vU4pjGYsQXmKlY4SJicypH93CCV0L8VB4cjFdMwra1vVarOnYdzytIlei1Q45L7pgRa
 Qo7Un60kcBeMKBRyTbaCGGl9S+HpHn6cixbxzCa4BISoSbGGwRWmCLvKW2wu4QmfEphPYwWdK3L
 Q8xXBXaaYW043Zx1jRAkwzJRISbiZjVkejsVypY+AAVGUOPFP9mb2zNZu0MYir/DtZAlEXkPQpW
 HHEuvZ2K2L0Glya3XSnqEF3F71P3V6+E9nxkzXt2n0l/k0duJFEWp7fGg8EYtKX1+dxmytIPvSH
 s+b8ak9gWfXHii/lqaJ+iTc2NIKllgTLkwMvK8seyhlyE91+0guh+AmeFLi0o1CKQvh+Q3/glN3
 Dvd
X-Received: by 2002:a05:6402:51c6:b0:6a6:7f0c:32b6 with SMTP id
 4fb4d7f45d1cf-6a7e8e920acmr13847627a12.15.1788800916256; 
 Mon, 07 Sep 2026 10:08:36 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a7e6bf3370sm4865388a12.27.2026.09.07.10.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 10:08:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Mon,  7 Sep 2026 19:08:33 +0200
Message-ID: <20260907170833.323089-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2026.05.x] package/{glibc,
 localedef}: security bump to 2.43-63
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This includes upstream fix for CVE-2026-18374, see
https://gitlab.com/gnutools/glibc/-/commit/72351055c6a1328c1ce2c06b72b8a4e3ebe0ef08

(alternative to commit 0838e968cb9e78d7ca5d1641f39655bc03a2be00)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index cff188ab52..5012727651 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  221a59fb35cad9435481bf7e79cbc4edd0ded70fb0ccf7e57d5478fb169dcdf6  glibc-2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d-git4.tar.gz
+sha256  1ee5c22f4a934db14cf942e73fc072c1e4ef68a4be944d4aec1a5acfa9cf813f  glibc-2.43-63-g20b3e8717652bdc2f89c99c4cc6e38d56a754866-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index bdf26a0f95..b7f834af3f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
+GLIBC_VERSION = 2.43-63-g20b3e8717652bdc2f89c99c4cc6e38d56a754866
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ad7b809578..aece62cdd0 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
+LOCALEDEF_VERSION = 2.43-63-g20b3e8717652bdc2f89c99c4cc6e38d56a754866
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
