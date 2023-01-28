Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C1AC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1DB384024;
	Mon, 20 Feb 2023 23:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DB384024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CO_fKnJEQfbT; Mon, 20 Feb 2023 23:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D049984021;
	Mon, 20 Feb 2023 23:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D049984021
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD2E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FDC741778
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FDC741778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-bK9AuzbGFY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2BFE41771
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BFE41771
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC56E86495; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:39:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b88adbf8f77fa2cfc75a80ae1eb0310f9c5ca6c
X-Git-Newrev: 3496f300a8ca2bb8b337db5d43be5b3293a4e9e4
X-Patchwork-Hint: ignore
Message-Id: <20230220205241.BC56E86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-greenlet: add
 missing C++ dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3496f300a8ca2bb8b337db5d43be5b3293a4e9e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.net/results/529/5291fe0fac1d5c7b6587e4a566991a764a2632fb

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-greenlet/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
index 9f66ebe119..ae092e3ffe 100644
--- a/package/python-greenlet/Config.in
+++ b/package/python-greenlet/Config.in
@@ -12,7 +12,12 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_GREENLET
 	bool "python-greenlet"
 	depends on BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Lightweight in-process concurrent programming.
 
 	  https://github.com/python-greenlet/greenlet
+
+comment "python-greenlet needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
