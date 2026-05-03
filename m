Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22454CD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE39E612B7;
	Sun,  3 May 2026 14:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqzC6C5XR1hY; Sun,  3 May 2026 14:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93C8612DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819840;
	bh=9CbpCDb+PIa+B+wReFhsqMR4LkaeZ50lj3ufxRKMNsg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CiY+Sb+03ImJmBewUtIs7Q4qlcrR75QaX+/3JYR+z4nQdUUW3pt/w+JyZ9SpFpU0T
	 mAJlSRjCAjEM6ZfFaEXwMLQ6LE5i4UJHwuxN9op5o9cVfeodLvP2Tiu0Xmdkv+zxka
	 2ZaSNDD6p7LHYlsekxCDUdzAnDECI+wyhoXBFjlcS++1y6gUjCweIkAdH/vRpARz9Y
	 +CFPJCWx8YE8eU5BvPTy+tXAgn+zmQH5R+kFn6HNWBTPKKXec97cFw3YP7Q+dN1in5
	 c3+LuZcpC5H12y6141FLdrI1KI5oBfgQXuVfGTrJkhUO+KUy/YbiX5yBKerBOFxhV9
	 Ag//Yz2yiLing==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D93C8612DB;
	Sun,  3 May 2026 14:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A85190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BD59406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7q0YM5LR5iCj for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC944046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC944046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2822D7FDF8; Sun,  3 May 2026 14:50:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac6b204e029da7fff925c2570fcfe4905f44a120
X-Git-Newrev: 2286c4a02cc0a22d1c902ed8e4cb997faefd72d1
X-Patchwork-Hint: ignore
Message-Id: <20260503145027.2822D7FDF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lmdb: security bump version
 to 2.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2286c4a02cc0a22d1c902ed8e4cb997faefd72d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
