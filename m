Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F58C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8EA60E5A;
	Wed,  9 Feb 2022 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sX_dk0Ay1MJZ; Wed,  9 Feb 2022 21:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C1860E56;
	Wed,  9 Feb 2022 21:44:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6721BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F4E60FDE
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjggUGo5Iig7 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C09D607BC
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2304D81335; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe70e4987e6fbcb986b28790c9311d1f3b56f8d1
X-Git-Newrev: ae86cd8dba6579443559a03058bf02e08a8fae38
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.2304D81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigrokdecode: drop reference to
 python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae86cd8dba6579443559a03058bf02e08a8fae38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsigrokdecode/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index 28cbb5ca5e..b58c8a2a29 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBSIGROKDECODE
 	bool "libsigrokdecode"
-	depends on !BR2_PACKAGE_PYTHON # python3
 	depends on BR2_USE_WCHAR # libglib2/python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2/python3
 	depends on BR2_USE_MMU # libglib2/python3
@@ -19,9 +18,4 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 
 comment "libsigrokdecode needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_PYTHON
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-comment "libsigrokdecode is not compatible with python"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PYTHON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
