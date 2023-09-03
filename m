Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B671C83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 12:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BECA416A2;
	Sun,  3 Sep 2023 12:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BECA416A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYlrXn999MvD; Sun,  3 Sep 2023 12:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135DC416D0;
	Sun,  3 Sep 2023 12:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135DC416D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6A321BF228
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 12:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC8B1416A2
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 12:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8B1416A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gb6aRlxzRirR for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 12:29:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96B484169B
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 12:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B484169B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4070F13F861;
 Sun,  3 Sep 2023 14:29:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 14:28:31 +0200
Message-ID: <20230903122831.7800-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903122831.7800-1-ju.o@free.fr>
References: <20230903122831.7800-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693744150;
 bh=4rDuAcQJR43SZnwkEv668EK4PJdlxg0w4qlw1Wo2HyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n/fvhB0mgIfocXS8qPoDStBa2qoCin0fWilbg2RAV7VzseskWaPqRVDWUEYj7/Tjs
 +DXvOVY/XbZVwkigwNH1YSTCM5svnlClyLjMor7aQ2vW8YmK5yyDuaYiq7qDEnESRz
 htb50Bw9EApgl/wbzhRNMxSysL/mDPbjn/KW6JfAcqx5YbJzHBDL+2PoTwH0+9mRV/
 9NzrQzp+SSsZz6/71Za2JkZ2d9vPCK8q1+GKCd6CRiPZLNo4nCtKM4X7zSLxcrhElg
 qjXZPK/1nxcnoJ2xwCZw5sscKXyOtzqqwfkLgHF6TjqwGzeaV4nY09dDAifx/a676j
 ps25ySGVNb7bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n/fvhB0m
Subject: [Buildroot] [PATCH next 2/2] package/libgpgme: bump to version
 1.22.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1] and [2].

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=log;h=gpgme-1.22.0
[2] https://dev.gnupg.org/T6668

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Series tested on branch next at commit 3fa1ae0 with commands,
in Docker image:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -p libgpgme
    ...
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Note: this package in branch next is subject to issues described in
[1]. The issue will be resolved when the branch next will be merged
into master.

[1] https://git.buildroot.org/buildroot/commit/?id=bf7926230c7d47dd809e59646a6ff4f7fe35b833
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 556f1d3b42..5c47db76d5 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  abe7db72760c0bb3e9c429b72dcc3c60bed023de  gpgme-1.21.0.tar.bz2
-sha256  416e174e165734d84806253f8c96bda2993fd07f258c3aad5f053a6efd463e88  gpgme-1.21.0.tar.bz2
+sha1  12f4c98ffa75bdbfc4934d38757f57ba718b5aa0  gpgme-1.22.0.tar.bz2
+sha256  9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71  gpgme-1.22.0.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index be4e8ff23b..2a567a17a7 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.21.0
+LIBGPGME_VERSION = 1.22.0
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
