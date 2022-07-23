Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432BAC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DFA4174B;
	Sat, 23 Jul 2022 17:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DFA4174B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pnwR_Fm2Pkz; Sat, 23 Jul 2022 17:21:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A604168B;
	Sat, 23 Jul 2022 17:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A604168B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED68E1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C826D84C19
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C826D84C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpPGCr7XipSi for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:21:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 057A584C18
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057A584C18
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B1F7F8498F; Sat, 23 Jul 2022 17:07:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4f5e5b6a7eca1ca8153c5c654baa9ef50bf7024
X-Git-Newrev: 55b26bdfa19b95a1d7da31e7f1018a5676709039
X-Patchwork-Hint: ignore
Message-Id: <20220723170735.B1F7F8498F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix 2022.08 entries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55b26bdfa19b95a1d7da31e7f1018a5676709039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7763ba7007172ceb5e928ae5902735d727aaa90d wrongly added
BR2_PACKAGE_RTL8723BS below 2022.05 entry instead of 2022.08

Commit 793ee1011e84bd79fa3d146dbe6c14c7fba39648 wrongly duplicated
2022.08 entry

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7349f0b037..53ff1294c7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -159,8 +159,6 @@ config BR2_PACKAGE_PHP_EXT_WDDX
 	help
 	  The WDDX extension was removed from php.
 
-comment "Legacy options removed in 2022.08"
-
 config BR2_nds32
 	bool "nds32 architecture removed"
 	select BR2_LEGACY
@@ -169,8 +167,6 @@ config BR2_nds32
 	  its support being removed from the upstream Linux kernel,
 	  and its lack of maintenance in Buildroot.
 
-comment "Legacy options removed in 2022.05"
-
 config BR2_PACKAGE_RTL8723BS
 	bool "rtl8723bs removed"
 	select BR2_LEGACY
@@ -179,6 +175,8 @@ config BR2_PACKAGE_RTL8723BS
 	  kernels and is not maintained anymore: code has been removed
 	  in 2017 as driver is available in the linux-next tree.
 
+comment "Legacy options removed in 2022.05"
+
 config BR2_PACKAGE_KTAP
 	bool "ktap removed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
