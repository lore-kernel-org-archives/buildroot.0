Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B23C001DB
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 12:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 926084056B;
	Tue, 15 Aug 2023 12:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926084056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmMGrUl6xdjh; Tue, 15 Aug 2023 12:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3B0A4029B;
	Tue, 15 Aug 2023 12:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B0A4029B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0CCD1BF28B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 12:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C600F81E6D
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 12:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C600F81E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3006jORUk0Sm for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 12:57:09 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86D398141B
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 12:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D398141B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2566013F8CB;
 Tue, 15 Aug 2023 14:57:04 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 14:56:51 +0200
Message-ID: <20230815125652.687317-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692104226;
 bh=nScK6wfA1G85ck2pBnxwaskqfgg1Trm9Uz+/6WrFpt0=;
 h=From:To:Cc:Subject:Date:From;
 b=idi4FGyvOfG3fyU6Ozkmp4Wv+BWN4BZLUpNz8fUeptm5efUe/97BaxCk4keqwrZ4E
 zLsIz6HS7xLIFKQ3wEWBBrJ2X6+GKDtTHwp67NwYGZDkbFFDGHP0BbDnVDA7woQxjh
 yK5a9pTb9gLZ8KDzTYBwsCEUeQ6Ie9i8GWJAoTXLo363GjuT/xD2KJoQcJR+udEhbY
 7d3S8z9WK8cmPoNa/9Ak7IRs3XKmzRHxmbLlGe9vImTGMxTOmrD3+4pkIxEwMmHfHJ
 TJDX4Gv1FJS1kcXe5b1SVL5wgzfcnlmUqyp4gYqjeUz3G+KqWqBJyvb0+6hbDrE087
 eDJiwBiKzkZJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=idi4FGyv
Subject: [Buildroot] [PATCH next 1/2] package/libnftnl: bump to version 1.2.6
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

For change log, see:
https://www.netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.6.txt

This commit also adds comments in hash file:
- that pgp signature was verified with links
- that the license file hash was locally computed

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnftnl/libnftnl.hash | 7 ++++++-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 0cb3917f2d..5d1aad15d1 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,8 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  966de0a8120c8a53db859889749368bfb2cba0c4f0b4c1a30d264eccc45f1226  libnftnl-1.2.5.tar.xz
+# Checked pgp signature:
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.6.tar.xz.sig
+# with key:
+# https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
+sha256  ceeaea2cd92147da19f13a35a7f1a4bc2767ff897e838e4b479cf54b59c777f4  libnftnl-1.2.6.tar.xz
+# Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index a7045337d0..18be55a17d 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.2.5
+LIBNFTNL_VERSION = 1.2.6
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
