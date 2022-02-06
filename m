Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6701CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EB164032E;
	Sun,  6 Feb 2022 10:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PI6anQCrF3gF; Sun,  6 Feb 2022 10:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7352401ED;
	Sun,  6 Feb 2022 10:23:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF9B1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9598340354
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4qO2MyTYpRu for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:23:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62114025C
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:23:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ACBEC8267F; Sun,  6 Feb 2022 10:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:21:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48f6ff227984612ddf0fb27222b59e50a11d20c9
X-Git-Newrev: 550ab032881e1aacde344c575f1fce586d9ce243
X-Patchwork-Hint: ignore
Message-Id: <20220206101631.ACBEC8267F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speexdsp: use snapshot tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=550ab032881e1aacde344c575f1fce586d9ce243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use snapshot tarball so SPEEXDSP_VERSION will match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/speexdsp/speexdsp.hash | 2 +-
 package/speexdsp/speexdsp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index fd9870dc58..82e054d4d4 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c92c7e428cb5ca11b4e6f13118ff288332f330b6fefc93cb39bf7b43b13cb1f7  speexdsp-SpeexDSP-1.2.0-br1.tar.gz
+sha256  0fe0e31be215f820bed0f9c913c673997773fce3a03a4555658e7b73a54eed7b  speexdsp-SpeexDSP-1.2.0.tar.bz2
 sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
index 35c06dd833..8e886b2b21 100644
--- a/package/speexdsp/speexdsp.mk
+++ b/package/speexdsp/speexdsp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SPEEXDSP_VERSION = SpeexDSP-1.2.0
-SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp.git
-SPEEXDSP_SITE_METHOD = git
+SPEEXDSP_VERSION = 1.2.0
+SPEEXDSP_SOURCE = speexdsp-SpeexDSP-$(SPEEXDSP_VERSION).tar.bz2
+SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-$(SPEEXDSP_VERSION)
 SPEEXDSP_LICENSE = BSD-3-Clause
 SPEEXDSP_LICENSE_FILES = COPYING
 SPEEXDSP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
