Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B254C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D887340201;
	Sun,  9 Jan 2022 22:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHArSuT2htdV; Sun,  9 Jan 2022 22:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6FD40223;
	Sun,  9 Jan 2022 22:49:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FA111BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E63740305
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0lh6WODkAVa for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D299D40201
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 634AC832C2; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7786524be67e98ffa88f75581b41531fb69c4372
X-Git-Newrev: 0f51c6f6b5c75499bb55be913b5c3533d5a8f648
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.634AC832C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-installer: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f51c6f6b5c75499bb55be913b5c3533d5a8f648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                     |  1 +
 package/python-installer/python-installer.hash |  5 +++++
 package/python-installer/python-installer.mk   | 15 +++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c83c53658..e715d8d353 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1303,6 +1303,7 @@ F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
+F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
new file mode 100644
index 0000000000..68af457664
--- /dev/null
+++ b/package/python-installer/python-installer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/installer/json
+md5  cf7b8f470620c54f2d28167fc80542a7  installer-0.4.0.tar.gz
+sha256  17d7ca174039fbd85f268e16042e3132ebb03d91e1bbe0f63b9ec6b40619414a  installer-0.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
new file mode 100644
index 0000000000..2c1d371dab
--- /dev/null
+++ b/package/python-installer/python-installer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-installer
+#
+################################################################################
+
+PYTHON_INSTALLER_VERSION = 0.4.0
+PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/71/9a/8d7c724b0d51336453e75f76b32de86b336ef26755c64119204f1f5b4388
+PYTHON_INSTALLER_LICENSE = MIT
+PYTHON_INSTALLER_LICENSE_FILES = LICENSE
+PYTHON_INSTALLER_SETUP_TYPE = distutils
+HOST_PYTHON_INSTALLER_NEEDS_HOST_PYTHON = python3
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
