Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F002C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD0E41728;
	Wed, 22 Feb 2023 17:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBD0E41728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyuvCM_agukH; Wed, 22 Feb 2023 17:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 012BF4176A;
	Wed, 22 Feb 2023 17:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012BF4176A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B547C1BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC4C281430
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4C281430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoOHKktE_1T9 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9211481FFC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9211481FFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E8A1867D1; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:47:06 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d91470731e28e3c6c42e95e5c405b6e8ff975feb
X-Git-Newrev: 693f779fe85292ae9cae612867afe4de05f3cfcc
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.8E8A1867D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openpowerlink:
 properly handle legacy options
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

commit: https://git.buildroot.net/buildroot/commit/?id=693f779fe85292ae9cae612867afe4de05f3cfcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "b1063a0136 package/openpowerlink: bump to v2.2.2" tried to add
legacy handling but the new symbols are part of a choice, and Kconfig
does not enforce the select of a option from a choice.

Update the legacy entry for 2016.02, following the example described in
the beginning of the file.

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e1e4f3950719dd92a2456e2c45856f8cf5dc587e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                | 6 ++++--
 package/openpowerlink/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5000c7a7be..6f5d01709a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4152,19 +4152,21 @@ config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
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
