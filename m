Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B373606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TUpECjbS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B855606F7;
	Mon, 16 Nov 2026 09:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WVfDk_CUCJQ; Mon, 16 Nov 2026 09:47:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 31AB860657
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794822423;
	b=UPTgpImJ44Va7gtwmu8qwQiLgMO4cLJTKPqztfgWFMc8M4HyopF6yF4wDIYjGe2XoyGO
	 a5UO4wRC/BX5LrOjOnd9yj7NNP8mucAywR3UhR/fpq8iz3WUZF1Yn5dw5Ak4ApC2G+eKW
	 U9LjadL1h7q5vQoHEOJRWaYkZzmeaXcK3Jhuf6C2ks5IZBai0MLY4xC1kbRxzqJtayM3s
	 brRUsHkE4i/5GTInFitlPxwXFn4f+WVoxhbmSZX5kTroqK70jFbptbJiHTI+vaPhyKTYx
	 wvdszSYfIhWZUPmRVG9+DHVfcRnSIFtQtqRC2DjKIG9cWNK5cCcWWcq8PkUk+Ldub0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794822423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GXe8lq/jdQAJd9ZDUjWkw+a9Q1YnFeyda/E7ZS+Hbrg=;
	b=DpW11ohJcXECo7kK+vdu0MhI3b7yAmUlCbFzrL7ZZN8+KfDsZnjnhBBV+Lqdh+C08Y/X
	 ZxYSzO0E7cUJGHN5H2vzPW7n3zHaaS+FPIaGCXjwG5SHA3yFS9sgKrxX645iQ6DyYEd5g
	 2GNmpm4q0ZFsuQPv34zEndvGilORBIEsG/K4vRIS5RVc+dtEVeIILvNuB2RILo3SdWZkU
	 L+k5grsaXqdlewznh6PV9BykH1WcUSYVGNZPY90zE1WVgvyh1dP6EaFgoCmaDfr+/XlOw
	 B7uB5eWlvhmU4RiBRlDqIJm9kKy2zW7kpvcAaaYcZhQ4vF+j5jBxCq2WKqjgBlmUWvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794822423;
	bh=GXe8lq/jdQAJd9ZDUjWkw+a9Q1YnFeyda/E7ZS+Hbrg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TUpECjbSKf6dnTmKfY+qPVdv4RpB5aOZ9G1SUSy6VgkwjNTk3QEN4A5Z9ahxld910
	 HKmFIqcc42S3atBHNu/3asDK7kt3ULwvEjXfJ0iE0JWjk7rCqzxlmBLyiGKvkTvq01
	 yoFhXrQRRca9fiAmpCcyyr4wZNwyYRejCkRNMawm8Xch9tjvstbIAzSRZw7tq3KKzU
	 eCbXD63EH1blJR0mOzCUDdYnTR55oaJMcW/Do5P0XgsS0wol7GnUZko7dyqFet0ux1
	 kBXUZIKRPcO5c6Gu7s2d/nU7lGv55b2tESeOKxchSAWSLJyY+ikY4SimUSlYYG/wUo
	 GyhG1e/JOPhfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AB860657;
	Mon, 16 Nov 2026 09:47:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 483101E7
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E1840565
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnofVn3wCIrA for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 09:47:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 91F40401EE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91F40401EE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:46:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so7188875e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 01:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794822417; x=1795427217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=RcydUwi/ScIRgQLLVrlS5b2yyNonwZy83b+s/lMx+64=;
 b=n2yL0SwyK4+ck6WOG31L2Ih7HFgpezTVMPnmM7jtMHW5Eg4m5D7nKYV0Fz1IGIqXhV
 RIH4F1gcpc80qypMgvGS/fmVo16ORN4yyZ03MlSEnZGu2RFbjuNYfApX2y8fBEiaoLz/
 n/wxz1KeY+O0UGMNY+H5AEYSDIMYyW6Hj2x68D0tdLLHCyHF5YSRtDgO1e/XqDj1bHVU
 ua7Iwp9YdOJkAa3433VQFEZxcAz1oS/v4UJ3LjK/FMtQcCVhhOXusUig7+oiU9Y0zqfT
 YTZiPXvOoIECsxdU7G8H9BDm+E1yX4PvR1RBiL7Wv9rQJxua6PqnCWvxrNVq10eR1Ukd
 2CAA==
X-Gm-Message-State: APuU4Z+zeyTU7fUcbOXINVL/lyK2Waiqgy2UPKF0sLT3wpjrYpCOQ8n8
 fKeF9PJ6cilmypAidKlpaGXUi3W9ZgT++Zt8QJlvAwxFOxlW7OhXDHWejSr2pmlJKXEsQMkGAWq
 T5KeY
X-Gm-Gg: AYBFou2GP06L0/KAkI/ISyKEKuOBzfuzPMJQyHW6Yd40lxRkBmOAFP3+Qwy8RUg+lF7
 KtvibV0plbRjL6CpkQEckF2oHlA0GVY9nDFoP8t7QfMLqQcq1UEMYsfCrmoOq+cR6SsGVTCYj8s
 gJwhdK9k9xRC92aqmmsSOIHmNoSYHugGxoJceKjr0xnvGNUIQ8o8DtlE1f8DBfdb+2RWzpEOp+z
 /uPzxnVKZ271muWmAc5rYjX81xTv8Io16svZv/MrYkIAFCL0XEJHbbm73X/Df9izv1fn1+fNyxm
 JNtyK9ADG7P/vqbefRCl4PmOq7FmwoXoYu9cegAy7iCfX8swQMDRrcCE5dvTlSh8eSGW7S8g+UG
 Ys1VRNmaqglP24uM17j+pqHMwPGFFCc3+D0EHYBJnCKZ/ePIFQEqosnHaRwaIBzkcMbhGltDQ++
 PkhqAJtB1q0b7WNLuLppTyb1Lnw3cbI726iZbFxfWLuQe5R6qcB9klEh55yA8C0ztY2uXBf+wip
 oCuG7DM3aYZGXF8FRuVRCisYpbtEBSm0CNlePq2Sc+u6fnb1tNPwZWey1pf6jbabSk4VGZ5ULBv
 pOCC0pzYXfS72Z517CTBfvj1szWxbShI4TrCMrv+nQ==
X-Received: by 2002:a05:600c:8b65:b0:4bb:62d5:4ab1 with SMTP id
 5b1f17b1804b1-4bb62d54ff5mr140895375e9.33.1794822416940; 
 Mon, 16 Nov 2026 01:46:56 -0800 (PST)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ac0e1esm251055845e9.3.2026.11.16.01.46.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:46:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 10:46:41 +0100
Message-ID: <20261116094641.306120-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From the release notes:
    Update urgency: `SECURITY`: There are security fixes in the release.
    - Heap buffer overflow when propagating a `PUBLISH`/`SPUBLISH` message
      larger than 4GB over the cluster bus in cluster mode

See https://github.com/redis/redis/blob/7.2.17/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 1d58f98462..6f75fa86e9 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  960a8ec15e34ff40e57ff16837b26b33bd81f2da6d24497bb63de532a323a18e  redis-7.2.16.tar.gz
+sha256  07c679c013fd82513299733bddf91999bbbc830351ec9ea985a533b09a595d76  redis-7.2.17.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 31b4aad2b2..99a2d88322 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.16
+REDIS_VERSION = 7.2.17
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
