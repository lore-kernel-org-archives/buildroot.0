Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA5E6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3788F60DA3;
	Sun,  1 Feb 2026 20:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4ADm0aP1DWm; Sun,  1 Feb 2026 20:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34F2060E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978463;
	bh=VksK6esGVGV04UWTdFE4X9TCqeapNq3G4nn3d5EYxQ8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cevKyLMJz0NguQUB3W5+620woiiLU6jng45yejBMO241SDJBwZvvIoSOoNHiy0Fra
	 koPewwPHip9EyrN455qCHg2oaV3d2Ccp8oXpGPZQAfgK4Bk5VnO90SvPvPpxlhMb6V
	 pcXGjo3XyMlWN/yfCg6t2VDM+IfoTQ2L7FiyQ6G87WN1zSJGGRUCckGRKve0jP5VQt
	 OmRb2hJh0K8tDHk8iZx8h5vApV5+LcS6E16rPsMR7jrMKus70yjx2wpgoZwwEeQGCZ
	 wEvQ4rJ3P7CIbMk9Xh5DERQ8hWXar7gdq7YD1L5KcgOd9eVCpjlsHdhLaLKzRYX60W
	 LJHS+jmzwTjYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34F2060E10;
	Sun,  1 Feb 2026 20:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EE611E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22AA74010B
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCjcd7K-71Xm for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F3D84010C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3D84010C
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89E4E86170; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:28:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91523ae39c9798e04162e25721826cc691d11cda
X-Git-Newrev: b3689f70f9ec9e5b14e7c26c6d81efdf24e5bbef
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.89E4E86170@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.2.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3689f70f9ec9e5b14e7c26c6d81efdf24e5bbef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://cmake.org/cmake/help/latest/release/4.2.html#id21

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 32c334c928..88744ac703 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.2-SHA-256.txt
-sha256  bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58  cmake-4.2.2.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.3-SHA-256.txt
+sha256  7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9  cmake-4.2.3.tar.gz
 
 # Locally calculated
 sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 63ddb927fc..f5d1787d19 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
