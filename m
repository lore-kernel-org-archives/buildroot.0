Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E77C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E9D88128E;
	Fri, 14 Aug 2026 13:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUm7uebsdCCd; Fri, 14 Aug 2026 13:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7325B812B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713605;
	bh=ZEgWfnN6sZ3dkoRaOSIkYQuxwP9dD7v8HVlwpVDwxCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hGXLl7xiHVlYmFB0U+O2ifo+y4bfQPI8FLNiqED1qNq+AojPaXM7zBJ0iPAo7+WTP
	 MyZYBFCODUR9LqlENWh4G5d1p5q/fq7KcRVKccpsBrhjq1hXDbsF6oVrKXWZ209fQm
	 Nhvp7iF5p6fOv3wulsX2cZy7lfT++kpMRAHFHQDGzOtYWbys6Xys+v35Hj4iVDm48S
	 SNR7gsYLxBecTmexbQtXi6ZUxyPxzDl34UwvFbk/xeukhtNah3Us790VnO0Jk6w9Im
	 /dQdrtRSKyG2UOWgtTMH1MRTbXMETNhS21tmdCx0cHZHhQjzpYhHImu0VhRoJrkj7D
	 +1Y9QvdNtkuZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7325B812B7;
	Fri, 14 Aug 2026 13:20:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F96433B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614EB80E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq8KovtA5NHj for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CBC80E24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80CBC80E24
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 853AD8D667; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:44:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2ea2e167bb001e3ab99f860d7e81c32d484c8000
X-Git-Newrev: 0dd9fc7c90791cc0353337a903dc5fd1e51ecd82
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.853AD8D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0dd9fc7c90791cc0353337a903dc5fd1e51ecd82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67d6e6602fec095084f64560050cb1195dff7765)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_pydal.py | 11 +++++++++++
 support/testing/tests/package/test_python_pydal.py   | 12 ++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e492e03694..d400a0c2b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1795,6 +1795,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_pydal.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/sample_python_sympy.py
 F:	support/testing/tests/package/test_4th.py
@@ -1948,6 +1949,7 @@ F:	support/testing/tests/package/test_python_midiutil.py
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
