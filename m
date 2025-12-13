Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11774D5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59D0608C5;
	Sat, 13 Dec 2025 20:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INs4eg4k7_qd; Sat, 13 Dec 2025 20:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53FE608A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765656698;
	bh=PTnzz+4J70RB9aDLsJ4wKDcTP//pXCuxUVmG5mHH7aE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=igSDTIlHp29XgqME8ZnV2i8n+EyOh41CHq+fZFZnCvOSwGL2GJ8ciy3fxMwpvKeX0
	 MG5BRszP//6tnkNJrUFFeE2981XnZbx5/A238Ntvix/PdYzu5TdYTF0PeIBoCN/9w/
	 TZSrJDpHPkQDyqnGgJXEJGDEQ1SoNQoO1xkY7sMfgVS9damj+sRXBN4JB9fd5849Ni
	 Dj3CgkaI9I81Py4ANtVeObBOtDlm1WHMmD3Vy61mU7P7hDgvwxKkYt4IK8+EVW9bMG
	 9Ca66O76Tttt3ogKxMywkT/OS5XoGdmBkLZT8O7FZd7PUcqHgtYhAHq0dnNx+SC9b2
	 EOEz+vO30TP0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53FE608A5;
	Sat, 13 Dec 2025 20:11:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E73B32C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97E94018E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrIrbjpgvmTT for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D9A9400A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9A9400A0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24EFB86E26; Sat, 13 Dec 2025 20:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 21:05:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 856d88d9a079a5d874e984fec65a6f7456143267
X-Git-Newrev: 2170ed923d298d779867e55c8d4d1b85f740dda9
X-Patchwork-Hint: ignore
Message-Id: <20251213201136.24EFB86E26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2170ed923d298d779867e55c8d4d1b85f740dda9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://cmake.org/cmake/help/latest/release/4.2.html#id1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 2bc7b740d2..7724fc4e85 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.0-SHA-256.txt
-sha256  4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579  cmake-4.2.0.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.1-SHA-256.txt
+sha256  414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070  cmake-4.2.1.tar.gz
 
 # Locally calculated
 sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 66b169440c..e9752640e5 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
