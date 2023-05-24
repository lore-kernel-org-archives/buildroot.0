Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C52BC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6AAB840AA;
	Wed, 24 May 2023 19:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6AAB840AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DV9nIOw3AVkZ; Wed, 24 May 2023 19:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C338405E;
	Wed, 24 May 2023 19:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C338405E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59B611BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0038D41C4B
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0038D41C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74GEvasI8K9T for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 19:16:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E15A429E0
 for <buildroot@buildroot.org>; Wed, 24 May 2023 19:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E15A429E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BFAA868B7; Wed, 24 May 2023 19:16:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 21:14:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32ddbbcf3f1d96290d1130be999b13eea006f71
X-Git-Newrev: e418a2c06a1bdc7a5fc65ce58400ed0a9c9e28bb
X-Patchwork-Hint: ignore
Message-Id: <20230524191609.2BFAA868B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain-external-custom: Describe
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
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

commit: https://git.buildroot.net/buildroot/commit/?id=e418a2c06a1bdc7a5fc65ce58400ed0a9c9e28bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"Toolchain prefix" option apparently doesn't have any help describing
it, which causes confusion when using external toolchain. Leaving this
option at default prefix name ("$(ARCH)-linux") when external toolchain
components are called with different prefix (e.g.
"$(ARCH)-unknown-linux-gnu") may cause build failure unless the prefix
symlink is already in place (e.g. when using Buildroot-generated
toolchain as external toolchain).

Describe the option to clarify.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external-custom/Config.in.options           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0fd8841e5b..8ca66ab7b6 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -24,6 +24,21 @@ config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
 	default "$(ARCH)-linux"
+	help
+	  Component name prefix used by your external toolchain.
+
+	  Typically, this is the target tuple, e.g. something that
+	  looks like: $(ARCH)-unknown-linux-gnu.
+
+	  If unsure, look at the "bin" directory of your toolchain and
+	  note the part of component name before the last dash, i.e. if
+	  you call the toolchain's gcc as $(ARCH)-unknown-linux-gnu-gcc,
+	  the prefix is $(ARCH)-unknown-linux-gnu.
+
+	  Note that Buildroot toolchains have shorter aliases that look
+	  like $(ARCH)-linux, as symlinks to the full-tuple components,
+	  so you can leave this option at default value if you use them
+	  as external toolchain.
 
 choice
 	bool "External toolchain gcc version"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
