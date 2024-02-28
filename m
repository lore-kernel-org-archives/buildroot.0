Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA2C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5806A416C2;
	Wed, 28 Feb 2024 21:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WxqwuynKa-9Z; Wed, 28 Feb 2024 21:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D30541781
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D30541781;
	Wed, 28 Feb 2024 21:27:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07F801BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90137403FB
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5X43utezn9l for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1D5041665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1D5041665
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CFBF87CDB; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:15:04 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 876a47e0f4b60e45d7f771771ba61795a1cc045c
X-Git-Newrev: 8dedc1329fe28b59c6a8014cc81ed6e40d86b13b
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.9CFBF87CDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wireless-regdb:
 drop WIRELESS_REGDB_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dedc1329fe28b59c6a8014cc81ed6e40d86b13b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:kernel:wireless-regdb added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:kernel:wireless-regdb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 05617160dd0bc4aef6cc91930d7985009e854142)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireless-regdb/wireless-regdb.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index e9003ce2e6..5c8ef96398 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -9,7 +9,6 @@ WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
-WIRELESS_REGDB_CPE_ID_VENDOR = kernel
 
 ifeq ($(BR2_PACKAGE_CRDA),y)
 define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
