Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E29D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F312260AF9;
	Sun,  7 Dec 2025 16:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je4wNGu4p3Ca; Sun,  7 Dec 2025 16:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 200876074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123347;
	bh=D9C+IhVQ8MxaZZ7Z7s47ZWow1re9jHVw+vz1QyJPxF0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ePtiVLSeX4qKofJXMs0Hvd3/q3uwpr+1ybiEGoTPaa3VpcfYtNNFxYgYS7JPxYG6h
	 LWiF/CT8PIxRalRvAFg8VLaq3mrPiGb55WgbMIdbAXsmrzFihHfCUXCZjwttMoj/zf
	 T4PQPLAeXUaqke+fMSQSLJn+ZIpzOVCvRxJn1dntvr+6/JAd2vlsmdon2vAHxYYX/C
	 RV7EgcyL3VsNy/p1E+4rWP4Cqtifq0hEsjP2rZJigDPTLakP52+1PsPqdH3mtFUWD6
	 YVOrBzv9XlWrnR3sak5bZP4/6SgHwgW9ZZwKCRFwsv9qR87mJt3sUjU8tbSno6Cj/N
	 5ph9iE+A3tNaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 200876074C;
	Sun,  7 Dec 2025 16:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2337CE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 095F06074C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ib7EUjDi_Cv for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C0366065C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C0366065C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C1DD86717; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:16:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cf82c2e0540511a7b40602da283eab5a3eacd220
X-Git-Newrev: cb2e7531df00a4307841794df75489102f04d654
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.0C1DD86717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bullet: fix cmake 4
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb2e7531df00a4307841794df75489102f04d654
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-update-CMake-required-version.patch       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/bullet/0001-update-CMake-required-version.patch b/package/bullet/0001-update-CMake-required-version.patch
new file mode 100644
index 0000000000..f2805c90cf
--- /dev/null
+++ b/package/bullet/0001-update-CMake-required-version.patch
@@ -0,0 +1,22 @@
+From d1a4256b3a019117f2bb6cb8c63d6367aaf512e2 Mon Sep 17 00:00:00 2001
+From: Erwin Coumans <erwincoumans@gmail.com>
+Date: Wed, 23 Apr 2025 14:17:20 -0700
+Subject: [PATCH] update CMake required version
+
+Upstream: https://github.com/bulletphysics/bullet3/commit/d1a4256b3a019117f2bb6cb8c63d6367aaf512e2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a695b71726..e7a58e6d67 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.4.3)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
+ cmake_policy(SET CMP0017 NEW)
+ #this line has to appear before 'PROJECT' in order to be able to disable incremental linking
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
