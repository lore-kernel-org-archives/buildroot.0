Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F9EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC51B828DD;
	Sat, 22 Jan 2022 19:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 455ppD0z7W69; Sat, 22 Jan 2022 19:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0604682871;
	Sat, 22 Jan 2022 19:42:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 465301BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 248A660BBF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcXwqEaB6qHs for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:42:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9104C60BBC
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:42:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 303D8813B5; Sat, 22 Jan 2022 19:35:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 20:11:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5039c49d580eaaea493c28c707314a233e40c9fa
X-Git-Newrev: a1945979c8e418063240bc3d3f9c512b878f9acf
X-Patchwork-Hint: ignore
Message-Id: <20220122193531.303D8813B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: update supported
 protocol versions in help texts
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1945979c8e418063240bc3d3f9c512b878f9acf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index df9c12ca44..f00debc420 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_NFS_UTILS
 	help
 	  The NFS Linux kernel server.
 
+	  Supports NFSv3 and optionally NFSv4 (and later).
+
 	  http://linux-nfs.org/
 
 if BR2_PACKAGE_NFS_UTILS
@@ -24,7 +26,7 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_SQLITE
 	help
-	  Enable NFSv4/NFSv4.1 support
+	  Enable NFSv4/NFSv4.1/NFSv4.2 support
 
 comment "NFSv4/NFSv4.1 support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
