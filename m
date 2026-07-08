Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0449C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851D240931;
	Fri, 10 Jul 2026 13:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GksICs-IEnZe; Fri, 10 Jul 2026 13:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD37340928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690988;
	bh=H8/bq/LmlJsrUwGNBzbPEIE5FsvflOrZmKkBvXbVvW4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mpo0MB4WMf2TmISLGzjvXM8bhZb5Plg77e7qh2EE4xYGdX//NXh3Sj9RgyuHZF1vz
	 FfrxnOI+/cNhD3I0ErIev2s0rVWB0kEx4BOkqK4rbmjFCd5U0Z+JHoagKw6DEtDDt5
	 PPBKfa8UUga4P6ykXIlSZRmx2kv8mM/uD1sqHjWBon2NFNDVlYC88qPzkCTZROq/fM
	 /UiHJGvlnIO8oz2HTu/8+lY5K6b+oVtfH8tmrsYcx8ZktXJ84+nMPImfOdgkINlXGn
	 CZiUNqqrLXhUpoJhSNEGFuwObSbZYkv9wrhz+Ggl/TaUNYeG707NorPmQV9+W4cmRX
	 czQv6h9sK5pQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD37340928;
	Fri, 10 Jul 2026 13:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE382FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CDAC810B8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7RzY5CWV2f5 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF69810B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF69810B6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F95C88675; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:51:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 70864c5c81e4123454a999adb1704b98397a39f8
X-Git-Newrev: 6c81d7dd02b3d5cf46a698600ed0fa3313de7b96
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.2F95C88675@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mariadb: security
 bump to v10.11.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c81d7dd02b3d5cf46a698600ed0fa3313de7b96
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit c69f28ae5c31cf0a69ce184be1d0279cda4242eb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
