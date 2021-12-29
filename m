Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A21C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1485940183;
	Wed, 29 Dec 2021 09:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T33jdJkpiqI5; Wed, 29 Dec 2021 09:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 274534012E;
	Wed, 29 Dec 2021 09:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 556E11BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D4AC4012E
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcdfr8kChrX7 for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:56:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4755440022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:56:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2VgfnzT5xR1a12VgfnUmp4; Wed, 29 Dec 2021 10:56:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640771761; bh=/mTOdg5Gl3ubV6xxEz6NpOBnZcX52JmST6wdsSH3XGE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Jat6RwihP3ZMh8d6WqfQBvWvKY/rrpAk6xNz0nTb92AxRSplkUYgQPvt7NpPPszP4
 NW87VsFs9rYi7ZMRvsrR7JGVrrmE6B2xf8Jzvtri5BWXkS6qOI3GNhO+CAHOSC6/97
 p1oZSvjNiexW/rjVin40zBlEhvd22Q5nijp3Avwt7H4Pq4vrJ7ILVaZhEchSj3nd6e
 NvfS+wu4PUHxXP6Z8yOoSDFU67cGrcy0eg3TS3Ih+E3QfWlWP0revPARObW81ZUSJ4
 xTR688Y040/2NKb+41b5Va1vt5vgJszZyPFrY5zNX8p6AMBh1BljT3TXXinBzULXiq
 esdmGQtFue9SQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:56:00 +0100
Message-Id: <20211229095600.212449-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPPFYaHkxtC2PqwGhyvHKZDCmylObE1kDJv8ZOoN2Hu34dFeKH/4FNS+jKnLaW1659Ed8eBziatmtyL7KFBRehTtXlwx/mnKu+6SWa4j9kLiFkGCD/wX
 rpgB8V6t94g7FLtdh5Q7bLc4YBA2tQizi8FtD6sqIDCEr6svkLCwt8KEMG9Zx4f566AQxJiwMXFmtieGsXIXKJJ+LLJpazY52wVPoIKCLpvVyNB0iwQ1lQPr
 X2IfqGScIiUp0g/PoRg8H0zmjVSjiyWwnNJwdZxM8AZ5FxkDXn+dgCIROvBUurbl4EhjLFLk+6j4gH4BcI/Wfw==
Subject: [Buildroot] [PATCH] package/glibmm: needs BR2_TOOLCHAIN_HAS_SYNC_4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_TOOLCHAIN_HAS_SYNC_4 and restyle the with "|| \" form.

Fixes:
http://autobuild.buildroot.net/results/6a2/6a2709956fbb16ac3cbf676acb242c88f83fcdae/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/glibmm/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
index 2dfc861817..1b27f8cbb1 100644
--- a/package/glibmm/Config.in
+++ b/package/glibmm/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSIGC
@@ -14,5 +15,6 @@ config BR2_PACKAGE_GLIBMM
 
 comment "glibmm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
