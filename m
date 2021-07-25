Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555B4C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:00:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1650F60BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1650F60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7EC783417;
	Sun, 25 Jul 2021 13:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCkZfNoKe_8g; Sun, 25 Jul 2021 13:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F129832DB;
	Sun, 25 Jul 2021 13:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 674941BF20B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56674403D7
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHQi8uD0AsYq for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:59:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 738C4402F5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:59:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4A05188DCF; Sun, 25 Jul 2021 12:24:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:59:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d46f5b29dcc10d707b386bcc60a870b239107e2
X-Git-Newrev: 1a19e267296380185648a4850eb502b401d4990d
X-Patchwork-Hint: ignore
Message-Id: <20210725122459.4A05188DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a19e267296380185648a4850eb502b401d4990d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides fixes for CVE-2021-21775,
CVE-2021-21779, CVE-2021-30663, CVE-2021-30665, CVE-2021-30689,
CVE-2021-30720, CVE-2021-30734, CVE-2021-30744, CVE-2021-30749,
CVE-2021-30795, CVE-2021-30797, and CVE-2021-30799.

Full release notes can be found at:

  https://webkitgtk.org/2021/07/23/webkitgtk2.32.3-released.html

An accompanying security advisory has been published at:

  https://webkitgtk.org/security/WSA-2021-0004.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index dd950bbabe..1208dfce6c 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.32.2.tar.xz.sums
-md5  6dbf813fefd79c551be47b1312f27cec  webkitgtk-2.32.2.tar.xz
-sha1  958777627972b18501e5520d0aba9e274a2b151f  webkitgtk-2.32.2.tar.xz
-sha256  1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd  webkitgtk-2.32.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.32.3.tar.xz.sums
+md5  f31b802de421865ea9f1391ec8190519  webkitgtk-2.32.3.tar.xz
+sha1  9c9b2cb2638ea40706765768dd5cb3c95ab46dcb  webkitgtk-2.32.3.tar.xz
+sha256  c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc  webkitgtk-2.32.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index c3fbedf654..8102b1e74d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.32.2
+WEBKITGTK_VERSION = 2.32.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
