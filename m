Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A23BC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71F9406FA;
	Sun,  4 Jan 2026 13:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzG6B4jtkq5J; Sun,  4 Jan 2026 13:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D508406DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532010;
	bh=I5aeNwzdV3kaMUtKg2m9ZkSJ8TMpMjAbZVNuJhadZKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FvVLE/pyRC7l+thapiuOM3KiTguBJgO9MwXH/rFcsmqY4Tuyb6emvTQswALzpJiC8
	 y66z4V6WhOmizdVWpSsYnptToJNlVRFm5GU6ABAEabL6SENe/0PDOSFW2XBQFYLE1v
	 hl4byDsMWL5SHRnTMm02MeIEjUXfh5XMNwVKU+k2h+sa7kISDNY95oVqeJMJ64BH3h
	 jIAlSYGNstaZ6WhkrSyPKAeKVxAOZsdxzRZbu3ykvJfsRnaI3N2jJKkaCkn1cJoeiw
	 bKZbW3ZQ5jVu/eISzv45mvk1tsRb/XEUIc+G03fhANb4CcQpVP40xPtYcGM2vU9/xh
	 vFRJt9s+RLVMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D508406DA;
	Sun,  4 Jan 2026 13:06:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E92D249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F8A240391
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLBUnK6EkBmR for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B458404AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B458404AC
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99E7A88245; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0034ff96531b8993ed591323e37d0c1dec4de48
X-Git-Newrev: 65fcceed89baf36a0ed9290aeb1f94bf94e5c921
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.99E7A88245@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-dbd-mysql: update dependency
 comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=65fcceed89baf36a0ed9290aeb1f94bf94e5c921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
drop virtual package"), we no longer have mysql as a virtual package,
and therefore perl-dbd-mysql directly selects mariadb. As part of
that, the comments related to the dependencies have not been updated
accordingly. Fix that up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl-dbd-mysql/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index eff76f5b61..b430e44027 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PERL_DBD_MYSQL
 	bool "perl-dbd-mysql"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_INSTALL_LIBSTDCPP # mysql
-	depends on BR2_USE_MMU # mysql
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on BR2_INSTALL_LIBSTDCPP # mariadb
+	depends on BR2_USE_MMU # mariadb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
 	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
