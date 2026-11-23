Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A15606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kdykOt6p
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFEB580C93;
	Mon, 23 Nov 2026 09:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F2ZTU9QJJlg; Mon, 23 Nov 2026 09:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1676380C4D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427639;
	b=UtxBVIE0T4C/cinstKHjZSL34lF26H0U7Agk55KLcS88mAW7vEu/jv487YXd3nJqhg9V
	 CUWU0BCpmtTsEOLvXPzNSCestZV+Vg181nw/HKGkyAG86Ja6KKgTSYzyuxxYoejATsT3U
	 RXQ/vJVo3cPSKg17ib1CYkxOA41vBGwn1cL/sOm1xd30SLdulPBkADLns01RGzfcvubFB
	 kSMtPWtm/GeafuUMV8TbgYoa/m1SfnWYzvV2ArTyyTX/TpbVwfSHUmGIaIxXollLo0IDy
	 LMb25dt2mVnVeIWKmmX/NKOQ3IPwbgDTqerouycbhnm1Ef0iJ6SZLPkb6q/DEYvMAgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427639;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XKmYx3YiL1IJD+YyhuiqFMlv6VNXQLwpd3D+uR8+Ws4=;
	b=GIK633szFU9/uLz3raqamnPR6y5mblc0B1MBn8y9BQOdVY2CInFGOu+uUoYxKk9fx4lz
	 X7yvsVJZtq2AKIJjf+3rNI865td5B0aiskf2Wmr670gqDo/ghZOz74CeAPaWMIrVEjV3P
	 HbLd/oEz6Cf2OwsyrKkL+j6K4v84WpWKS6fLH8uTwextbfcLTEhb1NCpD6H3hMh6I72hU
	 8Ch1W47k3JRWbzT0fVigszU4TfWjUONoJYxYRWgVMvyKZ3wNotVzJvgIm8V91E3qEFupQ
	 WZSJ4TsZETP0PQO1IYUf3DXnmciRwcJvzEKz1ii+D60fHsU0lq4eMJWixXR/LOJhilA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427639;
	bh=XKmYx3YiL1IJD+YyhuiqFMlv6VNXQLwpd3D+uR8+Ws4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kdykOt6p4TSyL3fYBNVV9KhY1fJTLTlA6FaJxG82L5U2cIjMPOz7V4o+Vb0Z2nsM6
	 p/yKhVqnPJxK/1yOIYXLIxQYaI0hKu+RyFYeCWqdXEtpoXSXD3TwOHf+I83ggzpn6D
	 B20z9jibCOsDMPqtJPBL6/SkwnkFLz9L5Jx6mJlQBP2sTTJ0LnNtwPHzhx23Nb4vrt
	 jkRFishD8z9i84g0wBitrBWTjrHU07nEp7x+S+Bs4u7cssOsCDl3HjCi3vXQxB1xto
	 Q7OESGTlC9bfOcN7gIop7nGYgrIUY7oe2fZIstG8cdp+C2b4ZeBHEmgJj/Hvh9kG7v
	 fNWNlQYBujdMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1676380C4D;
	Mon, 23 Nov 2026 09:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98788499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA7740668
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgAcxRk7KdW6 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:53:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7376740654
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=209.85.128.50
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.50;
 helo=mail-wm1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7376740654
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:53:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb64c99d2fso30203905e9.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427634; x=1796032434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ptM4vwTCC+AIPmryifaBoVNIxoKb9d49TXwCosgBs3k=;
 b=fEL8TJzk8Rl+CadN60SoRHoIATghnZ4HmwyZ1SHACJZZqbJ4GU2wBAArouIRAVuTAw
 916SxD0ZYo3sPmiKuQQ2OdBgVI5a3378v6LwrXzq6cCe9ocyE++yECHRnPDkTbFSTaRN
 t9hTe0noKFI+krxB9ZUCPcXxRJ7CSl8cd3GyDFzPpfdomZQFkS4ZN35dx9qOVV+welfH
 MUNUKMXkoRI7ZQcssdOPP9ph2GLV6LY7XbYGVOV2PdF9n8yofiY63yk7X7S68PFW5PJo
 GEcWvvXGEc8J9zRytdSSvh1mfLZhuGkkEG/Oq4eBFbfn8zytC8sdp3Pifpdv9VcTZ+Yz
 rChw==
X-Gm-Message-State: APuU4Z8DWnNT4qOrrB+AWPKY1nk9uFMpkmWHkiP6Zol9n02Ysa9tM9l9
 f5W4pNlQogtE1bxbkU13l5m3IIPcXaSugTxoWP42lnBW0bwyHLofZBPWfmwdIsUm
X-Gm-Gg: AZFdTZe9hqVFWJ10D6X7CLISFaQKO5In55AZtBj3Z9eJScaAOZeaeCjC2ZRtIrkRVxa
 lgVC7Q+RxzrCjFJIiNPWWCB5psuW/ig8EviGnH4Q1AYllZR7cg7zobWVFAJJoWWO+U+fW/inaMu
 qrPzecsNksGvymtTXXZRhWu0aWoun1HsnxdZ6wUvxXtHmHUFNOBws/qscM52Fa9XD8pFKTWgW1e
 is7FjovsL/2L0KBjnz+2kKpWKX0NXo4NpRttMV76cUhtpsNTp0P+joC2yJj0VqLWzzf3QHEms0/
 1rQmGHaI4gEuoHO7sjCYYgN5qWwPmxjVfhNvjyWQ7Tc0oWxti26epbDtBKv+HpPsSmxzcc/+3mG
 IyguHlKERLYbWH6gru3lPFsCtB6A7LFTOABe0m498mJ0xJUI0JrrFfMKpzCsKMVzDga7nWKnxzI
 y9vTZ9UT9C6QyMsidtsfAwadoweFoDQ+1fsYF1yBxJEs2NJvfxeB6p+CFJSAhDQwbnM8FdmaVvz
 TuvKzWwHfcELWla5wOfGWNx6NblZsbEkr7vL6l1telucFFpSjR6Tv+Wwtv4p/sMlG5wZgcZgPes
 1GPsF9ydWHlH3ZpzhKbWe0NKvZS788U86tDSwanux7IoayT7UykF75/Ehk6OLVy2XBPPPXizwD8
 Z4v2ZrgjQ6kCJAc4pqmMCcanA8Zlm4yUtuqS9sXbMczyJpMNKkg4La/CsV20Fk6bC1aADkUWhZG
 7uqZ02sSlmwA==
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id
 5b1f17b1804b1-4bb88804d4dmr243081775e9.7.1795427633808; 
 Mon, 23 Nov 2026 01:53:53 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:53:53 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:29 +0100
Message-ID: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 01/11] package/at-spi2-core: bump to version
 2.62.1
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.62.1/NEWS

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 4257ba03a7f..5704d0d8783 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.sha256sum
-sha256  e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc  at-spi2-core-2.50.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.62/at-spi2-core-2.62.1.sha256sum
+sha256  cca6b6a86e4389d89b370288761ce2385ddeceb10c4412da78689bc30c88af2d  at-spi2-core-2.62.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 828280de1ad..a1e17a6e5f5 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.50
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION_MAJOR = 2.62
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
