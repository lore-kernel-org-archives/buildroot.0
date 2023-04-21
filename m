Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2180DC77B76
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AEF66FFF0;
	Fri, 21 Apr 2023 18:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEF66FFF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVSQRRZASo7F; Fri, 21 Apr 2023 18:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D366FFED;
	Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D366FFED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 237331BF2C2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F05AE6FFEE
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05AE6FFEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diHc7X_Glhmu for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D547E6FFA4
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D547E6FFA4
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:50:11 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MTOZQ-1pkORe1ZC0-00Tkbd; Fri, 21
 Apr 2023 20:50:06 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 20:49:59 +0200
Message-Id: <20230421185003.1221000-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421185003.1221000-1-laurent@vivier.eu>
References: <20230421185003.1221000-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:55owF1UbF6zxbexszV5vbxLMc+aC7xiezlGrz08W4e06qxM8CK+
 ZmLE41891JrF5kiZ6NLQc5YBHxnhEc2wq0NtdXOYJkqoEDgWWl6/Caz1Aeupc77PPXTsfzy
 ksQwtxqiSSsKEUTbsrpqxh41VXR4edl0aRhE/47Jf6WBG/xhFe3RyPfDQVopMW19FcnGlIU
 W6eqh+NlD74OSXLDWd1Aw==
UI-OutboundReport: notjunk:1;M01:P0:7Be0f5VZAp8=;7WG1VT8fbkClEuMGKFd6eIJpp2D
 UIlOnSYLK2L+EvjwY046F+lfI8JIdy3qTHPAgtoJbzpOiNLkOrOY4i0Mo/bGpDLHH/m2Z8E6D
 lJyyuqYhmvs8iLRo4vqfsuwdBO3j9obIa5dBSYAVReYtPRVti3ECQXnQN/4bUM47/YrFTnHEE
 ITGa9TFqYUaiyq5rxR2mc6k1EAuHPaHIgzW9F6HI9uVnMpWdjjL4Vk3Z3XnbKJCfALHkHVlW6
 SFlGiIgQr2c71KTUpraYQCLEDxwBMudkDYtcSJhzqBQBz1toS8CODGAGR71Ahs8ril01MzRVZ
 y/M+uag2TkBV41uTS7CRkkmZ5OVXpYpZvt2Ay2X5VS3YOdJIdLhwJGggiFSENtp3jT0vonEDG
 A9VSBXg3oGUUr9ljqZUygClFGxVXWBeVQXfYxti6Q2pEddda7FAg1b02TObhTP0wjz0JSC+7N
 Dv2uDuZSAF12QlVwi1XcD+rA0DeJVaOzenrY4m9VJMXjKn0gF2HyyjP0I/yobS2rSHksqY1xO
 6QZnUtNRQsgKgIKkDbXJLv/uAhN+tRmbg9muFk28bUssuG45idt6fgPH5NfY0VUTSpSH6glPj
 5A2UqHLxVZXSHuPfZueNjd+6tBA+UWNxfj8dFSMzOP54/rDHSBJAECK9YXRjaorKjVE4U9r2l
 5GcCPcZqr4mDAjCu1liVYIAcjluQ6n2WvHcDNsSaOw==
Subject: [Buildroot] [PATCH v11 1/5] kexec: fix sys/random.h with uclibc
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
 ...1-m68k-fix-getrandom-use-with-uclibc.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch

diff --git a/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
new file mode 100644
index 000000000000..d2fc3bc88641
--- /dev/null
+++ b/package/kexec/0001-m68k-fix-getrandom-use-with-uclibc.patch
@@ -0,0 +1,35 @@
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
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
