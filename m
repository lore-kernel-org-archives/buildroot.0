Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57FAECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F656122C;
	Fri, 16 Sep 2022 11:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F656122C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4hHy-SiBUUH; Fri, 16 Sep 2022 11:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BAB16121B;
	Fri, 16 Sep 2022 11:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BAB16121B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09A221C2744
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF08D41959
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF08D41959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJ4vEZDr3oKW for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9FEF418B8
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9FEF418B8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C7C8083CC2; Fri, 16 Sep 2022 11:47:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:12:04 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5c6883694a7ccc556e144bc8c2ee737f385bacda
X-Git-Newrev: ba1169a88cb462ad1aad7d0aa7fe4192e1a46e7d
X-Patchwork-Hint: ignore
Message-Id: <20220916114713.C7C8083CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/ola: ftdidmx
 needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba1169a88cb462ad1aad7d0aa7fe4192e1a46e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure raised since re-introduction of the
package in commit 16ff948444c3978d63f483344a3d92d994c64312:

Makefile:575: *** libusb is in the dependency chain of libftdi1 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/f65baf4dd4c9a313745cdb9aefad2eae7a295469

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac98e808e4485cc93b5456f57d12cc247926c701)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index cfca09a936..701083b5d3 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -86,10 +86,14 @@ config BR2_PACKAGE_OLA_PLUGIN_ESPNET
 
 config BR2_PACKAGE_OLA_PLUGIN_FTDIDMX
 	bool "ftdidmx"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Build FTDI USB DMX plugin for OLA.
 
+comment "ftdidmx needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_GPIO
 	bool "GPIO"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
