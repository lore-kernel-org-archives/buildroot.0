Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ECCC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C63B402C0;
	Mon, 15 Jul 2024 10:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWhxWXNwG3d2; Mon, 15 Jul 2024 10:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCCA403CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCCA403CD;
	Mon, 15 Jul 2024 10:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFC311BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADB21607D5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjLbToLsc9xo for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 050B16079F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 050B16079F
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:50:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAC9786B2A; Mon, 15 Jul 2024 10:50:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:33:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c53455ea4ffaaee050e1e43a3c15fa98324d5235
X-Git-Newrev: c3068530747157cb130be2765ce1fd20d28e7ba9
X-Patchwork-Hint: ignore
Message-Id: <20240715105037.EAC9786B2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: install bash-completions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3068530747157cb130be2765ce1fd20d28e7ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See meson_options.txt file [1].

[1] https://github.com/tio/tio/blob/master/meson_options.txt

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tio/tio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index d7b554ee84..95831e8ce6 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -11,4 +11,10 @@ TIO_LICENSE = GPL-2.0+
 TIO_LICENSE_FILES = LICENSE
 TIO_DEPENDENCIES = inih
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+TIO_CONF_OPTS +=-Dbashcompletiondir=/usr/share/bash-completion/completions
+else
+TIO_CONF_OPTS +=-Dbashcompletiondir=no
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
