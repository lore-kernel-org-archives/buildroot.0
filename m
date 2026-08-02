Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3337DC55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BDF780C6A;
	Sun,  2 Aug 2026 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mx9m0q2t0g5; Sun,  2 Aug 2026 20:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BD480BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702303;
	bh=aGf3wg1NkxKOuCXtYGcG0ue4CiJiBWGpLjY2p6EsqEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RxrNpqaaAGUbrce+i9xa/8PfBHADKt9C1E7xeybkMe2v2q6pgDSVicusP89t0eiN1
	 JejdBXyO3BpDY78PO4O2n7wu4Lp9O1iahg+UvZSOGGCXpDcCnOO7kZVh/cWWlbm/Rw
	 7uXFAuxxy+Rr4XBrRpyUlmqZMbN0A1NM//OG2eN5ONLqqu+C+26LngPJeDD6UnS66+
	 +g2zRMa9aeockQk78w+HH21YgPPk3+2+vpawdjhifdeZxlqQD4jk8kmyQWqZo4DAdf
	 4oAqUSeEnb/9RWpKP0qhTA/rb0kc99dpyYrXymq/7v6U9jEhSsVYrotAT7S0U2vGDY
	 70WrIEi0smzsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BD480BE7;
	Sun,  2 Aug 2026 20:25:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EA7926C
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CDD86061D
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7gNK5CwXQCb for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA50C6065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA50C6065E
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 767618B844; Sun,  2 Aug 2026 20:24:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 21:50:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc6ff71ee369ecadd768bf4605c175398a8e6e49
X-Git-Newrev: 67d6e6602fec095084f64560050cb1195dff7765
X-Patchwork-Hint: ignore
Message-Id: <20260802202415.767618B844@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: python-pydal: new runtime
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67d6e6602fec095084f64560050cb1195dff7765
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_pydal.py | 11 +++++++++++
 support/testing/tests/package/test_python_pydal.py   | 12 ++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ccb147163a..d78e08bdb4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1857,6 +1857,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_pydal.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/sample_python_sympy.py
 F:	support/testing/tests/package/test_4th.py
@@ -2012,6 +2013,7 @@ F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
 F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_pydal.py
 F:	support/testing/tests/package/test_python_pyqt5.py
 F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
diff --git a/support/testing/tests/package/sample_python_pydal.py b/support/testing/tests/package/sample_python_pydal.py
new file mode 100644
index 0000000000..269fbaffa8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pydal.py
@@ -0,0 +1,11 @@
+# From:
+# https://github.com/web2py/pydal/tree/v20260313.1#usage-and-documentation
+from pydal import DAL, Field
+db = DAL('sqlite://storage.db')
+db.define_table('thing', Field('name'))
+db.thing.insert(name='Chair')
+query = db.thing.name.startswith('C')
+rows = db(query).select()
+print(rows[0].name)
+assert rows[0].name == "Chair"
+db.commit()
diff --git a/support/testing/tests/package/test_python_pydal.py b/support/testing/tests/package/test_python_pydal.py
new file mode 100644
index 0000000000..b0166c7a8a
--- /dev/null
+++ b/support/testing/tests/package/test_python_pydal.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PyDAL(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_SQLITE=y
+        BR2_PACKAGE_PYTHON_PYDAL=y
+        """
+    sample_scripts = ["tests/package/sample_python_pydal.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
