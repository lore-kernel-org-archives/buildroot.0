Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E160EEF5852
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993E560851;
	Sat, 14 Feb 2026 20:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IfF-clElq4a; Sat, 14 Feb 2026 20:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D131B6101C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771101044;
	bh=zFo9SgCrDFlBikJr8BDjeWXAzhbhiJws7VA2qw1VcQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JNAFDB6xSnWwkTlc6bwlrRg+J+GBbBI2R6XQiAF6IJleposkW11dSXeYWeCdme+8p
	 eCZ8PYakVRHMxF9E/QdoMCkKpHAQTzBIlLlT9+vc1g1dwb4ChFxYY524OjrF+vytSm
	 +Ub0oZw0tyj6U1BuixVuiGV+6ACNp/rp7yN6ZnwvseFPw8p2jfB9UZVbYN2bkZCuxe
	 zpdlQQfunRKVjcFPMjJ4MrHmyIhnotIoJgrtdryo8kWs5uyp1Yd4F5+oPQ6atOs2co
	 NWF63Q4ngtA244M9s6SXE7+kaOAqDfxJwMoni77g+JNNfZ8jz0kFP0Ql1saV7rVqEz
	 uWw9xrQMH4pdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D131B6101C;
	Sat, 14 Feb 2026 20:30:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B60669
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2097840A78
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKBWYgfLAMXE for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED9C40A74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED9C40A74
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B80286D78; Sat, 14 Feb 2026 20:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 21:27:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb0b183aba99c15872aeebef272013ad9d4da52b
X-Git-Newrev: 0b53bd87d3421d13e5b1055133c64e074d45792a
X-Patchwork-Hint: ignore
Message-Id: <20260214203042.6B80286D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplist: bump version to 2.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b53bd87d3421d13e5b1055133c64e074d45792a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libimobiledevice/libplist/blob/2.7.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libplist/libplist.hash | 2 +-
 package/libplist/libplist.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 9bc79bf3f0..ecc8984716 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3f5868ae15b117320c1ff5e71be53d29469d4696c4085f89db1975705781a7cd  libplist-2.4.0.tar.bz2
+sha256  7ac42301e896b1ebe3c654634780c82baa7cb70df8554e683ff89f7c2643eb8b  libplist-2.7.0.tar.bz2
 sha256  7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 0b8a69455b..2c7edd38ef 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 2.4.0
+LIBPLIST_VERSION = 2.7.0
 LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
 LIBPLIST_SITE = https://github.com/libimobiledevice/libplist/releases/download/$(LIBPLIST_VERSION)
 LIBPLIST_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
