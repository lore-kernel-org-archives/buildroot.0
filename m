Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C075606A322
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B5qHcup7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BDCD607FB;
	Tue, 20 Oct 2026 06:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEH7WDBA1SGu; Tue, 20 Oct 2026 06:42:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C59CD607EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792478553;
	b=bb133A0lxDFKmGt4rJ4lYnSJ+9KZoZYku9SrjiBtu2V6xnSAr6VAcDaSf1traN8wBBKm
	 1zLZ/LCctcptxjz/VSupWaar57RWNyfeGju63Tnd9Onn88WVEnkV4/RDWeX2/qQIxAdo2
	 Qfmd5Wqb+G3vMJws+CF6+MM90UiEwqHdOY4I0n4//1/92UUtwT67CVTjshUmLivXqVOWd
	 vIKZk7Nr+HHyQSD8lEAbPond2A2oltOVx1a+4Va8HiZhIYIK2lC/DBCD9t0vpR7tnS+eV
	 csr96vsPXpyIP+/d+JosTrKFJakoQx3usM2+1fdjhP47pOLB/U5giGaKUudb+iR9EQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792478553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NX056WOT7U7vO1cB9JW3NdfIFOyT8bLQ8ozcz6wZzAA=;
	b=Vc5jw0lU17uMzZ9ZDT+Z+AYjPF+X+S1nBmK1yUKX1XlGh3UjSWxYKFqHJxPzFSopis9g
	 NO7cKMhpDu+UOu1JtVl2570COOBJmFtgaO4pcqsc7NUJuwt1WhwgAum1cMl0QseyeDFte
	 gs0/YXtC8Wt1yxpm3Oiq24ZAbnj/v5/6G//k6xLepSjBuhcMm37l9llP82HIJ3OvR4Kt2
	 jjzNQ1gNY2wOlLVFCSSQGktpmVEYFQ0Gsnj6pAuTqkmcMyII4Ip0PM00vmPZ62Kmku8QE
	 6i7UBEUc8UA4zxruZPzTBL4ulOEIRvMYUKn5KVUYwLis0HssFIV/3XGFDU7NziVqHyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792478553;
	bh=NX056WOT7U7vO1cB9JW3NdfIFOyT8bLQ8ozcz6wZzAA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=B5qHcup7B2E2Z2SaTBz2HInthO95uUSPRA5anrAW2JFAkAUo8NVg6/6c0aIYP9lnU
	 gn63UX8T3cAbtN5pQoMq++0QWOjh831iyp9chHbCup38EutvtMhWY0hNG/DUhi9f1C
	 eeUkGtnzAT4Ode5rBpeWHAPBIIN+ena/+BNnsElOOrq9rdmL2C4xIvkWxK3/7DzEks
	 WbA9o7WE8KBo1KlCKP5UQDrQnv0gB5TXfICxGCxbnYOkT7yaiDn+Xd5TtJKAba77m+
	 vUuEo1sL7d8hdCoJEyie8MhP3VTH+zSdUs/93R7smagUf6WapR22AezFW87f4cDdL6
	 q0tPDvfOqVtIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59CD607EA;
	Tue, 20 Oct 2026 06:42:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B9873A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74BC740812
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOEpmiCjszHQ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 06:42:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 419FB407C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792478551;
 b=Is1iYM+RfLddDFQaQfS2cykRvdk8+pUFddyjBa9CpHKywkCV4rPeYyI0uoRGdXUjk3xE
 QivxQminznWKE2B4ghpAwL+ACz54KJDqFG3LM5QwBcQCWKte0HxfbhA8SOcjGX7JfLMao
 39MmPMt87fnUkV90eRS/AOHawZIzClBqOrRrUpql72VEHG3KPDwNFzgRWD29nL1xaBFU0
 I/kJUGk31dmQpDpWTWwOeVWsyVUb6i4ct28nkUukixQRVAnW1AOBNPmIbES2eoV6dLv1k
 oeQJkjRWj+TzyUW8s8uOpj3YzRwJN/0+o2DhXYtPQVU0pH3aROdkeHKNB5/4F9bjvjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792478551;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BulMzym4N+K5RFhxXhVtrYLK34EezH5gp3ntzj/Algg=;
 b=KtE4zSF07/oC5ymBrh858xgxvaW/r1Y8t40kQXGO4pvDqNgn/cb8MQAsvHsJRRkby/HD
 ifw/QXVhL6GlRoDkjfXWj1tMn6cSydqweEJjXba1joCqmbyAw9+CojrKMd6IsQ1ZsMWIr
 7d4G6yOd/+TgaaNcRp58oD9b2l4+PvFE9G0wIfPHQ4PpaOQp4qJNn1hhhmEzao0M18pV9
 bF2m2TCx1eignhTaFWJcnxEocWBrVWddDVmzaCXvrmGHw+bYudyrlu/ovQorHziO8haD2
 EGEl3bB9a6KlGUcyVwy5akD9rT0xX33Gstny7B7O9v+eV/bNizzbqN0q/A2YV5/JAxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=V1cBNd9M; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 419FB407C4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:42:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48e0d885929so2138083f8f.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 23:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792478547; x=1793083347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BulMzym4N+K5RFhxXhVtrYLK34EezH5gp3ntzj/Algg=;
 b=vlJBf9S/rTTt6err5xXSzQwW9jz+b8iCnTEgIFXO1udjFqgV5kwfjuNY4MRKbodKzr
 rstsvroFfDD92pnTyed41J8DHEfs5rbkpq0qodv8/UhHDWW+mcGRwtn08aJMmjewm3eo
 tEf+zmK1VHjaU+UW9Iy3ETQoHnu8U46AunGhON5Dr2MzYIyIivTBCy2RPYYdDxqAFHWR
 Wb45f1L3BRSVpHdZ/6pcq1ezic4BH6RhOeAisfbi10R09aHfqO2JZM0C88h/zWIPC8Mq
 nA0bIY7VXmmdWiIU+jCkSH7YrfnnnsvTgudM1qX5WXBooUS4SDX8GMp4c33ORa+TL89e
 oaBw==
