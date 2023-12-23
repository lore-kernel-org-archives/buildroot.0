Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3C1C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 18:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C93AA4011A;
	Sat, 23 Dec 2023 18:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C93AA4011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OvTSIiX974f; Sat, 23 Dec 2023 18:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E072A4011C;
	Sat, 23 Dec 2023 18:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E072A4011C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 118B51BF34C
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E21114011C
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 18:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E21114011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1L0nXQ3JdY5g for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 18:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C14B54011A
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 18:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C14B54011A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD568821BA; Sat, 23 Dec 2023 18:27:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 19:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce52fd55969c330868fdae2cb10c6f325a8f42c8
X-Git-Newrev: d344ffe6245b7ab67cbd4a2371c35354211983e3
X-Patchwork-Hint: ignore
Message-Id: <20231223182709.AD568821BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: add hash for custom uboot
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

commit: https://git.buildroot.net/buildroot/commit/?id=d344ffe6245b7ab67cbd4a2371c35354211983e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
