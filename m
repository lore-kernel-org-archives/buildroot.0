Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99920C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:15:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4075C601FC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4075C601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197F4606EE;
	Tue,  3 Aug 2021 22:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3MCbCeHZ6scK; Tue,  3 Aug 2021 22:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C67560664;
	Tue,  3 Aug 2021 22:15:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C26F91BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E0C83ADB
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiHCm8tvl4O1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CC183AD9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F3B681F12; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:39:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9dcf461b6ec1f431b525f2376e23ad7e07bea4da
X-Git-Newrev: 6e47347b1d83e8816366dd4588f11e95a0571382
X-Patchwork-Hint: ignore
Message-Id: <20210803211016.5F3B681F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/clapack: introduce
 BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e47347b1d83e8816366dd4588f11e95a0571382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This makes it easier for packages that depend on clapack to get
their dependencies correct.

Since the glibc dependency only exists for PowerPC, treat it as
an architecture dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/clapack/Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index a912eb6c91..98f94b0e60 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -1,14 +1,19 @@
+config BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
+	bool
+	default y
+	# assembler: Error: value out of range
+	depends on !BR2_m68k_cf
+	# _fpu_control is used on PowerPC, but not available with
+	# uClibc or musl
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
+
 comment "clapack needs a glibc toolchain"
 	depends on BR2_powerpc
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
-	# _fpu_control is used on PowerPC, but not available with
-	# uClibc or musl
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
-	# assembler: Error: value out of range
-	depends on !BR2_m68k_cf
+	depends on BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
 	help
 	  BLAS and LAPACK C implementation (f2c'ed version of).
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
