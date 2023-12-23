Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23938C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 11:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C07B783B4B;
	Sat, 23 Dec 2023 11:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C07B783B4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ztpt04GdiPui; Sat, 23 Dec 2023 11:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0433482540;
	Sat, 23 Dec 2023 11:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0433482540
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3B621BF3C8
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 11:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA4C860BE8
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 11:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4C860BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yL3yrU4R_Wlq for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 11:19:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECF2160AD5
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 11:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECF2160AD5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D517887C2E; Sat, 23 Dec 2023 11:19:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 12:13:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc8eff0c76ab35db7d783ce7959193ff4c30a01e
X-Git-Newrev: 5baf1ffe7ec959356b5bf4ba8dd6d7e1d4d8689c
X-Patchwork-Hint: ignore
Message-Id: <20231223111919.D517887C2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: bump to version 2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=5baf1ffe7ec959356b5bf4ba8dd6d7e1d4d8689c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announce on mailing list, see [1].
For release general news, see [2].

This commit removes all package patches, as they are all included in
this version.

The .checkpackageignore file is updated accordingly (the entry for
patch 0001 is removed).

This commit also removes GRUB2_AVOID_AUTORECONF hooks, since patch
0001 is removed.

This commit also removes the GRUB2_IGNORE_CVES entries associated to
the removed patches. The version bump should now explicitly exclude
those CVEs. For patches 8 and 9, the upstream commit IDs were
incorrectly recorded:
  - patch 8 mentioned d5caac8ab79d068ad9a41030c772d03a4d4fbd7b while
    the actual commit is 5bff31cdb6b93d738f850834e6291df1d0b136fa
  - patch 9 mentioned 166a4d61448f74745afe1dac2f2cfb85d04909bf while
    the actual commit is 347880a13c239b4c2811c94c9a7cf78b607332e3

Finally, this commit introduces a new patch, adding a missing file in
the release tarball.

[1] https://lists.gnu.org/archive/html/grub-devel/2023-12/msg00052.html
[2] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=blob;f=NEWS;hb=refs/tags/grub-2.12

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |   1 -
 ...-grub-core-extra_deps.lst-file-in-release.patch |  37 ++
 ...ke-grub_fstest.pp-depend-on-config-util.h.patch |  45 --
 ...b-mkconfig-Restore-umask-for-the-grub.cfg.patch |  43 --
 ...efi-chainloader-Simplify-the-loader-state.patch | 126 ----
 ...ds-boot-Add-API-to-pass-context-to-loader.patch | 165 -----
 ...er-efi-chainloader-Use-grub_loader_set_ex.patch |  80 ---
 ...-Reject-non-kernel-files-in-the-shim_lock.patch | 105 ----
 .../0007-video-Remove-trailing-whitespaces.patch   | 689 ---------------------
 ...rs-png-Abort-sooner-if-a-read-operation-f.patch | 204 ------
 ...rs-png-Refuse-to-handle-multiple-image-he.patch |  34 -
 ...rs-png-Drop-greyscale-support-to-fix-heap.patch | 173 ------
 ...rs-png-Avoid-heap-OOB-R-W-inserting-huff-.patch |  44 --
 ...rs-jpeg-Block-int-underflow-wild-pointer-.patch |  78 ---
 .../0013-net-ip-Do-IP-fragment-maths-safely.patch  |  56 --
 ...http-Fix-OOB-write-for-split-http-headers.patch |  50 --
 ...p-Error-out-on-headers-with-LF-without-CR.patch |  52 --
 ...ze-overflow-in-grub_font_get_glyph_intern.patch | 116 ----
 ...veral-integer-overflows-in-grub_font_cons.patch |  83 ---
 ...ont-Fix-an-integer-underflow-in-blit_comb.patch |  93 ---
 ...xt2-Ignore-checksum-seed-incompat-feature.patch |  61 --
 ...xt2-Ignore-the-large_dir-incompat-feature.patch |  60 --
 boot/grub2/grub2.hash                              |   4 +-
 boot/grub2/grub2.mk                                |  30 +-
 24 files changed, 40 insertions(+), 2389 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
