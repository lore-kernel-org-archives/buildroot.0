Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3393CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E36D7817C3;
	Sun,  9 Jan 2022 22:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcEKn4AZrZcX; Sun,  9 Jan 2022 22:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3331381767;
	Sun,  9 Jan 2022 22:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8DE1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C7A160BA2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrUxC28BbxAR for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD87C60B87
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4E89D832B2; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4872d527319d710d5ebc04ed0b93b4e4a733e035
X-Git-Newrev: 860e9b3f553511d772573427ebaa6371e205aa9c
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.4E89D832B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pep517: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=860e9b3f553511d772573427ebaa6371e205aa9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/python-pep517/python-pep517.hash |  5 +++++
 package/python-pep517/python-pep517.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed65c74319..260dcce912 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1306,6 +1306,7 @@ F:	package/python-greenlet/
 F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
+F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
 F:	package/python-pyphen/
diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
new file mode 100644
index 0000000000..4dd4c47fa0
--- /dev/null
+++ b/package/python-pep517/python-pep517.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pep517/json
+md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
+sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
new file mode 100644
index 0000000000..da0431a637
--- /dev/null
+++ b/package/python-pep517/python-pep517.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pep517
+#
+################################################################################
+
+PYTHON_PEP517_VERSION = 0.12.0
+PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
+PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
+PYTHON_PEP517_LICENSE = MIT
+PYTHON_PEP517_LICENSE_FILES = LICENSE
+PYTHON_PEP517_SETUP_TYPE = distutils
+HOST_PYTHON_PEP517_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
