Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678B4C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:59:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3505160EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3505160EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC8B83231;
	Sun, 25 Jul 2021 12:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHn8N-6qwv_Y; Sun, 25 Jul 2021 12:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6637D83168;
	Sun, 25 Jul 2021 12:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15CD71BF470
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B9B8305C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsizAN71VtYt for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5581A83168
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3251A86F07; Sun, 25 Jul 2021 12:23:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:58:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab346237ef59bc5c9e849d53980dcf947f581624
X-Git-Newrev: 5d46f5b29dcc10d707b386bcc60a870b239107e2
X-Patchwork-Hint: ignore
Message-Id: <20210725122352.3251A86F07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.32.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d46f5b29dcc10d707b386bcc60a870b239107e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides fixes for CVE-2021-21775,
CVE-2021-21779, CVE-2021-30663, CVE-2021-30665, CVE-2021-30689,
CVE-2021-30720, CVE-2021-30734, CVE-2021-30744, CVE-2021-30749,
CVE-2021-30795, CVE-2021-30797, and CVE-2021-30799.

Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.32.3.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2021-0004.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 9 +++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 28e3feae90..39bf8829d0 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,8 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.32.2.tar.xz.sums
-md5  a6624736150045a54037457416820b19  wpewebkit-2.32.2.tar.xz
-sha1  7b41a49f97b4cb458b6896623a02f4861cbcf728  wpewebkit-2.32.2.tar.xz
-sha256  2f0ebef0395a5a9e37a8609093f86140f74504f9954f97799b95f5dfbe186739  wpewebkit-2.32.2.tar.xz
+
+# From https://wpewebkit.org/releases/wpewebkit-2.32.3.tar.xz.sums
+md5  1e34412c50fe8d1ff084738477ecad7e  wpewebkit-2.32.3.tar.xz
+sha1  157344d8febfc89d6731404c30857f122f220d6e  wpewebkit-2.32.3.tar.xz
+sha256  859bd1bbe51026aecfb2b6f5c8c024d88fb69ac6fcdc74c788c9fbe9499d740d  wpewebkit-2.32.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 339dedd49b..01b1309ad6 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.32.2
+WPEWEBKIT_VERSION = 2.32.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
