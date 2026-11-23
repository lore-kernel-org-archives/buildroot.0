Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678F606A334
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sCwGq4BF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHc2wub7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8706069E;
	Mon, 23 Nov 2026 20:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdIfBeH7-q3c; Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C420D6067E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467327;
	b=qhFvN9zQ/34vQHRcpA9XdexjEgwjjwtiVCh3Qpprxb7tRnMfqF+HiQ6j6VeWIh9tZHQc
	 qvXrHRzltJVcMNeUyzOrBQbVaCYPYZ2GqrDezgS7j63FTVLe9CmaAZVNwYesUl0no+GnT
	 +BwniUpONz0KRWXXWTZX76+eMkw8DicG0KUHRGNpGDLsh1gTt9+KWNpTIdjKnRtsQui8/
	 7HaPon7DB0/XYTMyN5DWBUsLzixS9G2r6U5f4BRkquXN0r9KxYZK1OA8qsgZr1+Iadj45
	 rULuYreJJuUz54wCS5LIVRJfg8SjHrSni60jAFPpPJlqMP4fObSnktOPRXAa0PzyFmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467327;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IbgQY+6Om9A9X373q9iSCGidpmvWeBgE+X7d/bbdSfs=;
	b=XMuyty/Kg4Otp7Dn/nMzi3+y7q57ULzOBkRNJ6YoWOdkvmerH6lkJxaUm86Vh1+JwySB
	 rykYTFaYj38K2v05KlUrMuhOwxSxUof6KkF1YLgfXsb85dZ2hSvX39XNXPQzkk1+g8Oel
	 p1NJf7z3WxUV5e3FUVCZBuJdLRRqaviT5At5JV8MFPOEMoGsp5zvnGf/Zvs0jMPS6H7KZ
	 ph3bLD3uPWfU+rWKeYwb566OY9hqGA1/AhlSHRRbb0IHp74h7lcN/Ld/t07cv8UoMECEO
	 8xb0TDiEXe9BDWmyDFU83QbhfCOkhubGhyhxgvZIgOeui+8FHMOpOwxdsd3vrZia6vQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467327;
	bh=IbgQY+6Om9A9X373q9iSCGidpmvWeBgE+X7d/bbdSfs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sCwGq4BFrQUgbzWzsMm03BG/v1niLRFTbjpZCGPOMGnSjoTBa8LayPe5cS2rCkckA
	 xwIUepyJPM2RWq8or6/S4wJtQYzW2VtCZhgPy7mhqIYRFfftBQoO/dv2Lc9+CNwG6n
	 2m4x2yAUrPAMHE8VUb7rgyem5NUnOZ6S3WG2M/7zlaulKvikJynsBzl2RRcsEe83h6
	 zY7/GrbOdEv+1TrGWfOoaPuFa/8SnAgc49zkteo9KtRhe9kHI73Fz1ucsSF1dEC6Tb
	 NMrU6Um7xzzusLSDl8wmn3ArgjkkNGPUZdsdNRi470iIuFCij0WpK9zivzywQCxcWi
	 ve93A+cvu1mcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C420D6067E;
	Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50791260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D0F280DCB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gXw8eSld-tW for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:55:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D29980D8A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=FHc2wub7
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D29980D8A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso3395661f8f.2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795467323; x=1796072123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3m9HZYNI5TxBZKUZFg5ULB4Cn+bfiAcXL1q71E3W2Ww=;
 b=FHc2wub7VbAt5LL5BsWUwdtCm80kaxShH9Si00b/G6Tvzigz4voRWJcPe8i2g43slI
 TPzdQpvdCF0+xfwYE+2haANYoIu6xfGy2eE6NiR/HSCc6VcyWqO/zMJgsobCl4NF5XVq
 9oBTOf8W2F2WE8RAoj1dmmp0au/vK3DO/3WDsak9ZbSk84Q/hnyqfVk3yGHU1qAcFD5r
 rnMy8bnJGvWRvEtXf29DxEjd/qlVZOYfu2XhII9QXNBfOMlKLbVPsQSf/fARk4QsiSU1
 T98blACfUl1FKTMdt7CR5P0JuShvMt6W4qzXmc2XPiVNU6ZyWRIo0ZfgL8t+OaxPXSg6
 hsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795467323; x=1796072123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3m9HZYNI5TxBZKUZFg5ULB4Cn+bfiAcXL1q71E3W2Ww=;
 b=bRFUu2LAFP45Mt57ACUy4HeJkS7ZvJVgXLyl5bZKhmrRPyHgs20PufJ9iSzngaIj6Q
 JM4bzRNFb19WF2nfhGhgZ33kR9y567wgQhlMGXsDLbY0/Mwi6aA1LlGGFCS9m2/pE0JB
 tfKMwo5ahxHcHtSEk9Tedd9szdDZ12qwCkwspZnVvCXPSsLClKkbNqC2UykmjGRPfZqq
 MUlg522g5YzAbm/XNVF3ZPjVPJ1azi0ld6Ec29qPzmY/oJVeVbfKlhrivho1eKWXtlTv
 3yak8en/y5NeS3aU9myzoIBqRRjf+Tb9skzBv1hZkQEbCEa4E264MUMy1BYa0S1A/NU/
 96gg==
