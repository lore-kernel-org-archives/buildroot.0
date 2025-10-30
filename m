Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C43CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FE641152;
	Thu, 30 Oct 2025 08:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dpETg7QVumo; Thu, 30 Oct 2025 08:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10ABF41163
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10ABF41163;
	Thu, 30 Oct 2025 08:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34CF72A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 271604115D
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZ_2EuWjrxnh for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50DEA41152
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50DEA41152
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C9898773E; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:55:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f7762b85c149dfbc7790d272337c5b780df22f9
X-Git-Newrev: 952abe662215b25edcbacd325566db2026dff90a
X-Patchwork-Hint: ignore
Message-Id: <20251030081039.4C9898773E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-webpy:
 bump version to 0.70 and add upstream commit to fix CVE-2025-3818
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=952abe662215b25edcbacd325566db2026dff90a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes: https://github.com/webpy/webpy/releases/tag/webpy-0.70

Switched _SITE to github because version 0.70 was not released to
pypi.org: https://pypi.org/project/web.py/#history

Added upstream commit to fix CVE-2025-3818.

This bump includes
https://github.com/webpy/webpy/commit/f7540bef650bce7227af796728136d41e44cdd0e
which removes the deprecated cgi module which was removed in Python 3.13
and causes build errors since buildroot bumped python3 to 3.13.2 with
commit d63e207eb869063f82c867658676c2903beb08cb.

Fixes:
https://autobuild.buildroot.net/results/5a7/5a7382250d33ddfd49de2c7996fb54aaf20dd62c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d05e2f785de6e0e51590160e002d1fd6e143d403)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../python-webpy/0001-Address-CVE-2025-3818.patch  | 42 ++++++++++++++++++++++
 package/python-webpy/python-webpy.hash             |  5 ++-
 package/python-webpy/python-webpy.mk               |  5 ++-
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/package/python-webpy/0001-Address-CVE-2025-3818.patch b/package/python-webpy/0001-Address-CVE-2025-3818.patch
new file mode 100644
index 0000000000..d8373cbac6
--- /dev/null
+++ b/package/python-webpy/0001-Address-CVE-2025-3818.patch
@@ -0,0 +1,42 @@
+From 3ba1b40e5a828a26a1df1b49cdc87395f3274c81 Mon Sep 17 00:00:00 2001
+From: Mek <michael.karpeles@gmail.com>
+Date: Wed, 7 May 2025 15:14:44 -0400
+Subject: [PATCH] Address CVE-2025-3818 (#807)
+
+* Address CVE-2025-3818
+
+Co-authored-by: Scott Barnes <scottreidbarnes@gmail.com>
+
+Upstream: https://github.com/webpy/webpy/commit/3ba1b40e5a828a26a1df1b49cdc87395f3274c81
+
+Fixes CVE-2025-3818: https://github.com/advisories/GHSA-9g47-36rw-gjh2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ web/db.py | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/web/db.py b/web/db.py
+index 5284f8d0..ba3e12c5 100644
+--- a/web/db.py
++++ b/web/db.py
+@@ -1198,10 +1198,18 @@ def _process_insert_query(self, query, tablename, seqname):
+                 seqname = None
+ 
+         if seqname:
+-            query += "; SELECT currval('%s')" % seqname
++            query += self.get_sequence_query(seqname)
+ 
+         return query
+ 
++    def get_sequence_query(self, seqname):
++        import re
++        # Ensure the sequence name is valid
++        if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_$]*$', seqname):
++            raise ValueError(f"Invalid sequence name: {seqname}")
++        return SQLQuery("; SELECT currval(%s)", seqname)
++
++
+     def _get_all_sequences(self):
+         """Query postgres to find names of all sequences used in this database."""
+         if self._sequences is None:
diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 540771a244..0fb39170c7 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,3 +1,2 @@
-# md5, sha256 from https://pypi.org/pypi/web.py/json
-md5  cd2c0296ceffa1acb96ae5315214eb42  web.py-0.62.tar.gz
-sha256  5ce684caa240654cae5950da8b4b7bc178812031e08f990518d072bd44ab525e  web.py-0.62.tar.gz
+# Locally computed
+sha256  eee36e423b5e85463145159d94735e3c3a4c1c8078555042d8139348350b0022  python-webpy-0.70.tar.gz
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 06d4ae039b..62b2331c08 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.62
-PYTHON_WEBPY_SOURCE = web.py-$(PYTHON_WEBPY_VERSION).tar.gz
-PYTHON_WEBPY_SITE = https://files.pythonhosted.org/packages/cd/6e/338a060bb5b52ee8229bdada422eaa5f71b13f8d33467f37f870ed2cae4b
+PYTHON_WEBPY_VERSION = 0.70
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = setuptools
 PYTHON_WEBPY_LICENSE = Public Domain
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
