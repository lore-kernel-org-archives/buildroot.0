Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAEECD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D198160BCA;
	Thu, 11 Jun 2026 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWe5XksO0Gtg; Thu, 11 Jun 2026 20:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A464D60BC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781209287;
	bh=okDmb+qZvS71xKfxezAy90OzUaKQXE5teY+QxlypkNs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HumDwddVUPWujPtmLMb8L/blH3x5JN4ODdy+mHvqpt7zVCUvutYOF/B4ZKjJ2D2w/
	 vwy3E+YuhLukSAQfg82DUIMBPgjbp6rAwfZII3LfzmyeTtbl81wfw/1fW2mYNHvzgP
	 i3jJrKOnszXBrkfT4Q/p4UprQ+cKXo4qh0Ftp09nBL7/T3n0Oy/ipP7Aig5cU0xzn5
	 fK3chHAfaOb6ObGAOWrHgC87Eo98eyAsnQz+jXQHwykoUXjKGdR9vLpQ69jhU3w74L
	 bTemvC/dXAwHLgeN7UDI/zESo5Wo9j1R5tuc1RMP2XYoQqsc0W00R3cEP5xbwm1ub/
	 z8BsEfm93dzww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A464D60BC7;
	Thu, 11 Jun 2026 20:21:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FC47F4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01CBF404A7
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNN0-Gtg2OLT for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 330AC40076
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 330AC40076
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5188388036; Thu, 11 Jun 2026 20:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 22:12:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c8d5a98a9aa689a31edd5d6c12a22e5a0a011e7
X-Git-Newrev: dab0de6277c484998842f4617a9730ce2ae3b050
X-Patchwork-Hint: ignore
Message-Id: <20260611202106.5188388036@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webpy: bump to version 0.76
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dab0de6277c484998842f4617a9730ce2ae3b050
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Change log since v0.60:
https://github.com/webpy/webpy/releases/tag/0.61
https://github.com/webpy/webpy/releases/tag/0.62
https://github.com/webpy/webpy/releases/tag/v0.76

Remove the upstreamed patch and add a license file.

This commit adds the new python-multipart runtime dependency, needed
since upstream commit:
https://github.com/webpy/webpy/commit/f7540bef650bce7227af796728136d41e44cdd0e

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien:
 - move the "v" from _VERSION to _SITE
 - select new BR2_PACKAGE_PYTHON_MULTIPART runtime dependency
 - add links to all release notes in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-webpy/0001-Address-CVE-2025-3818.patch  | 42 ----------------------
 package/python-webpy/Config.in                     |  1 +
 package/python-webpy/python-webpy.hash             |  3 +-
 package/python-webpy/python-webpy.mk               |  5 +--
 4 files changed, 6 insertions(+), 45 deletions(-)

diff --git a/package/python-webpy/0001-Address-CVE-2025-3818.patch b/package/python-webpy/0001-Address-CVE-2025-3818.patch
deleted file mode 100644
index d8373cbac6..0000000000
--- a/package/python-webpy/0001-Address-CVE-2025-3818.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3ba1b40e5a828a26a1df1b49cdc87395f3274c81 Mon Sep 17 00:00:00 2001
-From: Mek <michael.karpeles@gmail.com>
-Date: Wed, 7 May 2025 15:14:44 -0400
-Subject: [PATCH] Address CVE-2025-3818 (#807)
-
-* Address CVE-2025-3818
-
-Co-authored-by: Scott Barnes <scottreidbarnes@gmail.com>
-
-Upstream: https://github.com/webpy/webpy/commit/3ba1b40e5a828a26a1df1b49cdc87395f3274c81
-
-Fixes CVE-2025-3818: https://github.com/advisories/GHSA-9g47-36rw-gjh2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- web/db.py | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/web/db.py b/web/db.py
-index 5284f8d0..ba3e12c5 100644
---- a/web/db.py
-+++ b/web/db.py
-@@ -1198,10 +1198,18 @@ def _process_insert_query(self, query, tablename, seqname):
-                 seqname = None
- 
-         if seqname:
--            query += "; SELECT currval('%s')" % seqname
-+            query += self.get_sequence_query(seqname)
- 
-         return query
- 
-+    def get_sequence_query(self, seqname):
-+        import re
-+        # Ensure the sequence name is valid
-+        if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_$]*$', seqname):
-+            raise ValueError(f"Invalid sequence name: {seqname}")
-+        return SQLQuery("; SELECT currval(%s)", seqname)
-+
-+
-     def _get_all_sequences(self):
-         """Query postgres to find names of all sequences used in this database."""
-         if self._sequences is None:
diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index ed78409572..12920a7b32 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
 	select BR2_PACKAGE_PYTHON_CHEROOT # runtime
 	select BR2_PACKAGE_PYTHON_MARKDOWN # runtime
+	select BR2_PACKAGE_PYTHON_MULTIPART # runtime
 	help
 	  web.py is a web framework for Python that is as simple as it
 	  is powerful.
diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 0fb39170c7..a3f9122258 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  eee36e423b5e85463145159d94735e3c3a4c1c8078555042d8139348350b0022  python-webpy-0.70.tar.gz
+sha256  c5d5df8b95c22cacb6be580cee88459922ff114894fe4e146da634ab3d1f9185  python-webpy-0.76.tar.gz
+sha256  791bf6e9419435f114a19fc6519ff33738021eb3c41b18490943230ab0894df9  LICENSE.txt
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 62b2331c08..5127873677 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.70
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_VERSION = 0.76
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,v$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain
+PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
