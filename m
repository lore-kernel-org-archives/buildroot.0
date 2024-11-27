Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A51D65521
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 05:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E881F6071F;
	Wed, 27 Nov 2024 05:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Exrt_uBD8-8A; Wed, 27 Nov 2024 05:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7BB60723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7BB60723;
	Wed, 27 Nov 2024 05:11:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 151E1712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 105418559D
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWZAqWvtFEUX for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 05:11:37 +0000 (UTC)
X-Greylist: delayed 1677 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 27 Nov 2024 05:11:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F4698559E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4698559E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.74;
 helo=fallback22.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F4698559E
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 05:11:36 +0000 (UTC)
Received: from [10.113.124.220] (port=44192 helo=send275.i.mail.ru)
 by fallback22.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1tG9to-00Gxrg-Uz; Wed, 27 Nov 2024 07:43:37 +0300
Received: from [10.113.21.24] (port=38500 helo=send197.i.mail.ru)
 by exim-fallback-97cc4f9bc-d5f5t with esmtps (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (envelope-from <fido_max@inbox.ru>)
 id 1tG9td-00000000WJ4-2sWe; Wed, 27 Nov 2024 07:43:25 +0300
Received: by exim-smtp-7c956b4878-q5h9j with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tG9tN-000000003Cu-1B1H; Wed, 27 Nov 2024 07:43:09 +0300
To: buildroot@buildroot.org
Date: Wed, 27 Nov 2024 07:43:01 +0300
Message-ID: <20241127044301.16943-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9058B55010D64F7313DBDDC13D98857589AA62F8EA6F0E87C182A05F538085040DE06EA4C05BE9D453DE06ABAFEAF670596C655996A38FF8B64AA5890BDFA051F7821E8BEC7DEA809
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FBB2043146276655EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B20ACC28402695E48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A2460227610437CE680503A1EEBA11DB83681F8ABEFCBD2920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0ECC8AC47CD0EDEFF8941B15DA834481FA18204E546F3947C632EDEA9CD5989A3F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637F112198EC9313FB79FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A53C2496150CAEEC575002B1117B3ED696CA24815A57221F20C638DF663A625AFA277AA237ED671D4372AF3B35EA4094CC735DFC8FA7AC12079C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53F80095D1E77F4578A71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E8AD80843939A11AEA638A446BE3E5C627BF0CFE790FC11A7261332C5CB50AE517BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF26627E0B569FD6DE0357DC0226EF9A8E87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5DDEB5CB34464B81C419D03A3B41EC038C7DED0725569DB5EFDEEF80C4242FE15585C02E945303B3BDCC763D930D6EFA54E997C4BEEBB1C7CF7E0BBB351C5FAC8B3912F83C8E78EF146D90F64BF3396102C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojB97csLsx6RGkp1h34QdG0w==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219ED837C173A0A07868A56DE1D801AFD2DCDAA253918B1C55490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B400DCA754A51D576D59148AE78C392C6D12AD2DC78A427EBC049FFFDB7839CE9EA045B0A3CAF751E29F87AAA19A31E968F4D2BAB4BDFBEBA063AEE17BCDE0A9E742B6EA5742AE70DE
X-7FA49CB5: 0D63561A33F958A529F882526368FE9B5002B1117B3ED6966556FBD5056861BDE409568A2FDEBC0902ED4CEA229C1FA827C277FBC8AE2E8BDBFAD7C07953A467
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqG1VDEsn1tOpuf5RTkiCWD
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B400DCA754A51D576D59148AE78C392C6D45D5BC7F726DE012049FFFDB7839CE9EA045B0A3CAF751E2849337876595D80B1C79A75246EB51C9D188A772B87C704A
X-7FA49CB5: 0D63561A33F958A5988562B8ACBA1273F0CFF58B88FB8D96FE830A0073A3C863CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSr1oTRgLZVM5JzUdJfQ/bjz
X-Mailru-MI: 20000000000601000
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=HtVRqWzSxijqncYJ9TZFZr28z76gC3JTqosTm5M4+w8=; 
 t=1732684296;x=1732774296; 
 b=eUrpjjEQb2RmlcZ0/6X+oaeM5qNveArgbV+8QRo8mAszR9WGbJ0ReHJ7Bmr0LSbk1l1o2tCwJQvtCjDUP6cWYj7aPGHCNDX4kpS1bPPGsLVyJ0r4PSaIsLDirt6TwgXaHD3i1ZXz8oBzKZiazw+//5ZP7DTU13X8yd0NGiHwHxkvmiC7qdZXIeqHQjTMZe+mV4vhHiT/R4FNT+nWjPVAbPShR1w9ZusYPul53vtwJIkgOJ6QcbWx61KZrWY07YkAYKygg9GPUGyZPkkJM+kD8za7aWdS3yDw2hYT5l6/Gm7EpR0W5R+M2kdLTy6PxGCPPAUqDyOXNe9QuVIbJRgRZA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=HtVRqWzSxijqncYJ9TZFZr28z76gC3JTqosTm5M4+w8=; t=1732682604; x=1732772604; 
 b=ObwOWvd6iQanYJkoNOCxowm0NibG9fbSJcEEmAhQWKlN7xfMis4jThEpsww9FLkeELlY1/qtrIg
 KIRO++Yq9n20q5s22Y+JC7ClIZ0HDSR6Apa7IMZHEkeIpfRET7dku2nmmnSIjzYsW8Qolr752nsWl
 xYAvCb7Qqs3xZVupfzvlNKufMgozaTkqcNMj4mEKOfjzr9r2HZIsyKQQmcTjAlqrGHPPOSady4ovp
 T6P4p0rYu+mCJ+1okwp8hn8Qx843QsjSBv/iqO5mIPVTxokIa7LCAxCKrYKH1f5pSf7GzbAPt23P9
 XtrIRBJ/2Zn7CiWbpblCv4Yef6+bbG2j44/w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=eUrpjjEQ; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ObwOWvd6
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 17.2
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Alexey Lukyanchuk <skif@skif-web.ru>, Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Nathaniel Roach <nroach44@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://www.postgresql.org/about/news/postgresql-172-166-1510-1415-1318-and-1222-released-2965/

- Use meson build system and drop automake quirks.

- Since commit https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=68a4b58eca032916e2aad78d63f717dcb147e906
  BR2_TOOLCHAIN_HAS_THREADS_NPTL is mandatory dependency

- Since commit https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=8d9a9f034e925568342c7ccfd8d351a3cd20e7f3
  BR2_ENABLE_LOCALE is mandatory dependency

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/bandwidthd/Config.in                  |  5 +-
 package/collectd/Config.in                    |  4 +
 package/lighttpd/Config.in                    |  3 +
 package/php/Config.ext                        |  8 +-
 package/poco/Config.in                        |  4 +
 .../0001-Fix-compile-without-threads.patch    | 87 -------------------
 package/postgresql/Config.in                  |  9 +-
 package/postgresql/postgresql.hash            |  4 +-
 package/postgresql/postgresql.mk              | 67 +++++---------
 package/python-psycopg2/Config.in             |  4 +
 package/qt5/qt5base/Config.in                 |  4 +-
 package/qt6/qt6base/Config.in                 | 10 ++-
 package/zabbix/Config.in                      |  3 +
 13 files changed, 68 insertions(+), 144 deletions(-)
 delete mode 100644 package/postgresql/0001-Fix-compile-without-threads.patch

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index e2a6f1acb1..b0485ef957 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -34,8 +34,11 @@ if BR2_PACKAGE_BANDWIDTHD
 
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
-	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 39c0d352e5..6568aa1d7b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -475,7 +475,11 @@ config BR2_PACKAGE_COLLECTD_PING
 
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 66532d7dd5..5311f37ae1 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -94,6 +94,9 @@ config BR2_PACKAGE_LIGHTTPD_PGSQL
 	bool "pgsql support"
 	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/php/Config.ext b/package/php/Config.ext
index d5f8659016..609cf17016 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -139,8 +139,10 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 config BR2_PACKAGE_PHP_EXT_PGSQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -174,8 +176,10 @@ config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 9bdef125ad..db1b36964e 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -52,6 +52,10 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 config BR2_PACKAGE_POCO_DATA_PGSQL
 	bool "Data/PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_POSTGRESQL
diff --git a/package/postgresql/0001-Fix-compile-without-threads.patch b/package/postgresql/0001-Fix-compile-without-threads.patch
deleted file mode 100644
index a280df540f..0000000000
--- a/package/postgresql/0001-Fix-compile-without-threads.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 6c71182dde4d37fd70ee8015f61935254ae6f9a6 Mon Sep 17 00:00:00 2001
-From: Maxim Kochetkov <fido_max@inbox.ru>
-Date: Thu, 19 Sep 2024 10:04:05 +0300
-Subject: [PATCH] Fix compile without threads
-
-All mutexes should be wrapped by #ifdef ENABLE_THREAD_SAFETY.
-
-Fixes: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Signed-off-by: Maxim Kochetkov <m.kochetkov@yadro.com>
-Upstream: N/A, as --disable-thread-safety will disappear in PostgreSQL 17.
----
- src/interfaces/ecpg/ecpglib/misc.c | 6 ++++++
- src/interfaces/libpq/fe-misc.c     | 6 ++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/src/interfaces/ecpg/ecpglib/misc.c b/src/interfaces/ecpg/ecpglib/misc.c
-index 4b54322926..5a4d2e847e 100644
---- a/src/interfaces/ecpg/ecpglib/misc.c
-+++ b/src/interfaces/ecpg/ecpglib/misc.c
-@@ -538,7 +538,9 @@ ecpg_gettext(const char *msgid)
- 	 * might as well do it the same way everywhere.
- 	 */
- 	static volatile bool already_bound = false;
-+#ifdef ENABLE_THREAD_SAFETY
- 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
-+#endif
- 
- 	if (!already_bound)
- 	{
-@@ -549,7 +551,9 @@ ecpg_gettext(const char *msgid)
- 		int			save_errno = errno;
- #endif
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_lock(&binddomain_mutex);
-+#endif
- 
- 		if (!already_bound)
- 		{
-@@ -566,7 +570,9 @@ ecpg_gettext(const char *msgid)
- 			already_bound = true;
- 		}
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_unlock(&binddomain_mutex);
-+#endif
- 
- #ifdef WIN32
- 		SetLastError(save_errno);
-diff --git a/src/interfaces/libpq/fe-misc.c b/src/interfaces/libpq/fe-misc.c
-index 488f7d6e55..2185e0ba7a 100644
---- a/src/interfaces/libpq/fe-misc.c
-+++ b/src/interfaces/libpq/fe-misc.c
-@@ -1232,7 +1232,9 @@ libpq_binddomain(void)
- 	 * might as well do it the same way everywhere.
- 	 */
- 	static volatile bool already_bound = false;
-+#ifdef ENABLE_THREAD_SAFETY
- 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
-+#endif
- 
- 	if (!already_bound)
- 	{
-@@ -1243,7 +1245,9 @@ libpq_binddomain(void)
- 		int			save_errno = errno;
- #endif
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_lock(&binddomain_mutex);
-+#endif
- 
- 		if (!already_bound)
- 		{
-@@ -1260,7 +1264,9 @@ libpq_binddomain(void)
- 			already_bound = true;
- 		}
- 
-+#ifdef ENABLE_THREAD_SAFETY
- 		(void) pthread_mutex_unlock(&binddomain_mutex);
-+#endif
- 
- #ifdef WIN32
- 		SetLastError(save_errno);
--- 
-2.45.2
-
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 899907d6a5..06e8646119 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE # locale_t
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# fails to build in a pure static linking scenario, and
 	# postgresql is unlikely to be used in a pure statically
 	# linked environment.
@@ -32,9 +34,12 @@ config BR2_PACKAGE_POSTGRESQL_FULL
 
 endif
 
-comment "postgresql needs a toolchain w/ dynamic library, wchar"
+comment "postgresql needs a toolchain w/ dynamic library, wchar, locale"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR
+	depends on !BR2_ENABLE_LOCALE
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_STATIC_LIBS
 
 comment "postgresql can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 6a15f78628..98246ca9b6 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v16.5/postgresql-16.5.tar.bz2.sha256
-sha256  a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0  postgresql-16.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.2/postgresql-17.2.tar.bz2.sha256
+sha256  82ef27c0af3751695d7f64e2d963583005fbb6a0c3df63d0e4b42211d7021164  postgresql-17.2.tar.bz2
 # License file, Locally calculated
 sha256  9bf20ee493926a7e17a74bc7f05089fbc014269667b1540bc35a6b194a40c9de  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 12693e625c..a28785f3a2 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 16.5
+POSTGRESQL_VERSION = 17.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -13,59 +13,41 @@ POSTGRESQL_CPE_ID_VENDOR = postgresql
 POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
-POSTGRESQL_CONF_ENV = \
-	ac_cv_type_struct_sockaddr_in6=yes \
-	pgac_cv_prog_cc_LDFLAGS_EX_BE__Wl___export_dynamic=yes \
-	LIBS=$(TARGET_NLS_LIBS)
-POSTGRESQL_CONF_OPTS = --disable-rpath
+POSTGRESQL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+POSTGRESQL_CONF_OPTS = -Drpath=false
 POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # CVE-2017-8806 is related to postgresql-common package
 # It is false positive for postgresql
 POSTGRESQL_IGNORE_CVES += CVE-2017-8806
 
-# https://www.postgresql.org/docs/11/static/install-procedure.html:
-# "If you want to invoke the build from another makefile rather than
-# manually, you must unset MAKELEVEL or set it to zero"
-POSTGRESQL_MAKE_OPTS = MAKELEVEL=0
 
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
-POSTGRESQL_MAKE_OPTS += world
+POSTGRESQL_NINJA_OPTS += world
 POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
 POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-# PostgreSQL does not build against uClibc with locales
-# enabled, due to an uClibc bug, see
-# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
-# so overwrite automatic detection and disable locale support
-POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
-endif
-
-ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
-POSTGRESQL_CONF_OPTS += --disable-thread-safety
-endif
 
 ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_nios2)$(BR2_riscv)$(BR2_xtensa),y)
-POSTGRESQL_CONF_OPTS += --disable-spinlocks
+POSTGRESQL_CONF_OPTS += -Dspinlocks=false
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 POSTGRESQL_DEPENDENCIES += readline
 else
-POSTGRESQL_CONF_OPTS += --without-readline
+POSTGRESQL_CONF_OPTS += --Dreadline=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 POSTGRESQL_DEPENDENCIES += zlib
 else
-POSTGRESQL_CONF_OPTS += --without-zlib
+POSTGRESQL_CONF_OPTS += -Dzlib=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TZDATA),y)
 POSTGRESQL_DEPENDENCIES += tzdata
-POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
+POSTGRESQL_CONF_OPTS += -Dsystem_tzdata=/usr/share/zoneinfo
 else
 POSTGRESQL_DEPENDENCIES += host-zic
 POSTGRESQL_CONF_ENV += ZIC="$(ZIC)"
@@ -73,56 +55,51 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 POSTGRESQL_DEPENDENCIES += openssl
-POSTGRESQL_CONF_OPTS += --with-openssl
-else
-# PostgreSQL checks for /dev/urandom and fails if it's being cross-compiled and
-# an SSL library isn't found. Since /dev/urandom is guaranteed to be provided
-# on Linux systems, explicitly tell the configure script it's available.
-POSTGRESQL_CONF_ENV += ac_cv_file__dev_urandom=yes
+POSTGRESQL_CONF_OPTS += -Dssl=openssl
 endif
 
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 POSTGRESQL_DEPENDENCIES += openldap
-POSTGRESQL_CONF_OPTS += --with-ldap
+POSTGRESQL_CONF_OPTS += -Dldap=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-ldap
+POSTGRESQL_CONF_OPTS += -Dldap=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 POSTGRESQL_DEPENDENCIES += icu
-POSTGRESQL_CONF_OPTS += --with-icu
+POSTGRESQL_CONF_OPTS += -Dicu=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-icu
+POSTGRESQL_CONF_OPTS += -Dicu=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 POSTGRESQL_DEPENDENCIES += libxml2
-POSTGRESQL_CONF_OPTS += --with-libxml
+POSTGRESQL_CONF_OPTS += -Dlibxml=enabled
 POSTGRESQL_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
 else
