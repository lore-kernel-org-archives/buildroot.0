Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19600CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 14:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C70BF400CC;
	Thu, 12 Oct 2023 14:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C70BF400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXdEzkj_nuIo; Thu, 12 Oct 2023 14:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 057A24177B;
	Thu, 12 Oct 2023 14:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 057A24177B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3BD31BF365
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD3D28217D
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3D28217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmoGVlI37_M3 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F7B81368
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F7B81368
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6828845F9; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 16:38:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91045831247850d54d1eb13a54edcfdc5de80ab8
X-Git-Newrev: 3aee3a326d37ae5ddaf99bbc7bcf26a5c1ea7b2a
X-Patchwork-Hint: ignore
Message-Id: <20231012143924.B6828845F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcue: security bump to version
 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3aee3a326d37ae5ddaf99bbc7bcf26a5c1ea7b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2023-43641: Out-of-bounds array access in track_set_index
https://github.com/lipnitsk/libcue/security/advisories/GHSA-5982-x7hv-r9cj

For more details, see the github writeup:
https://github.blog/2023-10-09-coordinated-disclosure-1-click-rce-on-gnome-cve-2023-43641/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcue/libcue.hash | 2 +-
 package/libcue/libcue.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index 93ae2dacdb..47fe906e1a 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200  libcue-2.2.1.tar.gz
+sha256  cc1b3a65c60bd88b77a1ddd1574042d83cf7cc32b85fe9481c99613359eb7cfe  libcue-2.3.0.tar.gz
 sha256  c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f  LICENSE
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index 3edb4f3b69..7ef27f5a17 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCUE_VERSION = 2.2.1
+LIBCUE_VERSION = 2.3.0
 LIBCUE_SITE = $(call github,lipnitsk,libcue,v$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
