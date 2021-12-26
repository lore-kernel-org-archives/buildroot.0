Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1380C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 22:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21ED1408A1;
	Sun, 26 Dec 2021 22:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N95ZtiUkj9-r; Sun, 26 Dec 2021 22:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6354088C;
	Sun, 26 Dec 2021 22:29:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 168421BF2B9
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F181740441
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 22:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExpzVP5XLlcb for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 22:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2333D40298
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 22:28:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6022382A71; Sun, 26 Dec 2021 22:23:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:28:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce26a2418b7c091a0dcd68f249a797c1f81c2fd5
X-Git-Newrev: 6d9d6996952c04cf49d3687003cb4d3d69236ce3
X-Patchwork-Hint: ignore
Message-Id: <20211226222306.6022382A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libseccomp: enable s390x support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d9d6996952c04cf49d3687003cb4d3d69236ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x is supported since version 2.3.0 and
https://github.com/seccomp/libseccomp/commit/02030ce9920181bc1058990ecaefaa754de9ad3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libseccomp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index d3b4bb8192..da1d9008e6 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc
+	default y if BR2_s390x
 
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
