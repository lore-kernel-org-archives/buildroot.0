Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DC3CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F65C61600;
	Fri, 15 May 2026 13:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbznZ_GmlIQm; Fri, 15 May 2026 13:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74A4D615FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851826;
	bh=5PnpHBa3ONHU5V/UlLRx9FN+Nl6yHleXu9SOOOQOSXc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VvctLhwH/gQq39lawieSHM2LOl/XBah20As6VbFo2ib2p/1tH+ztH+IkBkbnjPI7S
	 Llue+1MrNjpUMAiLycnVDl9Cpy1G40iVJpbqM2BQDe8xBs7E5ArVgtNmK9eJJBWZtA
	 KksdJ2d9kcFJD0lE3f4YysYKHk8CqYv3j8rcYZOQ6QDQNCNel5dUZK+ct1c2x7tukH
	 agNjzXnioBsT+UPLVlLHj2SgLZB8k6UXCdc1SQiLwTXVQZa+d9UjHxcUTW3PW5fzPH
	 0i3UQJWCYN6ozDtVThipbPWHFFeZ85rvesuRcMqFS//GYwQoXds+bKpMrQAr1JdW5t
	 HZSkvxYf/+KFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74A4D615FF;
	Fri, 15 May 2026 13:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E76436F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8816440E22
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNZ02dNn5iog for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A1541ABF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A1541ABF
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0689286354; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:35:26 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 39098f7d042ecff740519120dce1461ccb3d513f
X-Git-Newrev: 1ac609d83ee67cb716dfabfd208ce103451f5e00
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.0689286354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-lmdb: bump
 version to 1.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ac609d83ee67cb716dfabfd208ce103451f5e00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/jnwatson/py-lmdb/blob/py-lmdb_1.8.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6df86418f57771419e63aceb1b6a2b2aab16ae37)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 525c434f2a..679d552d1c 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  0996b2df3b8019b76ce1fa37913e41f0  lmdb-1.7.5.tar.gz
-sha256  f0604751762cb097059d5412444c4057b95f386c7ed958363cf63f453e5108da  lmdb-1.7.5.tar.gz
+md5  de895e4a88eeb179aa0c185a08523d62  lmdb-1.8.1.tar.gz
+sha256  44ef24033929e9cc227a7e17287473c452b462d716f118db885c667c80f57429  lmdb-1.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 3f92ef066f..dbdc80bfda 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.7.5
+PYTHON_LMDB_VERSION = 1.8.1
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/c7/a3/3756f2c6adba4a1413dba55e6c81a20b38a868656517308533e33cb59e1c
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/23/19/392f028e7ebcc1cc8212fe8a315a909b7a556278456f0bab9234d3a3b665
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
