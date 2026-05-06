Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E84CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4AE560F54;
	Wed,  6 May 2026 22:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPrBDxEpOxnu; Wed,  6 May 2026 22:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB8E260F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778105838;
	bh=QBoGvLbIlzz0af1z2umyDezm6fByiaJ13EX4WEEXfl0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Je+VQ54p3fJiWC85gSWXZFzNfX+Vow/EwRhtV4QnjZwaHP70KRORn5RkfQyegpOIV
	 rJZtGQZcSVlaCgRIpgk2nlJcKPbgP053W+3HMTvMthS2x3WGnEgtPQru3Hk9QkQusi
	 ycPl4/4wvXJU/Am0Ev8qJVMgy2+W1e4RhtY87Ul52iFQXKv7DAPEB+yyrUG5v7Wi/l
	 tHqAm6DQRTcZCek8l/HcJkhZX7eRUjotzx8Ptx6a40YRm0qjIp9fKdhWMhoYU7AOdq
	 5tjBl4RCWerJSZr4jcvCulCxcZ2TitpkqnjhfzpP2Thu0HzoGZhND6xreMMzsCcFQ/
	 7S8vC2jcFZlNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8E260F57;
	Wed,  6 May 2026 22:17:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA35A280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0BCD607CD
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X998L7dxntAP for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B514260747
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B514260747
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:17:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42A4084BC1; Wed,  6 May 2026 22:17:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 May 2026 23:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f2e9cc8784715bdf18e72c433fe9bece4537f85
X-Git-Newrev: 951e07f0c40c52fc069c53c6cf9232dcc0e8b296
X-Patchwork-Hint: ignore
Message-Id: <20260506221714.42A4084BC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/951e07f0c40c52fc069c53c6cf9232dcc0e8b296
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-22-1-5-released/90734

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index eb3775659f..9155ba8c53 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.4
-sha256  3e68c90dda630c27d41d201e37b8bbf5222e39b273dec5ca880709c69e0a07d4  llvm-project-22.1.4.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.5
+sha256  7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c  llvm-project-22.1.5.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 1aa02e0800..eedef3a1c5 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
