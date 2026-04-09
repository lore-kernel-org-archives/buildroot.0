Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8C0F364AF
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 19:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FDB3822A2;
	Thu,  9 Apr 2026 19:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUES3lvAy1Ji; Thu,  9 Apr 2026 19:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E19BE82292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775763851;
	bh=u5+cIBrwt4f7TFt5PQZpMpTDf9rP6TG0LqHcbu5xWeI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H0s5xFPapGqzxduYe4K5kfpCu5QN3uQutqHycvHd4JwfmOJRxqA+aLzNknxLS205O
	 J5395kAxBTp1g7bxUqbWMMXG7gbTNg6VTzbJBbqP8p4AlcznCut6l4lFkdP5j65Tt8
	 pbPPernlzsNTAslVZKSb64VyE1b5YA/s+5BmUnac/Pef+T2JN9Jjv4rLR03dIeW/8I
	 yninLBBebWHgMMIPr/zHidEq/K8h/N0UE7L4IIsec8ywmNMM60rSc1B2uX/24WR8AY
	 hyz1yv7R+mBP9yl52DNwdYkyi4hu1T2PQ5i5AtZDR2uIpVw96PG9SNTUC6IqS5yuRZ
	 cYan1+7a17j5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E19BE82292;
	Thu,  9 Apr 2026 19:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A111237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE19410AD
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puJoUHWNL8cZ for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 19:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87B740D79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A87B740D79
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 19:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4036180F70; Thu,  9 Apr 2026 19:44:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Apr 2026 21:26:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58d2330b62ce1f94fe7dd942b4393e6bb9b8db83
X-Git-Newrev: f862711b1033ee3b0bd92f2aab9f16ee4035b603
X-Patchwork-Hint: ignore
Message-Id: <20260409194408.4036180F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.14.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f862711b1033ee3b0bd92f2aab9f16ee4035b603
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-3144/
https://docs.python.org/release/3.14.4/whatsnew/changelog.html

Fixes
CVE 2026-4224: https://www.cve.org/CVERecord?id=CVE-2026-4224
CVE 2026-3644: https://www.cve.org/CVERecord?id=CVE-2026-3644
CVE 2026-2297: https://www.cve.org/CVERecord?id=CVE-2026-2297

Rebased patch 0010 due to upstream commit
https://github.com/python/cpython/commit/616e6118442832544fab0b93e9dd7d15411a2a58

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...h-139275-Fix-compilation-of-Modules-_remote_debuggi.patch | 12 ++++++------
 package/python3/python3.hash                                 |  4 ++--
 package/python3/python3.mk                                   |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
index 716d9d3e8a..b000a68e9b 100644
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
 
 Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
 
-[ Bernd Kuhls: ported to Python 3.14.2]
+[ Bernd Kuhls: ported to Python 3.14.4]
 [ Vincent Fazio: update to apply cleanly to 3.14.3 ]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
@@ -29,28 +29,28 @@ diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_modu
 index b46538b76df..e86a27d5812 100644
 --- a/Modules/_remote_debugging_module.c
 +++ b/Modules/_remote_debugging_module.c
-@@ -812,7 +812,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
+@@ -834,7 +834,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
          PyErr_SetString(PyExc_RuntimeError, "Failed to find the AsyncioDebug section in the process.");
          _PyErr_ChainExceptions1(exc);
      }
 -#elif defined(__linux__)
 +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
      // On Linux, search for asyncio debug in executable or DLL
-     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython");
+     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython", NULL);
      if (address == 0) {
 diff --git a/Python/remote_debug.h b/Python/remote_debug.h
 index 8f9b6cd4c49..b7d17a0f345 100644
 --- a/Python/remote_debug.h
 +++ b/Python/remote_debug.h
-@@ -886,7 +886,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
+@@ -923,7 +923,7 @@
              handle->pid);
          _PyErr_ChainExceptions1(exc);
      }
 -#elif defined(__linux__)
 +#elif defined(__linux__) && HAVE_PROCESS_VM_READV
      // On Linux, search for 'python' in executable or DLL
-     address = search_linux_map_for_section(handle, "PyRuntime", "python");
-     if (address == 0) {
+     address = search_linux_map_for_section(handle, "PyRuntime", "python",
+                                            _Py_RemoteDebug_ValidatePyRuntimeCookie);
 -- 
 2.47.3
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b674b589bd..13e2b94336 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3143/
-sha256  a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b  Python-3.14.3.tar.xz
+# From https://www.python.org/downloads/release/python-3144/
+sha256  d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8  Python-3.14.4.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 07cba7c02d..c71cb0b05b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
