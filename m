Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BCEC77B71
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 13:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 246F160D80;
	Tue, 25 Apr 2023 13:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246F160D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhX_zZfbfH_B; Tue, 25 Apr 2023 13:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED46F60AE2;
	Tue, 25 Apr 2023 13:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED46F60AE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00FEA1BF836
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 13:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9C4C60AE2
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 13:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C4C60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doyEzLnZliqU for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 13:34:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC3E60AD4
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EC3E60AD4
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 13:34:16 +0000 (UTC)
Date: Tue, 25 Apr 2023 13:34:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <Tm7UB83oi2aPJoQgoeiYTQrMJLPO4yjcBMbKqUPLlebN4FU9m2kt2n7NpycuWBjEDKrXzTL0AngujcH42EmoZLtIdZ8PxVtmUE1fYjH3jJU=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1682429652; x=1682688852;
 bh=7jwHiB3bf5Q4ctv0JOa3bqmApfhrBKV7UJo72tFeVPc=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=fi41tHfX11Hb6k87a8gX/BAPvdU83vHaVmid3j42G/mommdkuRfDj4G3ta5SpZlTg
 ooP3v1XnGw8pGOybk1Rq33iib7HNPBZi0cMN4QwZn1NeZ09RaUlz5oP63Z3JOFydtR
 XPE+tQc2eyQcYywtZedB8v4dduiMord3pigqeTisJ9xyF4zhiWja4/q4hB94FWkK9X
 eZ+G7oKimq/TTjK1CpW8UMJKwEC+sA9OCXHL8ql8u+sI+u/cXQwTz7LJMQBkIKrOT8
 yCYlvb+3CD652jB/nUoYJDgFy+MmwDUEK8+Iryt0i5SNuG8I9mawvKxJlIf1e/Eh9p
 fY0JOZcxlaCPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=fi41tHfX
Subject: [Buildroot] package/gloox: bump version to 1.0.27
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 ...src-connectiontcpserver-cpp-fix-musl.patch | 25 -------------------
 package/gloox/gloox.hash                      |  2 +-
 package/gloox/gloox.mk                        |  2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch

diff --git a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch b/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
deleted file mode 100644
index 56a2d4982c..0000000000
--- a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-src/connectiontcpserver.cpp: fix musl build
-
-Build on musl fails on:
-
-connectiontcpserver.cpp:131:13: error: 'strerror' was not declared in this scope
-           + strerror( err ) + " (errno: " + util::int2string( err ) + ")";
-             ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a61a91bb6e1156eff5fb756f9dccfc2bb6c0f277
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.camaya.net/ticket/?id=291]
-
-diff -Nuar gloox-1.0.23-orig/src/connectiontcpserver.cpp gloox-1.0.23/src/connectiontcpserver.cpp
---- gloox-1.0.23-orig/src/connectiontcpserver.cpp	2020-06-05 23:22:59.624018949 +0200
-+++ gloox-1.0.23/src/connectiontcpserver.cpp	2020-06-05 23:26:20.708027221 +0200
-@@ -36,6 +36,7 @@
- # include <resolv.h>
- # include <netdb.h>
- # include <arpa/inet.h>
-+# include <string.h>
- # include <sys/socket.h>
- # include <sys/un.h>
- # include <sys/select.h>
diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
index 6419db90f8..66a3c2d1be 100644
--- a/package/gloox/gloox.hash
+++ b/package/gloox/gloox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae1462be2a2eb8fe5cd054825143617c53c2c9c7195606cb5a5ba68c0f68f9c9  gloox-1.0.24.tar.bz2
+sha256  0b8b7371439bc58d9e51384b616c964b18b7b41b87af1b7855104380eda86ffb  gloox-1.0.27.tar.bz2
 sha256  40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE
diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
index b741d5ebc1..3495db96f0 100644
--- a/package/gloox/gloox.mk
+++ b/package/gloox/gloox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOOX_VERSION = 1.0.24
+GLOOX_VERSION = 1.0.27
 GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
 GLOOX_SITE = https://camaya.net/download
 GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