X-Gm-Message-State: APuU4Z8KkM9wN2zzKlWdkmlkzii8yYWiarfz+M6CLMDmwSrLFkapehzU
 XXOvv5IsOGmic9e5WkiphRlx3/q+SfgcL1560PVT+7XEFtp78hS13JxpVzuBTse8
X-Gm-Gg: AZFdTZd99m50Vb3CCmuwrPn3W6HYbLgpKWiyUHE+CAH8C7lEzEVRiu4f5c2CUulhCun
 3sXFDEO+ld1XpekfeivUIXhmTWewxwOr3rCPZ8HixgV4RhhRaZIha8qU0tq5cJ/DMrp7hmAbpg6
 AxnNeXLf1uMi6K+HlK/aauz1bK4T4GARNu/k/gBiekjpyrVMJ6FVLQJuKcg1k0Wj1ib53y7kS/4
 iQc/b3C1iL7vzhZWvEDkHxviFiHIIXP6sKSw3h1WPNxBVWmzQ6SgUrBAASGKfzWXOtGiwy5A/od
 rJzjGe8+kqqBkn0Nd+kdy3iBk8EhSiJFMD/mGfpcxJzvU3A0FudriFyUiXmHHkwRe9186K7GYJd
 H8OOEeY3Y9UeUpJmbDwTcJQJwIt3rPW/bdObcwDlQduqVveqTTEr6gxpjMhNu1yGg5hZqVP9/nx
 FldYn+WHXf0Wzgos7lhXeNi8zl6pL1MVENwIMbsk+LSox2FVCXTu942aNpD5/Xwg+DAEAVAJlVy
 4VI/tDxjEx9nVZvYf3n4t0716bQRcGf60rYA/LR4Bm2Wk/3DmiEB2L1QoxwP9yDS7bhrJYjZIBQ
 peaEaIV9uC5iXp6B3pUfvvehc/2nzIxCAWBXGuBwCSTE3jzGGZs=
X-Received: by 2002:a05:6000:4009:b0:4ab:7c3:101 with SMTP id
 ffacd0b85a97d-4abb514617emr26344038f8f.22.1795467322371; 
 Mon, 23 Nov 2026 12:55:22 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm23611512f8f.20.2026.11.23.12.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 12:55:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 23 Nov 2026 21:55:18 +0100
Message-ID: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/libp11: bump to version 0.4.21
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

Release notes:
https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.21

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 10ab7388ad..034e88c740 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
-sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.21
+sha256  efdb523aef8613d447e6a2d38227d4b389866f4bcf4b503130acd7f759490847  libp11-0.4.21.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 38cc1c2e6d..3ad475d43a 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.20
+LIBP11_VERSION = 0.4.21
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
