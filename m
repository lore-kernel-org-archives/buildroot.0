Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2FDD3F09A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B41F40910;
	Wed, 28 Jan 2026 17:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCQk72CYz64E; Wed, 28 Jan 2026 17:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0E840A32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620854;
	bh=12lMirHW7uggGAVd8/AknGCkr84zI+YL849TDoGIqBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q+gakxEiPjoU0GymlGfJ+qdNaM/qNGilYLRwMCCzl5xnrbLvPfhIQ/sjJq675DNrb
	 EcJHElBV2apA2txwqWLBNtqnQLaZ0YuMKaMMaDH5mDl/d1u11pDgF7+wIT3UpbkoYZ
	 j9+7XfSu8MaITqxerv7xDMe7LXI7purzd90kQRNDQcSGWaKItvWOc3HTYBhXOek94J
	 0O1pHSo1wq2C2cHfYC3ZRHiBPO5Hm/HH3NSHNGSkt/HxTUOpE8olTC56YdpBaXVj1R
	 5fwV1HWvxImIjcQw7ebIO9F6SfGLleo7iA6gtIcsGvsbwk4KLk6sJ21vFRkaqsLXEQ
	 8qssUKgSZn8sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0E840A32;
	Wed, 28 Jan 2026 17:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 817ED3B7
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BC02408BA
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmMtScHIzjud for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF6D2408F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF6D2408F1
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8C5985FE9; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:53:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 24050693384ee32ada824e7f076883201945faef
X-Git-Newrev: abd1a9613f6d4d7ec0dbfb17998e95f8c2d185b6
X-Patchwork-Hint: ignore
Message-Id: <20260128172037.E8C5985FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rp-pppoe: update
 tarball URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=abd1a9613f6d4d7ec0dbfb17998e95f8c2d185b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The project moved its repo to codeberg.org:
https://dianne.skoll.ca/pipermail/rp-pppoe/2025q3/000663.html

Updated tarball hash after verifying that no files changed, only the
directory name changed from rp-pppoe-4.0/ to rp-pppoe/

Fixes:
https://autobuild.buildroot.net/results/5ff/5fff21a4150a5f668d43830591e21b660299ed9d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4768a26047d31fbf0dde3a282513707f81aed52f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rp-pppoe/rp-pppoe.hash | 2 +-
 package/rp-pppoe/rp-pppoe.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 97bb61eaf8..89f9f5c33f 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17d45712778f2bf6b0859ff610a3dacd24bc4462e9f53bb1466d47af391701d3  rp-pppoe-4.0.tar.gz
+sha256  459904065fd4a70c927757d84cc7b4ef70946a707fa1b83f16246f925158b13e  4.0.tar.gz
 sha256  d2767e7ffc6dc9477812f6238551fe4b29a889df6f23c3922e7b9cec92bc278d  doc/LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 98325e7d49..562e0311f0 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 4.0
-RP_PPPOE_SITE = $(call github,dfskoll,rp-pppoe,$(RP_PPPOE_VERSION))
+RP_PPPOE_SITE = https://codeberg.org/dskoll/rp-pppoe/archive
+RP_PPPOE_SOURCE = $(RP_PPPOE_VERSION).tar.gz
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
