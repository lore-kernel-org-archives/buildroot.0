Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF0DC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EF634175D;
	Wed, 22 Feb 2023 17:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF634175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJUbZ-yya3-U; Wed, 22 Feb 2023 17:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5445416FF;
	Wed, 22 Feb 2023 17:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5445416FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3D91BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C775940CAF
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C775940CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnlTECb9eBGD for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDFD8416CB
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDFD8416CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB8D282261; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:46:56 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5d2f70b381a1a13c8913799f4172dcbc3c9cebe2
X-Git-Newrev: 9afadcbe5cef8346caa4fc6569c151dbabae43f6
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.EB8D282261@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/openpowerlink:
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

commit: https://git.buildroot.net/buildroot/commit/?id=9afadcbe5cef8346caa4fc6569c151dbabae43f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
index 98861137d2..5ffeb01af3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4327,19 +4327,21 @@ config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
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
