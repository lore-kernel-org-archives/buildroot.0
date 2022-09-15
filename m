Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8C9C6FA89
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 14:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB871410BB;
	Thu, 15 Sep 2022 14:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB871410BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id de1NiBTTsMhu; Thu, 15 Sep 2022 14:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F307410B6;
	Thu, 15 Sep 2022 14:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F307410B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46FFB1BF2FB
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A083410B7
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 14:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A083410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCloYakhk4QG for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 14:03:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5143D4108E
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 14:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5143D4108E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 40C5883C75; Thu, 15 Sep 2022 14:03:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 16:03:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a4706e9b8c4477c71ce8b36f20c965b10809dde4
X-Git-Newrev: a34a180f4ccbabbd783f6574228fabd551ae4558
X-Patchwork-Hint: ignore
Message-Id: <20220915140350.40C5883C75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-txdbus:
 drop comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=a34a180f4ccbabbd783f6574228fabd551ae4558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 69cbdbe8877f5ee1e51d05cfe71b636635df9c3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txdbus/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
index f3ea4c78d6..e299596611 100644
--- a/package/python-txdbus/Config.in
+++ b/package/python-txdbus/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_TXDBUS
 	bool "python-txdbus"
 	# python-twisted -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-twisted -> python-cryptography
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
