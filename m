Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD21C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 668FC84875;
	Sun, 15 Sep 2024 21:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tag_hIgu9QzH; Sun, 15 Sep 2024 21:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED73884719
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED73884719;
	Sun, 15 Sep 2024 21:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 763BD1BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF2F760D96
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v992BONfjavz for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E1C60881
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E1C60881
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15F1683683; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33a7a17cc1bb7034296cf431d61d8825527b2db9
X-Git-Newrev: 4d1331f67742a9dd49ae6231f8267682f0b2657e
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.15F1683683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-babel: bump to version
 2.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d1331f67742a9dd49ae6231f8267682f0b2657e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-pytz dependency.

License hash changed due to date update:
https://github.com/python-babel/babel/commit/40b194f4777366e95cc2dfb680fd696b86ef1c04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-babel/Config.in         | 1 -
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 7 +++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-babel/Config.in b/package/python-babel/Config.in
index 1a22b83f2c..4f66404a5f 100644
--- a/package/python-babel/Config.in
+++ b/package/python-babel/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_BABEL
 	bool "python-babel"
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  A collection of tools for internationalizing Python
 	  applications.
diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index ab4e022564..cb41750386 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  3bec3f4c842144c15d839bdde41a44d4  Babel-2.14.0.tar.gz
-sha256  6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363  Babel-2.14.0.tar.gz
+md5  1dbf17974d7ccc9950757ed3c9618db0  babel-2.16.0.tar.gz
+sha256  d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316  babel-2.16.0.tar.gz
 # Locally computed sha256 checksums
-sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
+sha256  3f9142a40859dfcb33f45c16ad872b500d683cc4a20b17091478b404e900520f  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index eb39b9aef7..dd10abbfa3 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.14.0
-PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/e2/80/cfbe44a9085d112e983282ee7ca4c00429bc4d1ce86ee5f4e60259ddff7f
+PYTHON_BABEL_VERSION = 2.16.0
+PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/2a/74/f1bc80f23eeba13393b7222b11d95ca3af2c1e28edca18af487137eefed9
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
 
 # purge locale data (if enabled), keep special en_US_POSIX data which
 # is used by default by the python-babel code
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
