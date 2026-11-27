Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E954606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nUEai+LG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE6dJkz8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6644D40A63;
	Fri, 27 Nov 2026 08:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vt1YDf6ZY5J; Fri, 27 Nov 2026 08:21:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D3CA40A58
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795767710;
	b=jcf6EGSGYKguH+/lQxJXdfpta1LAOwcMapKT+e8nowaYmYaYo4zz9Jy3PNJmk81DUGoa
	 WCzyKbAmn9X+zlRXhGNH3YwurWCFmHIwW7OcGwLQFAwRbVdYpDHX6EusfCV0XHRjhiYxR
	 PY1EPT3cs1ZO0CHeoeM+E/VCLJO7tCqAwjBgrj73ZgVzpNRB069EljnODsW168aZtPZYV
	 rSvQHNpDLOM0AR+cO6JnEKmljAFSDEkk9W10WXnCA9Dz9B/ePK2RHbuqMhJWm4PmPhygn
	 MJ/z/iFjdqcB4ejAIByRq3eky2U+QN+BNz6Ny8uZGrFTufxK9FRK6swrE/Isx0uHZwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795767710;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i1g4jpogU/TePhpIvhngsAEHbXUMAdS+6LM/AHVU8Dk=;
	b=Mtr4Qds8RKhe1ma9Ir0ElKL2+Nm2HuB0HPHp+LrHmw2xZaoCtfP09PbPKwAGcG2YFOsl
	 1d7dnmvgFgiqG1sv27tdSnZJjdkAq9ZwTgPILSi8b3tvjXl/wepcXO9zl77d4bcBS1D06
	 aHIh0W/K4ODdKbIH8CeWDYCqEC/aSZ0I9znVr7uewJMWu51gpzCu8VDR6Z4WWV0DRzIsT
	 BZ8hWgfzk9Nt5G3lu45glU9cKAsEt5q67ypZD77nn6JgIjLsYnRFvwhTDBY7EV+GYdyPb
	 CR4/Zbpm0jypyxyWbzldudA0Ud1FnTTgQ/s/Ujhh/1OAAMoaAjMA1C3yO+Ko7f1bGAg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795767710;
	bh=i1g4jpogU/TePhpIvhngsAEHbXUMAdS+6LM/AHVU8Dk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nUEai+LGKrj605cJ1Etws3rSv2kO3D6C0smwRb0yPMmRW6S4P1P94IrO4+bHSyh8W
	 ru79OHppoGV80gzWffkHDiOvvhbqhIGl/53lomO1osqHJ5neXl97wy+4chFYrYB3pP
	 e+Xba1owjDMpTfF4Mp0BpUTj9aJq+W5vQClksxocOdZ+QnM/N751bFpfPFCWoqWAcl
	 7Za7u/sHzHeAlBNFleop0cLjGK1H4ERUUBkTTs97ec41DxDp0eJpHrVOx11yOYypRH
	 2ureCakOTBiM1+ge3lahP0Oe5+U01RRMDtpJkIIMv8QpDOB5W7imGOyUzMrKVfxbRn
	 NyFgNO7swgPMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D3CA40A58;
	Fri, 27 Nov 2026 08:21:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69C30325
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B5264008B
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa33tsHv3RAS for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 08:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 761EA4004D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=tE6dJkz8
Received: from mail-dy1-x1336.google.com (mail-dy1-x1336.google.com
 [IPv6:2607:f8b0:4864:20::1336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 761EA4004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:21:48 +0000 (UTC)
Received: by mail-dy1-x1336.google.com with SMTP id
 5a478bee46e88-385c497bf94so7402280eec.1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795767707; x=1796372507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nFz2AYPmX+UggqfisFO0JQ8K9pBpDXGHtuZm8We9aqg=;
 b=tE6dJkz8vOCwyBtqWoA19fIbAO/eSurNfpz5KoVP6GLLdfUdMQO6Lbn3j1oNzGFLgJ
 +EKpVLHj8YUCH3FjjYreOtiDEOWhfnP8aHODePEtz2GDd8s6BbVXtFkgwCV2sStUrYnm
 FHz6SdXxqxM8ilQzzvy2l7cQkexvNJLFME/0MAg7U15qiRx/minoC0SCIeuimjcIZr5X
 pDdzYtYd6sOPP5bNYc5SuZ1hLE0LkixnY/Rbmoe5HV9vthrPNccqL4HrDIF6jUnzxV+o
 Gn/R7a4z1T7CftCNS+NyYzvmfK4/7gjvlxQO8sh03t8kw+C8nqAgl6CwB3QRx+xFqUra
 E8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795767707; x=1796372507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nFz2AYPmX+UggqfisFO0JQ8K9pBpDXGHtuZm8We9aqg=;
 b=0qbKBF+B8jJ2AUpkWCohZoOvQb9M5KNOf9yUvwLJx6NwBE3dvWA534EESc3rDSiy/p
 itm29gBsaW8/YyWAqflhrP9N1wmPcvQi5wQIqTG7g52/YjIJF4WfyW9d8tTifFZ07MAi
 4HVK/BJXkIp8l/of2iU4LYQT0CtOG6KrZLY4gUB/CGeHC4pqTPQoBktCXQLr8t58Gw2r
 ztQgSFwtoNPc1SwB/juekLg6EQCHR9yF1zL+5T4FvFVZ2IVElavvTB3GGdU5pd23gXen
 dI+DPfPeu3POZtaw2j4gWgKvnZ/kg9HO/rhm9mb9yyJ99ZsCbp9+BN29pkUxNNwRyW7k
 XHGA==
X-Gm-Message-State: APuU4Z/beRuha3d0p+t+FgJcnGD2bJWTCELvKmKZFUuDI6WDf3qGJwmX
 vDkW3iOCBJjHv2fHf0SXRa67spt/l1EdPH42qQNQPMXorgcLbK89r8SqYvUpCw==
X-Gm-Gg: AZFdTZezCVFaOqMOJvkpwuwzcX53gqtknMWy1Hrv7OQcs/eP9mjh2cDzCW/+qr4Rou/
 +/vbUc+sxkv2fngt0aAZz5woyg/YzitfUrOP+gs4uoeMM4BYffmY9cWbsl6p319YOZX86yQoo4X
 GmHSAyqgK3ODhv4XxcL6FSpvXgnXAdNLtAoi1UEetMsLNX8mEUK+BZLRWeJ638mEodVn5JiqMO+
 W/LqYaqJaF9xzN/UQlHu+XpW2jdqlR4G1M3QvJs/ODgRCiOYmbbo4OdZW4AzJ8A9Fo5r+j92ZLE
 lFesPJw5/frNOvOxTnZjWppnlfZhGDH+7FNXAVURviiaXjk4WnlKSkDnMKJGAFK52RFttUHCI9v
 OaTC17F85vgNPA8F3TatA27Ih29avZAlr0vOLnQQ5u//krReahJr3jCEqgCkAVdRe9IzpfVtIqc
 1w2HZ89kU2k/X/3kbKgeQF9Qn4U0rRxPOog6C18qW0TZeInVY5p9FkNPSnlHF/KE4f5YdlR4YQj
 OhqPreC7qOZ+pTRoXJOOqr3SBKac4nmGDhUHdtUB+Jfw7z4pOOe1T0GUtLqUbEGaoOVeThDST+Z
 J8RJBnliUjRwnIhWY36+ARW+vXmy8g6/y0xQavxr+BNtERHMbYHaKiCrQl+npoqA7/5mM5bR6Zi
 0JaRLww==
X-Received: by 2002:a05:7301:4718:b0:380:9c6f:ad0a with SMTP id
 5a478bee46e88-3856e63b224mr22981411eec.10.1795767707182; 
 Fri, 27 Nov 2026 00:21:47 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:9a:8d55:c1fd:54fe:d86f:afcc])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385672ce402sm66111215eec.16.2026.11.27.00.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 00:21:46 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 27 Nov 2026 13:51:39 +0530
Message-ID: <20261127082141.697043-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zstd: security bump to version 1.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes CVE-2026-124851:
https://www.cve.org/CVERecord?id=CVE-2026-124851

For release notes and full change log, see:
https://github.com/facebook/zstd/releases/tag/v1.6.0
https://github.com/facebook/zstd/blob/v1.6.0/CHANGELOG

Tested using:
 utils/test-pkg -c /tmp/zstd-full.config -p zstd
 (Result: 6 builds, 0 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 2cd26ffc77..1135f2ec48 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz.sha256
-sha256  eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3  zstd-1.5.7.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.6.0/zstd-1.6.0.tar.gz.sha256
+sha256  2ba599ae2a257976278e7e71e998433a387bfd18aa7b78678229fd5d84f5e9b8  zstd-1.6.0.tar.gz
 
 # License files (locally computed)
 sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index b0fbf3a1a5..f70e0860ac 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.7
+ZSTD_VERSION = 1.6.0
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
