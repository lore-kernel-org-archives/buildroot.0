Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA46C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29FC613DD;
	Sun,  7 May 2023 16:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E29FC613DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z42EVxZRHVau; Sun,  7 May 2023 16:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136BD613E5;
	Sun,  7 May 2023 16:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136BD613E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 957871BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D42E4173C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D42E4173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlrWtsRDK93T for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C92416B4
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C92416B4
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:47 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6DnM-1ptUiM2XZg-006jTo; Sun, 07
 May 2023 18:53:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:53:36 +0200
Message-Id: <20230507165340.42151-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507165340.42151-1-laurent@vivier.eu>
References: <20230507165340.42151-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6GEE/3WGaAJJUfGBxDn61eTw57v4vil/fpmL6qezuuyvtzLHB1c
 hOfDIunyURishLRhQyq5gxWxNfHiZhqv4CeI6st11C7ruoJI3hhqnDy/NLHz94jXIaexQM1
 O2TJp9x7D6MhzDwvoLDNdLUMjkESYLF8Ek64O1m8vtPs6ZRClJnXFsxZIzu/QppsDCSqe8t
 2nUZoJvfhYESJUTEppM6g==
UI-OutboundReport: notjunk:1;M01:P0:eOEDO2Ey+H0=;rYGZpBtZvGjm39RGujgKxTJRLaI
 VyCk5omF0U5Mynr+ARxIzPUVMXopyFfD8ySp87VEwu/g31ukx2UWJIaZisfgUZmm4RDAFuYko
 f3Ev1r2WcwVKhBEpvltYOWr+5dfa6ItWhVgERhKwPK4X0Vv8NNIdkAmyBLz3iJv3+QPKthboR
 Ivi3XU4CJwdrFyJlt+YABs1lMvLDsmgNNLhUqqtNVi6EstxcmB8a6Jbbw5Of6msDaOeBn9BYh
 GrxVTOcNHYzwcIa16u2m5Nlnik+0WDRD9NgXkdA14LfMqIpefRcWvlrIStFIKdOGb4j1jSRuM
 DX/at+1jB9Dg6mj4H5oR4bQA2JddS8OY31nBKxIfSEMb+xcHA7wuo+V7Fl8pikR7bZPRlfOgo
 oxvrk8DlH8mPcBI+2OXm7Hc01hoTOuaWeVHGKqdT8e6YxbcmU2Ms5PlOGBTB2IdnpKLfpb6TP
 TW8LPCNV4aI7jIjvmy5ThEYOKdV23uBQcFKreAFOTr/xF8XnAx1kYAsZujVZ9qtzP8vOjstx8
 zVhmY38VCjXfjIgYG1W8hJ4XzuBSd/lvwfGVtsczNC/ClmX4/FgtJjE4xYYeT92zvhmXu8BrW
 yl0+wrUpc8IsZVudri6in2+jJGmrIfGQnn/IYKWt6v2mLX1uPjUBwwB9LaD0HWAAPOmh84VuX
 n4LRTPgXDPwjEc0KrD37x/0phKmkjgtwa8fjBKELNw==
Subject: [Buildroot] [PATCH v12 1/5] kexec: fix sys/random.h with uclibc
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 ...1-m68k-fix-getrandom-use-with-uclibc.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch

diff --git a/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
new file mode 100644
index 000000000000..6661349aba75
--- /dev/null
+++ b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
@@ -0,0 +1,36 @@
+From 491439a5c55b18dce96b522f3a603faaf1908ede Mon Sep 17 00:00:00 2001
+From: Laurent Vivier <laurent@vivier.eu>
+Date: Fri, 21 Apr 2023 18:22:07 +0200
+Subject: [PATCH] m68k: fix getrandom() use with uclibc
+
+With uclibc, getrandom() is only defined with _GNU_SOURCE, fix that:
+
+kexec/arch/m68k/bootinfo.c: In function 'bootinfo_add_rng_seed':
+kexec/arch/m68k/bootinfo.c:231:13: warning: implicit declaration of function 'getrandom'; did you mean 'srandom'? [-Wimplicit-function-declaration]
+  231 |         if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
+      |             ^~~~~~~~~
+      |             srandom
+kexec/arch/m68k/bootinfo.c:231:56: error: 'GRND_NONBLOCK' undeclared (first use in this function)
+  231 |         if (getrandom(bi->rng_seed.data, RNG_SEED_LEN, GRND_NONBLOCK) != RNG_SEED_LEN) {
+      |                                                        ^~~~~~~~~~~~~
+
+Fixes:  b9de05184816 ("m68k: pass rng seed via BI_RNG_SEED")
+Upstream: https://lore.kernel.org/kexec/20230422095904.1303434-1-laurent@vivier.eu/
+Cc: Jason@zx2c4.com
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+---
+ kexec/arch/m68k/bootinfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kexec/arch/m68k/bootinfo.c b/kexec/arch/m68k/bootinfo.c
+index 086a34bdfdeb..5afd212d9d34 100644
+--- a/kexec/arch/m68k/bootinfo.c
++++ b/kexec/arch/m68k/bootinfo.c
+@@ -1,3 +1,4 @@
++#define _GNU_SOURCE
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.40.0
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
