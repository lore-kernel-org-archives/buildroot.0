Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6292C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7108460BB7;
	Sun,  9 Jan 2022 22:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSwe1PvCZFwf; Sun,  9 Jan 2022 22:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA48A60B87;
	Sun,  9 Jan 2022 22:51:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBDFA1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91ADC40385
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUu1gRdrAbYn for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A9B400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 595AC8324A; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 860e9b3f553511d772573427ebaa6371e205aa9c
X-Git-Newrev: 7786524be67e98ffa88f75581b41531fb69c4372
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.595AC8324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7786524be67e98ffa88f75581b41531fb69c4372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a namespace clash with python-build we need to use a different
package name.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                       |  1 +
 package/python-pypa-build/python-pypa-build.hash |  5 +++++
 package/python-pypa-build/python-pypa-build.mk   | 19 +++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 260dcce912..1c83c53658 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1309,6 +1309,7 @@ F:	package/python-multidict/
 F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
+F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-snappy/
 F:	package/python-sockjs/
diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
new file mode 100644
index 0000000000..c7daedc6b3
--- /dev/null
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/build/json
+md5  ec3dbe55359ee735b45766b30dfad877  build-0.7.0.tar.gz
+sha256  1aaadcd69338252ade4f7ec1265e1a19184bf916d84c9b7df095f423948cb89f  build-0.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
new file mode 100644
index 0000000000..6babade672
--- /dev/null
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pypa-build
+#
+################################################################################
+
+PYTHON_PYPA_BUILD_VERSION = 0.7.0
+PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/f0/62/c73b775216bb1f34962beaf005f38460c6161177fef6e068a7a0c30a1597
+PYTHON_PYPA_BUILD_LICENSE = MIT
+PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
+PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
+HOST_PYTHON_PYPA_BUILD_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
+	host-python-packaging \
+	host-python-pep517 \
+	host-python-tomli
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
