Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA1C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 11:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E863560B70;
	Mon,  8 Jan 2024 11:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E863560B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vdiedn5KA4Ua; Mon,  8 Jan 2024 11:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 273E160F66;
	Mon,  8 Jan 2024 11:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 273E160F66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 257C51BF8B4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 11:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED08C40622
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 11:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED08C40622
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_x5qM5VA6yK for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 11:08:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C780040591
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 11:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C780040591
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B382584BBD; Mon,  8 Jan 2024 11:08:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 12:03:48 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a3d291e8f6ad2b970a81c1b8a7e7f25a69ffc229
X-Git-Newrev: 92f06caf4d89cf2a2395f0780fbf8bf203bb9621
X-Patchwork-Hint: ignore
Message-Id: <20240108110838.B382584BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] configs/rock5b: add hash
 for custom uboot
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

commit: https://git.buildroot.net/buildroot/commit/?id=92f06caf4d89cf2a2395f0780fbf8bf203bb9621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The defconfig uses a custom uboot version, downloaded with wget, so we
weant to be sure that it does not get modified on the server, so we add
a hash for it.

The kernel we get from a git clone, so the sha1 of the commit is enough
to be sure that what we get is what we expect (because we do a local
tarball out of a git clone).

Since we only get a hash for uboot and not for the kernel, we don't
enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d344ffe6245b7ab67cbd4a2371c35354211983e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..efd629bd2f
--- /dev/null
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  12e921b466ae731cdbc355e6832b7f22bc90b01aeceef9886f98aaba7b394300  u-boot-2023.07.tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
