Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5930C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:16:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF46561038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF46561038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F1F40150;
	Fri, 13 Aug 2021 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY0DgzRsF-2c; Fri, 13 Aug 2021 13:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E12BD40200;
	Fri, 13 Aug 2021 13:16:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04E291BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8ECC60C07
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXuxjmqUXDxk for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:16:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EAA860BFA
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AC73F87DCB; Fri, 13 Aug 2021 13:15:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:15:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d3b0a4dcdd7f397dacbd833e16f31ea9896e7508
X-Git-Newrev: 2ff40658acf667f957051ef5975cc8131d13fdff
X-Patchwork-Hint: ignore
Message-Id: <20210813131542.AC73F87DCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sshguard: bump to
 version 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ff40658acf667f957051ef5975cc8131d13fdff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index 9bbb41336f..b1752f1c68 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.1/sshguard-2.4.1.sha256
-sha256  875d02e6e67dced614790ed5e36aef1160edea940f353a79306cbb1852af3c67  sshguard-2.4.1.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.2/sshguard-2.4.2.sha256
+sha256  2770b776e5ea70a9bedfec4fd84d57400afa927f0f7522870d2dcbbe1ace37e8  sshguard-2.4.2.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index 3616fba780..d27c76e63f 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.4.1
+SSHGUARD_VERSION = 2.4.2
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
