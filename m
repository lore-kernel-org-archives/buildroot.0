Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39975D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F15183FED;
	Tue, 13 Jan 2026 19:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZGaxjoM--kz; Tue, 13 Jan 2026 19:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0804283FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333314;
	bh=6X6w8aC/Prfqbti3UivAH5GeQN/J0GRVqwV5VsgugOg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fuVyWS0t8n8/4dXRdA57VXrzsBYuZ9lwVLUs77iRstMEXl+Yfof2HMBs83b02yINB
	 /SemQz4Hsyvng70GJqMGTKf0KgsVsGpzDxuLu0DiDyrkCsvboDdv+yyP5xAzGPiFh2
	 29CWh/wR0GTPRg2Xo4Tw+zznbhgR2+B6CaKRZcMr9Rl2nU/bE+BN3lJ2hx4DnEq4ip
	 EQKfuiPnJxo67Pp1U1FpyJAfkWwrEUa3gDQz6GJEK+jOE9yRQlNwq1Vn1M2zhD4VIe
	 pspZxHJsWh0qllFtt4B138cqQi90y4zuSrRVd+siUneMY88JqHpIwNr9uO06UlpISV
	 7eQJ6hz84NNDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0804283FAA;
	Tue, 13 Jan 2026 19:41:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F0952CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B48783026
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcnFsdlYFR9G for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CFC182F14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CFC182F14
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BB5583939; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6fad2374f039fb255cf03e3071a235630e8c6051
X-Git-Newrev: 9cfb7daaeae0b32e14d842dd7d9f8070bfaa297d
X-Patchwork-Hint: ignore
Message-Id: <20260113194035.2BB5583939@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/perl-dbd-mysql:
 update dependency comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cfb7daaeae0b32e14d842dd7d9f8070bfaa297d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
drop virtual package"), we no longer have mysql as a virtual package,
and therefore perl-dbd-mysql directly selects mariadb. As part of
that, the comments related to the dependencies have not been updated
accordingly. Fix that up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 65fcceed89baf36a0ed9290aeb1f94bf94e5c921)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
