Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D04CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9816840A4;
	Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PErnxSezw3uK; Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E12284230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819829;
	bh=uXuKBiQBfsp5lN1lKdTKTEM1525e2Css8nz9qhVIKjU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E5kEwWaoICbHfWa+LvlxsVso7kAmSy8m3fMSw3RaiZ7SXkXJWxZBqTeVt10d6Wfxp
	 0rTfOdYmOf4CgXK1n94YlmAGsliC++3CVsCGZHZyf/WESKK7rRnr1Ja7uQe6nn/vBq
	 TEq0ckF5q9MHFErBhEhLULb8pi6DPWZQk8NdAOptN14g5dc1xxK3q6XvAsys8s0Jaz
	 kbvbYaRZLVxGTSheS9GPrC3BIJtbgtNBidH8OSd6AC4iBwe2rKtvdeOuOSnM3GSXM8
	 vyCuy1sEVhWaFUYKLpCklGEuDa6jVDsDYsdCovNN7yBYOVNueyi/Bb7gb51rl2JqjG
	 3f+yEKarIvIog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E12284230;
	Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8CC0190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9004C41156
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SLJ_WeeXvJ1 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB85240A95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB85240A95
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 905C183FC1; Sun,  3 May 2026 14:50:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68cdf123d48f574241b1c23a4f8bf8755b7d02b4
X-Git-Newrev: 7e98e745c4182f5c86d58771b18723970ee0335e
X-Patchwork-Hint: ignore
Message-Id: <20260503145024.905C183FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump version to
 1.43.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e98e745c4182f5c86d58771b18723970ee0335e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/boto/botocore/blob/1.43.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index d7b9d72baf..fdeb9291ee 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  5dede248bc91c7213fc8ffb42b76e318  botocore-1.42.68.tar.gz
-sha256  3951c69e12ac871dda245f48dac5c7dd88ea1bfdd74a8879ec356cf2874b806a  botocore-1.42.68.tar.gz
+md5  6a8e7551f86c8701377928541b1a9f4b  botocore-1.43.1.tar.gz
+sha256  270d6357d662550fdb84973ec247e02bece0b6283d90bf37319c7753515336e4  botocore-1.43.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 545c4d44dd..ff892c60f8 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.68
+PYTHON_BOTOCORE_VERSION = 1.43.1
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3f/22/87502d5fbbfa8189406a617b30b1e2a3dc0ab2669f7268e91b385c1c1c7a
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/03/b7/416ae6f1461d6fec3b3aaffc4759371319c71a21f7ab4c3106ee574fda8d
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
