Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4546C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97BCC60E40;
	Wed,  9 Feb 2022 21:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg_Yj3VQz88E; Wed,  9 Feb 2022 21:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB5F60BF2;
	Wed,  9 Feb 2022 21:36:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16BBE1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF3983163
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnxjJqpMCvgu for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EE283168
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9879B8323E; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 459dd7a9850c7b3be519ae6bf7cc6a689c22cd32
X-Git-Newrev: 1682e9b23b6aa8cd4f93a56c0efc8d7ec3566b42
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.9879B8323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dstat: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1682e9b23b6aa8cd4f93a56c0efc8d7ec3566b42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dstat/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 647a7033c6..09d1970f73 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_DSTAT
 	bool "dstat"
-	depends on BR2_USE_WCHAR # python
-	depends on BR2_USE_MMU # python
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python
-	depends on !BR2_STATIC_LIBS # python
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Dstat, written in Python, is a versatile replacement for
 	  vmstat, iostat, netstat and ifstat. Dstat overcomes some of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
