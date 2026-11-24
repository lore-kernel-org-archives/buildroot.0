Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053B606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IBJfRHjA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwmEn+7Q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2658A403B3;
	Tue, 24 Nov 2026 09:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4t0wwgpKD2ca; Tue, 24 Nov 2026 09:09:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53582402A3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795511359;
	b=OXvd6OsXjbSD0BjOX7104UJbtGcU0r6erVeF1zBuivZlSxYhHDsg1We/CEgBHUvo/GFN
	 umJ1yjX6vnRGbgg/3yQ95aU4Jq2kAP9ZVEcQ74hoZ1rckoZq8f69r2PV1n4HQIgWCNAxR
	 dSZvSwEHq39m59KDt2VnmXLSn64+sKpr854oMvaoDuXdUqgc1nBgsjcyj+E9zl5PzmG89
	 cyPHA5rhQDF9bKacUTkJpy5bRGi+R9/HJolREWywZswXqfCMkHkEojEJCraP3yYh8ZAqc
	 HixLiQswVz3xYOLB5sDlmdEwsHS/OdZJhKTwsFtuzaaQybrGKzK7i9kjqn+arOJpf5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795511359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GREvC8WmEUEJXhrrs4MFU4i58xaOAlV4Rckgn+F9Lqw=;
	b=UhJ9hgMz0TXOCFh6HY0vsc+nwuSmOBe1Tc+W17gNdCX2Tsla/NO4JAkrHrXWMcfvFgoZ
	 cu4wzq28RZ91u8EA6Cb5WYTv2mswaOXzx0yIONOs6P4gNE+IoIV8ZP98vnYvdsTHHJGKw
	 ZildDec8jfxd038lMVDvSjGPEyePr+E1YZHwc4Us92y0o7uoAq+upe81ncsLpCWgfKC8q
	 ToLHE6FKtfAfgy5O9ftpoK0YyN1Z+vQ5e6pCIXwG+NXQ2TGmccXP0YsR/wiK4gcL06BVM
	 49xi/5+aOXSvZY1CsgbdT2/eKFCRbTtUnuKIYQfo/fPwXc2LYZ72szuwm0vVg2r/9tA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwmEn+7Q;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795511359;
	bh=GREvC8WmEUEJXhrrs4MFU4i58xaOAlV4Rckgn+F9Lqw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IBJfRHjAtmBMvmg5O6oHFTV0HTE8S94+3MHCIn0z4MSzbH4v3RQmWK53+Ks8Rvsj+
	 ++73I4VpAKSpictJx/okT+Qf3deM0VoAF2vM6cbOMqPP1PdHPqmj9uwWQJEtxlcpQZ
	 6m7oauLRZIsauBxJZCo7nFMqL34qn/bVeL1HYNRMcowb/eEmkA2s1z5iJ8GCzDmpZ4
	 ToUvXi3xfjVo9eBkMj0ghphMTw5YEN+p8OxE8xzU2pnvss/aaOAkDOQxeWjV/uUrkh
	 c38F3xkoSc1AHSKdXp4aeZBrYrdk4fSMMSvCN0oquxYEWXGQFu5e3E4qmnZ6vnpGPO
	 /SIbeXNQzBBag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53582402A3;
	Tue, 24 Nov 2026 09:09:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 895B4FBB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A74140779
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mw6rnhtjSNRr for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 09:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 19E704076B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=OwmEn+7Q
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19E704076B
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 09:09:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so2427891f8f.3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 01:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795511354; x=1796116154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kSvPf3rI6uGQAwwh0qsLdtx/0cKmoiOBuRAhttGPfg4=;
 b=OwmEn+7QboJjFT84uyb3f5o9+r550tED7A5I4Nq+oCq3EvfCA2lQFaDSVtvGgVPyz8
 8Df327wFuqbzooEM7/iptHcJQYJz4yQqWTZfLiFvmb6TUrqQe12miAV0Vw+G0S34SgTZ
 IFxU5Z4pCmpJci0x1/i5K/jdrDNmWOM/ZLg9xYJQUhn0H8/dTIdoVY9rZZsTyV+JmBR1
 bvGgwDZMeLghGc+4rY85/coOuzuT+kvxaPZEUkrp6rWvDPNfDy6N8zxfpp0V9b2WL3SN
 oXtuout95CGOXM9RF79HBxpOMT7KhYhb93/3tjlUSyarJsjYGUokRDPKrhz3a9GmqT+W
 51Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795511354; x=1796116154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kSvPf3rI6uGQAwwh0qsLdtx/0cKmoiOBuRAhttGPfg4=;
 b=YgGSAs5WapV+pQ/nrPvoSXtPGB02UF3j8B+/KrjoKdvxjU/dJGhh594nH8fgGoninB
 JQYTMTbCXQMS3CNdDY4F/Sc4NLqppIiDCPol8GfrGKBHv0FHGN8JeWNBL73OTOfu4GuJ
 ImB+wbUwjbTfzNqkyHiTMkHYoUzgiu8MIYnJWWIuR3iT/Rv0mLrgobR7Sh5OjoSeIX4Z
 QKXt3A5p5w2aq0qV04915nAEg4AMHCIjZ7mHpV8paXFv2w8eVMNUxEZxUqaIBryrGcT0
 z7HujnjgTjvOLUAioounrukfQ430FWBmUu/Jm4jXC+HXvt4ejtxtiThSHGfTIto3BAh8
 0o5w==
