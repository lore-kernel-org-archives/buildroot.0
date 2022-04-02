Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02B7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F9C60D70;
	Sat,  2 Apr 2022 17:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHHbkdmasNTD; Sat,  2 Apr 2022 17:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FEEE60BDB;
	Sat,  2 Apr 2022 17:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22CCC1BF973
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10B7383F6B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlmFaXbmqdvI for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:29:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBF583F65
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4D5328417C; Sat,  2 Apr 2022 17:20:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Apr 2022 19:28:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6626bf7c5fc1f5f47fcade03090de212a6121db3
X-Git-Newrev: 05f1a88f4979fda312264e0492d5892ddc9674d2
X-Patchwork-Hint: ignore
Message-Id: <20220402172009.4D5328417C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr: change URL from http to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=05f1a88f4979fda312264e0492d5892ddc9674d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apr/Config.in | 2 +-
 package/apr/apr.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apr/Config.in b/package/apr/Config.in
index 67de925474..4606fc5378 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_APR
 	  predictable and consistent interface to underlying
 	  platform-specific implementations
 
-	  http://apr.apache.org/
+	  https://apr.apache.org
 
 comment "apr needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index c45829aacc..7ff2c007b4 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -6,7 +6,7 @@
 
 APR_VERSION = 1.7.0
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
-APR_SITE = http://archive.apache.org/dist/apr
+APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
 APR_LICENSE_FILES = LICENSE
 APR_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
