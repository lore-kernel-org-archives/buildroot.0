Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABFAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9C7D40153;
	Sun, 30 Oct 2022 20:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C7D40153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0WYGqH-M5SF; Sun, 30 Oct 2022 20:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DCA400EC;
	Sun, 30 Oct 2022 20:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DCA400EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE90E1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AA39608A5
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AA39608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-X7Oxteggjj for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3FF860670
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3FF860670
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B23978764D; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:22:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47504a72e8a6526258516fdc35122494a4d4b529
X-Git-Newrev: 6d70fac1350a88a8e0e87d0d1b0bcf80eeeb5cf3
X-Patchwork-Hint: ignore
Message-Id: <20221030202515.B23978764D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-editables: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d70fac1350a88a8e0e87d0d1b0bcf80eeeb5cf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/python-editables/python-editables.hash |  5 +++++
 package/python-editables/python-editables.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b8b78976a4..2047b77b82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1380,6 +1380,7 @@ F:	package/python-cbor2/
 F:	package/python-cchardet/
 F:	package/python-charset-normalizer/
 F:	package/python-cssselect2/
+F:	package/python-editables/
 F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
diff --git a/package/python-editables/python-editables.hash b/package/python-editables/python-editables.hash
new file mode 100644
index 0000000000..3c28c44cc3
--- /dev/null
+++ b/package/python-editables/python-editables.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/editables/json
+md5  e91709fbb0ef586cb7b785042068ab67  editables-0.3.tar.gz
+sha256  167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f7b410cde16161b1a  editables-0.3.tar.gz
+# Locally computed sha256 checksums
+sha256  c73e08a04e1557fdb49525fb7a579f73bcab84a254910b9350ee56daf143932d  LICENSE.txt
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
new file mode 100644
index 0000000000..db67e7a16d
--- /dev/null
+++ b/package/python-editables/python-editables.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-editables
+#
+################################################################################
+
+PYTHON_EDITABLES_VERSION = 0.3
+PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
+PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/01/b0/a2a87db4b6cb8e7d57004b6836faa634e0747e3e39ded126cdbe5a33ba36
+PYTHON_EDITABLES_LICENSE = MIT
+PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
+PYTHON_EDITABLES_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