X-Gm-Message-State: APuU4Z/BXm1dJE1xoMNi1eDSRIbshe7Wjw8EPIlQZRvwpydgAKx6Ywww
 0FZN6wGQA98eLAdV14gErCQNaF4bEjyC6L0iVuPFuHtKIGhBdMhRH3oEYciCeheU
X-Gm-Gg: AZFdTZd/K3XndvOXSasVzfyxHV/4ORK/rSgWB68FIs4XsVndRldr2/IEoWj6amGeS0I
 ITC6+D9K3X/tHMkK2Hmp9i+ziTq4g2sGj11Mi4Wsx0bt7GiWn++QkWVfGeovY2/gAvYR3b5EpyI
 O804Z+HaPZN85GEd81zJPCFOLF0DWv9F9cS4qMlmAVS0jrzWKFQY9uVyT9U1HxK1gGyY64vCLSI
 gnoo/xy4rhXqpHnLWGvZdD1Cp7zFjv6Ntbzm1bymPfv6k4EpiUc64qaf0NUptx8IDliyiqDA4qP
 sIEjPFne95oaphotbBbAz9qD4tJ3MXwupNOKQeyXyFlK1CeJjzgoF6L40w54CZv0dkXgOJ3VYKk
 UZ5GH4wqYd9TWhD9i+f4eYqiho9s3WTKSR67YBjQadThULVUzijCpUubLTsWGDlH2Ei1USRMnSI
 MUa4cljAYjqYLqRjGCigIIn+V8zFpTuLRUZvATp866f08F3brl14qlf38Nc5XBA4y5qVpYgEZni
 pBAi6UKPzVtum0WlhE8ugm5ZTdEsvYq8bd18ipjbmgAOslmkOwiYyBHaHUOjbedcPm5YLz/JVct
 knsJoapQp88df909eJUs0T3ZqrX1mkB7HEwVS9Jt4rZPbwWQwpk=
X-Received: by 2002:a05:6000:3106:b0:48d:ff0d:cfa5 with SMTP id
 ffacd0b85a97d-4abb7787bc0mr28146759f8f.47.1795511353508; 
 Tue, 24 Nov 2026 01:09:13 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab9cf005f2sm21917363f8f.45.2026.11.24.01.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 01:09:12 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Tan En De <ende.tan@starfivetech.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Nov 2026 10:09:11 +0100
Message-ID: <20261124090911.2368475-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libkcapi: security bump to version 1.5.1
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

Fixes the following security issues:

- CVE-2026-71225: add safety measure to prevent IV reuse
- CVE-2026-71226: fix memory corruption
- CVE-2026-71227: fix potential for an infinite loop

License changes:

- COPYING: hash changed due to copyright year update.

Release notes:
https://github.com/smuellerDD/libkcapi/releases/tag/v1.5.1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/libkcapi/libkcapi.hash | 4 ++--
 package/libkcapi/libkcapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 172b6cbcc7..3242350c00 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  15b550c14165a266fa233b485d029d54508da593dfa6d1731ec5d5a285c716e9  libkcapi-1.5.0.tar.xz
-sha256  00e0a844d67b190580a9dc5943e555a3d0b2158e21d01a25526762c619979326  COPYING
+sha256  bd2e4c5731380922a8a6a45cc6dce0477bab000c917086f802d983d65441599a  libkcapi-1.5.1.tar.xz
+sha256  3f38f1c8bd93ca29e14ad64d46e070405d29b3e95b93f969e7edbf52e2d6f21b  COPYING
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 7a79dd55ae..a113eb7b01 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.5.0
+LIBKCAPI_VERSION = 1.5.1
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi/releases/$(LIBKCAPI_VERSION)
 LIBKCAPI_AUTORECONF = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
