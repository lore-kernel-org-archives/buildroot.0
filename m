Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0570D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7671460B55;
	Sun, 14 Dec 2025 17:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58DOmV7nXefX; Sun, 14 Dec 2025 17:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96D3060DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734273;
	bh=ErUPQBnjC2qghYCwBiPY0TzmJ4cjzV+2940FgzeImkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=shB/1vzEXkq5ApCNjJ7eTOMsd51gXseO+h3FCo+OV9JGjtR7Ss7G+ekOxYbUMRzIO
	 UU58U5v1CksW46Ip6/9pvzaTKohltHGksErYnQ+udsogoLkhfRjQWlZLM6wtDP6PAC
	 H3QW+BX0tCDtaA8IvgMjSDGGp6Kg0/tDKEFywvQeKRMzOsgZkfUP1ZSxnAffql2hki
	 SXyqf75cvtAwAjAol1f6gW4rBtViNvuCJkST1kP3ECGuETk8b7lAk0Y4l4REACfGyl
	 zvExUZ56cqHLY7aRAvUL+SDes5+lS9QslQGX26SpxIfatoEE5s6bPFkkfKiUieO2B2
	 ZC0H9TWQ5EQ8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D3060DAA;
	Sun, 14 Dec 2025 17:44:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C85D32D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADE9D807A2
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOj3x_L7-axn for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B04807E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5B04807E1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D779B86E90; Sun, 14 Dec 2025 17:44:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:30:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3600d2fd4a45862eba0493a8637987b3655334a3
X-Git-Newrev: 3b62f17f327ddacaca9ba134c4a9c1570bd869b6
X-Patchwork-Hint: ignore
Message-Id: <20251214174428.D779B86E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: bump to version
 0.9.15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b62f17f327ddacaca9ba134c4a9c1570bd869b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For more details on the version bump, see the release notes:
  - https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.15

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch | 2 +-
 package/libvncserver/libvncserver.hash                           | 2 +-
 package/libvncserver/libvncserver.mk                             | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
index 48921175fa..40236d614d 100644
--- a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
+++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
@@ -22,6 +22,6 @@ index 205f3928..9b8118c8 100644
 -cmake_minimum_required(VERSION 3.4)
 +cmake_minimum_required(VERSION 3.5)
  
- project(LibVNCServer VERSION 0.9.14 LANGUAGES C)
+ set(PROJECT_LANGUAGES C)
 
  
diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 225c42e46a..127a163fe2 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  83104e4f7e28b02f8bf6b010d69b626fae591f887e949816305daebae527c9a5  LibVNCServer-0.9.14.tar.gz
+sha256  62352c7795e231dfce044beb96156065a05a05c974e5de9e023d688d8ff675d7  libvncserver-0.9.15.tar.gz
 sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 082f838f12..c6cbc834f6 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.14
-LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
-LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
+LIBVNCSERVER_VERSION = 0.9.15
+LIBVNCSERVER_SITE = $(call github,LibVNC,libvncserver,LibVNCServer-$(LIBVNCSERVER_VERSION))
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
