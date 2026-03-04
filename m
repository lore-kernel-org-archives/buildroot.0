Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A0EFCE49
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10018408CA;
	Wed,  4 Mar 2026 21:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4wfHwzM3mFq; Wed,  4 Mar 2026 21:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A514091D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660466;
	bh=7zJtqcjIp7Kmwvw0qmuymQm7iSoHvguD+SjVS3w9WXk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hv0LFryLgOlIXEU1HNJwz/kk2tgxXLxMS+R7vvfauwjEe33Yerwr+MGI5dIk8NzNc
	 RK7Rmmsi09UwXIJWoRME3VUmf7JgnxRfP8FNWtWJiij5b8568O/UGr0R3hCC8Xsi+R
	 fB5vqeqMN8yVh/mDBIKhGlQ+4NBw63crYIqHovosNpZ3Xhfdxb8DZN+vGjkLBooIX6
	 UVC9E2gOeCFfUdlcXWvnZhDy2vsgS4MfVQyJC7Nue51crqGmk2luUUIACmwlgMjDWl
	 6ZrhcBAq5meTpjNJmWkGtgFUb8WPgTiwE/dG3iE0QlRPbmgKdEZinJTHpjaoNDPl2X
	 j9xETW+d9S88g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30A514091D;
	Wed,  4 Mar 2026 21:41:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 662EB25B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57D4E608E9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77vcVyGj75Yx for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 818BD608D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 818BD608D7
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:41:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A3648623B; Wed,  4 Mar 2026 21:41:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:34:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c3aa5f977a8748f363e64b1225cccfcc848629e
X-Git-Newrev: d225a6ffad8d1b1a40976f9c49a04d5db33e0c47
X-Patchwork-Hint: ignore
Message-Id: <20260304214104.7A3648623B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: security bump version to
 1.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d225a6ffad8d1b1a40976f9c49a04d5db33e0c47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://blog.clamav.net/2026/03/clamav-152-and-144-security-patch.html

Fixes CVE-2026-20031: https://www.cve.org/CVERecord?id=CVE-2026-20031

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 807c8fc2ea..db50d77194 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  64fe4a16a5622c1d71efe9ed7f2c2fbd37f8f237da9f11ff66b73038df71db91  clamav-1.5.1.tar.gz
+sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index bda714ea65..7f8008ab5f 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.1
+CLAMAV_VERSION = 1.5.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
