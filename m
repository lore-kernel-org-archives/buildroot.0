Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F55C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 21:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920BA81AF4;
	Mon, 23 May 2022 21:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aABRTm6DNt0l; Mon, 23 May 2022 21:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B00A81A81;
	Mon, 23 May 2022 21:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BCA21BF299
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 498AD81A81
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 21:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fe3MbfPB6ROq for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 21:16:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F12881A6A
 for <buildroot@buildroot.org>; Mon, 23 May 2022 21:16:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 h205-20020a1c21d6000000b003972dda143eso303346wmh.3
 for <buildroot@buildroot.org>; Mon, 23 May 2022 14:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwaN2MypifYOwjiml2O36iGrNG0OwOVylfixZL9NIzo=;
 b=S7t1I15qulB3ltW+i2kUOzlleFNH6342Jm3AoFXlq+v+UzHdgc9Mx1Lm9nFNBci6uj
 dl5/qIhafBMBLJOJR1aTm/zNfml9VxVzE+XjEvoEeOJ5/gdF/ME631pqdYnaMWFGAqC+
 E0g3jTZRptQz0HaOcy+MzmgnBnZPs68xueDg87prtEOuFOJsiqk3Q3H0yuBHN9aFwH+Y
 q3PZ4tmoCvTzmX4E9KIePg666+wN2DZanJQdoiHN5q9J5BEUvejL2N9Y65RB6HrglThS
 ZPqdX3hAgb/8QmVvEeqH5aaLMcnkNO0p93CsQq/wk9cZGk47j9xZKOMJguhmZ+w4Pgch
 Okcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwaN2MypifYOwjiml2O36iGrNG0OwOVylfixZL9NIzo=;
 b=gnUbB/2BXWw5p83iz8mNK4VM/f41PZBn2UIiz23tZDFb30nQ53UVfgXFELsoIFk/S5
 4d9mwBqty5f4Ga3BdZAeov8hxpHJTZlaQskZVX+Knj6GLCLWRTyj7eP2kqWCIqP6EsC+
 H6pcDFYQzWT8kw5kqdlREvXYL0VVTKS3XOhpFtH0Ok8CDyuw5Q9ijf/X1bEYWNeRm+dA
 zcESIiJ2S+VP208Unefc4YqgxkGR6XEmp2GsbRcMOmnOZBMt1pNtkYxbuBHXQBmrnETx
 LRYGBCbi1sIwRmQgMXC+eLimygcZrgB+MRlsoDE68Hgh1lRoRu/57U+ijjFc0ZCozRW7
 Lcmg==
X-Gm-Message-State: AOAM533TJeLP2NnCcLsQ+hzcAEbCdc0NwWku1KH/2M5dMLGGl0kGKkAf
 /tZ4DOsIkJUHn9y7KruO7ko4ewXgWd8=
X-Google-Smtp-Source: ABdhPJwMDjqKN4m+qVZdv2hVxRW481GcDDIK+GOomcO5M7ApqZCjZG+qcXF6tBY7AmEqNHFalaIaTA==
X-Received: by 2002:a7b:c4cc:0:b0:397:431f:eeb4 with SMTP id
 g12-20020a7bc4cc000000b00397431feeb4mr771497wmk.123.1653340606183; 
 Mon, 23 May 2022 14:16:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003942a244ebesm397326wmq.3.2022.05.23.14.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 14:16:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 23:14:16 +0200
Message-Id: <20220523211416.1500310-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix musl and uclibc-ng build
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl and uclibc-ng build failure raised since bump to
version 7.0.0 in commit 3fa79c038ec75228015ea0022de80c5e7a2003f8 and
https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:

../linux-user/syscall.c: In function 'target_to_host_resource':
../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
 1057 |         return RLIMIT_RTTIME;
      |                ^~~~~~~~~~~~~
      |                RLIMIT_NOFILE

Fixes:
 - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ll.c-fix-build-without-RLIMIT_RTTIME.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch

diff --git a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
new file mode 100644
index 0000000000..729c2e9be8
--- /dev/null
+++ b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
@@ -0,0 +1,48 @@
+From 84863e007d4ef0858e74a1250e2472954924c617 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 May 2022 16:10:16 +0200
+Subject: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
+
+RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
+1.2.0 and
+https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
+resulting in the following build failure since
+https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
+
+../linux-user/syscall.c: In function 'target_to_host_resource':
+../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
+ 1057 |         return RLIMIT_RTTIME;
+      |                ^~~~~~~~~~~~~
+      |                RLIMIT_NOFILE
+
+Fixes:
+ - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://patchwork.ozlabs.org/project/qemu-devel/patch/20220523105239.1499162-1-fontaine.fabrice@gmail.com]
+---
+Changes v1 -> v2 (after review of Laurent Vivier):
+ - Use an ifdef block instead of defining RLIMIT_RTTIME
+
+ linux-user/syscall.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index dd0d92ba4e..488facb356 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
+         return RLIMIT_RSS;
+     case TARGET_RLIMIT_RTPRIO:
+         return RLIMIT_RTPRIO;
++#ifdef RLIMIT_RTTIME
+     case TARGET_RLIMIT_RTTIME:
+         return RLIMIT_RTTIME;
++#endif
+     case TARGET_RLIMIT_SIGPENDING:
+         return RLIMIT_SIGPENDING;
+     case TARGET_RLIMIT_STACK:
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
