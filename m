Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74A6C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FBB812FD;
	Fri, 14 Aug 2026 13:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e36KKPwcqnzV; Fri, 14 Aug 2026 13:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E0E813CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713701;
	bh=jtfeAB6p/amw1rXua5HMHCPlfh2UA6w29heqK5vWpAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cFYGh6uV0qSBbYgle08o2MuKcAR3e4rB4GHWuUuqmvQkEk7MEPgpIPF0FpEEzMFvJ
	 3iut8jRrqyOP91IWFk9lb2ugpaq51ytDYXjk1l6xVlHQiGdLxeBOt24dD/ymZzvxGX
	 d5zM8CmwhOjEBTVQJWjpmjMyLv/WthhBA/lAqy2P66wAM5+AsIPXRxMGwAt+vcXPry
	 xTsK+DlvgC6OTiIsU04b92QfaMgG160donnD2Sv8qfnooMzqYjhmBRqL8WPU3U9mYR
	 bziUJJaKyblb1wD8T4bdhupUGOVb1AYWVdb2vaG454kaDrqay9jiEQQCWxTLZsmIOl
	 Ib9WCbj3l3atA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E0E813CB;
	Fri, 14 Aug 2026 13:21:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5820123F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 365708123C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4QlIb_UgOMH for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3A180E3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3A180E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E8C48D66C; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d2bdd24d249a9911f6474760ef00b748482ffbc5
X-Git-Newrev: 032b8416a424d670d79f26a8f66d80a9fae3484c
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.7E8C48D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/botan: cleanup
 boost dependencies
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/032b8416a424d670d79f26a8f66d80a9fae3484c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

- botan dropped the usage of Boost.Filesystem in 2.10.0 [0]
- botan never actively searched for Boost.System, as it is header-only
  the dependecy can be dropped too

The only part of boost botan currently uses is asio. So use --with-boost option
when boost is selected.

[0] https://github.com/randombit/botan/commit/aff8cc8a7a5e22e3fedeae7ca82b63d4744ac82c

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8ff577bb35d7f15a924298ae56cb46f694a22ef1)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
