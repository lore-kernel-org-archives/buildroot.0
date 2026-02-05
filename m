Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFFAECD986
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 16:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C2460B13;
	Thu,  5 Feb 2026 16:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNc9QuAO5A6S; Thu,  5 Feb 2026 16:25:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D334860B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770308756;
	bh=fFOUky9meuWxqyLMf4UPvKX7Ovj0n/FzYm/WswJHef8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QVJO3TKfYotOex80K98/vs7mKHkw1yS6yZAT1fkGRsUQQXz056vk4Ju7k9BRsGgwJ
	 RV9b1HuRjMB5My3bfbB1Wjec69a9s3PmDP+tG11yAC8BZz2mFy+3BXUn+xM39oru53
	 8gcih/UHaxG6jbvNF3614Ac2V9cqgWbYdowy7GxuIVtQrpbIggHyCB5w0N6JU2DsP/
	 dk86D8o7b0uy+Z2Bkfe0czOEX7Fx+buJWY7emFKZB7tMaZC8kiU9q0HWpo7iQXMszN
	 Bv2B9jdUMxq/eMhHFpz07GpyXbHLmyc7U2pNC9y/lAoU5ZronLwCBnREaxIKE1u6Cm
	 gcYWdwSAVVT1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D334860B4C;
	Thu,  5 Feb 2026 16:25:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B033B173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9143760B4C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LArpIaFtc79a for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 16:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0E7860B13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0E7860B13
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:25:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8706586A1C; Thu,  5 Feb 2026 16:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 17:23:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 375ae3d82e69edcdd94738e695c592e9eb4bfdfa
X-Git-Newrev: 296f509307ae2aea3dbd2064244721d7b8215f9f
X-Patchwork-Hint: ignore
Message-Id: <20260205162551.8706586A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump to version 3.14.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/296f509307ae2aea3dbd2064244721d7b8215f9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-3143/
https://docs.python.org/release/3.14.3/whatsnew/changelog.html

Update the hash file to use the sha256 hash provided by upstream.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch  | 3 ++-
 package/python3/python3.hash                                         | 5 ++---
 package/python3/python3.mk                                           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
index 7a72ebb16c..716d9d3e8a 100644
--- a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -8,6 +8,7 @@ Subject: [PATCH] gh-139275: Fix compilation of
 Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
 
 [ Bernd Kuhls: ported to Python 3.14.2]
+[ Vincent Fazio: update to apply cleanly to 3.14.3 ]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
@@ -41,7 +42,7 @@ diff --git a/Python/remote_debug.h b/Python/remote_debug.h
 index 8f9b6cd4c49..b7d17a0f345 100644
 --- a/Python/remote_debug.h
 +++ b/Python/remote_debug.h
-@@ -881,7 +881,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
+@@ -886,7 +886,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
              handle->pid);
          _PyErr_ChainExceptions1(exc);
      }
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b71f6e7deb..b674b589bd 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,4 @@
-# From https://www.python.org/downloads/release/python-3142/
-md5  19a31b2838db3b53f9f2db8782bf8773  Python-3.14.2.tar.xz
+# From https://www.python.org/downloads/release/python-3143/
+sha256  a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b  Python-3.14.3.tar.xz
 # Locally computed
-sha256  ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9  Python-3.14.2.tar.xz
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8195f4fd83..a240349d3e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
