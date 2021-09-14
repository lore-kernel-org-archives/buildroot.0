Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C655BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:15:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739466112D
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 739466112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B30607DA;
	Tue, 14 Sep 2021 06:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_Gw1B78Xdd6; Tue, 14 Sep 2021 06:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A953C607D9;
	Tue, 14 Sep 2021 06:15:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6131E1BF31B
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38FC54018C
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5L9v_SANOKu for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5691A40183
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0F77F8AF41; Tue, 14 Sep 2021 06:13:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 08:13:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 141c4726c226b0e187c527ce320f897ef71f1311
X-Git-Newrev: 495316758070f7859f974e0594928c5dbe6712de
X-Patchwork-Hint: ignore
Message-Id: <20210914061300.0F77F8AF41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre: fix license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=495316758070f7859f974e0594928c5dbe6712de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0e5a901d3141a3d7e477f0fb79e8f6a748f06449 forgot to update license
hash (updates in year and email)

Fixes:
 - http://autobuild.buildroot.org/results/045cd98a4067f1314deb66f52240d2db2000ec4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index a84d63e1bc..6150303e24 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256  4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8  pcre-8.45.tar.bz2
 # License files, locally calculated
-sha256  0dd9c13864dbb9ee4d77a1557e96be29b2d719fb6584192ee36611aae264c4a3  LICENCE
+sha256  51b3dea44f63338b84b9c97b3d793826a8397309068cf9379a423216ab8ea5b2  LICENCE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
