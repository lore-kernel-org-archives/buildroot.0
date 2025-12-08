Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80537D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EF261084;
	Mon,  8 Dec 2025 20:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6quOTC17qSWs; Mon,  8 Dec 2025 20:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F4661095
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765225215;
	bh=qtoiwbQB28monw9YDqhbHr3SqyAwoP7colZcS2WrGsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s5yYX36uQsAqXGIcOdGFRMIZ339qFyea+wnYbvNXpTUnG0Vjgkbd5v/n9qeTJKP/N
	 TW1a8KzVF5ZZd7EZ9ffneshOgMOoXKKl9b+J5AVIM+84LGHHeMAAcPZpxj36DGHi2j
	 51v4vzLh3P6rr9FfcV99naJqKHZT9Lbpou+PIhvbYNbxAgQh9Kv9ma5DJTsBS23sx+
	 vaADp7GAkZZ5+colF6WsGqG9MODZilvLoMzSEzvohP0+mLMZKZvCooNhfoLdC4oD9l
	 nvjX3FRvrR+hFC538xn1a2kYr3TJtkfqQ5xnTAbFcQLB0u46EtfAycssHy+I9kJNqq
	 jlY9Tzc0idxyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F4661095;
	Mon,  8 Dec 2025 20:20:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F05F8E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D751481A64
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezGijLZhrfmg for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280BA81934
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 280BA81934
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13A38866DB; Mon,  8 Dec 2025 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 21:17:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2bb8ea3ff11dd032a6cede3a101cfe129c7023d6
X-Git-Newrev: d7f2a7b85b17a9e933805d01c03bdfff16c5a0e8
X-Patchwork-Hint: ignore
Message-Id: <20251208202013.13A38866DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/read-edid: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7f2a7b85b17a9e933805d01c03bdfff16c5a0e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/read-edid/0004-cmake4.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/read-edid/0004-cmake4.patch b/package/read-edid/0004-cmake4.patch
new file mode 100644
index 0000000000..4530a9d3b9
--- /dev/null
+++ b/package/read-edid/0004-cmake4.patch
@@ -0,0 +1,17 @@
+Fix build with newer CMake versions
+
+Downloaded from
+https://gitlab.com/liguros/liguros-repo/-/blob/develop/x11-misc/read-edid/files/read-edid-3.0.2-cmake4.patch
+
+Upstream: sent to pyrophobicman@gmail.com
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/CMakeLists.txt	2014-02-05 17:27:26.000000000 +0100
++++ b/CMakeLists.txt	2025-08-27 23:01:08.868613931 +0200
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.10)
+ project (read-edid C)
+ 
+ option(I2CBUILD "Build I2C get-edid implementation" ON)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
