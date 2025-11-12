Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71600CCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 07:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FEA4059A;
	Wed, 12 Nov 2025 07:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNttvn9l4FbW; Wed, 12 Nov 2025 07:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 353774081C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 353774081C;
	Wed, 12 Nov 2025 07:56:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 983CD24D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BCD380E09
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-vSXbbHkip1 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 07:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC5080DEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC5080DEA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82FEB8429E; Wed, 12 Nov 2025 07:56:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 08:54:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e8a6c0dc27f542363e5e834c1dc67e72bc23514
X-Git-Newrev: 235e365059af5f251abee95f88fa1ae16bf8e3d4
X-Patchwork-Hint: ignore
Message-Id: <20251112075621.82FEB8429E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: security bump version to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=235e365059af5f251abee95f88fa1ae16bf8e3d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
