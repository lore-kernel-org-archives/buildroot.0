Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F41C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 15:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 072ED410D6;
	Thu, 31 Mar 2022 15:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FKtTg9cjTlo; Thu, 31 Mar 2022 15:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D97E4014E;
	Thu, 31 Mar 2022 15:54:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B16731BF3AE
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD77661304
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 15:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGnfiTlumfcr for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 15:54:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB2B2612E9
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 15:54:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 858A585F3D; Thu, 31 Mar 2022 15:44:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 17:53:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7fa40a9c1e93c063bbc5c5d4cac0c67493087a7
X-Git-Newrev: ae699d7f9ad3caebe1fb338303f1b7c6ad42f6ac
X-Patchwork-Hint: ignore
Message-Id: <20220331154459.858A585F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paramiko: security bump to
 version 2.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae699d7f9ad3caebe1fb338303f1b7c6ad42f6ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-24302: Creation of new private key files using PKey
subclasses was subject to a race condition between file creation & mode
modification, which could be exploited by an attacker with knowledge of
where the Paramiko-using code would write out such files.

https://github.com/paramiko/paramiko/blob/2.10.3/sites/www/changelog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index b11acf1dbc..951bd8e114 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  44136d79da4cd7619e368018ad022619  paramiko-2.7.2.tar.gz
-sha256  7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035  paramiko-2.7.2.tar.gz
+md5  6e47947882e2c1b81f35b4133e8e62b9  paramiko-2.10.3.tar.gz
+sha256  ddb1977853aef82804b35d72a0e597b244fa326c404c350bd00c5b01dbfee71a  paramiko-2.10.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 3c135cf9b1..46209f5823 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.7.2
+PYTHON_PARAMIKO_VERSION = 2.10.3
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/cf/a1/20d00ce559a692911f11cadb7f94737aca3ede1c51de16e002c7d3a888e0
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/d4/93/1a1eb7f214e6774099d56153db9e612f93cb8ffcdfd2eca243fcd5bb3a78
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
