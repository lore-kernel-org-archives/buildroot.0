Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E6CC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7530D7006B;
	Tue, 21 Feb 2023 01:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7530D7006B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsirEd2iWYjQ; Tue, 21 Feb 2023 01:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D0670067;
	Tue, 21 Feb 2023 01:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D0670067
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96C101BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FD536FC15
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD536FC15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRkRyfXDW8XM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EC906FC19
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC906FC19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A805828C8; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e1e4f3950719dd92a2456e2c45856f8cf5dc587e
X-Git-Newrev: eb8f38891b16e5fb0f010c658b271e22670a1633
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.9A805828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: properly handle
 legacy for renamed ARC option
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb8f38891b16e5fb0f010c658b271e22670a1633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "50332a530b gcc: rename option for ARC gcc" tried to add legacy
handling but the new symbol is part of a choice, and Kconfig does not
enforce the select of a option from a choice.

Update the legacy entry for 2016.11, following the example described in
the beginning of the file.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 3 ++-
 package/gcc/Config.in.host | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1a325f8139..73d8ab4ca7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4100,10 +4100,11 @@ config BR2_LINUX_KERNEL_TOOL_SELFTESTS
 config BR2_GCC_VERSION_4_8_ARC
 	bool "gcc arc option renamed"
 	select BR2_LEGACY
-	select BR2_GCC_VERSION_ARC
 	help
 	  The option that selects the gcc version for the ARC
 	  architecture has been renamed to BR2_GCC_VERSION_ARC.
+# Note: BR2_GCC_VERSION_4_8_ARC is still referenced from
+# package/gcc/Config.in.host
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d7fedc9591..cd1b9fa46d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,6 +2,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
+	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
 	default BR2_GCC_VERSION_11_X
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
