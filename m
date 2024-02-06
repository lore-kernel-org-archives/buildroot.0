Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4902C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED8841E86;
	Tue,  6 Feb 2024 10:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED8841E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9A4B_sRbZwLo; Tue,  6 Feb 2024 10:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEC2341E91;
	Tue,  6 Feb 2024 10:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEC2341E91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6F301BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 850F581432
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVLhwPuB7pHz for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FBF81778
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89FBF81778
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 873BA86F3E; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:33:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1c77f08ac4dd3f963f65da608bb3043011e47a1
X-Git-Newrev: 2a211f917d2f93504f9b78547d7594f46b77a4b5
X-Patchwork-Hint: ignore
Message-Id: <20240206103429.873BA86F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hiredis: bump to version
 2.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a211f917d2f93504f9b78547d7594f46b77a4b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash for LICENSE file changed due to license change to MIT:
https://github.com/redis/hiredis-py/commit/1e29dd4719a44092e8317d6cddb8075a4a143e0e

The vendor/hiredis/COPYING file remains BSD-3-Clause.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hiredis/python-hiredis.hash | 6 +++---
 package/python-hiredis/python-hiredis.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 372f2f50ae..ad33295ad7 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  670a932c2972cbd88f910c2b29f85c3c  hiredis-2.2.3.tar.gz
-sha256  e75163773a309e56a9b58165cf5a50e0f84b755f6ff863b2c01a38918fe92daa  hiredis-2.2.3.tar.gz
+md5  8823961dc3ba19a6e63ab6329b3b852f  hiredis-2.3.2.tar.gz
+sha256  733e2456b68f3f126ddaf2cd500a33b25146c3676b97ea843665717bda0c5d43  hiredis-2.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256  65d467915fa36249f60e6942c9d44dfe54d75882e6b66e94fc6c3971fcde1722  LICENSE
+sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 5aceb15ae1..d86fb109dc 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 2.2.3
+PYTHON_HIREDIS_VERSION = 2.3.2
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/b0/04/dab6792584fc548803ffa50b5bb2b99f01d3ab04d7c7f64e85f1a22fb847
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/fe/2d/a5ae61da1157644f7e52e088fa158ac6f5d09775112d14b1c9b9a5156bf1
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
-PYTHON_HIREDIS_LICENSE = BSD-3-Clause
+PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
