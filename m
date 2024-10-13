Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB93CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F917403D6;
	Sun, 13 Oct 2024 10:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGwyX8K6TKCA; Sun, 13 Oct 2024 10:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC94A40918
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC94A40918;
	Sun, 13 Oct 2024 10:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64B051BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 538036072C
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptbglcAjgGLc for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7711460611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7711460611
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:49:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ED1E85F8D; Sun, 13 Oct 2024 10:49:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:48:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bf8be92edeb5415062de619dec1f4744a041130
X-Git-Newrev: a6686987ba34ca301d5b4122c09589afa7dc821f
X-Patchwork-Hint: ignore
Message-Id: <20241013104907.6ED1E85F8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aespipe: bump to version 2.4h
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6686987ba34ca301d5b4122c09589afa7dc821f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aespipe-v2.4h     May 14 2024
    - Added assembler implementations of AES for 32-bit arm and 64-bit arm64

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aespipe/aespipe.hash | 6 +++---
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index 4fe7d0753b..cb60e7dc1e 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4g/
-sha1  fb6b0108176d653f0e5b3be2385b132be791d800  aespipe-v2.4g.tar.bz2
-md5  c216c6c9e939fac69f859af0ad2fd8ef  aespipe-v2.4g.tar.bz2
+sha1  f1148f4aa82979755b13130b74643b449de55f6e  aespipe-v2.4h.tar.bz2
+md5  6c4552f10771eda471c964b34b1fae4a  aespipe-v2.4h.tar.bz2
 # Locally computed:
-sha256  bfb97e7de161e8d7ce113b163bda1d1a8ec77d2c1afab56dcc8153d7a90187fc  aespipe-v2.4g.tar.bz2
+sha256  eab311fc26ea43289bc3adf660d6270492494960725d2026ec4917294a1aba49  aespipe-v2.4h.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 4769536d2f..054849a147 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4g
+AESPIPE_VERSION = 2.4h
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
