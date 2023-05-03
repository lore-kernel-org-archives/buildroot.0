Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55475C77B7F
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 05:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7F5B40476;
	Wed,  3 May 2023 05:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F5B40476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rm9VQHqvVCbZ; Wed,  3 May 2023 05:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD3C8402E7;
	Wed,  3 May 2023 05:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3C8402E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A61661BF3F2
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 05:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F319402E7
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 05:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F319402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tY4ztDRkeXK1 for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 05:13:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24AB640164
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24AB640164
 for <buildroot@buildroot.org>; Wed,  3 May 2023 05:13:32 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pu4nx-0004U9-7C; Wed, 03 May 2023 08:13:29 +0300
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 08:13:27 +0300
Message-Id: <20230503051327.558449-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F572AEF33F1BC58508C37521036EBDD5C831F14F2C69419A182A05F53808504087FFB8EBA5E28414D117D877796A29A71081921E37503B1CAA0EC1D356B06CC8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE771540F9ECFC94C4BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E80306D42697F3998638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82353602B735CB0855A155A1E5F94A7086F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23D9E625A9149C048EE4B6963042765DA4B2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B6CE7A4E25BAF3B969FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637A2A43CD5061A88E86D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637BC468E7E89D8C5D6EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5C9073F0BE177347D1EB86BE3F1894648054B8E16DB4ACEC7F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FB9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFBF5B3D20DA93A528B9AA9899B77AB08F5A635246CCF87C360F2226FEAF2B29B50FDE04257288300914EE98CD8E9D35FC31435FD555598F8C1573830BF852C142C897C70B1EFF344F
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojUsZxtR84vld6nz2pPBq7LA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF54C0DA9C9B7555E6F1A18AE5BB83694B098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=7wofbb84IVwXA/cHRDNjnb9v9zRPd20c1N/g4NuIMTs=; 
 t=1683090812;x=1683180812; 
 b=DLe6ISYe7H6FeujVgTrml6H+AfpA+RhqGas+ZhDna3EkZFy6uBr0DVGqF/VlhxOSGHlwP/J0NL/l6vyD3gGCwzJIbl2Vvvc8RetqwC53lACkpkWmmQGBVH2brRLu9hp9tJdZ8snlED/v1rhWc2gUQsUHK8o9PXwQhIoW+ChVsbRm87ATif3j5sQ7nKSHfzYKaqlnTAsKHSjh3Enn+kKX61AQWtxlAaj/hUDQZs3iBZVLx4NfdPOpgoPxYitV2zi8u4KYnDBBN5vQuus/S/z6Bi8vToIZ4/Fzd6M5ofaftdH+BxpfBKD7bsUByi3fJP26UGjv001CySalHhPQzjR5Cg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=DLe6ISYe
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 2022.02.x 1/1] package/postgresql: bump version
 to 14.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.postgresql.org/docs/release/14.7/

Fixes: https://security-tracker.debian.org/tracker/CVE-2022-41862
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 26bb626943..83b27a5fc0 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v14.6/postgresql-14.6.tar.bz2.sha256
-sha256  508840fc1809d39ab72274d5f137dabb9fd7fb4f933da4168aeebb20069edf22  postgresql-14.6.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.7/postgresql-14.7.tar.bz2.sha256
+sha256  cef60f0098fa8101c1546f4254e45b722af5431337945b37af207007630db331  postgresql-14.7.tar.bz2
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 30a4d45737..a43c6bb953 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.6
+POSTGRESQL_VERSION = 14.7
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
