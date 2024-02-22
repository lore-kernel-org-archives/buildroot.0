Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDF1C54788
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 14:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B574020B;
	Thu, 22 Feb 2024 14:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaDsPlIdf1yy; Thu, 22 Feb 2024 14:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2095140A59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2095140A59;
	Thu, 22 Feb 2024 14:04:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07F3E1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 14:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E88DD82640
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 14:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6KXOD30ivbf for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 14:04:50 +0000 (UTC)
X-Greylist: delayed 533 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 22 Feb 2024 14:04:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E1B682605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E1B682605
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E1B682605
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:04:50 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 9AC3220FB6;
 Thu, 22 Feb 2024 07:55:56 -0600 (CST)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 07:55:50 -0600
Message-Id: <20240222135550.3428952-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] [PATCH 1/1] package/gcc: remove orphaned 10.4.0 patch
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Shortly before GCC 10.4.0 was dropped in d37a8f3a2, commit 4ce0dacb6 was
merged and introduced a patch to 10.4.0 that was not accounted for by
the patch that dropped 10.4.0 support.

Fixes: d37a8f3a2 ("package/gcc: remove gcc 10.x")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...ine-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 49 -------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch

diff --git a/package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
deleted file mode 100644
index 7e9714e9cb..0000000000
--- a/package/gcc/10.4.0/0007-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ca01d2526917ec6e54b30472d3aedfd46d4ca585 Mon Sep 17 00:00:00 2001
-From: Stafford Horne <shorne@gmail.com>
-Date: Thu, 29 Sep 2022 15:32:39 +0100
-Subject: [PATCH] or1k: Only define TARGET_HAVE_TLS when HAVE_AS_TLS
-
-This was found when testing buildroot with linuxthreads enabled.  In
-this case, the build passes --disable-tls to the toolchain during
-configuration.  After building the OpenRISC toolchain it was still
-generating TLS code sequences and causing linker failures such as:
-
- ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
- ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
-
-This patch fixes this by disabling tls for the OpenRISC target when requested
-via --disable-tls.
-
-gcc/ChangeLog:
-
-	* config/or1k/or1k.c (TARGET_HAVE_TLS): Only define if
-	HAVE_AS_TLS is defined.
-
-Tested-by: Yann E. MORIN <yann.morin@orange.com>
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca01d2526917ec6e54b30472d3aedfd46d4ca585
-
-[Bernd: backported to 10.4.0]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- gcc/config/or1k/or1k.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/config/or1k/or1k.c b/gcc/config/or1k/or1k.c
-index da2f59062ba..0ce7b234417 100644
---- a/gcc/config/or1k/or1k.c
-+++ b/gcc/config/or1k/or1k.c
-@@ -2175,8 +2175,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
- #undef  TARGET_LEGITIMATE_ADDRESS_P
- #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
- 
-+#ifdef HAVE_AS_TLS
- #undef  TARGET_HAVE_TLS
- #define TARGET_HAVE_TLS true
-+#endif
- 
- #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
- #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed
--- 
-2.39.3
-
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
