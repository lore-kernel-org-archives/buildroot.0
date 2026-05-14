Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42607CD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDCB8553B;
	Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqK2J6lig8UB; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00238554B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010082;
	bh=pM3lTJ9fiC4yLJzg/BhMwegosw3nGu1YH5mfqa3fl8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fnAJaU8F2rUfce0kMAusJ5Jxw+OqkedHQ97wJ5AYnUHIYM2AvKjVwTBbqVHp1MvIU
	 x/PJxbzjlZFcax8MWPKVug60UeRgkV2MLRTTMDK2PfilMj44mizOHZgv+HXjRa7tBs
	 IWY9te+wniEkxGFKeZ78XDLnOEaDtv/DxXcqpqKG3p4IzACHiRSA01lA28rqBRiozZ
	 YewKF9lgLfbh54hYMtJWUaD8u95jv8rRcyRR8pLl48FkSnVi/Gn1Fa5fuBDcXKnyuC
	 e9HtY7jFTDvQ12RM5ib6flscgDxYEU0YQxsQn4Qsu3olIbPfCE7gd0Lft8XaLP652u
	 y+cAlA0Cb1BSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D00238554B;
	Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F7CE2EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F8540CA5
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyroPiPg32Mi for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85DD40C0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A85DD40C0A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D782687DE8; Tue,  9 Jun 2026 13:00:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:14:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62afff3baabd4535cb6909e7324779aea577ad85
X-Git-Newrev: 0452451195518ab694bb488b6e5e8b2d5073551e
X-Patchwork-Hint: ignore
Message-Id: <20260609130053.D782687DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump to version 1.22.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0452451195518ab694bb488b6e5e8b2d5073551e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes, since 1.22.0:
https://github.com/containers/skopeo/releases/tag/v1.22.1
https://github.com/containers/skopeo/releases/tag/v1.22.2

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 72b5b07801..20ceebeb8a 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc9aa749973b10d3c2672d2839e61bac75cf32d5e5106463420b83653c9df3ff  skopeo-1.22.0-go2.tar.gz
+sha256  b6e1f208c1048f7a80613e8154774e6a3fdc891aeb45325c8ed905be4dee48d8  skopeo-1.22.2-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 2dcad871df..fe9becaaa6 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.22.0
+SKOPEO_VERSION = 1.22.2
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
