Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A61C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 18:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCCA80C13;
	Wed,  1 Jul 2026 18:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_kPqIK-bKyb; Wed,  1 Jul 2026 18:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8144880C33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782931603;
	bh=9dAv6y7Hsp74N0xWV78QVJrGF/5yHR5QTP6h8P47/wM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NqAt6tonOI6znpA2GNUY+ksnfpOAYaE2BMgTeB0iaRWmxf9qUYWMISCps3u58ZG10
	 hO3P+/0w5IT+3pjDBWftAr0z/iDzCEj/9P+abOBZIztKe5CLfmw9dS5+VqCLTMxKuJ
	 Dqs5SgXkeiH0789yl2hj79ZtHTUi3GsibYK7LMPk8g08DYFMzA0hrVw6aqH45lBVOc
	 9zTS87pMq+K5Q54hjS1LrAfukRFv/j49VsZh0dReDr5UWd2KxXhAn5Z1KzciY4XOPb
	 SgZnbYRLXqCOZGYGkRZ1HQ1GbF8lFLpcJWWJ2FcJWnb079jBXa86VZJtw/XHi98TOd
	 bQFixRxRh8zBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8144880C33;
	Wed,  1 Jul 2026 18:46:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF4FB127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 18:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0FB2405CC
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 18:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmkByNKHLGde for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 18:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C99BC40243
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99BC40243
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 18:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48955879BD; Wed,  1 Jul 2026 18:46:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 20:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfd7483a26e17ca4ea95793ea7a618c6cc1b1b78
X-Git-Newrev: c69f28ae5c31cf0a69ce184be1d0279cda4242eb
X-Patchwork-Hint: ignore
Message-Id: <20260701184612.48955879BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: security bump to v10.11.18
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c69f28ae5c31cf0a69ce184be1d0279cda4242eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information on the release, see:
  - https://mariadb.com/docs/release-notes/community-server/10.11/10.11.18

It fixes the following vulnerabilities:

- CVE-2026-48163:
    MariaDB server is a community developed fork of MySQL server. From
    versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
    to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, during the SST
    the donor node is interpolating parameters that the joiner sent into
    the command line. Not all parameters were properly validated which
    could allow a malicious joiner to execute arbitrary shell commands on
    the donor side via the rsync SST method. This issue has been patched
    in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and 12.3.2.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-48163

- CVE-2026-48165:
    MariaDB server is a community developed fork of MySQL server. From
    versions 10.6.1 to before 10.6.27, 10.11.1 to before 10.11.18, 11.4.1
    to before 11.4.12, 11.8.1 to before 11.8.8, and 12.3.1, a high-
    privileged MariaDB user could've used wsrep_sst_receive_address or
    wsrep_sst_donor global system variables to execute shell commands as
    the uid of the mariadbd process on the galera joiner node. This issue
    has been patched in versions 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
    12.3.2.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-48165

- CVE-2026-49261:
    MariaDB server is a community developed fork of MySQL server. Versions
    10.6.1 through 10.6.26, 10.11.1 through 10.11.17, 11.4.1 through
    11.4.11, 11.8.1 through 11.8.7, and 12.3.1 with  `wsrep_notify_cmd`
    enabled would execute shell commands embedded in the name of the
    joiner node. This is fixed in 10.6.27, 10.11.18, 11.4.12, 11.8.8, and
    12.3.2. As a workaround, anyone who cannot upgrade now should disable
    `wsrep_notify_cmd`.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-49261

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index ca23b36a38..e2c13e3302 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.11.17
-sha512  788803b15afbb6193111774a233d0db0604f27ebae3b4b439368e2d7caeffb662846e530fa65f453a6d77541cedb99112ea319c7c0c2ce5074c32aefb06a51aa  mariadb-10.11.17.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.18
+sha512  45fa3c746138aa51b55d61efe11d44b0476fdcb104d5a40929ca2910145668ae749664e2afed7f9d59825d5b2b14e920c012513a4efa4eb0f8af1607d44ae31b  mariadb-10.11.18.tar.gz
 
 # Hash for license files
 sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index c718c1ce7b..7d3c505ada 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.11.17
+MARIADB_VERSION = 10.11.18
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
