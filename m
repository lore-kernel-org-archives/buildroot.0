Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CFAFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 19:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E4E84E46;
	Sun, 26 Apr 2026 19:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NLl8GXhN5BW; Sun, 26 Apr 2026 19:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFB3084E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777230841;
	bh=C1wjCiUSBGxgh35Cq8b7RsvNczoETfcsOmK3EPvUqaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cjQPwYzLr1ivp2gnvgGflmjKwma3bI+f4hxUR3+nx2svpz6xmvfRkYLZiHF2Lrunz
	 ZrZJSvvMi28DDMIUYPeVDeLnG4hxPTGeyBARddfgoVaJXRU3vSK6Z911aAbY5cI5/6
	 cZpYE74O6qzXzxzlMqVE24Dx94lz+uhFULRkvOBXdn8+VY7fVJ0UyZynBWofpsvg//
	 7r7Qqvmjz0UahbeYXHU6h6tFnLYnSPjCCk5p3LqCwiaum6RP1shyEY6iO+CsHGyHKl
	 BvBQBKpgQlSxxlWlnf2sPBb0nQ+X5xjNZSUqHwnh3YIGPUauEt4X/9EKTnkXvEvBHI
	 9BERe38CsVtZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB3084E2A;
	Sun, 26 Apr 2026 19:14:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C8D231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 173C760830
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BX2beRWHnIsC for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903F9617A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 903F9617A1
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51612836F3; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 20:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c41092cc9851b689f803114e88ee5d0f1c39af58
X-Git-Newrev: 838c36679049b778a7b2188dcf4a9aee286c83da
X-Patchwork-Hint: ignore
Message-Id: <20260426191354.51612836F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: bump to version 1.6.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/838c36679049b778a7b2188dcf4a9aee286c83da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://dev.gnupg.org/T7174
https://github.com/gpg/libksba/blob/libksba-1.6.8/NEWS

Updated license hash due to upstream commit
https://github.com/gpg/libksba/commit/39aa8435819df6a97fc751f5e5e45178f033c2ef

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libksba/libksba.hash | 6 +++---
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index aca159d972..b7e1e2f9f5 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,9 +1,9 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  781acfb012cbb5328f41efcf82f723524e8d0128  libksba-1.6.7.tar.bz2
-sha256  cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763  libksba-1.6.7.tar.bz2
+sha1  ff1705f512ab18323571e009d8ead407f7d0279f  libksba-1.6.8.tar.bz2
+sha256  0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5  libksba-1.6.8.tar.bz2
 
 # Hash for license files:
-sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
+sha256  078dca2d4a2a5d19788b18dc05e039f7a63cb789f6f0b6f9e3fbe6284e6968bd  AUTHORS
 sha256  6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING.GPLv3
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index dc22d60113..f43693872e 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.7
+LIBKSBA_VERSION = 1.6.8
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
