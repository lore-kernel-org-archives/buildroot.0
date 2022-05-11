Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A436C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 11:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 217D783366;
	Wed, 11 May 2022 11:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMBTSXjp4Wis; Wed, 11 May 2022 11:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BCB5832C9;
	Wed, 11 May 2022 11:10:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 039131BF9C2
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 11:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0018E40286
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 11:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrygHDAYvmio for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 11:10:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42664010C
 for <buildroot@buildroot.org>; Wed, 11 May 2022 11:10:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4D919CFD17
 for <buildroot@buildroot.org>; Wed, 11 May 2022 11:06:38 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 31F3EE0011;
 Wed, 11 May 2022 11:06:32 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 13:06:19 +0200
Message-Id: <20220511110619.1610327-2-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220511110619.1610327-1-foss+buildroot@0leil.net>
References: <20220511110619.1610327-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] manual: add LIBFOO_ROOTFS_PRE_CMD_HOOKS docs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Even though it's barely used in packages, let's list the hook in the
list of supported hooks.

Also add a specific section to explain what's its use and how it
differs from LIBFOO_TARGET_FINALIZE_HOOKS.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 docs/manual/adding-packages-hooks.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 741b71ca29..9dd77bece3 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -48,6 +48,8 @@ The following hook points are available:
 
 * +LIBFOO_TARGET_FINALIZE_HOOKS+
 
+* +LIBFOO_ROOTFS_PRE_CMD_HOOKS+
+
 These variables are 'lists' of variable names containing actions to be
 performed at this hook point. This allows several hooks to be
 registered at a given hook point. Here is an example:
@@ -87,3 +89,12 @@ Packages may also register hooks in +LIBFOO_TARGET_FINALIZE_HOOKS+.
 These hooks are run after all packages are built, but before the
 filesystem images are generated. They are seldom used, and your
 package probably do not need them.
+
+==== Rootfs pre-hook
+
+Packages may also register hooks in +LIBFOO_ROOTFS_PRE_CMD_HOOKS+.
+These hooks are run after all packages are built, but before the
+filesystem images are generated. They are run under fakeroot, in a
+temporary directory and after all +*_TARGET_FINALIZE_HOOKS+ have
+been run.
+They are seldom used, and your package probably do not need them.
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
