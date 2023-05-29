Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9B0C77B7E
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 07:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A997741C3B;
	Mon, 29 May 2023 07:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A997741C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcMQCY6ubGH0; Mon, 29 May 2023 07:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C782941C3A;
	Mon, 29 May 2023 07:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C782941C3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C81F1BF962
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34EBD417C2
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34EBD417C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYVkwDRLYl5p for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 07:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59D2E417B8
 for <buildroot@buildroot.org>; Mon, 29 May 2023 07:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D2E417B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45C2A86A2C; Mon, 29 May 2023 07:15:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 May 2023 09:14:24 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0a92e971968191a7e209015721a5f44c38f5acaf
X-Git-Newrev: 971cabfd917627b5d7a3c11e5342126b0e351cf6
X-Patchwork-Hint: ignore
Message-Id: <20230529071523.45C2A86A2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 toolchain-external-custom: Describe BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
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

commit: https://git.buildroot.net/buildroot/commit/?id=971cabfd917627b5d7a3c11e5342126b0e351cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit e418a2c06a1bdc7a5fc65ce58400ed0a9c9e28bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-custom/Config.in.options           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1c39334ddd..e9a9c1c2a1 100644
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
