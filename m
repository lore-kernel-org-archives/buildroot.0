Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75289C76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 20:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9558401C9;
	Sun,  2 Apr 2023 20:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9558401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-vCJd2_Qtyc; Sun,  2 Apr 2023 20:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0030B40523;
	Sun,  2 Apr 2023 20:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0030B40523
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E571BF8B4
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BEFE401C9
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BEFE401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCNLoDcBD4vT for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 20:47:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8327740176
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 20:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8327740176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F70783767; Sun,  2 Apr 2023 20:47:43 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 2 Apr 2023 22:39:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a45f2af7fae09e4daee9d017b02e8744b357cf48
X-Git-Newrev: a2ac1a951fc7581b980c5517594d511aa792a3e3
X-Patchwork-Hint: ignore
Message-Id: <20230402204743.6F70783767@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproject-hooks: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2ac1a951fc7581b980c5517594d511aa792a3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's a runtime dependency on tomli, but only for Python < 3.11.
Therefore this is not applicable for us.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                                 |  1 +
 package/python-pyproject-hooks/python-pyproject-hooks.hash |  5 +++++
 package/python-pyproject-hooks/python-pyproject-hooks.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 67c6004ddf..7c5880c8ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1415,6 +1415,7 @@ F:	package/python-pycares/
 F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
+F:	package/python-pyproject-hooks/
 F:	package/python-rtoml/
 F:	package/python-selenium/
 F:	package/python-snappy/
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
new file mode 100644
index 0000000000..9fdcd33596
--- /dev/null
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproject_hooks/json
+md5  69b0b6de189bc04c3f9e304281765741  pyproject_hooks-1.0.0.tar.gz
+sha256  f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5  pyproject_hooks-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
new file mode 100644
index 0000000000..a42dbb0ab1
--- /dev/null
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyproject-hooks
+#
+################################################################################
+
+PYTHON_PYPROJECT_HOOKS_VERSION = 1.0.0
+PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
+PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/25/c1/374304b8407d3818f7025457b7366c8e07768377ce12edfe2aa58aa0f64c
+PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
+PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
+PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
