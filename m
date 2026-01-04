Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94874C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D92405AA;
	Sun,  4 Jan 2026 13:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6VQJISBmzxd; Sun,  4 Jan 2026 13:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B424405B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532005;
	bh=+GtycLtI6i1HB/Z3Rs7wceSpFP1CVaLrxMCHJDa1Yc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IlqdBBLeCEoRwz5wfBzX0GNDGYhtOcaXClNTC7QKe0BttTkZtuL0H4sap7+ecF96y
	 IFmFU4ej+U1Wt0u2q2T5a5SVVcL9yY2KGJr3QGlP3kWSIv3jb3JBhYNganxE2ISQLE
	 zdLY0rcl0bpFJ8jP1hXQaMeCtcb57s78/Z4uHoGe3OXqEy62Ff5bVWfbz94Ygp7d9T
	 36hUtMPx53asi7LKz5Nrv949dwZI9lbJOs3fHVXO1qWFgvM88oXeeeP/1FXKgsRppy
	 l4KYUj40FFl2BuoHR8oAyaWCy/m60yL99VoWIoy9FM3mJ7DwfPCf3FLznrWns9E9vK
	 noChaZD1YWtoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B424405B1;
	Sun,  4 Jan 2026 13:06:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED68249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EECA40353
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj0QBlpc1Rgq for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEEC404C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACEEC404C3
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABA2680E53; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65fcceed89baf36a0ed9290aeb1f94bf94e5c921
X-Git-Newrev: 64a288e33c076300bacfdf1aa3e955a7da86ad65
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.ABA2680E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-dbd-mysql: add missing
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=64a288e33c076300bacfdf1aa3e955a7da86ad65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
