Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F6FCD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2090B60EE0;
	Fri,  5 Jun 2026 12:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byVJs8K80Ylu; Fri,  5 Jun 2026 12:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9806160EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663249;
	bh=+y07XxEymTvDkxrim83NP3CZMXIAotGOw6Y2p5Cq8aQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sws8EzkgvZoiZVlK5erGmn/WV7TL9PAnMlPvRKAjmj18qt1FxaeDBsD6GfkH1BdrZ
	 W8Hc0j70KJH68QoT5ZAgcmYib1R7YG5Kj1+HuxKr+1M28+BPvSrlLUUpNSIF9jB8Yt
	 79j6bt6P1u2LhdNGdPxvi9WFnQceWgpwqzL2G6XbvevKq3spok+P7RwCI8y7oEHvU9
	 zbDfvAA7f6MNpNKA6BqFgD7LJ4FK1fmWH/ycapSgbxD4Ig+wT+Zr/QRD7pR0yiuWlS
	 Td89DK4PCWPNVj7tldt9olwWwMRuQw6EpFs1yIQ0ow2sOGPEBtHcak3r7/6TLzJnTI
	 wyF4kdOxcxhpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9806160EDB;
	Fri,  5 Jun 2026 12:40:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA573B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 566D382012
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0cSSpH63rjw for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 276AA81F67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 276AA81F67
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5160D87B3C; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:18:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8b6eeca15889b5af98eaf5d52ea491e5fd306812
X-Git-Newrev: d2910d13224afec58fc77ef0468d6a1278f912c0
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.5160D87B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/php: propagate
 postgresql dependencies properly
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2910d13224afec58fc77ef0468d6a1278f912c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Commit 9e7172ceac1e93a7167031a50edbff813c4b4774 bumped postgresql and
had to disable postgresql on Sparc. This dependency was unfortunately
not properly propagated to BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL, causing
the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_POSTGRESQL
  Depends on [n]: BR2_USE_MMU [=y] && !BR2_sparc [=y] && BR2_USE_WCHAR [=y] && BR2_ENABLE_LOCALE [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_STATIC_LIBS [=n] && !BR2_OPTIMIZE_FAST [=n]
  Selected by [y]:
  - BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL [=y] && BR2_PACKAGE_PHP [=y] && BR2_PACKAGE_PHP_EXT_PDO [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_ENABLE_LOCALE [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_STATIC_LIBS [=n] && !BR2_OPTIMIZE_FAST [=n]

We fix this by properly propagating the dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e139c3692580e40aff8e54672bc585ed2b79a67e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/Config.ext | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 8948ff3484..c96ce5f34a 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -169,6 +169,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -180,6 +181,7 @@ config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 
 comment "PostgreSQL drivers need a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL drivers can't be built with Optimize for fast"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
