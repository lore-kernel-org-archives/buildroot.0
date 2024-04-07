Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F369CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7FB1414EB;
	Sun,  7 Apr 2024 20:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znHgRh--H1yk; Sun,  7 Apr 2024 20:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65DEF414EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65DEF414EF;
	Sun,  7 Apr 2024 20:30:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48ADA1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3608760895
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAYtubWj10jA for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 555D76065D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 555D76065D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F89085D04; Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:51:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2711a7c6d70c7e64e2eec20f87311126830b774a
X-Git-Newrev: ae1d482a3d1ebbae3f58fb6cf847d78a554d48a2
X-Patchwork-Hint: ignore
Message-Id: <20240407203020.3F89085D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/ti/am6{2,
 4}x-sk: add arm-trusted-firmware v2.7 hash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae1d482a3d1ebbae3f58fb6cf847d78a554d48a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are going to enable BR2_DOWNLOAD_FORCE_CHECK_HASHES by default
to enforce downloads to have at least one valid hash including
those that use a custom version.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 ++
 .../ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..74fe35c9bc
--- /dev/null
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..74fe35c9bc
--- /dev/null
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
