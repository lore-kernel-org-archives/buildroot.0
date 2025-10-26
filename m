Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E239CCD193
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 11:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AECF40F7B;
	Sun, 26 Oct 2025 11:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dt3cbj1NA0ba; Sun, 26 Oct 2025 11:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AA040F72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42AA040F72;
	Sun, 26 Oct 2025 11:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80693D7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD2880BA8
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUeo5ku1650Y for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 11:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2075380BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2075380BA7
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2075380BA7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:44:25 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCzAb-00FOtu-TX; Sun, 26 Oct 2025 12:44:22 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 7dc155b6;
 Sun, 26 Oct 2025 11:44:20 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 26 Oct 2025 13:44:17 +0200
Message-ID: <20251026114420.3409017-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NsFYv9ogrkt7iQIY/FRwlmfWdhIsXmP9w5uR0rppgRw=; b=Re4ZJ/OZOR/ycvQyJbjz6imeVc
 4nVjgA09S7dev/lhg0WCCPFooiPgenbAgGcnMRrN2C56XIkDjb9y1TzJcsE7j2MZ2npD1k0mnc/6n
 17O2eUEx9cJYDfFdAbsUCBwYoSOlXsNBCrXlNkBgIRB1/Wxkxz0es6h7Gpxo3KBKUE3F5aisKBlO6
 mQA7dZvsf5GP6yzDZdqN6r1QDcSnAWLSVhwWbNDz/n+f6Qnvd7ItMJfw0hVYZKlUQO0wqvGxG3kib
 0EtzvWfJH7BZPP9m/hSjqplVZ3i4DiGBIOlz2qwSYvaTp0Qj73aCVnhQbHQyhHMAstdjZtqN+Setf
 XwuM2uiw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Re4ZJ/OZ
Subject: [Buildroot] [PATCH] package/woff2: fix cmake 4 compatibility
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch fixing cmake 4 compatibility.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../0002-Fix-the-build-with-CMake-4.patch     | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/woff2/0002-Fix-the-build-with-CMake-4.patch

diff --git a/package/woff2/0002-Fix-the-build-with-CMake-4.patch b/package/woff2/0002-Fix-the-build-with-CMake-4.patch
new file mode 100644
index 00000000000..c516c67ef4a
--- /dev/null
+++ b/package/woff2/0002-Fix-the-build-with-CMake-4.patch
@@ -0,0 +1,37 @@
+From ee31ca0647decc493e992eaa3dc5be9d9e1bc871 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sat, 25 Oct 2025 22:19:21 +0300
+Subject: [PATCH] Fix the build with CMake 4
+
+Require CMake 3.5, which is the latest version that CMake 4 is
+backwards-compatible with. The CMake build system does not need
+any change otherwise.
+
+Fixes #183
+
+Upstream: https://github.com/google/woff2/pull/187
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+---
+ CMakeLists.txt | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ecfbb83..6525747 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,11 +3,7 @@
+ # Distributed under MIT license.
+ # See file LICENSE for detail or copy at https://opensource.org/licenses/MIT
+ 
+-# Ubuntu 12.04 LTS has CMake 2.8.7, and is an important target since
+-# several CI services, such as Travis and Drone, use it.  Solaris 11
+-# has 2.8.6, and it's not difficult to support if you already have to
+-# support 2.8.7.
+-cmake_minimum_required(VERSION 2.8.6)
++cmake_minimum_required(VERSION 3.5.0)
+ 
+ project(woff2)
+ 
+-- 
+2.51.1
+
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
