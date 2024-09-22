Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D89CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2143581B9D;
	Sun, 22 Sep 2024 10:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJFDr_OH1DwE; Sun, 22 Sep 2024 10:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E69081B60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E69081B60;
	Sun, 22 Sep 2024 10:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2021C1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A8F24064D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kX2Ci4m6CkrD for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F12C40635
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F12C40635
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3958A81EE7; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:28:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b612a5e25c58ed9269d2ab94fc0e2186c68202e6
X-Git-Newrev: 478f4a0b3a64e3d32d65892f3b606f0b0d67d6ea
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.3958A81EE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tornado: bump to version
 6.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=478f4a0b3a64e3d32d65892f3b606f0b0d67d6ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream; that was a backport from an upstream
security fix for CVE-2023-28370, so we can drop the CVE exclusion now.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - drop CVE exclusion
  - extend commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Fix-an-open-redirect-in-StaticFileHandler.patch | 42 ----------------------
 package/python-tornado/python-tornado.hash         |  4 +--
 package/python-tornado/python-tornado.mk           |  6 ++--
 3 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
deleted file mode 100644
index 357c6f2f12..0000000000
--- a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ac79778c91bd9a4a92111f7e06d4b12674571113 Mon Sep 17 00:00:00 2001
-From: Ben Darnell <ben@bendarnell.com>
-Date: Sat, 13 May 2023 20:58:52 -0400
-Subject: [PATCH] web: Fix an open redirect in StaticFileHandler
-
-Under some configurations the default_filename redirect could be exploited
-to redirect to an attacker-controlled site. This change refuses to redirect
-to URLs that could be misinterpreted.
-
-A test case for the specific vulnerable configuration will follow after the
-patch has been available.
-
-Upstream: https://github.com/tornadoweb/tornado/commit/32ad07c54e607839273b4e1819c347f5c8976b2f
-[Thomas: backported to fix CVE-2023-28370]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tornado/web.py | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/tornado/web.py b/tornado/web.py
-index cd6a81b4..05b571eb 100644
---- a/tornado/web.py
-+++ b/tornado/web.py
-@@ -2806,6 +2806,15 @@ class StaticFileHandler(RequestHandler):
-             # but there is some prefix to the path that was already
-             # trimmed by the routing
-             if not self.request.path.endswith("/"):
-+                if self.request.path.startswith("//"):
-+                    # A redirect with two initial slashes is a "protocol-relative" URL.
-+                    # This means the next path segment is treated as a hostname instead
-+                    # of a part of the path, making this effectively an open redirect.
-+                    # Reject paths starting with two slashes to prevent this.
-+                    # This is only reachable under certain configurations.
-+                    raise HTTPError(
-+                        403, "cannot redirect path with two initial slashes"
-+                    )
-                 self.redirect(self.request.path + "/", permanent=True)
-                 return None
-             absolute_path = os.path.join(absolute_path, self.default_filename)
--- 
-2.41.0
-
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index f30a6bb136..f8ac0ceaf3 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  32fbad606b439c3e1bf4e79d4e872741  tornado-6.2.tar.gz
-sha256  9b630419bde84ec666bfd7ea0a4cb2a8a651c2d5cccdbdd1972a0c859dfc3c13  tornado-6.2.tar.gz
+md5  07ebd88a2a7acee1b819738f3f4ca7ef  tornado-6.4.1.tar.gz
+sha256  92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9  tornado-6.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index f4a4c97d2a..c5e5a2ca0c 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.2
+PYTHON_TORNADO_VERSION = 6.4.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f3/9e/225a41452f2d9418d89be5e32cf824c84fe1e639d350d6e8d49db5b7f73a
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/ee/66/398ac7167f1c7835406888a386f6d0d26ee5dbf197d8a571300be57662d3
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
 PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
-# 0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
-PYTHON_TORNADO_IGNORE_CVES += CVE-2023-28370
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
