Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148EEC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5097812BA;
	Fri, 14 Aug 2026 13:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKgo3Rh8UQKk; Fri, 14 Aug 2026 13:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B3FF812C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713602;
	bh=oAc3XB5G3mHV7K8f60/ZfAblq1iTbg019h5PoEPSzCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PHShHpuCMUKI5N5kbYivc5Rd6xUdMBxi2kItuI/rAmz0K6eWLJjO99HliclxXDy3+
	 mJAZkisanTXUNxpCCtuVEepwdycKmgpSpGMIPbjWTg3hMwLEjvXZD+WnBI2z7tR/uM
	 IqW/6rt/YxC/8WaP3LQIssCcqAGEI8pbKP3DlngGDUxybSUQlwPOODL9PQO6mEuRs6
	 DcrYLOWc9+/QOg4k1qIdq2arzPjPmxac1qzKDiNU5T17ROMJb0BiQSOcNT1h5DSASK
	 Oe3hDW3kKYK7HH67VLKxIw+jo2BF1EJq5MiPHp+kFT9wjtyCJvYQ+GA4j2e0UFjVuX
	 QQM4GCNa2/xEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B3FF812C9;
	Fri, 14 Aug 2026 13:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 426B5139C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2908380E3E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDJmWa2-zqlr for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF6180E61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AF6180E61
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F66B8D667; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0565093a1a9ec25a9cc1e0b37f41046a9086c96e
X-Git-Newrev: 1665cca3d7ecd4008410fb83130ec79ec0e43077
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.2F66B8D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/botan: cleanup
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1665cca3d7ecd4008410fb83130ec79ec0e43077
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
