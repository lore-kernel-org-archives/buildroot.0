Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E098CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96270817B0;
	Wed,  6 Jul 2022 21:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96270817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOUjP8HYXfJW; Wed,  6 Jul 2022 21:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C7F81749;
	Wed,  6 Jul 2022 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C7F81749
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD91D1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88BA781749
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BA781749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjCD3gmiI7DW for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:46:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1BE5815CD
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1BE5815CD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EB1C28323E; Wed,  6 Jul 2022 21:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:45:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4138151e447e69771e2579ea5a3daa89c56d41a8
X-Git-Newrev: 0d566b8cc7146ad57dfdf7ef13aceb80b85acd9e
X-Patchwork-Hint: ignore
Message-Id: <20220706213335.EB1C28323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: fix indentation of options
 in menuconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d566b8cc7146ad57dfdf7ef13aceb80b85acd9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move kconfig comment below the "if BR2_PACKAGE_BIND...endif" block so
that the two sub-options are presented in menuconfig as subordinate to
"bind" package selection rather than equal to it as if they were
unrelated.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
