Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670CDC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 247986069B;
	Sat,  8 Aug 2026 15:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwX7tirdL50M; Sat,  8 Aug 2026 15:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A485D605EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786204518;
	bh=5CZW+YgWx8jPdbyYSI1L1tfYMS0Nob3DniZs6orJHeg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eFI4uIUCxsuvT9bZ8AUAWr/Zhvkjo5Tm79nTwYMK4oh7aVRavo8j3RZTcISmh+OHD
	 vnUJrjZQHyGLEuzSCPNFhN95X1Uyj3/U/ckZbGLdU2whnpidBTJPUM/ckqRQeS0VZg
	 eUt3IbsbCAhScwbjFuWj/Tx3/wBiW8rxM6+VoL8Qw9x2ILgcdWfCM16MY0TDggc3UW
	 m3wSYHkPMn4xWkaUnY9BwMgDzh7sU063SL1bV5tszQ/bEYUJ0iBfQkmLbskve2i6ig
	 1PNWTtw/9a97e/LJ7f3dsq9gp3Oz041+YF/qbNO1SeziYEeEYbffUsvdioM1CU6wOH
	 xWah6FZzooQBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A485D605EE;
	Sat,  8 Aug 2026 15:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18DA92F5
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF07C400D3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpydd90piTv1 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47A2940142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47A2940142
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 246898CA4E; Sat,  8 Aug 2026 15:54:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 17:16:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b94d3eb728546aeb196941472b98922843e36279
X-Git-Newrev: 8ff577bb35d7f15a924298ae56cb46f694a22ef1
X-Patchwork-Hint: ignore
Message-Id: <20260808155429.246898CA4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: cleanup boost dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ff577bb35d7f15a924298ae56cb46f694a22ef1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- botan dropped the usage of Boost.Filesystem in 2.10.0 [0]
- botan never actively searched for Boost.System, as it is header-only
  the dependecy can be dropped too

The only part of boost botan currently uses is asio. So use --with-boost option
when boost is selected.

[0] https://github.com/randombit/botan/commit/aff8cc8a7a5e22e3fedeae7ca82b63d4744ac82c

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/botan/Config.in | 2 --
 package/botan/botan.mk  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 305cc2fe8c..6ac6341f71 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -17,8 +17,6 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
 	  Botan is a crypto library for C++
 
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 38948f0184..115cce6765 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -61,7 +61,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
 endif
 
-ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
+ifeq ($(BR2_PACKAGE_BOOST),y)
 BOTAN_DEPENDENCIES += boost
 BOTAN_CONF_OPTS += --with-boost
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
