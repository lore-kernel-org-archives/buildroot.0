Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53DBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:04:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3F261050
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D3F261050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD7E60AC1;
	Wed,  4 Aug 2021 00:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gngc0U0o0EIa; Wed,  4 Aug 2021 00:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9921360A51;
	Wed,  4 Aug 2021 00:04:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 061CA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D3340E62
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9yr3j9qAWId for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8385840644
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CE1278827E; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:40:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 91aa6efa8588bf7617cc4a640eb55052b524ceb7
X-Git-Newrev: 745d1a00230d87bff80578fbd044fbc0a5c03bf5
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.CE1278827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openpgm: fix link for
 32-bit x86
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=745d1a00230d87bff80578fbd044fbc0a5c03bf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add upstream patch fixing link with libpgm on build for x86 32-bit.

Fixes:
http://autobuild.buildroot.net/results/80254e61dc55bc07b16b3b66710946c71b9d53bb/
http://autobuild.buildroot.net/results/7bce71db86df8ba204153e0ab5022fb5ace9a6e5/
http://autobuild.buildroot.net/results/24a0aaff8f46953d015218a60da2c9856152eea3/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pgm-checksum.c-fix-build-with-32-bits-MMX.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch b/package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch
new file mode 100644
index 0000000000..a04dc7dba9
--- /dev/null
+++ b/package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch
@@ -0,0 +1,41 @@
+From b7fa865fa6b06d97d424c500fd1c4bc44c096359 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Nov 2020 22:46:18 +0100
+Subject: [PATCH] openpgm/pgm/checksum.c: fix build with 32 bits MMX
+
+Build with i386-pentium-mmx or i686 is broken since version 5-3-128 and
+https://github.com/steve-o/openpgm/commit/b276dc15be5d4e6e1143b9de25d09f63f9c85135
+because _mm_cvtm64_si64 is undefined resulting in the following build
+failure for example on zeromq:
+
+/srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/8.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /srv/storage/autobuild/run/instance-3/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib32/libpgm-5.3.so.0: undefined reference to `_mm_cvtm64_si64'
+
+So use the fallback if __x86_64__ is not defined
+
+Fixes:
+ - http://autobuild.buildroot.org/results/01d9be37e8a743307128f53f41785654c9971e1a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit b7fa865fa6b06d97d424c500fd1c4bc44c096359
+
+ openpgm/pgm/checksum.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openpgm/pgm/checksum.c b/openpgm/pgm/checksum.c
+index fef89bce237c..8d8dd3f32305 100644
+--- a/openpgm/pgm/checksum.c
++++ b/openpgm/pgm/checksum.c
+@@ -948,7 +948,7 @@ do_csumcpy_mmx (
+ 
+ 		sum = _mm_add_pi32 (sum, lo);
+ 		sum = _mm_add_pi32 (sum, hi);
+-#if 1
++#if defined(__x86_64__)
+ 		*(int64_t*)dst = _mm_cvtm64_si64 (tmp);
+ #else		
+ 		((int*)dst)[1] = _mm_cvtsi64_si32 (tmp);
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
