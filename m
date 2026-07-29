Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46391C53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB06E80E4C;
	Wed, 29 Jul 2026 20:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwBG_iVGm9hq; Wed, 29 Jul 2026 20:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE1C80E4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785355593;
	bh=FAWv6Ql13DrCqXCYlAIokPY3DrGOUYH1TjmxHWBBPRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BqGXYddApIvFUDgizNx6az0xFBYqDbyfXNdoSmLuLyXbfQHUlWvq+BzgFePvUnh4f
	 iVLnDypHJQsCkhG+fXBJwCWc73OaPrxpDegrLTiLnMM5tfu6jPD2AdDtfldG7bA6Us
	 z2Zquy0JPo1fxIHOt9sTkLD+6sL5U3A6qM+QeGKxGnD2LyiktNmp5G01kGWXoU+rpf
	 xAvYD45Zy6tp17QE6fhAw8nNw6Lue/5GS8JTAMtb5tAJly4D0ne6Ze6DF+7baLe0u9
	 TwYkVzYwhRnxWguGeP5D8PtGL5CLlKYOobVKF0LyTVVSxk7RfsBsLVR53agMvB/eFn
	 BeNCuzZsqSG3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE1C80E4F;
	Wed, 29 Jul 2026 20:06:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 429DA26E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2813260731
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAM560vtW8aC for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 655FD605E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 655FD605E8
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21F0E8B553; Wed, 29 Jul 2026 20:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 21:19:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c1a81106e0e781cc662a8956d271dd59e9e5945
X-Git-Newrev: 6b47cae61a9fd73f3be857b520e26ee0d1a9d8d4
X-Patchwork-Hint: ignore
Message-Id: <20260729200548.21F0E8B553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-artifact: bump version to
 4.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b47cae61a9fd73f3be857b520e26ee0d1a9d8d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Update License hash due to year change to 2026.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: add "package/" in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-artifact/mender-artifact.hash | 6 +++---
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 19f650046a..5dffdbb7df 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  14ba008df9b24321de72821de394bc4326e4dd9e17ed7c111340689e90d8b596  mender-artifact-4.2.0-go2.tar.gz
-sha256  a99c495576ecc6d6e137e471c515d38757179240ff6cc41bd481e29d3504f334  LIC_FILES_CHKSUM.sha256
+sha256  c7002052028496f230c34ef6f0488bf5e8ca32b075b7a96555532fe928aed984  mender-artifact-4.4.1-go2.tar.gz
+sha256  0e7c48f6471ca81a2fce9e3f605dffeb0385afd4dc3b5eb7f4e86ece4aa9b068  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -8,7 +8,7 @@ sha256  a99c495576ecc6d6e137e471c515d38757179240ff6cc41bd481e29d3504f334  LIC_FI
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256  38791d93beae962b266e11ac888ea2af4f07578b272c2f9dcb05f54f32960a76  LICENSE
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  132fb47b89947cd5f98e380186bc412af5561c70669d37d3a83b36f03a0ddae5  vendor/github.com/mendersoftware/progressbar/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/genproto/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 609ce05c5a..9f235b55bd 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 4.2.0
+HOST_MENDER_ARTIFACT_VERSION = 4.4.1
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 # Vendor license paths generated with:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