X-Gm-Message-State: AFq9FYLcuJZySuIBEDy35a51c7Wq5FBf1+5/FlMNxXVWMgIuSAeXbE/x
 oRUMYVsvcaNUy99uJf1Qn2b4I3fNIlKNt0DurRjj4rCG2DvjJBc5wKZhAuYnVKdqBecJU8e+ed/
 AiIuX
X-Gm-Gg: AYBFou0cc97jJLKWpn2Lt5gPYL3SjOIWxSK7rT87Q51uxaE5qJhkoC+3QqhyyJ0e/EA
 iZ2xp+UfK+98Y15rpkCJYq52ipGT68eUYZWkhfyGUe3eW2FogNquC//EGyL03gslwUFQ0d9Wl4N
 pAWtUqNDSbQ9emI8uBRxj4MPns/PrFYz7zlJZJZzr/B530kQ5skj26FIyxiL0vfgAvLyseLXduY
 UZBD952MuVQPSlWNum4nxDy9gzqqElRDPN+iONjesWfiEJNGAT/pJn8TwsUx942R7KS2n2TF3+s
 jTzuVtcbmalOHxeUXWFWlBu3LJaXxtIBccsGgc4q0Qm7rm6w4IxhTagnUYoeOd204i/AHeNmqjw
 JTg2KuII4ej0lljkl1LLUlZNIV6RXiLeC/CJIf0n4I57WBLlAHPf1jE371tIxNRGxxOxlExYxkT
 6N6pjSeeAoFlsXT6dwjKcjT2e8Q79v4ocqQSs0oBDlgrxgMJTEbstjHz8/dfKHB4E=
X-Received: by 2002:a05:6000:230d:b0:48e:1299:663f with SMTP id
 ffacd0b85a97d-48e1299672fmr13125152f8f.56.1792478546814; 
 Mon, 19 Oct 2026 23:42:26 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d82456asm4397023f8f.42.2026.10.19.23.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 23:42:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Tue, 20 Oct 2026 08:42:25 +0200
