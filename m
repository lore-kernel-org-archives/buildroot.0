Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7F1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C17384EDB;
	Thu, 27 Jan 2022 18:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdSUMxQmzV9U; Thu, 27 Jan 2022 18:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62DDE84ECB;
	Thu, 27 Jan 2022 18:33:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6752A1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B89D184ED0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHa4tDZJkpft for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B77F484EEC
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6030082A00; Thu, 27 Jan 2022 18:25:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:21:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: dcc1585d9ddb12ff849cf0e0940d90389e23123e
X-Git-Newrev: 213d4e125ddb398cacbe4a0aec4f631f3ca1d55c
X-Patchwork-Hint: ignore
Message-Id: <20220127182510.6030082A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libvirt: drop C++
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=213d4e125ddb398cacbe4a0aec4f631f3ca1d55c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Commit f81242ae4fb64ab85af5d38e70246222276552ae forgot to drop C++
comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fb9a65d98b128c1b06069013e0ab874779ef5228)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index b91b8e2c1c..af0fc36aea 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -56,9 +56,6 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
-comment "libvirtd needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP && !BR2_PACKAGE_NETCAT_OPENBSD
-
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
