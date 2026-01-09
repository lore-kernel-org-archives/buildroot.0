Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A6D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327B682FAE;
	Tue, 13 Jan 2026 19:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_zgFH2FlnyB; Tue, 13 Jan 2026 19:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D085783D52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333050;
	bh=YJ8kSL/pD4F/1ZhU/ksqkRSTudy5bobZ14P4Lw+xfwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MV/7ENe6IVcVxiqi036qsa3lrbzi0PkKqsnc+QqL1UEwCCu1+fTaz2QA+uFanm1Rd
	 e2bloWEHsqGlz9/ON+VWCaJvr0gkUl/+n11EGJnro701Xm4QsrxlSeIcnxKg90Tssk
	 VPvlcCaAtPl8+WxITQDXPW3yoTnmw3EjGMCQbAWZRSRSEJUIhT9dyWVGN26NJM2pRc
	 lPAAkNrQNS71EXUs2YMMf8OslQ9jNz1wzI6Jviw8t3opajV7tpW9aTFb2TStUgbZLt
	 tbvIIEOv5STS2staEwyADb0/0Znfe+2d6wgb+pPaOQ6Fx5FABo+il+tVlDsC11dfxT
	 f0tqgByOyKgBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D085783D52;
	Tue, 13 Jan 2026 19:37:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4333231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A24D44054B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqTmzSGXMCUk for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 057704056E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 057704056E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01D4B86184; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5b550746bccb21592d18bba2c9e9bf8d0858bc6f
X-Git-Newrev: 997ee1124deeaa4392d950d454cdb0a68e46fcbb
X-Patchwork-Hint: ignore
Message-Id: <20260113193620.01D4B86184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/perl-dbd-mysql:
 add missing dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=997ee1124deeaa4392d950d454cdb0a68e46fcbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
drop virtual package"), we no longer have mysql as a virtual package,
and therefore perl-dbd-mysql directly selects mariadb. However,
mariadb as stricter dependencies than what the mysql virtual package
had, and this commit forgot to properly propagate those dependencies,
causing a Config.in warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=y] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=n]
  Selected by [y]:
  - BR2_PACKAGE_PERL_DBD_MYSQL [=y] && BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Fixes: 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql: drop virtual package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 64a288e33c076300bacfdf1aa3e955a7da86ad65)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/perl-dbd-mysql/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index b430e44027..cd75c9d18b 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mariadb
 	depends on BR2_USE_MMU # mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
+	depends on BR2_USE_WCHAR # mariadb
 	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
@@ -11,7 +13,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 
 	  http://dbi.perl.org/
 
-comment "perl-dbd-mysql needs a toolchain w/ dynamic library, C++, threads"
+comment "perl-dbd-mysql needs a toolchain w/ dynamic library, wchar, C++, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
