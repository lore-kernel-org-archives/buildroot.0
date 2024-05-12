Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88428C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C6F83BBB;
	Sun, 12 May 2024 16:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puwVpYAVEWEZ; Sun, 12 May 2024 16:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE1E83BBD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE1E83BBD;
	Sun, 12 May 2024 16:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08B61BF3C6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98AC840104
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf4qBmgdMHRG for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 16:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3174400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3174400B5
 for <buildroot@buildroot.org>; Sun, 12 May 2024 16:31:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD16D870BD; Sun, 12 May 2024 16:31:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 18:29:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acce2e3a38e849b2f85b7bd423c54c7ab29ec82f
X-Git-Newrev: aea54eab471c0efe696984859a6dcd2f7487f83c
X-Patchwork-Hint: ignore
Message-Id: <20240512163133.CD16D870BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.12.10
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6070066622801104927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6070066622801104927==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=aea54eab471c0efe696984859a6dcd2f7487f83c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is bugfix release of stable libmdbx branch.

The most significant fixes since v0.12.8 (previous version pinned to
buildroot):

  - Fixed an major bug inherited from LMDB (Lightning Memory-Mappe
    Database) that causes database corruption during use the
    MDBX_DUPFIXED mode, and that has existed for more than 10 years.

  - Fixed of a false error MDBX_CORRUPTED (-30796) in the scenario of
    working in the mode MDBX_DUPFIXED with odd length of multi-values.

  - Fixed a bug in adjusting the cursors in the case splitting a page by
    adding a new page on the left.

  - Troubleshooting an error when opening a database on a read-only file
    system.

  - A set of C++ API improvements.

The complete ChangeLog:
    https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
[yann.morin.1998@free.fr: ammend and reflow the commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 82cf28d6a9..1dbdef7c69 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  c78c56c53708bbfc519bf53ebf520d1f09d30ee6427a4bedf713316696e671d0  libmdbx-amalgamated-0.12.8.tar.xz
+sha256  4637e06768a9a8fc7577e6e458e045ad1f9a8baee74996a3c88bc0ad64cbcf67  libmdbx-amalgamated-0.12.10.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 4cc6cbd08e..6e0571ff24 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.12.8
+LIBMDBX_VERSION = 0.12.10
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============6070066622801104927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6070066622801104927==--
