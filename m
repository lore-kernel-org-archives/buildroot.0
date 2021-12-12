Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1502C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F5B4013C;
	Sun, 12 Dec 2021 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNtaU63eHk2p; Sun, 12 Dec 2021 19:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 522534032E;
	Sun, 12 Dec 2021 19:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 374AF1BF300
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 269E742986
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2x7bsA84Hpt for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 19:25:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA80542981
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 19:25:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d9so23758185wrw.4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 11:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6In7Fw26CAt6TFI6Pgjoh7QiRXggpwVvdUc+Pc9qKZs=;
 b=AEuglXzPaAFafpERCYC9SCjlSTIT/ujnWe8TYBqvrkDH2bN6gMqUhhEX3RVTTtZKkk
 16iMqyOmxnct7+nwZVtrBbhUDPQNQOEzbtNwkmpzMqbvIT8Yocit9jGN5zAnTIJ+b/Kz
 3IcVjVj0ayII5Mj8R8+YoKHe/8sTVHDMnskwTrD9+NnMRuEtqPMFNGLcJqUUcdxQ6eAv
 Vaw6FGlLPn/CyAgcj45KSfrgndJ1WrDOXRGx9b82/x0VxZTxKjDv9Hk0dPD+1m4D1cWG
 9Xn+1m6630o0ZyPXA3i2a1KLQypjeIM3Az/Q4v4RUOgnLT6/pSBrwNInR0NU73nOZ7PM
 xZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6In7Fw26CAt6TFI6Pgjoh7QiRXggpwVvdUc+Pc9qKZs=;
 b=aQrrIKpnk9BYXZwthM0eutDS32kPYvemPoTrY3k7SvvA8FAja9dA2oTedopiRfJ1WL
 84daU5DnbAXvxWdlQjf2R57QkWFaXZAFjskIUORrBKMXOcRtqMRv6e889f4Aqcl9MwF1
 kHVOAa8Fq+G+e9pdVwgSNcYK2goJfsHDlU8BfKyBT3imx7zfpwztg+IsN1BKwRSqGJfv
 1IQGH/c9DgYRhL9rkZxPInz1i6PviHWlxtSu9JwFeyPCfh/uZmQ+B+ezST1fGC6cmn34
 SQyNrKsAgQXOs0hp0r9HzGNUqK1/FksrjxUGemIlMlq7hATSoLBgBpKZ/mgprl6Dc4L8
 B6WQ==
X-Gm-Message-State: AOAM532pd9A/htUgK9zVs8YzcbxSF6PkO+qnOI+hHPd7RFKqanowGwsN
 mN09ikSZ65C7Pye+zmQzX+i22eIH4bFfJg==
X-Google-Smtp-Source: ABdhPJy0h5D5X3ZcsVkMrEOIsHaQC1aEUhEGDeHAiVEx7EbHn/PugbRcGsdByc5ju9EeF2Nqe0nV/g==
X-Received: by 2002:a5d:6091:: with SMTP id w17mr27377030wrt.65.1639337155846; 
 Sun, 12 Dec 2021 11:25:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a10sm5284540wmq.27.2021.12.12.11.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 11:25:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 20:25:44 +0100
Message-Id: <20211212192544.838696-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.40
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- This bump will fix build failures on ARM
- This bump will fix build failures with old glibc thanks to
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/e1671236671afbf7719b3ef29039ec4ac5102347

https://gitlab.freedesktop.org/pipewire/pipewire/-/tags/0.3.40

Fixes:
 - http://autobuild.buildroot.org/results/faec4ea02f4a6ddf44d54d5784d9de866c2d8a1f
 - http://autobuild.buildroot.org/results/31014558b6ad72e0f602095c423d48219dd6ebfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-compilation-on-some-architectures.patch | 28 -----------------
 ...u-disable-VFP-asm-when-not-available.patch | 30 -------------------
 package/pipewire/pipewire.hash                |  2 +-
 package/pipewire/pipewire.mk                  |  2 +-
 4 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
 delete mode 100644 package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
deleted file mode 100644
index 4465523610..0000000000
--- a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 651f0decea5f83730c271e9bed03cdd0048fcd49 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Thu, 21 Oct 2021 11:09:48 +0200
-Subject: [PATCH] cpu: fix compilation on some architectures
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/651f0decea5f83730c271e9bed03cdd0048fcd49]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- spa/plugins/support/cpu.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spa/plugins/support/cpu.c b/spa/plugins/support/cpu.c
-index ee1816512..01cff4854 100644
---- a/spa/plugins/support/cpu.c
-+++ b/spa/plugins/support/cpu.c
-@@ -270,7 +270,7 @@ impl_init(const struct spa_handle_factory *factory,
- 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_VM_TYPE)) != NULL)
- 			this->vm_type = atoi(str);
- 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_ZERO_DENORMALS)) != NULL)
--			impl_cpu_zero_denormals(this, spa_atob(str));
-+			spa_cpu_zero_denormals(&this->cpu, spa_atob(str));
- 	}
- 
- 	spa_log_debug(this->log, "%p: count:%d align:%d flags:%08x",
--- 
-GitLab
-
diff --git a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
deleted file mode 100644
index 297016edc2..0000000000
--- a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2cddd4a775c145570f4a8a30d28b57f551d43206 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Mon, 25 Oct 2021 16:32:16 +0200
-Subject: [PATCH] cpu: disable VFP asm when not available
-
-Fixes #1746
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cddd4a775c145570f4a8a30d28b57f551d43206]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- spa/plugins/support/cpu-arm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
-index c07711f70..fe6222f7c 100644
---- a/spa/plugins/support/cpu-arm.c
-+++ b/spa/plugins/support/cpu-arm.c
-@@ -143,7 +143,7 @@ static int arm_zero_denormals(void *object, bool enable)
- 			"msr	fpcr, %0		\n"
- 			"isb				\n"
- 			: "=r"(cw)::"memory");
--#else
-+#elif (defined(__VFP_FP__) && !defined(__SOFTFP__))
- 	uint32_t cw;
- 	if (enable)
- 		__asm__ __volatile__(
--- 
-GitLab
-
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 7894939b0d..c41c0a3686 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fafcde675b264485883df1f3bf7e08f36fd1d661ecc092dcec6fd35a059c2aff  pipewire-0.3.39.tar.bz2
+sha256  b6a2eab8bda2f3cb87c3a0a714839696831ad27b5786674c4bd6c3776b9ebc97  pipewire-0.3.40.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index cbf24dd0ec..efda3ad695 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.39
+PIPEWIRE_VERSION = 0.3.40
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
