Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A298DD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 749C383E90;
	Fri, 12 Dec 2025 07:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zG3svbnd3qnX; Fri, 12 Dec 2025 07:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795FA84025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526286;
	bh=Ch7mPRGz+LubXybNRQZujzrRakhjGUSVVe5sS4yXpC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZAAanoxqiGg9D1DguhI6yHtlebgBg9DuWNHd/9UFx8V5h9buLCaemzPgA4AF44zyq
	 cwIaRyIXnfks7SJQ/NQAWlGkYq1q8FFkyac+WWaBrWCRU6RscMYTHm6NwwsTn5cVjJ
	 cKQIZ85vCPZ+wqwVzLwiFbmF3c+tuOAodU6/BZTT0W6P9jssI+ggIU2oWGXQUJc7nL
	 Ts79yRvqy589EmyG5bYzDLqJehnsiUVrYvkH+HrKwObHJmCYVFwTGwEdZ1gLyWOODY
	 L++C3AnDLA7xXPEV/syOuucgjqkfPE2mvT1Tjro4L04qoF9iN+qPK6+3eSLgIaeJGL
	 skcdRJKcs7s0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795FA84025;
	Fri, 12 Dec 2025 07:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E2DC2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87A9141112
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMKfDKmUwQGi for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A29B24116A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A29B24116A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1D6381674; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca863d787047dc6cf1f2d20ee60b08e82439642b
X-Git-Newrev: cf00a0a1a1dcdc331f0d4b249d9aa867f773a780
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.A1D6381674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmatroska: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf00a0a1a1dcdc331f0d4b249d9aa867f773a780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-drop-CMake-older-than-3.5.patch           | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libmatroska/0001-drop-CMake-older-than-3.5.patch b/package/libmatroska/0001-drop-CMake-older-than-3.5.patch
new file mode 100644
index 0000000000..25e09ed7bc
--- /dev/null
+++ b/package/libmatroska/0001-drop-CMake-older-than-3.5.patch
@@ -0,0 +1,29 @@
+From dc80e194e93e6f0e25c8ad3e015d83aca2a99e10 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <slhomme@matroska.org>
+Date: Sat, 24 Feb 2024 08:38:00 +0100
+Subject: [PATCH] drop CMake older than 3.5
+
+It generates a warning with newer versions of CMake.
+3.4 was released in 2015. We require C++17 with compilers only available in 2017/2018.
+If your CMake is older than your toolchain, you have a problem.
+
+There's no need to support legacy CMake going forward in libebml 2/libmatroska 2.
+
+Upstream: https://github.com/Matroska-Org/libmatroska/commit/dc80e194e93e6f0e25c8ad3e015d83aca2a99e10
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to version 1.7.1]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 221c8ac6..97b392e0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1.2)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(matroska VERSION 1.7.1)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