Message-ID: <20261020064225.176913-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/zfs: fix uclibc support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] fixed ZFS support for uclibc 1.0.57. This commit
has been cherry picked in LTS branch 2025.02.x as the same error
occured in that target branch.

At the time the master branch was based on 2.4.1 while 2025.02.x branch
was based on ZFS version 2.3.2

The ZFS version present on the master branch included a number of
upstream commit [2][3] not present in 2025.02.x. Those commits adds
the infrastructure to properly support statx in both uclibc and glibc.

Later a follow up commit [4] has been commited upstream.

This commit backport this set of commit to fix the uclibc support for
zfs. Those patches change the autoconf files and thus needs to be regen.

[1] b6884913ae package/zfs: add patch to fix build with uclibc >= 1.0.57
[2] https://github.com/openzfs/zfs/commit/523d9d6007effb01bf6a44f9942158f47a65e2b2
[3] https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
[4] https://github.com/openzfs/zfs/commit/2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...nt-on-path-based-unmount-using-statx.patch | 92 +++++++++++++++++++
 ...e-sys-stat-h-instead-of-linux-stat-h.patch | 82 +++++++++++++++++
 ...04-config-fix-STATX_MNT_ID-detection.patch | 41 +++++++++
 ...s-cmd-statx.c-avoid-statx-conflicts.patch} |  0
 package/zfs/zfs.mk                            |  5 +
 5 files changed, 220 insertions(+)
 create mode 100644 package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
 create mode 100644 package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
 create mode 100644 package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
 rename package/zfs/{0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch => 0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch} (100%)

