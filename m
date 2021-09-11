Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2BDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52BF5611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52BF5611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A9F94022F;
	Sat, 11 Sep 2021 14:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6l2-LCnX2aJi; Sat, 11 Sep 2021 14:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D8E240597;
	Sat, 11 Sep 2021 14:22:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED6711BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCA9140458
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQ3G0puyFzxg for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AF6E40461
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2B1D989017; Sat, 11 Sep 2021 14:20:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:15:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7a30c2673c03996a0014ac5da21f8b3b266d4d3
X-Git-Newrev: 9080d628aa8a350514bfe24a6ffbd0b37a74ba7e
X-Patchwork-Hint: ignore
Message-Id: <20210911142032.2B1D989017@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: drop unrecognized options
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9080d628aa8a350514bfe24a6ffbd0b37a74ba7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MATLAB_BINDINGS and WITH_MATLAB_BINDINGS_API have been dropped since
version 0.21 and
https://github.com/analogdevicesinc/libiio/commit/b968f81375b8e3e03467e2765173434dc6e1922c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libiio/libiio.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index aec251e9a1..b36ea3bafe 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -13,8 +13,6 @@ LIBIIO_LICENSE_FILES = COPYING.txt
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
 	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
-	-DWITH_MATLAB_BINDINGS_API=OFF \
-	-DMATLAB_BINDINGS=OFF \
 	-DINSTALL_UDEV_RULE=$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
