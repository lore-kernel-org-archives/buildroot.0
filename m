Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4C2C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2418E4046A;
	Mon,  6 Feb 2023 13:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2418E4046A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7YRMgT5XHcx; Mon,  6 Feb 2023 13:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34C7E403B8;
	Mon,  6 Feb 2023 13:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34C7E403B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7E211BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0AC60A7A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF0AC60A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wR4VmKB4UJzK for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:43:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E91F2605D6
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91F2605D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4F4483C4D; Mon,  6 Feb 2023 13:43:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:40:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3727229222f23d151a4991ef3db451df6362ce83
X-Git-Newrev: 00410ab668833d822f645fffd782ce11253457b1
X-Patchwork-Hint: ignore
Message-Id: <20230206134318.D4F4483C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: select BR2_LEGACY from
 _XF86_INPUT_KEYBOARD
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

commit: https://git.buildroot.net/buildroot/commit/?id=00410ab668833d822f645fffd782ce11253457b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1100ead7b318 (package/x11r7/xdriver_xf86-input-keyboard: remove
package) added a legacy symbol for BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD,
but forgot to select BR2_LEGACY.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bfebe3f89..191a209eeb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -210,6 +210,7 @@ config BR2_PACKAGE_QEMU_CUSTOM_TARGETS_WRAP
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	bool "xf86-input-keyboard removed"
+	select BR2_LEGACY
 	help
 	  The X.org keyboard input driver no longer support Linux.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
