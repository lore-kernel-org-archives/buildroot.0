Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED385C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78F53400F2;
	Mon,  1 Aug 2022 17:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78F53400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84E9Gn0Nn_zz; Mon,  1 Aug 2022 17:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8493440574;
	Mon,  1 Aug 2022 17:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8493440574
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4616F1BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C24A4408A0
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24A4408A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPpQPABFcsP0 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:33:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A75840872
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A75840872
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8C85F86BAE; Mon,  1 Aug 2022 17:19:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 19:17:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 085eaa9a2ecfba4c77393835ec695f134ff1d694
X-Git-Newrev: bd9fa0e8366711a229a4ca5f33a056bf0e95d729
X-Patchwork-Hint: ignore
Message-Id: <20220801171936.8C85F86BAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pythran: new host-only
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd9fa0e8366711a229a4ca5f33a056bf0e95d729
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generated with scanpypi and converted to host.

It is a dependency of python-scipy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/python-pythran/python-pythran.hash |  6 ++++++
 package/python-pythran/python-pythran.mk   | 19 +++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f32a086daf..3398111256 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1184,6 +1184,7 @@ F:	package/pixiewps/
 F:	package/python-beniget/
 F:	package/python-gast/
 F:	package/python-pybind/
+F:	package/python-pythran/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
new file mode 100644
index 0000000000..a24bb4dc4c
--- /dev/null
+++ b/package/python-pythran/python-pythran.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pythran/json
+md5  e09e90484771937ab499380858bdb18d  pythran-0.11.0.tar.gz
+sha256  0b2cba712e09f7630879dff69f268460bfe34a6d6000451b47d598558a92a875  pythran-0.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
+sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
new file mode 100644
index 0000000000..8234513af3
--- /dev/null
+++ b/package/python-pythran/python-pythran.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pythran
+#
+################################################################################
+
+PYTHON_PYTHRAN_VERSION = 0.11.0
+PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/88/9f/161f08131abf7f23920cee29b691de27f10fd97ac09fb2f3532b3a7f9b96
+PYTHON_PYTHRAN_SETUP_TYPE = setuptools
+PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
+PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
+HOST_PYTHON_PYTHRAN_DEPENDENCIES = \
+	host-python-beniget \
+	host-python-gast \
+	host-python-numpy \
+	host-python-ply
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
