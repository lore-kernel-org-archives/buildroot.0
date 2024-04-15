Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EB8C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C2038131A;
	Mon, 15 Apr 2024 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4EYrIFhEj34; Mon, 15 Apr 2024 16:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1818F814B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1818F814B8;
	Mon, 15 Apr 2024 16:27:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 141201BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0138F605C9
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jOuSBSSyaQI for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44870605BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44870605BB
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F36B860AF; Mon, 15 Apr 2024 16:27:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:06:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47027fefa4a0c79b03dee381a75647d735a41f9f
X-Git-Newrev: 6e019fed31257a156965c95561ca7c83333a7565
X-Patchwork-Hint: ignore
Message-Id: <20240415162719.2F36B860AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-tools: rename Kconfig prompt
 to bmaptool
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e019fed31257a156965c95561ca7c83333a7565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Historically, the package was named bmap-tools, and that's the name
under which it was introduced in Buildroot. Since then, it has moved to
a new home (i. e. to https://github.com/yoctoproject/bmaptool) under the
Yocto Project umbrella, and got renamed to bmaptool. To avoid useless
churn, we keep the old symbols, and just refer to bmaptool in the
prompt.

Link: https://patchwork.ozlabs.org/project/buildroot/patch/20240413131757.3627575-2-dario.binacchi@amarulasolutions.com
Suggested-by: Yann E. Morin <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bmap-tools/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index 425b7dfb9e..b5ccce786e 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -1,5 +1,9 @@
+# Historically, the package was named bmap-tools, and that's the name
+# under which it was introduced in Buildroot. Since then, it has moved
+# to a new home, and got renamed to bmaptool. To avoid useless churn,
+# we keep the old symbols, and just refer to bmaptool in the prompt.
 config BR2_PACKAGE_BMAP_TOOLS
-	bool "bmap-tools"
+	bool "bmaptool (formerly bmap-tools)"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
