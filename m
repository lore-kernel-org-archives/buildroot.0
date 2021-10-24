Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA4DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:09:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B5A60F46
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38B5A60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 073BA80C6A;
	Sun, 24 Oct 2021 13:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvWoMU42zvuS; Sun, 24 Oct 2021 13:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E087680C80;
	Sun, 24 Oct 2021 13:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3C051BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3DDC40230
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4joN_HxTjt1m for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:09:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B8034020E
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:09:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C8C2888578; Sun, 24 Oct 2021 13:06:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:08:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92f367b474e4bb6e9d2222abe631ee43465f8780
X-Git-Newrev: e8dbb173004c96e204b91d447452767fc572ca7c
X-Patchwork-Hint: ignore
Message-Id: <20211024130616.C8C2888578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/seatd: bump to version 0.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8dbb173004c96e204b91d447452767fc572ca7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update seatd to version 0.6.3, which fixes a crash when used along
libinput 1.19.

Release notes:

  https://git.sr.ht/~kennylevinsen/seatd/refs/0.6.3

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 980c0faded..18f65d3aeb 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  1e2745ea39266de40d5beb24011782da95468b81ecfa410dd0db5ff75c665727  0.6.2.tar.gz
+sha256  5226850c163b485aebe71da0d3f4941761637e146a5c9393cb40c52617ad84a8  0.6.3.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 98eea650dd..27d3155b2b 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.6.2
+SEATD_VERSION = 0.6.3
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
