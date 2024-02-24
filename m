Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAB7C54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 10:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B27B2820E4;
	Sat, 24 Feb 2024 10:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7JtZCKfo2iH; Sat, 24 Feb 2024 10:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93FAD82124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93FAD82124;
	Sat, 24 Feb 2024 10:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1650F1BF283
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 463E181490
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-vBTq5-LsF7 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 10:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FB7820AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FB7820AB
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 10:17:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 330A287A09; Sat, 24 Feb 2024 10:17:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 11:13:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd2f99246c253739a3d44d8345f2fbb5362b3fb5
X-Git-Newrev: fbedcfa221bc8826536a39b01eccf0626ab89bf1
X-Patchwork-Hint: ignore
Message-Id: <20240224101749.330A287A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: remove orphaned 10.4.0 patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbedcfa221bc8826536a39b01eccf0626ab89bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shortly before GCC 10.4.0 was dropped in d37a8f3a2, commit 4ce0dacb6 was
merged and introduced a patch to 10.4.0 that was not accounted for by
the patch that dropped 10.4.0 support.

Fixes: d37a8f3a2 ("package/gcc: remove gcc 10.x")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...y-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch | 49 ----------------------
 1 file changed, 49 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
