Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE584C636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4142881E43;
	Sat, 28 Jan 2023 21:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4142881E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaWEMmzGgMCi; Sat, 28 Jan 2023 21:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2CC81E4D;
	Sat, 28 Jan 2023 21:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2CC81E4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC5931BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C07CC81E4D
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C07CC81E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHWeCwd5i01I for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:40:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAADD81E43
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAADD81E43
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D377687EDF; Sat, 28 Jan 2023 21:40:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b88adbf8f77fa2cfc75a80ae1eb0310f9c5ca6c
X-Git-Newrev: 3496f300a8ca2bb8b337db5d43be5b3293a4e9e4
X-Patchwork-Hint: ignore
Message-Id: <20230128214008.D377687EDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-greenlet: add missing C++
 dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
