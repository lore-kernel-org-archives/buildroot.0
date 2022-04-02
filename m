Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C16C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAFC83F79;
	Sat,  2 Apr 2022 17:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InRhbkLgLYdm; Sat,  2 Apr 2022 17:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C2683F6B;
	Sat,  2 Apr 2022 17:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13AB91BF968
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC5240256
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKLvGF_2xIw8 for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:29:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A6C40123
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5B74C841D2; Sat,  2 Apr 2022 17:20:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Apr 2022 19:28:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05f1a88f4979fda312264e0492d5892ddc9674d2
X-Git-Newrev: 15f76e16b30aa7555aa84c71b42bfda69c5ebda7
X-Patchwork-Hint: ignore
Message-Id: <20220402172009.5B74C841D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr-util: change URL from http to
 https
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

commit: https://git.buildroot.net/buildroot/commit/?id=15f76e16b30aa7555aa84c71b42bfda69c5ebda7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apr-util/Config.in   | 2 +-
 package/apr-util/apr-util.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 6c5e3bbdf5..c1a967bdec 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_APR_UTIL
 	help
 	  The utility library for the apache runtime project
 
-	  http://apr.apache.org/
+	  https://apr.apache.org
 
 comment "apr-util needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index cf8407ced0..fb0735f5e7 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -6,7 +6,7 @@
 
 APR_UTIL_VERSION = 1.6.1
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
-APR_UTIL_SITE = http://archive.apache.org/dist/apr
+APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
