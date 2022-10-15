Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1120EC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 14:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BCE160B83;
	Sat, 15 Oct 2022 14:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BCE160B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyxalK8CAo9R; Sat, 15 Oct 2022 14:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAF5E605E0;
	Sat, 15 Oct 2022 14:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF5E605E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7421BF307
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BA7460B3A
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA7460B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XciEOA9j8zUp for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1AE7605E0
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1AE7605E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BF2D86BF7; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:32:53 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 881d97d3e60773ad054f58847081e5bc5d2ad65e
X-Git-Newrev: 5db6d5f143b989495b54c0b5fb751fa355c0c300
X-Patchwork-Hint: ignore
Message-Id: <20221015143434.9BF2D86BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/volk: fix
 Config.in syntax error
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

commit: https://git.buildroot.net/buildroot/commit/?id=5db6d5f143b989495b54c0b5fb751fa355c0c300
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes:
package/volk/Config.in:4: syntax error
package/volk/Config.in:3: invalid option

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d395f49acf5222558601eb6d8300248bf7931051)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/volk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/volk/Config.in b/package/volk/Config.in
index 83d58d64ab..6a343e0751 100644
--- a/package/volk/Config.in
+++ b/package/volk/Config.in
@@ -1,6 +1,6 @@
 comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_VOLK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
