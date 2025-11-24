Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9ACD4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19325816D9;
	Fri, 12 Dec 2025 07:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGHOD6v9RfSD; Fri, 12 Dec 2025 07:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37ABF83843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526184;
	bh=wGt0pyttKAF1tKxBV6598sJCcvEaTcr3xPJBDNJUfb8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/BnWkxd8koNDz1oL5beTKpdI56vQmTHoVlEa11fi3Ellu1a9i/l2JLJyPc+o8+HU
	 kycWAxQVAwAB0hMFTIvho377T84PqVPJJyE4NsQVcJyoDDwYJP2+B4l+ehOekFFBmG
	 dG5MZaG0q2LMZHeEOJz3SOgJchBw0uyz4sk8CjTcZLeNR7y12xZZRtmOUW88oxpENt
	 aIQzmlNTqet0bki+osRT1wcYi1cTK0GRyIrHt07PXpzcQ7ZCh1Af4yjRJpLmMxnyqZ
	 oT1Ac1UUXpjFnmXLeqNSbmrlyx0T8GTEbwQ3zmam+X6YmuRC9U8ahFP0TpuBKSFFXZ
	 A6bpT7mPzZH+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37ABF83843;
	Fri, 12 Dec 2025 07:56:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 111082C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 197324117A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4WDUjfATrdY for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACAEC41113
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACAEC41113
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB0F98076A; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 22:06:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84d9c08dbeb68dcca8a33e62f399a2740d90a1ff
X-Git-Newrev: e46695bbe4ab583f39f9448f3ef3e044efa28808
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.AB0F98076A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e46695bbe4ab583f39f9448f3ef3e044efa28808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://cmake.org/cmake/help/latest/release/4.2.html
https://cmake.org/cmake/help/latest/release/4.1.html

License file was renamed upstream
https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d51510013565e
and updated:
https://gitlab.kitware.com/cmake/cmake/-/commits/v4.0.3/LICENSE.rst?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/Config.in.host | 15 +++++++++++++++
 package/cmake/cmake.hash     |  6 +++---
 package/cmake/cmake.mk       |  6 +++---
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b30ce03a1c..86f93b0ac8 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -63,10 +63,25 @@ config BR2_HOST_CMAKE_AT_LEAST_3_31
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_30
 
+config BR2_HOST_CMAKE_AT_LEAST_4_0
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_31
+
+config BR2_HOST_CMAKE_AT_LEAST_4_1
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_0
+
+config BR2_HOST_CMAKE_AT_LEAST_4_2
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_1
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.2"	if BR2_HOST_CMAKE_AT_LEAST_4_2
+	default "4.1"	if BR2_HOST_CMAKE_AT_LEAST_4_1
+	default "4.0"	if BR2_HOST_CMAKE_AT_LEAST_4_0
 	default "3.31"	if BR2_HOST_CMAKE_AT_LEAST_3_31
 	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
 	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index cbca2fc355..2bc7b740d2 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.9-SHA-256.txt
-sha256  5d4fdec04247ca8a8e8f63692f0d0f1e9d6d082a2bdd008dff8ab3ba7215aa83  cmake-3.31.9.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.0-SHA-256.txt
+sha256  4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579  cmake-4.2.0.tar.gz
 
 # Locally calculated
-sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
+sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 8f3a54be5a..66b169440c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
+CMAKE_VERSION_MAJOR = 4.2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
-CMAKE_LICENSE_FILES = Copyright.txt
+CMAKE_LICENSE_FILES = LICENSE.rst
 CMAKE_CPE_ID_VALID = YES
 # Tool download MITM attack warning if using npm package to install cmake
 CMAKE_IGNORE_CVES = CVE-2016-10642
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
