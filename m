Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF6C00528
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 12:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4E7600BB;
	Wed,  2 Aug 2023 12:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4E7600BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVfgac51wpTm; Wed,  2 Aug 2023 12:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C932261203;
	Wed,  2 Aug 2023 12:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C932261203
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63FDB1BF343
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3926B8120B
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 12:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3926B8120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybntFPGdWUXz for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 12:02:07 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C9080EBB
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 12:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C9080EBB
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe110de46dso45800825e9.1
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 05:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690977725; x=1691582525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X6ikGBzyvfT3lU4m91npDldJDYVRFqF3/8V/2oHMLc0=;
 b=US7zTlDit584WP2rhFpjp/1a5WKuGw+e5xKh4d2wG4f7XN0hDacUrJU4FN5zGcN8fB
 PaW6RwulazYsBVk1u0AVbefibw7tsL7SU6dhQnyZ8FngkgdtTj6MdNrylAnNlahzxnw7
 asAR7TcXzt9zhK1lWx35sD0bn9CiRzo8TQ5tRrZYlrrzJ6Fze2Ic9cVossxAsSnbhfVh
 Z/5Rnr6A0tuR2zmSCFxoUBiiVl+v62U5VHxbMnEK/oQ5tauj+h8PsrwRsCWQdeV7pUZ7
 4/awLaVNwWdUsT2ODoXhnbWcO8QJZdmLBhEm3MdXRhpAHFInagHPXBzNDXr0XMA9rmxM
 0rsg==
X-Gm-Message-State: ABy/qLZxLPzvfzvzJqFUfJ+/Vspc1N3fgivWLpk0YnkckEGwO3DPxkSJ
 dBN8832IT+h4o0QaxW1GPdAWEFU+yf8=
X-Google-Smtp-Source: APBJJlEnFzXGpc5AP7JB4xDZ/JOkpYoEyvBMUhDLV6RapRKrHgx60ypZ352yvSVvpnRbK5iToudAsQ==
X-Received: by 2002:a7b:c38d:0:b0:3fe:140f:4f8e with SMTP id
 s13-20020a7bc38d000000b003fe140f4f8emr4341457wmj.6.1690977724821; 
 Wed, 02 Aug 2023 05:02:04 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c00cd00b003fbb25da65bsm1481713wmm.30.2023.08.02.05.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 05:02:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 14:02:01 +0200
Message-ID: <20230802120201.382284-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690977725; x=1691582525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X6ikGBzyvfT3lU4m91npDldJDYVRFqF3/8V/2oHMLc0=;
 b=rTe6EXhEz4U0msBCfNV14qEuFp1AWOkCgBWtFhG+Z9+TXfu3+CGuPwxoMd0Oyq2l6T
 tjwbMvXZv3Ol+4ZcgNM9CJ8Nqrh9W0ERZT+CD5jGPAEl/h9tMWuEZZHOuUKPtlT+khoG
 x3SIdynsanGvhWgZokGU08ln/eCyvhBLPt47iQqlLCkwanTS/bgoqPEtoayY9KgaiF6E
 4rUmnsbWSQCNluwdbxSyZeR0WBEl7wgpZtHQR8rtC07LRQPIp6pBxflz7zNCf5yDkLGL
 vBEJ/kY7UhpLNfLxgsi/Zsk8ZBIE2Lsd8BTFS1nIb1dmun8ZXQLKW8FPpHtaGkaiEn9j
 e5Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rTe6EXhE
Subject: [Buildroot] [PATCH] package/systemd: handle vconsole w/ keymap
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd v254 provide a new option "default-keymap" to handle vconsole
with keymap support [1]. With this change systemd now use the "us"
keymap by default and requires keytable files and keyboard utilities
from kbd package.

The keymap support can still be disabled using -Ddefault-keymap=""
at build time.

Handle the vconsole w/ keymap support and allow to use another
keymap than "us" by default.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561206 (TestInitSystemSystemdRwNetworkd)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561203 (TestInitSystemSystemdRwIfupdownDbusbrokerDbus)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561202 (TestInitSystemSystemdRwIfupdownDbusbroker)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561201 (TestInitSystemSystemdRwIfupdown)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561199 (TestInitSystemSystemdRwFull)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561197 (TestInitSystemSystemdRoNetworkd)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561194 (TestInitSystemSystemdRoIfupdownDbusbrokerDbus)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561190 (TestInitSystemSystemdRoIfupdownDbusbroker)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561189 (TestInitSystemSystemdRoIfupdown)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561186 (TestInitSystemSystemdRoFull)

[1] https://github.com/systemd/systemd/releases/tag/v254
[2] https://github.com/systemd/systemd-stable/commit/1cd421106893c5126e33e211cf6634e9167d1762

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 15 +++++++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bea717a456..174ee77b29 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -569,4 +569,19 @@ config BR2_PACKAGE_SYSTEMD_VCONSOLE
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
 
+config BR2_PACKAGE_SYSTEMD_VCONSOLE_KEYMAP
+	bool "enable vconsole w/ keymap support"
+	depends on BR2_PACKAGE_SYSTEMD_VCONSOLE
+	select BR2_PACKAGE_KBD
+	help
+	  systemd-vconsole-setup requires keytable files and keyboard
+	  utilities only if at least one keymap is used by default.
+
+config BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP
+	string "vconsole default keymap"
+	default "us"
+	depends on BR2_PACKAGE_SYSTEMD_VCONSOLE_KEYMAP
+	help
+	  default keymap used when populating /etc/vconsole.conf.
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0aa1da3fb8..f6d131c304 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -353,6 +353,12 @@ else
 SYSTEMD_CONF_OPTS += -Dvconsole=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE_KEYMAP),y)
+SYSTEMD_CONF_OPTS += -Ddefault-keymap=$(call qstrip,$(BR2_PACKAGE_SYSTEMD_VCONSOLE_DEFAULT_KEYMAP))
+else
+SYSTEMD_CONF_OPTS += -Ddefault-keymap=""
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
 SYSTEMD_CONF_OPTS += -Dquotacheck=true
 else
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
