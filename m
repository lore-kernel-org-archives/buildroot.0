Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A7CCFA1A
	for <buildroot@archiver.kernel.org>; Tue, 11 Nov 2025 11:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D70B81FA8;
	Tue, 11 Nov 2025 11:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UI6G6VZKdhp; Tue, 11 Nov 2025 11:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D61181F67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D61181F67;
	Tue, 11 Nov 2025 11:47:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3624DFA
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 11:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C97404DC
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 11:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNivI6BofyyL for <buildroot@buildroot.org>;
 Tue, 11 Nov 2025 11:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3BB3404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3BB3404D7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3BB3404D7
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 11:46:56 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D231A5FFBA;
 Tue, 11 Nov 2025 12:46:53 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 11 Nov 2025 12:46:45 +0100
Message-ID: <20251111114645.978645-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762861615;
 bh=HvEy0v/87z4h93efwB9ESQ2K5CgT5JwhhmlaKSBRhhg=;
 h=From:To:Cc:Subject:Date:From;
 b=Zbpxb65W4MdKdcdDDpPTFGnAnELw5xRi3avwYncZD1ycHmNxBDbqXRLq1OZjU43JU
 t7ciia4ieJ400+CiQj4MOrpetCxharWgQT5BYEa1jwf9kAiOmeJJJgEsf86iBEYh3V
 ROQtpCAROj+j8e5NarpxHzsiCyTklCdQwPQtanRjqA7nadnJ59BnarYIb251n2rKFm
 sYlAj65kxc24Z2RihoJPclaJwtNHaVFLuz4FVOmESh/SD73BfVjFJld8qh8IPCEORk
 54Fx242ytzoJw2xY2961RtegATuo1AjF0mJ3RIEqn7R3nfvMjAXbVT6OtbZ9vaKQ7G
 c5GJRnqPfC/Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zbpxb65W
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump version to
 10.11.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since 10.11.11:
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.12
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.13
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.14
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.15

Note: the version 10.11.12 is documented as fixing the following CVEs:
https://www.cve.org/CVERecord?id=CVE-2025-30693
https://www.cve.org/CVERecord?id=CVE-2025-30722
https://www.cve.org/CVERecord?id=CVE-2023-52969
https://www.cve.org/CVERecord?id=CVE-2023-52970
https://www.cve.org/CVERecord?id=CVE-2023-52971

Also, since Buildroot commit [1] "package/libxml2: bump version to
2.15.1", MariaDB is failing to build. This new maintenance release
fixes this issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845663
https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402485

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a67cff491a173c88187ce76e0d3cdccdb48371fc

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12044712660
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 05340c1faa..216b3be7e3 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.11
-sha512  d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac  mariadb-10.11.11.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.15
+sha512  98d1e54954b69cf87a96be7d76f80333f27832a29279e6b0a9615b830e171713222abcb9ec9b9a545c0fc4a0f9f8e3d4774babcabf534a6fa3cb3dfdaed0dedc  mariadb-10.11.15.tar.gz
 
 # Hash for license files
 sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 53395afc91..e2c0cee3d5 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.11
+MARIADB_VERSION = 10.11.15
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
