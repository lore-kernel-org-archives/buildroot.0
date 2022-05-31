Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E105FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7646241A21;
	Tue, 31 May 2022 08:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2RLkrmLvvmj; Tue, 31 May 2022 08:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E6A419FD;
	Tue, 31 May 2022 08:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC2E61BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB3CC8403B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ujhg0ol1r7GS for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:54:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E62183E1C
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:54:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E50486875; Tue, 31 May 2022 08:43:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:54:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 483b1105fd1ae94c6e76190e012b7c5f4f950167
X-Git-Newrev: 4141e017e199b4da088c33ce1f301d160ad23ed2
X-Patchwork-Hint: ignore
Message-Id: <20220531084307.0E50486875@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireshark: drop
 !BR2_arc dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4141e017e199b4da088c33ce1f301d160ad23ed2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is no longer a qt dependency as of:
16ffc6549465cb5d68b751f10603e8b0363bf9b0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index fdeb9da259..cd92beb1d1 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	depends on BR2_HOST_GCC_AT_LEAST_5 # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qt5
-	depends on !BR2_arc # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
@@ -39,7 +38,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	  Enable Qt5 GUI
 
 comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host gcc >= 5.0, gcc >= 5.0"
-	depends on !BR2_arc
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
