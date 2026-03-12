Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456A9106ACE4
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 006CE407D9;
	Thu, 12 Mar 2026 20:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJdtldxIZO3o; Thu, 12 Mar 2026 20:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F0B407DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773346260;
	bh=g1aRZGG/UuLt5R62JIYyHk0HrI4MgCA8b7o9eO5dGvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Go9ShltIWjc0io5PyJ1jw1H7NzRHsrGbBnhRrP8/gXI1EUuG3Jd5XgZUwdKcnC1oI
	 vKgzwLY8DPjVa+923KXzEKe8K3sDAvrVITx019CzmejvHR7VuhSl+NPSEVXAgYh1b4
	 wSRACPpx/6VkbKK/UI9rENZmO8x1UlR6AWqq09DTqG+mA0M5qjnW7xpRqUbm06RIKM
	 xWvLXjq1p8dxrVKUHsmG/w1Ql2DgdtUagMwWBlkmQYwBXzWRXd3PhHFP4WUu2OVPc9
	 EaPIi9C+gpG8byUXOFN4phnEz3QYHgxrMyib3iF/0ylXb3ihwZr8exxcgdsvr7Pih+
	 kw+IGZyM9GcIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F0B407DF;
	Thu, 12 Mar 2026 20:11:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADE7D201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F8D0606EF
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz0qbunPiQhE for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDB6E606E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB6E606E8
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:10:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E100883999; Thu, 12 Mar 2026 20:10:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 21:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a5e071e4f9f8477b43b27ca43a596e74c11b4e6
X-Git-Newrev: d950ff24888ed48cab96582b9389bda7e0bff6e5
X-Patchwork-Hint: ignore
Message-Id: <20260312201057.E100883999@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump version
 to 3.8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d950ff24888ed48cab96582b9389bda7e0bff6e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libarchive/libarchive/releases/tag/v3.8.6
"Libarchive 3.8.6 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index db7ed95bd9..be357183e2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
-sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
+sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f3e90e5910..3b8fdbae1e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.5
+LIBARCHIVE_VERSION = 3.8.6
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
