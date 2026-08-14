Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8FEC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890FD40D98;
	Fri, 14 Aug 2026 13:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfX4SxRsVmo9; Fri, 14 Aug 2026 13:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9401840DB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713723;
	bh=hy8H0eNv41Ou62XQ8xOqJznN3f7cspAuqu5fMf2jsuk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MK12blBlspcPj7Ab50SO8WipMnwzRJWIcv9FOn6DgGoeXajiuLCqdv3ik1HNGroLP
	 XJ0LJ3hAzxSNx/lMFg5Vw/I5wyyma1l3IJkiL+ez3DsPbXxOyMBXpT3v4M73bY6V70
	 nUf1EvxUdtbK74C72b47wrF+LPpBz6mHMI4bVXj+tzPOaYeT8/Ka5XBgQsQLPtwGGq
	 szi7YpIERF3495TEaXnMTxcs5Kr93/KdZ0/14KKqf4i9JrCt8Gi89c2fRfdUDU+WN0
	 s4nexKmd48I+WzJb9reYkoQ0+01Osp89OX5k3J+L0Ptu1LS+1H3iiMF1hOCgFZHjgb
	 1dhnYsNFQ7/pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9401840DB9;
	Fri, 14 Aug 2026 13:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E23633B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 812DA60633
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdOMytFnjkRU for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3F760A43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE3F760A43
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C28438D665; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:44:48 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c507205a6715271a0a17959c6a6bc58c614af863
X-Git-Newrev: a96a10636901629307201c0b93f707d839d4bd23
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.C28438D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 python-pydal: new runtime test
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a96a10636901629307201c0b93f707d839d4bd23
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67d6e6602fec095084f64560050cb1195dff7765)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_pydal.py | 11 +++++++++++
 support/testing/tests/package/test_python_pydal.py   | 12 ++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 89fb3fceeb..0d3f3c8f9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1845,6 +1845,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_pydal.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/sample_python_sympy.py
 F:	support/testing/tests/package/test_4th.py
@@ -2000,6 +2001,7 @@ F:	support/testing/tests/package/test_python_midiutil.py
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
