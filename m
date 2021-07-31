Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEBBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE8AE60F56
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE8AE60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A0766F914;
	Wed,  4 Aug 2021 00:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LEuEd_pvOPB; Wed,  4 Aug 2021 00:59:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B9960B2F;
	Wed,  4 Aug 2021 00:59:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 441341BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6E0640F12
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDW6LNb-Ryvb for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7610B40EB0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CD25287C2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 62cab101356c97432da482e168adaf065de65c4f
X-Git-Newrev: e7c8da37fe70e10b5ca19267331e0f820445952a
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.CD25287C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dtc: bump to version
 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7c8da37fe70e10b5ca19267331e0f820445952a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This will fix a build failure with gcc 11

https://github.com/dgibson/dtc/releases/tag/v1.6.1

Fixes:
 - http://autobuild.buildroot.org/results/59305de179a5bde415cfd42d75e005b36b7ec4f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dtc/dtc.hash | 2 +-
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index 902ce1baf9..29b7e0b121 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,5 +1,5 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256  10503b0217e1b07933e29e8d347a00015b2431bea5f59afe0bed3af30340c82d  dtc-1.6.0.tar.xz
+sha256  65cec529893659a49a89740bb362f507a3b94fc8cd791e76a8d6a2b6f3203473  dtc-1.6.1.tar.xz
 
 # Hash for license files
 sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 749abc6cac..53f9c9c8df 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.6.0
+DTC_VERSION = 1.6.1
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
