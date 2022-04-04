Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A74DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45DBA4092A;
	Mon,  4 Apr 2022 19:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbwAiADHpsWI; Mon,  4 Apr 2022 19:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2565E40448;
	Mon,  4 Apr 2022 19:35:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2591BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE6581882
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTW-iNeifYcH for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:34:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0173C8175A
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:34:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4DECC825FC; Mon,  4 Apr 2022 19:25:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:32:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3e36fa4c2200c63d7cae2239b5e9b82f008509b7
X-Git-Newrev: 371e42df5e3dfd87640f75f5505149e45ed28f78
X-Patchwork-Hint: ignore
Message-Id: <20220404192529.4DECC825FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libyang: drop
 unrecognized options
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

commit: https://git.buildroot.net/buildroot/commit/?id=371e42df5e3dfd87640f75f5505149e45ed28f78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 2a3edc5e00b38f4f927894d0911990c9060e4415 forgot to drop
ENABLE_LYD_PRIV and GEN_PYTHON_BINDINGS options which are not recognized
anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 58ab72bb8313aa9be90736c088fe04b199eeaea8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
