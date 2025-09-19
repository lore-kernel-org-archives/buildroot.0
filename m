Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0DFCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 07:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA5D381494;
	Fri, 19 Sep 2025 07:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8_2JhI56sKh; Fri, 19 Sep 2025 07:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C147181496
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C147181496;
	Fri, 19 Sep 2025 07:23:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D978150
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 07:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F17560F6B
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 07:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajDGe5-WCyto for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 07:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.79;
 helo=send240.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AAF360EF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAF360EF5
Received: from send240.i.mail.ru (send240.i.mail.ru [95.163.59.79])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AAF360EF5
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 07:23:54 +0000 (UTC)
Received: by exim-smtp-648cc8c6cc-znm84 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uzVTC-000000006NK-3dwG; Fri, 19 Sep 2025 10:23:51 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 19 Sep 2025 10:23:49 +0300
Message-ID: <20250919072349.169149-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9DB4A046F746C73F1E4EE41D8A028E4A1D1ECBAF1EE45118B182A05F538085040B322CFEC4A6A2C533DE06ABAFEAF6705FE8E040EC77D3BEBFBA3D1922FC6CE04FE495290C33621F9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3DED2DACB82E709C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6759CC434672EE6371C2A783ECEC0211ADC4224003CC836476D5A39DEEDB180909611E41BBFE2FEB2B862269BEA0DCDA9262C58D2DB8B64BC99EF3B87BAABB55A06FC8ED3837536D050C819B32DFABC24A725E5C173C3A84C3E478A468B35FE767117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC94BA36676CB21B6B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC86030639D0DAF385DF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA7E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDAE3FA6833AEA0C275ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A54F7CF7349D2B19C45002B1117B3ED69643B0DB9D76484D9C219207EC0A953D2C823CB91A9FED034534781492E4B8EEAD90A7226BC187CE1EF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34D8FD11F74BDD6E8D531F7ACAB32944EA194928018085A5941937E7E6238C1F89B7B3466297FA6E741D7E09C32AA3244C4B0D3C8C5A334F3D77DD89D51EBB774297BC2A821AF1A895EA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtPF7Ftv6j1BDkTVm59bjYmw==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6DE54D76D39A9742A14D14A2FC2E46BCBA3303E55AD51756390DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=v9p0Pxzv7aqe4+Av5bBI7EiVoVmFSQ328jrbem2xfd8=; t=1758266635; x=1758356635; 
 b=fCgp6kifbMYL/K+lyELn/qSAPle98hLAAbkO18VhEYFXzlWGI8PVvskIhrZuYFLHwixo3pO1VGM
 aH49EaA74zc3PnxrNxWF2U6kkO1nxEOXD4F4kyclM8jbe3oSAtO+VAMadzXRrxMwIv4pCfs7B8GUo
 wqcXgIWlP+oKTKnpz8JUt4KjIUYO5W5pHwOEi4BT3Y+fFn4/hYqkGLtziOTK8AREHrpYHRG5Dni84
 2/+ktPuRQj39AJzIWvEWEBpxXWB9A5lxTtGaHme4JYVDk2WPQFxwjehHszcw8JSlTH4B1U2VXERJJ
 S/tvTz2bniY4Yx3rBbo1N6h/fK+HXnvGg69w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=fCgp6kif
X-Mailman-Original-Authentication-Results: exim-smtp-648cc8c6cc-znm84;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump to
 version 17.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

CVE-2025-8713: PostgreSQL optimizer statistics can expose sampled data
within a view, partition, or child table

PostgreSQL optimizer statistics allow a user to read sampled data within
a view that the user cannot access. Separately, statistics allow a user
to read sampled data that a row security policy intended to hide.
PostgreSQL maintains statistics for tables by sampling data available in
columns; this data is consulted during the query planning process. Prior
to this release, a user could craft a leaky operator that bypassed view
access control lists (ACLs) and bypassed row security policies in
partitioning or table inheritance hierarchies. Reachable statistics data
notably included histograms and most- common-values lists. CVE-2017-7484
and CVE-2019-10130 intended to close this class of vulnerability, but
this gap remained. Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19,
and 13.22 are affected.

CVE-2025-8714: PostgreSQL pg_dump lets superuser of origin server execute
arbitrary code in psql client

Untrusted data inclusion in pg_dump in PostgreSQL allows a malicious
superuser of the origin server to inject arbitrary code for restore-time
execution as the client operating system account running psql to restore
the dump, via psql meta-commands. pg_dumpall is also affected. pg_restore
is affected when used to generate a plain-format dump. This is similar to
MySQL CVE-2024-21096. Versions before PostgreSQL 17.6, 16.10, 15.14,
14.19, and 13.22 are affected.

CVE-2025-8715: PostgreSQL pg_dump newline in object name executes
arbitrary code in psql client and in restore target server

Improper neutralization of newlines in pg_dump in PostgreSQL allows a user
of the origin server to inject arbitrary code for restore-time execution
as the client operating system account running psql to restore the dump,
via psql meta-commands inside a purpose-crafted object name. The same
attacks can achieve SQL injection as a superuser of the restore target
server. pg_dumpall, pg_restore, and pg_upgrade are also affected.
Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19, and 13.22 are affected.
Versions before 11.20 are unaffected. CVE-2012-0868 had fixed this class
of problem, but version 11.20 reintroduced it.

https://www.postgresql.org/about/news/postgresql-176-1610-1514-1419-1322-and-18-beta-3-released-3118/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index f17d4ca3ce..3b5e773c65 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.bz2.sha256
-sha256  fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8  postgresql-17.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.6/postgresql-17.6.tar.bz2.sha256
+sha256  e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0  postgresql-17.6.tar.bz2
 # License file, Locally calculated
-sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
+sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 671bd30347..31d0068328 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.5
+POSTGRESQL_VERSION = 17.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
