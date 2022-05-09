Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34A1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 11:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EBF60E44;
	Mon,  9 May 2022 11:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcxGJKOZIr6l; Mon,  9 May 2022 11:37:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F54D60EE4;
	Mon,  9 May 2022 11:37:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 112E11BF385
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 11:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED35260E02
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 11:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50e-YZu_yhD4 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 11:37:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20689607A3
 for <buildroot@buildroot.org>; Mon,  9 May 2022 11:37:08 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id o69so12884425pjo.3
 for <buildroot@buildroot.org>; Mon, 09 May 2022 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujKHKUoFSRVANo8VtjvOqmzFDrDkPt1AerEr53vwqEA=;
 b=jiJdKoWSPsqmu/gVz0hg+c1mHsXT9+wUbtihOJqHY0ejBm174LZl0D6Hpc7QzwQfIu
 4VhD9gkEqltv/LecIM7MIgXOyQRnDnX9ZBMbr5SgUdID//G57yvZM81VGYXuxWdak5ui
 CbMX3WIYOoxTEF7gYW+lw0PUGoz8lR/7QD0kYEkCJsW/TGMWnAyTQ5hc3tAjHSRrxoml
 S/iMBw7P0yiWu1KPUIfLOZfB508gqiE6H/bXXq5wh4Aqw9EcnQVsjKBg1nZJN+HxO0rT
 Kgv5RVfpHVT4L28MhcqyuL+TqX0f7LJHOenlLehNq3sorTv/cW/OejYUWySlViSliw3+
 tuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ujKHKUoFSRVANo8VtjvOqmzFDrDkPt1AerEr53vwqEA=;
 b=UM59M8YFvY6ntWNgovTSws6l1pZvtwwxVfMfCvVFxjG7SaKQaq42KdHf2gQF+4miNL
 fC9GvQbuxtJf46VAhKdloboMhOrHVEiLZWaZ/WKz/53BV0UWtASw2TKg3gkYIneEk2Jt
 GFYfSK12Th0Cc34p1j47ty+z5urLDk1TsAyk8ZX8NOrr1R2Ih4cvUcC+DqJklsq0Nn2n
 Zt6mlhC714DiJF6X06E3CS5wCI17foh7Gp2SHILIH8Fe6Jem2578Y7+5bspUTUDLOOQ+
 dVv18GC0QIr5VIKSsorjOj5ekQBDOhDpZn5s96taDhsyEh53yaQmwnn4LPGk90/JS9NQ
 nQTg==
X-Gm-Message-State: AOAM533Zrttlm1T1b6viISdra8NhCDAXugs5a93E4DdnfjuInRyIgZU4
 sVUeJVYU7BXmiXuo0xGkoU7fLgdeKh8=
X-Google-Smtp-Source: ABdhPJzpnivOc2/6Bs+stRzcjJ2k86jnRG+JUQV2KHrAd8uLQkrOZ9vkFmLtzJ2S5L9vKLDWU35y0A==
X-Received: by 2002:a17:903:11c7:b0:151:7290:ccc with SMTP id
 q7-20020a17090311c700b0015172900cccmr16126309plh.95.1652096226801; 
 Mon, 09 May 2022 04:37:06 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902e0c400b0015e8d4eb1f3sm6846291pla.61.2022.05.09.04.37.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:37:05 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 21:06:49 +0930
Message-Id: <20220509113649.37846-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dmalloc: Add patch to fix powerpc build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following build failure on powerpc64le:

 http://autobuild.buildroot.net/results/1f84facd106abdd59be87b9f6e1eb24bcef0a846

 Assembler messages:
 Error: missing operand

The code will fail to build on any powerpc platform with optimisation
disabled as package contains incorrect syntax behind !defined(__OPTIMIZE__).

The patch has been submitted to the project:

 https://github.com/j256/dmalloc/pull/113

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../0002-return-Fix-PowerPC-assembly.patch    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/dmalloc/0002-return-Fix-PowerPC-assembly.patch

diff --git a/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch b/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
new file mode 100644
index 000000000000..8df66a74ce21
--- /dev/null
+++ b/package/dmalloc/0002-return-Fix-PowerPC-assembly.patch
@@ -0,0 +1,53 @@
+From 6d87fc890c3de81ee33baf25d7c3c86532f26060 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Mon, 9 May 2022 20:27:58 +0930
+Subject: [PATCH] return: Fix PowerPC assembly
+
+The original assembly used suspicious syntax. However, due to the
+!defined(__OPTIMIZE__) guard this code was rarely built.
+
+There nothing to stop the compiler using r0 between the two asm blocks,
+which may have been the cause of the note mentioning it failed when
+build with optimisation enabled.
+
+Write a single asm statement that places the result in the given
+location.
+
+This builds for powerpc64le and passes tests.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ return.h | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/return.h b/return.h
+index 55b9369fe12d..fafbe3754f0f 100644
+--- a/return.h
++++ b/return.h
+@@ -260,20 +260,13 @@ asm void ASM_GET_RET_ADDR(file)
+ /*************************************/
+ 
+ /*
+- * For Powerpc 603 based system running LynxOS 2.3.1 using gcc/gas.
+- */
+-#if defined(__powerpc__) && defined(__GNUC__) && !defined(__OPTIMIZE__)
+-
+-/*
+- * This won't compile if "-O2" is used, but it seems to work fine with
+- * "-O0".  I'm no assembler expert; I was happy enough to come up with
+- * something that works at all...  :-)
++ * For PowerPC using gcc/gas.
+  */
++#if defined(__powerpc__) && defined(__GNUC__)
+ 
+ #define GET_RET_ADDR(file) \
+ do { \
+-  asm("mflr 0"); \
+-  asm("stw 0,%0" : "=g" (file)); \
++  asm("mflr %0" : "=r" (file)); \
+ } while(0)
+ 
+ #endif /* __powerpc__ && __GNUC__ && !__OPTIMIZE__ */
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
