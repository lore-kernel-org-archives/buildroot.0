Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E94FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0E66124C
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D0E66124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF76848AA;
	Sun,  3 Oct 2021 08:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vXOCgOBqroqT; Sun,  3 Oct 2021 08:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33167848A3;
	Sun,  3 Oct 2021 08:24:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE31B1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 613C860ACF
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pycd_KRgTk3 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A52BF60AD7
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 20F5C8DB40; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b25dd5eb96ce54c96df7911f6e646428cbe4e221
X-Git-Newrev: 501a333b28f2f66603873b3aee66e147c6de634b
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.20F5C8DB40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-schedule: bump to version
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=501a333b28f2f66603873b3aee66e147c6de634b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-schedule/Config.in            | 1 +
 package/python-schedule/python-schedule.hash | 6 +++---
 package/python-schedule/python-schedule.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-schedule/Config.in b/package/python-schedule/Config.in
index d00c245948..a0f800e364 100644
--- a/package/python-schedule/Config.in
+++ b/package/python-schedule/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SCHEDULE
 	bool "python-schedule"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Job scheduling for humans.
 
diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
index 79777829de..3d67be0f5e 100644
--- a/package/python-schedule/python-schedule.hash
+++ b/package/python-schedule/python-schedule.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/schedule/json
-md5	e29fd3b436b03220e147a4ed8191d220  schedule-0.6.0.tar.gz
-sha256	f9fb5181283de4db6e701d476dd01b6a3dd81c38462a54991ddbb9d26db857c9  schedule-0.6.0.tar.gz
+md5  9bf7544e37824e450457187633a17b17  schedule-1.1.0.tar.gz
+sha256  e6ca13585e62c810e13a08682e0a6a8ad245372e376ba2b8679294f377dfc8e4  schedule-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
+sha256  30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
index c0cc7dce8c..fc6081cf22 100644
--- a/package/python-schedule/python-schedule.mk
+++ b/package/python-schedule/python-schedule.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCHEDULE_VERSION = 0.6.0
+PYTHON_SCHEDULE_VERSION = 1.1.0
 PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
-PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/00/07/6a9953ff83e003eaadebf0a51d33c6b596f9451fcbea36a3a2e575f6af99
+PYTHON_SCHEDULE_SITE = https://files.pythonhosted.org/packages/a8/b5/a291a4c0faa491fd5baefa6d89011ece581cff47b23c0a39b42a63383358
 PYTHON_SCHEDULE_SETUP_TYPE = setuptools
 PYTHON_SCHEDULE_LICENSE = MIT
 PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
