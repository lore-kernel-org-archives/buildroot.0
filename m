Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F226C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 17:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5B84027E;
	Sat,  1 Jan 2022 17:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4OnGXhFHfDw; Sat,  1 Jan 2022 17:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 398BD40274;
	Sat,  1 Jan 2022 17:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B27201BF2F5
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF49401CC
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 17:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhcdPJHxXHE7 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 17:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 565DA40132
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 17:10:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id e5so18564749wmq.1
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 09:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SDAEbCNw/YxSEcjmxIaynHVd96HEGH3JDX5vqDqIiE4=;
 b=nfkusHeOgQYRoxs4IyrZ08+AXpG8sFrv3KzBij8vW1fmNTwKovbS61aleenN1axH+W
 0YobusUu/aaS8s6a/3q2GuDJxHb5kEQhHzHgFO6se9+r6GM1JunScZaZrEw8IwqqdQiY
 eG90jC/1iFohemaQaoHDQSC+vxTS7XJKGgqF5gDkbhTSVJGjUe7zLx8q3pEWWteY1QWj
 toKsh9WO/98g6Oa4HY1xT0ux1b1oG6KRaZx9FqAS0Gd4nleab+RgeQgHGpNK8X8RMgsp
 pO1GB7H24ofMq4m6YHIfXUQVYoJx3IMfGqOnjXcCcYGSIseQ+kSMpoVeVwph29VI5tT9
 FqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SDAEbCNw/YxSEcjmxIaynHVd96HEGH3JDX5vqDqIiE4=;
 b=VcM1oOfYIPSOSQu0nTC5idLEDNG2tSIwNL5UMgYJKqj38r8zDF6zK/sBsuWQOTQDiu
 1WZU8lGxuoDCRvARGq76lFZLjNM/aqfwPHBshC4zoCdMm+qRaW15tMtnN37WiqC9XOj9
 JhfnjsuQFMXJl7BiMgvvNljHcBTnWVnCmtXoFpk78xa1eg9NpdLiRYE2KT+6btTFIcPO
 3jnMHGMakEE46+fZbs4tsACgM1UY4xXlkQTQ6BDUAVcfySu4R841em1Z2f91YpssI5mD
 Vj4ex2AsKLu05fHL2yLj80uF2Wb+sA4DgweqN3klm0vilzzv5MS6BI2D04LiOi0Mibwp
 qxRA==
X-Gm-Message-State: AOAM533LXFZWqfJjKKjrZNJ3wOR6g3j/zwLsq9C2YDag/PctzK3kwYBz
 jkQdr83gPzqs8a6ODdCTpaAJOwlwVaY=
X-Google-Smtp-Source: ABdhPJwOs9Gwq9RMSh+MwvsX+KxKQ/DH9+qt0MhcHC+a88pMZVU/PmwEjqMAjasgJPOEnpltnlRt9g==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr32713012wmq.154.1641057056460; 
 Sat, 01 Jan 2022 09:10:56 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id o12sm30269917wrv.76.2022.01.01.09.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 09:10:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 18:09:38 +0100
Message-Id: <20220101170938.1866790-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.23
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://www.spinics.net/lists/kexec/msg27693.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...move-duplicate-definition-of-ramdisk.patch | 32 -------------------
 package/kexec/kexec.hash                      |  2 +-
 package/kexec/kexec.mk                        |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch

diff --git a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
deleted file mode 100644
index 173323bff8..0000000000
--- a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5e7ce27626a44428c01e0e5ab3fe60ef98ca788c Mon Sep 17 00:00:00 2001
-From: Petr Tesarik <ptesarik@suse.cz>
-Date: Mon, 26 Apr 2021 15:29:51 +0200
-Subject: kexec-tools: Remove duplicate definition of ramdisk
-
-The ramdisk variable is defined in kexec/arch/ppc/kexec-ppc.c. This
-other definition is not needed and breaks build with -fno-common.
-
-Signed-off-by: Petr Tesarik <ptesarik@suse.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
-[Retrieved from:
-https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=5e7ce27626a44428c01e0e5ab3fe60ef98ca788c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kexec/arch/ppc/kexec-elf-ppc.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
-index ad43ad1..4a4886e 100644
---- a/kexec/arch/ppc/kexec-elf-ppc.c
-+++ b/kexec/arch/ppc/kexec-elf-ppc.c
-@@ -33,7 +33,6 @@
- static const int probe_debug = 0;
- 
- unsigned char reuse_initrd;
--const char *ramdisk;
- int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
- 			char *);
- 
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 1cf860d85e..05eb9e3d02 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  96c97f49ed86049f8b72722cb53e7fe3693e5a4f31e78a3a6249e3d18dac49c2  kexec-tools-2.0.22.tar.xz
+sha256  aa63cd6c7dd95b06ceba6240a7fdc6792789cada75a655e6714987175224241b  kexec-tools-2.0.23.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 81d35815d8..b3b4e56546 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.22
+KEXEC_VERSION = 2.0.23
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
