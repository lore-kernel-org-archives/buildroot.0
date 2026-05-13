Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811F7CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505DF41A6F;
	Fri, 15 May 2026 13:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F36JknRsiOGD; Fri, 15 May 2026 13:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A44041AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851808;
	bh=WmwYZdmnkkZk4GJMr7uGy4kL0jkpHjDNYMbQ3NCOULQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WiGfKEc6Yuig3BVKuZO0kmfvrPrj19Df+PCYOI+eH/Zs2lkjilaTny7F5ESHawB+8
	 ZvEl7nSbguJU+MuZT/ROmObpzZ1Gv0+Pu5XL9IHSIom0dQydzHG+3u8j7CEnxa7RHm
	 Kr7LZZ+oeloFJIA+eT0j7q9jQylsdKoJ4DVSemrzU11R8OyS+bmdUvt/m+efs2f/1B
	 0ytyCcK2Thgz+pFf5qwnaFJNy9jrEw57JB5UjzLSpyIvqszmEMnghikRswLB4srULH
	 m7z5CKE6gSUVcGHkA0VzE89A2eugrfYe+laGO/x3FfvbsMLYhWsFERRAilAOJvE34k
	 saJ/isNruEtWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A44041AE9;
	Fri, 15 May 2026 13:30:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 032CA36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E9B46157B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UF5G2BSs9qnf for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC1F61580
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC1F61580
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E8C386356; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:36:45 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1ac609d83ee67cb716dfabfd208ce103451f5e00
X-Git-Newrev: 5b4194680c6bcf664d9127c070455ce36cc9125b
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.0E8C386356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-lmdb:
 security bump version to 2.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b4194680c6bcf664d9127c070455ce36cc9125b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/jnwatson/py-lmdb/blob/py-lmdb_2.2.0/ChangeLog

Version 2.1.0 fixes the following CVEs:

- **CVE-2019-16224**: heap buffer overflow via `MDB_DUPFIXED` without
    `MDB_DUPSORT` in on-disk `md_flags`. (#429)

- **CVE-2019-16225**: `SIGSEGV` from `P_DIRTY` flag set on mmap'd disk pages,
    causing `mdb_page_touch()` to skip copy-on-write. (#429)

- **CVE-2019-16226**: out-of-bounds `memmove` in `mdb_node_del` via corrupt
    `mn_hi` making `NODEDSZ()` huge. (#429)

- **CVE-2019-16227**: NULL pointer dereference of `mc_xcursor` when
    `F_DUPDATA` is set on a node in a non-DUPSORT database. (#429)

- **CVE-2019-16228**: divide-by-zero from zero `mm_psize` in meta page
    header. (#429)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2286c4a02cc0a22d1c902ed8e4cb997faefd72d1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 679d552d1c..ad111605bc 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  de895e4a88eeb179aa0c185a08523d62  lmdb-1.8.1.tar.gz
-sha256  44ef24033929e9cc227a7e17287473c452b462d716f118db885c667c80f57429  lmdb-1.8.1.tar.gz
+md5  f6f491b825302966f63b3fdee2ef80fd  lmdb-2.2.0.tar.gz
+sha256  53020e20305c043ea6e68089bc242d744fba6073cdb268332299ba6dda2886d4  lmdb-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index dbdc80bfda..ba3d257fdd 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.8.1
+PYTHON_LMDB_VERSION = 2.2.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/23/19/392f028e7ebcc1cc8212fe8a315a909b7a556278456f0bab9234d3a3b665
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/21/44/d94934efaf8f887b6959f131fde740fcaa831edfd13eb5425574637cddd5
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
