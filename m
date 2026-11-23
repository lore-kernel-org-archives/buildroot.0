Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE94606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n6HD1tAI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azBwjaQk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F8F405EE;
	Mon, 23 Nov 2026 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKA4M37XcDuK; Mon, 23 Nov 2026 20:55:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 306AB4061F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467329;
	b=BBGa4xc2tKdgZ+tROTSQ6+6xaBKOtIWJGM+6WAx8lzcpmGnO4FQtOOMLMWNAXzPNRU1G
	 IIBnM0Gbh2xcPPHs/7PscQy9KRmII4MyF59s18g3IiwzUFluOtCcRx2fZztHA0ZU0sFUg
	 h6bHFN4LCtzL1n/o6SRw5jRXuLXlpnB2XqkgNpnGpOW3PjPYuPI+LyZp94oaE1FGhC4ox
	 fbqruinSAWKwdXAytYkINSgPdW1dqc/A93rRJDtKGR+SQyxRZx2PJmOEywDqf2ry9SN6M
	 UhX273MeRsb7wLUDCbRTM3XY3aSJYTEMBOpDvXwPMelljgbAPCCTv7F5UjrjVyVcO6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=iVVjMUhgVr5YG6PGhA+JOfJaZ38lQztCnRdy2Wvfsvc=;
	b=B9nyppMaAeRQz1BrzCK2GDD0TmWOBEGxNv3IOcVYLSG3HAY0hR4ya06PDLoQ316ZMOiD
	 eA9nFJtJdFIDP8UGYGqbeCAYF+RjspL8yqO3blqx2yv5KdilW3RqLN/chZpDcWFDL2s8Y
	 GeORt07Nd/T4tH11TGGwU7mEFnqndwFQ4bUqyUZ/C3Or6B3bA9GDxIaM8D1PsSx62B0o4
	 TvMecbnH4+3r8g/Al4pC7pTpHIyMrj37CPjGefq2UAXtVVCqD4rOcatDydH1fS68Ox2Om
	 PHYabOObR88FDlk+wUgBkVjbFtPWlvZnEUwlJ2OMoZEOa5ExCG7VFN4AhpYoh5f02MQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467329;
	bh=iVVjMUhgVr5YG6PGhA+JOfJaZ38lQztCnRdy2Wvfsvc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6HD1tAIoKcmqJaUXhwIEmM+htJaQ/JnmQKo68Kit1lSJn8WZ+ay9Lxq2RfZkInm9
	 fd61hb8rVD5nZyW1Euq7wB2aQniecRLMm2D8U9x45mJsyktStXvtHYihui+HOx4i/9
	 hk7VMOgZj6jJ29UHDulTcmNcdeVLNDpfn5LxkAWNh2qGoEg1zaV2YBP04yYuREUAJI
	 RwiCp7q82T6d7bqS2gH2SlUIJzEzQBDx+oh8LOdZ9NuwNZRd6zYKtL5q2xGcaYlzCT
	 G6XhFOxTDfKipFa9IMW7v47r1fEB1R6tQsDJjkj8F77p88o4nrWyIev02NWSJcVKvF
	 /wggkoOqoNMIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306AB4061F;
	Mon, 23 Nov 2026 20:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38DF9311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29D6380DCB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNf0HkwpqGFn for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F149180DC5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=azBwjaQk
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F149180DC5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:55:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso28152025e9.2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795467324; x=1796072124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9nT+QunmTlnby5iJgmtvkT+EFoEZrvYtHzx4TI8rJTs=;
 b=azBwjaQkvGDmPoKJvRFY0IwcSyVIMNaYA8OMInsH6vgFA2W/gX9JGIB01TWeDDPFjP
 HTSBHR23IDBljmyqdtRmJPfmZ8enm2E+CTdBRFaGJC8Wad8WiVmvecKbU3pT/VWVcHra
 obTkVjf9VPlGxV3Up7kVwzyY7Et6XZ5ElTv2PljCC1HGdjLQ0AqCxTdkq0KuEDfNBu4R
 CZ/CXi2U33O9r5bCGpDvE/hhymDe9S+d5CrbNEGLiObHyiaEF44oErRQEu7Vdv4U049g
 1v7DuJYlz9RMnl585ndKhsdSa3PagS0aeRDP4mfyq5KaLUxZhk7uoMWB0cShrLL7zDZv
 EtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795467324; x=1796072124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9nT+QunmTlnby5iJgmtvkT+EFoEZrvYtHzx4TI8rJTs=;
 b=lY5I9CJ0jxpQ4BgUmm0QWnbbMLgnnRFHR/xpZ28UawtNQ3vJpJgdArf8aeQJ09opsu
 7cOKKpSDzDEFeZVJuNWRnrI/zYrXMA8Cq19dkba4dpLj3FW/umeigZNcI0xE7su8gpDe
 dt99aAbiYnDwMQB39dFMOJOeJqeUyMZMRt3eLkgOO9Lb6pY6FOfzOCt8Kijp9vXohptZ
 /TJf2tjNbd7RVn8l7H1uej2d5EIvV9SjDqKx9YE00pUJvV5Jfh4NoBazJ+yecdbRfnSl
 XUslPSqz7cauFdzmRZxPOO1sNTTC3qJ0f1XIobaPKMLoCjvpSy9bXexLd7uFhkQ5dhxn
 PrWw==