-POSTGRESQL_CONF_OPTS += --without-libxml
+POSTGRESQL_CONF_OPTS += -Dlibxml=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 POSTGRESQL_DEPENDENCIES += host-pkgconf zstd
-POSTGRESQL_CONF_OPTS += --with-zstd
+POSTGRESQL_CONF_OPTS += -Dzstd=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-zstd
+POSTGRESQL_CONF_OPTS += -Dzstd=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
 POSTGRESQL_DEPENDENCIES += host-pkgconf lz4
-POSTGRESQL_CONF_OPTS += --with-lz4
+POSTGRESQL_CONF_OPTS += -Dlz4=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-lz4
+POSTGRESQL_CONF_OPTS += -Dlz4=disabled
 endif
 
 # required for postgresql.service Type=notify
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 POSTGRESQL_DEPENDENCIES += systemd
-POSTGRESQL_CONF_OPTS += --with-systemd
+POSTGRESQL_CONF_OPTS += -Dsystemd=enabled
 else
-POSTGRESQL_CONF_OPTS += --without-systemd
+POSTGRESQL_CONF_OPTS += -Dsystemd=disabled
 endif
 
 POSTGRESQL_CFLAGS = $(TARGET_CFLAGS)
@@ -165,4 +142,4 @@ define POSTGRESQL_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/postgresql.service
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 4aa86c7690..307c072bd3 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 6e6a7cf984..16a17dfc27 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -72,8 +72,10 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 3b15d40c83..96a0416dbd 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -200,10 +200,12 @@ comment "MySQL plugin needs a toolchain w/ C++, threads"
 
 config BR2_PACKAGE_QT6BASE_PSQL
 	bool "PostgreSQL Plugin"
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR
-	depends on !BR2_OPTIMIZE_FAST
+	depends on BR2_USE_MMU # postgresql
+	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
+	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Build PostgreSQL plugin
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 4940f8ca8e..226bce51ba 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -40,7 +40,10 @@ config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
 
 config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
 	bool "postgresql"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on BR2_ENABLE_LOCALE # postgresql
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
 	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
