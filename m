Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E68C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 12:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED7460F39
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 12:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8ED7460F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42BED401D4;
	Thu, 26 Aug 2021 12:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4roaHYxzrWyv; Thu, 26 Aug 2021 12:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C41540212;
	Thu, 26 Aug 2021 12:53:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 315081BF873
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 12:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 204CA8269C
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 12:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Iqz-upOrGMb for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 12:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC5918268F
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 12:52:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BAC088CD3F; Thu, 26 Aug 2021 12:51:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 14:20:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 206c098f78da33cade7c2b8b6f8b71368c937c74
X-Git-Newrev: 73f34988bb81f3e9ea188ac49816dcf21d0276af
X-Patchwork-Hint: ignore
Message-Id: <20210826125156.BAC088CD3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "toolchain: handle toolchains with
 multiple ld*.so.* files"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=73f34988bb81f3e9ea188ac49816dcf21d0276af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This breaks some existing external toolchains. Since we're very close to
a release, don't try to fix it, but instead simply revert.

This reverts commit 6f911a17257d945eb3cb5c9c9a966f0e5fca0842.

Fixes: http://autobuild.buildroot.net/results/afe/afe44f4b6a3c53e5864cfb10b04529011e72cf5c/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/helpers.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 5ed149d57d..dfb2581ed5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -135,8 +135,10 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-       if ! find -wholename $(STAGING_DIR)'/lib/ld*.so.*' > /dev/null; then \
-               find -wholename $${ARCH_SYSROOT_DIR}'/lib/ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
+	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
+		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
+			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
+		fi ; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
