Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF889C001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9437E8129E;
	Tue,  8 Aug 2023 22:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9437E8129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5uxALoQWuJj; Tue,  8 Aug 2023 22:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D698124A;
	Tue,  8 Aug 2023 22:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D698124A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25CB21BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECE6381221
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE6381221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DW4h2aFajbl for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FCCA8125B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FCCA8125B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F12C84E15; Tue,  8 Aug 2023 22:08:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:08:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9630075a6506e48ed6ba090b346346bd43f2a736
X-Git-Newrev: 69d4e3bc3ed0fec343ab0b85cac65a0a095d308c
X-Patchwork-Hint: ignore
Message-Id: <20230808220842.1F12C84E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/microchip/mpfs_icicle/post-image.sh: add quoting to make shellcheck
 happy
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

commit: https://git.buildroot.net/buildroot/commit/?id=69d4e3bc3ed0fec343ab0b85cac65a0a095d308c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/microchip/mpfs_icicle/post-image.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
index c0e95e1642..04b34bbd40 100755
--- a/board/microchip/mpfs_icicle/post-image.sh
+++ b/board/microchip/mpfs_icicle/post-image.sh
@@ -2,7 +2,7 @@
 HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
 MKIMAGE=${HOST_DIR}/bin/mkimage
 
-${HSS_PAYLOAD_GENERATOR} -c board/microchip/mpfs_icicle/config.yaml ${BINARIES_DIR}/payload.bin
-cp board/microchip/mpfs_icicle/mpfs_icicle.its ${BINARIES_DIR}/mpfs_icicle.its
-(cd ${BINARIES_DIR} && ${MKIMAGE} -f mpfs_icicle.its mpfs_icicle.itb)
+"${HSS_PAYLOAD_GENERATOR}" -c board/microchip/mpfs_icicle/config.yaml "${BINARIES_DIR}"/payload.bin
+cp board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
+(cd "${BINARIES_DIR}" && "${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb)
 support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
