Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4C3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC396FC71;
	Thu, 13 Jan 2022 19:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GplEuXAV1m0p; Thu, 13 Jan 2022 19:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1905D6FC7E;
	Thu, 13 Jan 2022 19:44:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2981C1135
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A733384CD9
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_2HwhJioI-9 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D90CF84CDA
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A22AE8356E; Thu, 13 Jan 2022 19:37:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:43:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b051086ab11b2aeeb57465ce3d861ab526846a5
X-Git-Newrev: 23e4fbecb31678751812c54ce3006bab55bb3358
X-Patchwork-Hint: ignore
Message-Id: <20220113193713.A22AE8356E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-h2: bump to version 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=23e4fbecb31678751812c54ce3006bab55bb3358
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site in Config.in
- Reorder select
- python 2.7 support has been dropped since version 4.0.0

https://github.com/python-hyper/h2/blob/v4.1.0/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-h2/Config.in      | 5 +++--
 package/python-h2/python-h2.hash | 6 +++---
 package/python-h2/python-h2.mk   | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-h2/Config.in b/package/python-h2/Config.in
index dccee9b909..d88ad36761 100644
--- a/package/python-h2/Config.in
+++ b/package/python-h2/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_H2
 	bool "python-h2"
-	select BR2_PACKAGE_PYTHON_HYPERFRAME # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_HPACK # runtime
+	select BR2_PACKAGE_PYTHON_HYPERFRAME # runtime
 	help
 	  HTTP/2 State-Machine based protocol implementation.
 
-	  http://hyper.rtfd.org
+	  https://github.com/python-hyper/h2
diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 4193567d37..2f9c8f647f 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5  197a99c09f344a0dd987fab9801dc8d0  h2-3.2.0.tar.gz
-sha256  875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14  h2-3.2.0.tar.gz
+md5  4274f9619c0a43bb4ae01b6b02bf0c99  h2-4.1.0.tar.gz
+sha256  a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c28d2abb  h2-4.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  663f9253e13519b82ab4a6b1caab6bed05aada70517f28cd0254be8a9fa19ed6  LICENSE
+sha256  7a65a5af0cbabf1c16251c7c6b2b7cb46d16a7222e79975b9b61fcd66a2e3f28  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index 81397bbb10..699e8baece 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 3.2.0
+PYTHON_H2_VERSION = 4.1.0
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/08/0a/033df0fc05fe94f72517ccd393dd9ff99b1773fd198307638e6d3568a518
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/2a/32/fec683ddd10629ea4ea46d206752a95a2d8a48c22521edd70b142488efe1
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
