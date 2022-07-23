Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40135C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49AF42309;
	Sat, 23 Jul 2022 16:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C49AF42309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHqJrtwJWqFc; Sat, 23 Jul 2022 16:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3E4418A9;
	Sat, 23 Jul 2022 16:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3E4418A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2341BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25C7B418A9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25C7B418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ap-guxz6hq9n for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:37:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358924188F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358924188F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F34FC846E8; Sat, 23 Jul 2022 16:23:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:35:34 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d619fa054bff76afb424731136630a015d8ee2d8
X-Git-Newrev: bd938352ddc0a9e1fbf0be995fb79eabd0cb0594
X-Patchwork-Hint: ignore
Message-Id: <20220723162341.F34FC846E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/bind: fix
 indentation of options in menuconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd938352ddc0a9e1fbf0be995fb79eabd0cb0594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Move kconfig comment below the "if BR2_PACKAGE_BIND...endif" block so
that the two sub-options are presented in menuconfig as subordinate to
"bind" package selection rather than equal to it as if they were
unrelated.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d566b8cc7146ad57dfdf7ef13aceb80b85acd9e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 9887403ed9..63ccd57db7 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -29,11 +29,6 @@ config BR2_PACKAGE_BIND
 
 	  https://www.isc.org/bind/
 
-comment "bind needs a toolchain w/ NPTL, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-
 if BR2_PACKAGE_BIND
 
 config BR2_PACKAGE_BIND_SERVER
@@ -47,3 +42,8 @@ config BR2_PACKAGE_BIND_TOOLS
 	  Install tools (dig, host, nslookup, nsupdate)
 
 endif
+
+comment "bind needs a toolchain w/ NPTL, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
