Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A97CF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95906820A9;
	Wed,  2 Oct 2024 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbpfX4rC7HPn; Wed,  2 Oct 2024 20:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD9982101
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFD9982101;
	Wed,  2 Oct 2024 20:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D96C91BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65F1D407D2
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EMzTK3RLMO0 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D549840C8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D549840C8B
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D07C3838FA; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78e494e23908da964da3632735784dbc6b857947
X-Git-Newrev: 34e0130bc3d895a0b05bf997026e28248892b66f
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.D07C3838FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: remove STATIC from
 busybox-minimal.config
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

commit: https://git.buildroot.net/buildroot/commit/?id=34e0130bc3d895a0b05bf997026e28248892b66f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With FDPIC we want a shared busybox executable even with noMMU.
Static is already handled by busybox.mk for static toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/busybox-minimal.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 5d2a30806a..9733dd2156 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -40,7 +40,7 @@ CONFIG_FEATURE_SYSLOG=y
 #
 # Build Options
 #
-CONFIG_STATIC=y
+# CONFIG_STATIC is not set
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
