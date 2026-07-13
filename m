Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22891C44501
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FC1380F3F;
	Mon, 13 Jul 2026 11:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIHK_FOT5lAP; Mon, 13 Jul 2026 11:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C6A80E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783940413;
	bh=Vi3cD/2xqlPFNhxFEdDiXElxugaf86d9eZIuzdLuE58=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B/A2z10pFnBcZppPUWUvU0XupzUvOyNZ60NtHeWzk2mkhOsD+8rTv+vJ3oZ2WqejJ
	 +nMVpftIYFiNOXM+kzeqToz+zH8lXOOcAWrOHTmWikjFdMqGE/P1CMQFriH6l20rC4
	 l2TQJgUUwkL8JeaVR8QNIWQHvzrl65rgRhFrusVYdcic/+mPoxKx6Z22oNbkTwTi/a
	 VqipT/ClzUZB+sLKnXzpZTBv9mi0lUQRjoIeBzxzXFYvdqJ21SU1FjFvqPSvPzsRtw
	 sT4LVi08FX+wEoEPJSlaI6SE/Yf64UWqNasG9lYW4SZuxu2RGlSN6n245rnxUQhOtN
	 oj75XLV0jWkMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C6A80E75;
	Mon, 13 Jul 2026 11:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D771628D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD7234008D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvrpC3eZ0J56 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 11:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1704F40076
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1704F40076
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3582887BA; Mon, 13 Jul 2026 10:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 12:34:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6e304f3835b6989c828c13c83c9b03b68b82dab
X-Git-Newrev: 526f8b43edb7ac1dbf9b86afc183a95b389a7bab
X-Patchwork-Hint: ignore
Message-Id: <20260713105936.C3582887BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/526f8b43edb7ac1dbf9b86afc183a95b389a7bab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/latest/release/4.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/Config.in.host | 5 +++++
 package/cmake/cmake.hash     | 4 ++--
 package/cmake/cmake.mk       | 4 ++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 0d96ee2233..b8221a7d22 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -79,10 +79,15 @@ config BR2_HOST_CMAKE_AT_LEAST_4_3
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_4_2
 
+config BR2_HOST_CMAKE_AT_LEAST_4_4
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.4"	if BR2_HOST_CMAKE_AT_LEAST_4_4
 	default "4.3"	if BR2_HOST_CMAKE_AT_LEAST_4_3
 	default "4.2"	if BR2_HOST_CMAKE_AT_LEAST_4_2
 	default "4.1"	if BR2_HOST_CMAKE_AT_LEAST_4_1
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 8b6572c558..8a2942493d 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.4-SHA-256.txt
-sha256  fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda  cmake-4.3.4.tar.gz
+# From https://cmake.org/files/v4.4/cmake-4.4.0-SHA-256.txt
+sha256  65757f442fdd242e27f1728fc26dc0cba4164f7a0791a5c788631c00080369bc  cmake-4.4.0.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1422f80a70..007a1efa0b 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
+CMAKE_VERSION_MAJOR = 4.4
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