diff --git a/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch b/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
new file mode 100644
index 0000000000..4f1fcb75b4
--- /dev/null
+++ b/package/zfs/0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
@@ -0,0 +1,92 @@
+From 523d9d6007effb01bf6a44f9942158f47a65e2b2 Mon Sep 17 00:00:00 2001
+From: Ameer Hamza <ahamza@ixsystems.com>
+Date: Wed, 9 Jul 2025 07:10:00 +0500
+Subject: [PATCH] Validate mountpoint on path-based unmount using statx
+
+Use statx to verify that path-based unmounts proceed only if the
+mountpoint reported by statx matches the MNTTAB entry reported by
+libzfs, aborting the operation if they differ. Align
+`zfs umount /path` behavior with `zfs umount dataset`.
+
+Reviewed-by: Alexander Motin <mav@FreeBSD.org>
+Signed-off-by: Ameer Hamza <ahamza@ixsystems.com>
+Closes #17481
+
+Upstream: https://github.com/openzfs/zfs/commit/523d9d6007effb01bf6a44f9942158f47a65e2b2
+[thomas: stripped to only add support for the statx infrastructure]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ config/user-statx.m4                   | 34 ++++++++++++++++++++++++
+ config/user.m4                         |  1 +
+ 5 files changed, 89 insertions(+), 6 deletions(-)
+ create mode 100644 config/user-statx.m4
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+new file mode 100644
+index 000000000000..0315f93e0c20
+--- /dev/null
++++ b/config/user-statx.m4
+@@ -0,0 +1,34 @@
++dnl #
++dnl # Check for statx() function and STATX_MNT_ID availability
++dnl #
++AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
++	AC_CHECK_HEADERS([linux/stat.h],
++		[have_stat_headers=yes],
++		[have_stat_headers=no])
++
++	AS_IF([test "x$have_stat_headers" = "xyes"], [
++		AC_CHECK_FUNC([statx], [
++			AC_DEFINE([HAVE_STATX], [1], [statx() is available])
++
++			dnl Check for STATX_MNT_ID availability
++			AC_MSG_CHECKING([for STATX_MNT_ID])
++			AC_COMPILE_IFELSE([
++				AC_LANG_PROGRAM([[
++					#include <linux/stat.h>
++				]], [[
++					struct statx stx;
++					int mask = STATX_MNT_ID;
++					(void)mask;
++					(void)stx.stx_mnt_id;
++				]])
++			], [
++				AC_MSG_RESULT([yes])
++				AC_DEFINE([HAVE_STATX_MNT_ID], [1], [STATX_MNT_ID is available])
++			], [
++				AC_MSG_RESULT([no])
++			])
++		])
++	], [
++		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
++	])
++])  dnl end AC_DEFUN
+diff --git a/config/user.m4 b/config/user.m4
+index badd920d2b8a..62e59ed94437 100644
+--- a/config/user.m4
++++ b/config/user.m4
+@@ -17,6 +17,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
+ 		ZFS_AC_CONFIG_USER_LIBUDEV
+ 		ZFS_AC_CONFIG_USER_LIBUUID
+ 		ZFS_AC_CONFIG_USER_LIBBLKID
++		ZFS_AC_CONFIG_USER_STATX
+ 	])
+ 	ZFS_AC_CONFIG_USER_LIBTIRPC
+ 	ZFS_AC_CONFIG_USER_LIBCRYPTO
+diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
+index 488554f4e844..a605af962a6d 100644
+--- a/lib/libspl/include/os/linux/sys/stat.h
++++ b/lib/libspl/include/os/linux/sys/stat.h
+@@ -31,6 +31,11 @@
+ 
+ #include <sys/mount.h> /* for BLKGETSIZE64 */
+ 
++#ifdef HAVE_STATX
++#include <fcntl.h>
++#include <linux/stat.h>
++#endif
++
+ /*
+  * Emulate Solaris' behavior of returning the block device size in fstat64().
+  */
+
diff --git a/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch b/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
new file mode 100644
index 0000000000..1cac841a5a
--- /dev/null
+++ b/package/zfs/0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
@@ -0,0 +1,82 @@
+From ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d Mon Sep 17 00:00:00 2001
+From: classabbyamp <5366828+classabbyamp@users.noreply.github.com>
+Date: Wed, 27 Aug 2025 17:42:32 -0400
+Subject: [PATCH] linux: use sys/stat.h instead of linux/stat.h
+
+glibc includes linux/stat.h for statx, but musl defines its own statx
+struct and associated constants, which does not include STATX_MNT_ID
+yet. Thus, including linux/stat.h directly should be avoided for
+maximum libc compatibility.
+
+Tested on:
+  - glibc: x86_64, i686, aarch64, armv7l, armv6l
+  - musl: x86_64, aarch64, armv7l, armv6l
+
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Tested-By: Achill Gilgenast <achill@achill.org>
+Signed-off-by: classabbyamp <dev@placeviolette.net>
+Closes #17675
+
+Upstream: https://github.com/openzfs/zfs/commit/ccf5a8a6fcfdfbdaa2f0fdca5d787958224bf06d
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ config/user-statx.m4                   | 6 +++---
+ include/os/linux/spl/sys/stat.h        | 2 +-
+ lib/libspl/include/os/linux/sys/stat.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+index 0315f93e0c20..1ba74a40e9b8 100644
+--- a/config/user-statx.m4
++++ b/config/user-statx.m4
+@@ -2,7 +2,7 @@ dnl #
+ dnl # Check for statx() function and STATX_MNT_ID availability
+ dnl #
+ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+-	AC_CHECK_HEADERS([linux/stat.h],
++	AC_CHECK_HEADERS([sys/stat.h],
+ 		[have_stat_headers=yes],
+ 		[have_stat_headers=no])
+ 
+@@ -14,7 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			AC_MSG_CHECKING([for STATX_MNT_ID])
+ 			AC_COMPILE_IFELSE([
+ 				AC_LANG_PROGRAM([[
+-					#include <linux/stat.h>
++					#include <sys/stat.h>
+ 				]], [[
+ 					struct statx stx;
+ 					int mask = STATX_MNT_ID;
+@@ -29,6 +29,6 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			])
+ 		])
+ 	], [
+-		AC_MSG_WARN([linux/stat.h not found; skipping statx support])
++		AC_MSG_WARN([sys/stat.h not found; skipping statx support])
+ 	])
+ ])  dnl end AC_DEFUN
+diff --git a/include/os/linux/spl/sys/stat.h b/include/os/linux/spl/sys/stat.h
+index 087389b57b34..ad2815e46394 100644
+--- a/include/os/linux/spl/sys/stat.h
++++ b/include/os/linux/spl/sys/stat.h
+@@ -25,6 +25,6 @@
+ #ifndef _SPL_STAT_H
+ #define	_SPL_STAT_H
+ 
+-#include <linux/stat.h>
++#include <sys/stat.h>
+ 
+ #endif /* SPL_STAT_H */
+diff --git a/lib/libspl/include/os/linux/sys/stat.h b/lib/libspl/include/os/linux/sys/stat.h
+index a605af962a6d..13cc0b46ac93 100644
+--- a/lib/libspl/include/os/linux/sys/stat.h
++++ b/lib/libspl/include/os/linux/sys/stat.h
+@@ -33,7 +33,7 @@
+ 
+ #ifdef HAVE_STATX
+ #include <fcntl.h>
+-#include <linux/stat.h>
++#include <sys/stat.h>
+ #endif
+ 
+ /*
diff --git a/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch b/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
new file mode 100644
index 0000000000..176dca28d2
--- /dev/null
+++ b/package/zfs/0004-config-fix-STATX_MNT_ID-detection.patch
@@ -0,0 +1,41 @@
+From 2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5 Mon Sep 17 00:00:00 2001
+From: Rob Norris <rob.norris@truenas.com>
+Date: Fri, 13 Mar 2026 03:58:54 +1100
+Subject: [PATCH] config: fix STATX_MNT_ID detection
+
+statx(2) requires _GNU_SOURCE to be defined in order for sys/stat.h to
+produce a definition for struct statx and the STATX_* defines. We get
+that at compile time because we pass -D_GNU_SOURCE through to
+everything, but in the configure check we aren't setting _GNU_SOURCE, so
+we don't find STATX_MNT_ID, and so don't set HAVE_STATX_MNT_ID.
+
+(This was fine before ccf5a8a6fc, because linux/stat.h does not require
+_GNU_SOURCE).
+
+Simple fix: in the check, define _GNU_SOURCE before including
+sys/stat.h.
+
+Sponsored-by: TrueNAS
+Reviewed-by: Ameer Hamza <ahamza@ixsystems.com>
+Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
+Signed-off-by: Rob Norris <rob.norris@truenas.com>
+Closes #18312
+
+Upstream: https://github.com/openzfs/zfs/commit/2b930f63f85c11ad2f8c7f0bfbc5c7337ee5b1a5
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ config/user-statx.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config/user-statx.m4 b/config/user-statx.m4
+index b2441631c824..d359f48b8579 100644
+--- a/config/user-statx.m4
++++ b/config/user-statx.m4
+@@ -14,6 +14,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER_STATX], [
+ 			AC_MSG_CHECKING([for STATX_MNT_ID])
+ 			AC_COMPILE_IFELSE([
+ 				AC_LANG_PROGRAM([[
++					#define _GNU_SOURCE
+ 					#include <sys/stat.h>
+ 				]], [[
+ 					struct statx stx;
diff --git a/package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch b/package/zfs/0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
similarity index 100%
rename from package/zfs/0001-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
rename to package/zfs/0005-tests-zfs-tests-cmd-statx.c-avoid-statx-conflicts.patch
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index bdd7b2a3b0..e6c8f98af9 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -14,6 +14,11 @@ ZFS_CPE_ID_PRODUCT = openzfs
 
 ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux
 
+# 0002-validate-mountpoint-on-path-based-unmount-using-statx.patch
+# 0003-linux-use-sys-stat-h-instead-of-linux-stat-h.patch
+# 0004-config-fix-STATX_MNT_ID-detection.patch
+ZFS_AUTORECONF = YES
+
 # sysvinit installs only a commented-out modules-load.d/ config file
 ZFS_CONF_OPTS = \
 	--with-linux=$(LINUX_DIR) \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
