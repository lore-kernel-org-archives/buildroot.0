Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D475F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4723A61091;
	Sun, 15 Mar 2026 22:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW_0fskVD5UC; Sun, 15 Mar 2026 22:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35C0D610A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613107;
	bh=biIV1F8GKg/fAtATDIk3CGBCrpbobihvEwH7QP44huc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ocKt9YuGwezrNkShSCmUVKnue4ZAMIIX40b562cUcqpQNfOBYj1MTOV8PZfefrO5Q
	 kHTKOkJ/PdxNGYv1Zs53RacilwWpPYqkT+XCo4PgfFlvEdXFT6EK7Ufqv2O8gb2Nem
	 +4hJGAeW+EgSEtj3Y4lhLS6coDK60O5xJBdKgQPNTftv39OsOddXu1qTB5YvvZMRyd
	 tXiIvA5Q2KNtcOR7+0/za67XoD1lW/sjtbKROi4XC7VMqLJDZ2GbpNC3XZgaq6uEzu
	 SphnVo+NtgB6WCVFpPlYqi+tLswuMkURcCQZ1T0LfGXL089RXEPiw29csZjgQRRvcp
	 QckQGR4vtH4xQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C0D610A6;
	Sun, 15 Mar 2026 22:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0541B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6741A40A16
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkMR4UB9n7yu for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70874409C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70874409C6
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B373D83F4D; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:33:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb1410862a002f823da11f1929714f19e1995505
X-Git-Newrev: 2203e6bdc56cbb11fb5dfc15749102f9a3abd0b6
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.B373D83F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-greenlet: bump version to
 3.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2203e6bdc56cbb11fb5dfc15749102f9a3abd0b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://greenlet.readthedocs.io/en/latest/changes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index ca70b5293c..258cadc77b 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  1922c3b620792044728281d0139dc254  greenlet-3.3.0.tar.gz
-sha256  a82bb225a4e9e4d653dd2fb7b8b2d36e4fb25bc0165422a11e48b88e9e6f78fb  greenlet-3.3.0.tar.gz
+md5  be0d9748c252575e8a69cf8724685ed8  greenlet-3.3.2.tar.gz
+sha256  2eaf067fc6d886931c7962e8c6bede15d2f01965560f3359b27c80bde2d151f2  greenlet-3.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index e4d4c03961..07478807aa 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.3.0
+PYTHON_GREENLET_VERSION = 3.3.2
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/c7/e5/40dbda2736893e3e53d25838e0f19a2b417dfc122b9989c91918db30b5d3
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/a3/51/1664f6b78fc6ebbd98019a1fd730e83fa78f2db7058f72b1463d3612b8db
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
