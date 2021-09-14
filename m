Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D67C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:01:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AFA610E6
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66AFA610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FF680F71;
	Tue, 14 Sep 2021 13:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4m2YgUvqLW1; Tue, 14 Sep 2021 13:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B5D80F5F;
	Tue, 14 Sep 2021 13:01:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E348D1BF2F6
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D037D80E63
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GNIZio0-8Zd for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:01:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FA7E80E45
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:01:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 405588B36E; Tue, 14 Sep 2021 12:59:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 15:00:01 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: ab3fcf68d2d11c36f7778dcbfbf4b43d86f877fa
X-Git-Newrev: 26b12f53a9791b6069803215eb1a80300a247a30
X-Patchwork-Hint: ignore
Message-Id: <20210914125917.405588B36E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/python-pillow:
 bump to version 8.3.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26b12f53a9791b6069803215eb1a80300a247a30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d6ac118637b032f41c990cb1201664ce4b1bfd1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 562cb2c1a2..fb1ec53a00 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  21c03274a9f59b9c00419852a8faebe7  Pillow-8.2.0.tar.gz
-sha256	a787ab10d7bb5494e5f76536ac460741788f1fbce851068d73a87ca7c35fc3e1  Pillow-8.2.0.tar.gz
+md5  e42fc66e41b5309436a573af49cec47c  Pillow-8.3.1.tar.gz
+sha256	2cac53839bfc5cece8fdbe7f084d5e3ee61e1303cccc86511d351adcb9e2c792  Pillow-8.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 42607e0bbd..a55a937c11 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.2.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/21/23/af6bac2a601be6670064a817273d4190b79df6f74d8012926a39bc7aa77f
+PYTHON_PILLOW_VERSION = 8.3.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8f/7d/1e9c2d8989c209edfd10f878da1af956059a1caab498e5bc34fa11b83f71
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
