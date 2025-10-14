Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F653CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0723783DEB;
	Tue, 14 Oct 2025 18:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWzKf4b20rTM; Tue, 14 Oct 2025 18:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24A483CFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24A483CFE;
	Tue, 14 Oct 2025 18:45:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF5801479
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFEEA4150E
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqseUBmoA7Yz for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEABC411DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEABC411DE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCC86870CF; Tue, 14 Oct 2025 18:45:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 684462bbe8aee3bd888a4f161041424cf0aee71d
X-Git-Newrev: 6bf65a90a53a2f5860eeac0ba925f6a771141a14
X-Patchwork-Hint: ignore
Message-Id: <20251014184550.BCC86870CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aexpect: bump version to
 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bf65a90a53a2f5860eeac0ba925f6a771141a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Drop-the-use-of-pipes.patch               | 70 ----------------------
 package/python-aexpect/python-aexpect.hash         |  4 +-
 package/python-aexpect/python-aexpect.mk           |  4 +-
 3 files changed, 4 insertions(+), 74 deletions(-)

diff --git a/package/python-aexpect/0001-Drop-the-use-of-pipes.patch b/package/python-aexpect/0001-Drop-the-use-of-pipes.patch
deleted file mode 100644
index a952ddc8fb..0000000000
--- a/package/python-aexpect/0001-Drop-the-use-of-pipes.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 3753ad491bf5847a11a7f4baf3ecaa490e0e9111 Mon Sep 17 00:00:00 2001
-From: Xu Han <xuhan@redhat.com>
-Date: Wed, 31 Jan 2024 14:57:37 +0800
-Subject: [PATCH] Drop the use of pipes
-
-`pipes` was deprecated since version 3.11 so let's replace the use
-of that module with the alternatives.
-
-Signed-off-by: Xu Han <xuhan@redhat.com>
-Upstream: https://github.com/avocado-framework/aexpect/commit/f2b888b1bd453a46820d38b62fd2b5db1228e4b7
-[Romain: backport to 1.7.0]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- aexpect/remote.py | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/aexpect/remote.py b/aexpect/remote.py
-index d7e09ec..2bfd92a 100644
---- a/aexpect/remote.py
-+++ b/aexpect/remote.py
-@@ -47,7 +47,7 @@ import logging
- import time
- import re
- import os
--import pipes
-+import shlex
- 
- from aexpect.client import Expect
- from aexpect.client import RemoteSession
-@@ -217,8 +217,8 @@ def quote_path(path):
-     :return: Shell escaped version
-     """
-     if isinstance(path, list):
--        return ' '.join(map(pipes.quote, path))
--    return pipes.quote(path)
-+        return ' '.join(map(shlex.quote, path))
-+    return shlex.quote(path)
- 
- 
- def handle_prompts(session, username, password, prompt=PROMPT_LINUX,
-@@ -621,7 +621,7 @@ def scp_to_remote(host, port, username, password, local_path, remote_path,
-                 r"-o StrictHostKeyChecking=no "
-                 fr"-o PreferredAuthentications=password {limit} "
-                 fr"-P {port} {quote_path(local_path)} {username}@\[{host}\]:"
--                fr"{pipes.quote(remote_path)}")
-+                fr"{shlex.quote(remote_path)}")
-     password_list = [password]
-     return remote_scp(command, password_list,
-                       log_filename, log_function, timeout)
-@@ -664,7 +664,7 @@ def scp_from_remote(host, port, username, password, remote_path, local_path,
-                 r"-o StrictHostKeyChecking=no "
-                 fr"-o PreferredAuthentications=password {limit} "
-                 fr"-P {port} {username}@\[{host}\]:{quote_path(remote_path)} "
--                fr"{pipes.quote(local_path)}")
-+                fr"{shlex.quote(local_path)}")
-     password_list = [password]
-     remote_scp(command, password_list,
-                log_filename, log_function, timeout)
-@@ -717,7 +717,7 @@ def scp_between_remotes(src, dst, port, s_passwd, d_passwd, s_name, d_name,
-                 r"-o StrictHostKeyChecking=no "
-                 fr"-o PreferredAuthentications=password {limit} -P {port}"
-                 fr" {s_name}@\[{src}\]:{quote_path(s_path)} {d_name}@\[{dst}\]"
--                fr":{pipes.quote(d_path)}")
-+                fr":{shlex.quote(d_path)}")
-     password_list = [s_passwd, d_passwd]
-     return remote_scp(command, password_list,
-                       log_filename, log_function, timeout)
--- 
-2.50.1
-
diff --git a/package/python-aexpect/python-aexpect.hash b/package/python-aexpect/python-aexpect.hash
index ff30c765e3..8ca28a2e71 100644
--- a/package/python-aexpect/python-aexpect.hash
+++ b/package/python-aexpect/python-aexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aexpect/json
-md5  bb05319c277cfe97114780579d251c30  aexpect-1.7.0.tar.gz
-sha256  11bfeea78ef6147ac8f6e29c2a720bd332598383d88274cdca5e6413c2070d52  aexpect-1.7.0.tar.gz
+md5  46eb96cf409cd59c8d39ca5c092b734e  aexpect-1.8.0.tar.gz
+sha256  97b753e4b0aa08d455bd64d2486c97d6bf6a18a9b8c26315519ec61448400b78  aexpect-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7be26abf35e531a226dc742d2379d42d372cb61f027a6e26477c0e2f1a03bfcb  LICENSE
diff --git a/package/python-aexpect/python-aexpect.mk b/package/python-aexpect/python-aexpect.mk
index 1cfcc9ffaf..066f8d0480 100644
--- a/package/python-aexpect/python-aexpect.mk
+++ b/package/python-aexpect/python-aexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AEXPECT_VERSION = 1.7.0
+PYTHON_AEXPECT_VERSION = 1.8.0
 PYTHON_AEXPECT_SOURCE = aexpect-$(PYTHON_AEXPECT_VERSION).tar.gz
-PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/dd/32/738b5190adb5ed387d3e755885f646b714fbf9c22adbda7ff988db7ede49
+PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/a3/74/837acfcdb3187cb931aa2edc4979e64aa9954092e4fd36b1161f65d65fdb
 PYTHON_AEXPECT_SETUP_TYPE = setuptools
 PYTHON_AEXPECT_LICENSE = GPL-2.0+
 PYTHON_AEXPECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
