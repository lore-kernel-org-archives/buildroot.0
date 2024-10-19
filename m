Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAA3D3C926
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B71060745;
	Sat, 19 Oct 2024 18:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJc5xmkopIGv; Sat, 19 Oct 2024 18:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D5D160763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5D160763;
	Sat, 19 Oct 2024 18:43:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 225423F2C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B40B80D39
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG3Q0zsw4fsx for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC29580C9C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC29580C9C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D78B086008; Sat, 19 Oct 2024 18:43:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 20:42:22 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: a8f70006e7a73d7579c380fa142530331fbc0a1d
X-Git-Newrev: 87cb2999c3ae700b1bb43fa7c920c9391b393b13
X-Patchwork-Hint: ignore
Message-Id: <20241019184307.D78B086008@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] docs/manual: do not
 instruct doctoring the saved defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=87cb2999c3ae700b1bb43fa7c920c9391b393b13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Doctoring a defconfig is tedious, and it is not easy to update a
defconfig, as it requires manual copy-pasting, adding comments and so
on...

Instead, just require defconfigs to be generated with 'savedefconfig'.
Any details can/must be provided in the commit log.

Reported-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 17bdd10cb350e9c45926c2a5a05f278d104ee4c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-board-support.adoc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/docs/manual/adding-board-support.adoc b/docs/manual/adding-board-support.adoc
index be7699668d..0f7d534603 100644
--- a/docs/manual/adding-board-support.adoc
+++ b/docs/manual/adding-board-support.adoc
@@ -22,11 +22,7 @@ selections are highly application-specific.
 Once you have a known working configuration, run +make
 savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +<boardname>_defconfig+. If the configuration
-is a bit more complicated, it is nice to manually reformat it and
-separate it into sections, with a comment before each section. Typical
-sections are _Architecture_, _Toolchain options_ (typically just linux
-headers version), _Firmware_, _Bootloader_, _Kernel_, and _Filesystem_.
+directory, and rename it +<boardname>_defconfig+.
 
 Always use fixed versions or commit hashes for the different
 components, not the "latest" version. For example, set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
