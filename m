Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9377AD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A86840BF;
	Fri, 12 Dec 2025 07:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5dbWEhX9PP9; Fri, 12 Dec 2025 07:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8A4C840E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526295;
	bh=NuGUCp88f6yAt2Ldn/aOLAk9r3AKX2Sx6rNoVbQAgzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=joaIdjdU3U6wunn+GpXUeBuyw6Y8ZloZNIka8OWy45C5E/xqSbisMbwdZayJ1y3t/
	 TcvedVceTxSIZQdwE04qA4ZVGYQemkoL8Zxlf7RT+pd5KtDyjGuOzQwhhJcFURZyZ+
	 Fk00So/RpISl+akOYsWjkDvgyyA5ED5QCcd7Fu6pfKyIaE/h2j5l88RT5Us1k3KL+e
	 NbTBLSaZHGtH115KfCYa4PfYXRe6ooTb2TP9hC1Ui94B3HTZEhUwfjq16sZ4wzwhal
	 EWlpV3EXoOIxuB2LZKN/otw8fPs4FlQhSBeTAk7lAP7cTGZPbySoafRCoTxboGuMNf
	 pdvWpKyc7pQjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8A4C840E9;
	Fri, 12 Dec 2025 07:58:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 511DBE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AFFF41124
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHulD6j7gpO4 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2848A4117B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2848A4117B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27215807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 17:10:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b3db28739a2d050f930b0b99af76344fae37079
X-Git-Newrev: d29711322c98c6ed535208deffb82d8e23d433df
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.27215807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lugaru: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=d29711322c98c6ed535208deffb82d8e23d433df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-Revert-Set-CMP0004-policy-to-OLD.patch    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch b/package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch
new file mode 100644
index 0000000000..a8359f9e69
--- /dev/null
+++ b/package/lugaru/0003-Revert-Set-CMP0004-policy-to-OLD.patch
@@ -0,0 +1,31 @@
+From 165a34a5ca8a712be405fefffcccdb5845f230e3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Verschelde?= <rverschelde@gmail.com>
+Date: Sat, 7 Jul 2018 11:52:28 +0200
+Subject: [PATCH] Revert "Set CMP0004 policy to OLD"
+
+This reverts commit b461f4a69c17073d5c576d24e48b1b59c0d3c932.
+The workaround is no longer needed with SDL 2.0.5+, which is shipped
+in all distros we support (including Debian Stable and RHEL 7).
+
+Fixes #99.
+
+Upstream: https://github.com/osslugaru/lugaru/commit/165a34a5ca8a712be405fefffcccdb5845f230e3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 29141271..3973d362 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,6 @@
+ project(lugaru)
+ 
+-cmake_minimum_required(VERSION 3.0)
+-cmake_policy(SET CMP0004 OLD)
++cmake_minimum_required(VERSION 3.5)
+ 
+ include(FindPkgConfig)
+ include(GNUInstallDirs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
