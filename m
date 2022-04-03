Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78404C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A5B415D8;
	Sun,  3 Apr 2022 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2qLRt8JYoPM; Sun,  3 Apr 2022 20:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5274C415CD;
	Sun,  3 Apr 2022 20:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B58C1BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28670824F4
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XhzcfgE1Q9rD for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:25:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A3A482422
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0DCB5860FA; Sun,  3 Apr 2022 20:15:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 22:24:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1d80083781f844cc70229c4a592253c9a34cbaa
X-Git-Newrev: 58ab72bb8313aa9be90736c088fe04b199eeaea8
X-Patchwork-Hint: ignore
Message-Id: <20220403201537.0DCB5860FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang: drop unrecognized options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=58ab72bb8313aa9be90736c088fe04b199eeaea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2a3edc5e00b38f4f927894d0911990c9060e4415 forgot to drop
ENABLE_LYD_PRIV and GEN_PYTHON_BINDINGS options which are not recognized
anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libyang/libyang.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 7de9531bff..832adcb627 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -15,13 +15,10 @@ LIBYANG_DEPENDENCIES = pcre2
 HOST_LIBYANG_DEPENDENCIES = host-pcre2
 
 LIBYANG_CONF_OPTS = \
-	-DENABLE_VALGRIND_TESTS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF \
-	-DENABLE_LYD_PRIV=ON
+	-DENABLE_VALGRIND_TESTS=OFF
 
 HOST_LIBYANG_CONF_OPTS = \
-	-DENABLE_VALGRIND_TESTS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF
+	-DENABLE_VALGRIND_TESTS=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
