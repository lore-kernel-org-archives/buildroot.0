Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF262C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7466640314;
	Sun,  9 Feb 2025 15:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAO9n0_ESuV9; Sun,  9 Feb 2025 15:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564F3405DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 564F3405DD;
	Sun,  9 Feb 2025 15:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BC14C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C06B81ABA
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEbzppWEhDQE for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B5E081AF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B5E081AF3
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC268745B; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 13:13:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f78d362aa907ee019b9f43c56c8f4322d242f3c
X-Git-Newrev: aebbf57354d76ce22fd51718e07dc0a3cd3db116
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.1DC268745B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/terasic/de10nano_cyclone5: disable
 shellcheck SC2276
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=aebbf57354d76ce22fd51718e07dc0a3cd3db116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable shellcheck SC2276 warning introduced in v0.7.2 [1]
for barebox environment file.

[1] https://github.com/koalaman/shellcheck/commit/fbb14d6b384a65ee16781966d9d240db9ed7b644

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/terasic/de10nano_cyclone5/barebox-env/boot/mmc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
index fed2b0b45d..6cf307b80b 100644
--- a/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
+++ b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
@@ -1,5 +1,6 @@
 #!/bin/sh
 
+# shellcheck disable=SC2276
 global.bootm.oftree="/boot/socfpga_cyclone5_de0_nano_soc.dtb"
 global.bootm.image="/boot/zImage"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
