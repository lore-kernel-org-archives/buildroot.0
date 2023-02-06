Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AFFC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC7660AF4;
	Mon,  6 Feb 2023 13:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC7660AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ujY7OCJa88o; Mon,  6 Feb 2023 13:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DCB60AE8;
	Mon,  6 Feb 2023 13:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1DCB60AE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11B661BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E8340360
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E8340360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B3VPf_Rut8pR for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 875F040477
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875F040477
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7620483C25; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 367bd65f3c216426e2fc21742dbff11ea8d896d7
X-Git-Newrev: e1e4f3950719dd92a2456e2c45856f8cf5dc587e
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.7620483C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openpowerlink: properly handle
 legacy options
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1e4f3950719dd92a2456e2c45856f8cf5dc587e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "b1063a0136 package/openpowerlink: bump to v2.2.2" tried to add
legacy handling but the new symbols are part of a choice, and Kconfig
does not enforce the select of a option from a choice.

Update the legacy entry for 2016.02, following the example described in
the beginning of the file.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                | 6 ++++--
 package/openpowerlink/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 94d6ce19f5..1a325f8139 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4443,19 +4443,21 @@ config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
 	bool "openpowerlink package has been updated"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 	help
 	  openpowerlink kernel modules are built if the
 	  kernel stack library is selected.
+# Note: BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE is still referenced from
+# package/openpowerlink/Config.in
 
 config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
 	bool "openpowerlink package has been updated"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 	help
 	  The user space support has been split in two part:
 	  - a monolithic user space library
 	  - a user space daemon driver
+# Note: BR2_PACKAGE_OPENPOWERLINK_LIBPCAP is still referenced from
+# package/openpowerlink/Config.in
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "using the linux headers version for the kernel has been removed"
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 1a3dd62acd..ef59a04baf 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -38,6 +38,8 @@ endchoice
 
 choice
 	prompt "stack type"
+	default BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE # legacy
+	default BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB if BR2_PACKAGE_OPENPOWERLINK_LIBPCAP # legacy
 
 config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
 	bool "linked into application"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
