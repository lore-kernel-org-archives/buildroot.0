Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014D0D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC67284006;
	Fri, 12 Dec 2025 07:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqPagQN9DoPe; Fri, 12 Dec 2025 07:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B54784013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526282;
	bh=IQ9OHE4/SrZra9M/7Ezl8Yp/BP4hcywjVbychsOQqao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QUS3cJJti2aqOtjbgxy+TS7HXjDvvcbz+4fh8oaTHavcoS2gJtavQvCSm4NXj93GH
	 KLu7LRjigCEukzd/a3B7k2yIryHJ29Yod69emkgYqjWGxcBtkn3JIVHF2zGntZtwFr
	 vVioGeynPLdlJAj5JowD95C3fWzLSrkrHMH2OLebMcx5ngFGmNxFVej4xaLmxikWq6
	 L0AYMf/D8VJM9fS1VGP9THfBxZUIwvvbVKXBJ7AbV63QlXa6ZeLcax+pS+QHO8uFMo
	 osohVshCurIDjxiuJtiUVxhOJgFkcclRU4C/geBT7ymR3kOmM+nPi4D1kONiANbibr
	 RBAFIS8wZi4bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B54784013;
	Fri, 12 Dec 2025 07:58:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39DDFE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1044841166
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpwnI8vQjD10 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF8841176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF8841176
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC08C807F9; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 264bada0c545685a3cc58473d034ef382810c702
X-Git-Newrev: a7f3bdb7b26ff7c52b5911e7707aa915a34f1391
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.EC08C807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7f3bdb7b26ff7c52b5911e7707aa915a34f1391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-build-Update-for-compat-with-newer-CMake.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch b/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
new file mode 100644
index 0000000000..81cb5cd094
--- /dev/null
+++ b/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
@@ -0,0 +1,25 @@
+From 42ac641452aa56afa04f7bad5a55f790ee639852 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Sun, 30 Mar 2025 12:05:53 +0200
+Subject: [PATCH] build: Update for compat with newer CMake (closes #3245)
+
+Upstream: https://github.com/merbanan/rtl_433/commit/42ac641452aa56afa04f7bad5a55f790ee639852
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 08f63eea7..6dc1f7910 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ########################################################################
+ # Project setup
+ ########################################################################
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 2.6...3.10)
+ # Fix behavior of CMAKE_C_STANDARD when targeting macOS.
+ if(POLICY CMP0025)
+     cmake_policy(SET CMP0025 NEW)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
