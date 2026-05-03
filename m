Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4718FCD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3BD612C6;
	Sun,  3 May 2026 14:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc0cY2rEcGvX; Sun,  3 May 2026 14:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CDF4612C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819838;
	bh=ePe14KQK7gnJ8BD4+YbJ9FPLEPD2aHQQLWtTDoOFtPA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=suVz6VNIu8y2koWHx5GvdlKarw9tPGiJONB9xEArSSyKrDDKNfoljuhP7NCzLLyed
	 IkMjMw0qn8UveMnCasA6A/qpCLoEU3bHfZhtUAS/JRHPnwKGcD2OlX4i5R0zWOK5wS
	 pFyskz6tNQ7OsjC7I0mXA5sEAF7RZNdHiA4PXmk2GaNBLJaToHBOE+w2oyxe7NLnih
	 3iCmhCsnszI5h6X4UQy1hqH8mBU4KHfUt0A08nYfDQ2c5R/z6zI0qyAWDZTHITXpDa
	 a4re2T4a3fF/hR9dgxEu3OBADfXa3g7hzWSubge7aY6esAi6hF5KQGg4xapfPs2YJH
	 36WfTPLAF+ONw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDF4612C2;
	Sun,  3 May 2026 14:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16497127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08DA684230
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QbTuavpUmrM for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4716B84225
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4716B84225
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FD677FDF8; Sun,  3 May 2026 14:50:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 522da23ccb3b35ea66811b8f83b76e54fb43836c
X-Git-Newrev: ac6b204e029da7fff925c2570fcfe4905f44a120
X-Patchwork-Hint: ignore
Message-Id: <20260503145027.0FD677FDF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-librt: bump version to 0.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac6b204e029da7fff925c2570fcfe4905f44a120
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-librt/python-librt.hash | 4 ++--
 package/python-librt/python-librt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
index e12bb75949..30ab711042 100644
--- a/package/python-librt/python-librt.hash
+++ b/package/python-librt/python-librt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/librt/json
-md5  977ea89f85bd73d2ec17f5149f165f71  librt-0.8.1.tar.gz
-sha256  be46a14693955b3bd96014ccbdb8339ee8c9346fbe11c1b78901b55125f14c73  librt-0.8.1.tar.gz
+md5  25cc9fb4e0c47582ff60ee5985cacc6d  librt-0.9.0.tar.gz
+sha256  a0951822531e7aee6e0dfb556b30d5ee36bbe234faf60c20a16c01be3530869d  librt-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 8f16e762a7..264fe83281 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBRT_VERSION = 0.8.1
+PYTHON_LIBRT_VERSION = 0.9.0
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/56/9c/b4b0c54d84da4a94b37bd44151e46d5e583c9534c7e02250b961b1b6d8a8
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/eb/6b/3d5c13fb3e3c4f43206c8f9dfed13778c2ed4f000bacaa0b7ce3c402a265
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