X-Gm-Message-State: APuU4Z97EwDzMEaob9C85kjhm+luxoVOjGncHJMdD+cL5B1It8qHXSSN
 T81N+JsP1lem4b3goGdxT/hVrG1BARPb0QGA+qJ89jKE32kDHOSer1QsBY89z7Ai
X-Gm-Gg: AZFdTZfjFoJUuuTY5nnuV6GCmZH7R+LTnmy9o96dimGw/sFDcWl569xTEN5BYGgCOhN
 PKqOCjWYNOPI/DXA6/0K192FlVZIc3tMsZnvuuYDtcfHHhu4IK2MrMvj4QNHUq5xzvxqtgfIEop
 k4sPwRg0+jJ7ypBK7WNfSE2whMnVqH2QQSgbMZI6WxDBSbmmWIctcjuYIvOgW1WXCNlzX6vYjb6
 EnPmYU5tg4d1wZKOSPEAEUqACI0TYYcsyYZF1wTqbnc1YqdKaiwVCWk3zz9gH3gYFWaiTvT8gJJ
 lBc+s9kiIe4oRe91Ybx38PMU3loPC6w4hV+4ZA9aCyvg2XvcF2vCLeJrs3AqdxyWAeSRuwxuOjL
 UcubficQX9JGC46YtyXR1bQdYmul5B8pvNKDKCUqYw4EysMs+bI4GMfLRD/bVYoie41dd21C+u0
 9zqUxyapOncFYhFmVEYqtBl8vOT6CLPOSLkZPjbW80JR1jDGUXizvwpFILWD4QcaAeDmT/j/Bma
 r0zq0rn0FdgGZwMbNm2yBjDIcj6DPl/cmSEo3BijWwLAXEGyZDwDoBFqqFVQjAZ+v8x2RyT49uy
 9cV9UlG6o3e5qh7jzITYs8elJAzn/QDRMyuz4G/zIKTPtkiUp0uuMlEmo5buKRw5UAy27TqP
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id
 5b1f17b1804b1-4bb88817e4emr268676895e9.18.1795467323608; 
 Mon, 23 Nov 2026 12:55:23 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm23611512f8f.20.2026.11.23.12.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 12:55:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 23 Nov 2026 21:55:19 +0100
Message-ID: <20261123205520.3702760-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
References: <20261123205520.3702760-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/p11-kit: bump to version 0.26.6
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop patch 0001, merged upstream in b4bc169c8320 ("meson: allow
setting systemduserunitdir to break dependency loop").

Release notes:
https://github.com/p11-glue/p11-kit/releases/tag/0.26.6

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...ing-systemduserunitdir-to-break-depe.patch | 61 -------------------
 package/p11-kit/p11-kit.hash                  |  4 +-
 package/p11-kit/p11-kit.mk                    |  2 +-
 3 files changed, 3 insertions(+), 64 deletions(-)
 delete mode 100644 package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch

diff --git a/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
deleted file mode 100644
index 050bc3533b..0000000000
--- a/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 709e37f781e50ef981d337249c574a9255691665 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Sat, 17 Oct 2026 14:33:02 +0200
-Subject: [PATCH] meson: allow setting systemduserunitdir to break dependency
- loop
-
-The dependency on systemd is only used to retrieve systemduserunitdir,
-not otherwise needed during build. However, p11-kit is also an
-(optional) dependency of systemd, creating a dependency loop.
-
-This patch allows setting systemduserunitdir directly to break the
-dependency loop. If set, the given value is used unconditionally
-without checking for systemd, otherwise systemd is detected as before.
-
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
-Upstream: https://github.com/p11-glue/p11-kit/pull/788
----
- meson.build       | 11 ++++++++---
- meson_options.txt |  4 ++++
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 38cf81b..9e76d62 100644
---- a/meson.build
-+++ b/meson.build
-@@ -456,9 +456,14 @@ conf.set_quoted('TRUST_PATHS', trust_paths)
- # systemd
- 
- with_systemd = false
--systemd = dependency('systemd', required: get_option('systemd'))
--if systemd.found()
--  systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
-+systemduserunitdir = get_option('systemduserunitdir')
-+if systemduserunitdir == ''
-+  systemd = dependency('systemd', required: get_option('systemd'))
-+  if systemd.found()
-+    systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
-+    with_systemd = true
-+  endif
-+else
-   with_systemd = true
- endif
- 
-diff --git a/meson_options.txt b/meson_options.txt
-index c1f2362..a7c0553 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -46,6 +46,10 @@ option('systemd', type : 'feature',
-        value : 'auto',
-        description : 'Use systemd socket activation')
- 
-+option('systemduserunitdir', type : 'string',
-+       value : '',
-+       description : 'Override default location for systemd user units')
-+
- option('bashcompdir', type : 'string',
-        value : '',
-        description : 'Override default location for bash completion files')
--- 
-2.55.0
-
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index ca76eddae6..bc4f1363f4 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
-# From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
-sha256  f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7  p11-kit-0.26.5.tar.xz
+# From https://github.com/p11-glue/p11-kit/releases/tag/0.26.6
+sha256  5fda95dc89964af32dbd8e01b139c166717cf96c4fee3d601bcd60bdb23d23c6  p11-kit-0.26.6.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 17efff7b16..ca6ae54963 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.26.5
+P11_KIT_VERSION = 0.26.6
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_DEPENDENCIES = host-pkgconf
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
