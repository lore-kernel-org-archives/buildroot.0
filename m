Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5418C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FCC42406;
	Fri, 22 Jul 2022 21:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FCC42406
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KM5iE4S55I2; Fri, 22 Jul 2022 21:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF7F42402;
	Fri, 22 Jul 2022 21:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF7F42402
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09C6D1BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBEA760768
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEA760768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7vu4Kh-pi0c for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:21:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC86605BA
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EC86605BA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B37B6841FC; Fri, 22 Jul 2022 21:08:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 23:19:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfa0c8e3a876af16a0b57e49683c5f420c23678d
X-Git-Newrev: d7ec0f7e97019c9b198f49d8c46ed9ee95fab375
X-Patchwork-Hint: ignore
Message-Id: <20220722210803.B37B6841FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jmespath: bump to version
 1.0.0
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
Content-Type: multipart/mixed; boundary="===============8115240703857467525=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8115240703857467525==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d7ec0f7e97019c9b198f49d8c46ed9ee95fab375
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, remove the md5 hash as there is already a sha256 hash.

Changelog: https://github.com/jmespath/jmespath.py/blob/develop/CHANGELOG.rst
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jmespath/python-jmespath.hash | 5 ++---
 package/python-jmespath/python-jmespath.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
index 986db2e002..a1c64a121e 100644
--- a/package/python-jmespath/python-jmespath.hash
+++ b/package/python-jmespath/python-jmespath.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/jmespath/json
-md5  65bdcb5fa5bcf1cc710ffa508e78e408  jmespath-0.10.0.tar.gz
-sha256  b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9  jmespath-0.10.0.tar.gz
+# sha256 from https://pypi.org/pypi/jmespath/json
+sha256  a490e280edd1f57d6de88636992d05b71e97d69a26a19f058ecf7d304474bf5e  jmespath-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index cf11dedb60..48b19e8494 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JMESPATH_VERSION = 0.10.0
+PYTHON_JMESPATH_VERSION = 1.0.0
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/3c/56/3f325b1eef9791759784aa5046a8f6a1aff8f7c898a2e34506771d3b99d8
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/06/7e/44686b986ef9ca6069db224651baaa8300b93af2a085a5b135997bf659b3
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
 PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt

--===============8115240703857467525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8115240703857467525==--
