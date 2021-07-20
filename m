Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7DEC636C9
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DCF60FF3
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DCF60FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E5840504;
	Tue, 20 Jul 2021 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9idS3I9c1mc; Tue, 20 Jul 2021 20:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0224404D2;
	Tue, 20 Jul 2021 20:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07D5C1BF9BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 045CE8376D
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja6UzbFSbafB for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:45:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60B1083547
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2CF6588617; Tue, 20 Jul 2021 20:11:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:45:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0390d1ff164dd72fe3af3db357cdf49d7819706
X-Git-Newrev: e7b68ebd2bc171fed054d4dfc550c48fe1712735
X-Patchwork-Hint: ignore
Message-ID: <20210720201141.2CF6588617@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: fix license hash
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
Message-ID: <20210720204525.CiUqpdhep8LBBk1hkN5fjeie11hCKSsokzmrhzFCKQM@z>

commit: https://git.buildroot.net/buildroot/commit/?id=e7b68ebd2bc171fed054d4dfc550c48fe1712735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an unknown reason, commit 360d1aad84449c6a1993d8c7e469dc0cd35339a2
has set a wrong hash for CONTRIBUTING.md

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 6efd697af4..c9d4826a0b 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -3,4 +3,4 @@ sha256  701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873  Networ
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  65fd94885d3a5f468755e7cbe1334e56ef3a32b8a73980967fa9839c10514aa9  CONTRIBUTING.md
+sha256  e70c2d84a038b972beff16d8662f35567709dff2d552220bd1af6014f6d2215d  CONTRIBUTING.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
