Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526D8C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F31994BDD5;
	Mon, 20 Feb 2023 21:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F31994BDD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3pfBFTPJmJun; Mon, 20 Feb 2023 21:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C80C54EC7E;
	Mon, 20 Feb 2023 21:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80C54EC7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 649F41BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6365E4168E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6365E4168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGWtxu9O6qbt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B5F415C4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B5F415C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E3C386494; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 22:11:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3c2033cd2ace077e7dfaf58a2589b2a93a5fd7b0
X-Git-Newrev: 6ec2adee4efb96787cf702f418d09b45cb686482
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.9E3C386494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gqrx: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ec2adee4efb96787cf702f418d09b45cb686482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 34cea39024bf8dedaa071bc5f2d903755501215c forgot to update
gnuradio dependencies

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gqrx/Config.in | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index adcdbb0896..442b28e546 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -1,15 +1,16 @@
-comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
+comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_USE_MMU # gnuradio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
 
-comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 || BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+comment "gqrx needs a toolchain not affected by GCC bug 43744"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
@@ -21,8 +22,8 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
