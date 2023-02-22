Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0DBC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74B52404D8;
	Wed, 22 Feb 2023 17:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74B52404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8c9TxTZF2hS; Wed, 22 Feb 2023 17:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF7864170E;
	Wed, 22 Feb 2023 17:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF7864170E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DEA1BF97C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E9A7410CA
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9A7410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ek8Up7nNEN8W for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3912C40E47
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3912C40E47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23AFF867D1; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:37:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4f63e64d9c8782987c2fc1fafe3ada2f8762e809
X-Git-Newrev: 0a54bc3316155ae95eefc597d5780cb5d3078e13
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.23AFF867D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/fwts: use ifeq
 instead of ifdef
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a54bc3316155ae95eefc597d5780cb5d3078e13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The conditional code using ifdef was added in 2018 and works as
expected.
But there is no reason to use ifdef instead of ifeq.

For consistence, switch to use ifeq like almost all packages already do.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6ae82531928662764536cadbe2d6f3c558e7de2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/fwts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 6634cdc40e..cd9bccae2c 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -15,7 +15,7 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
-ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+ifeq ($(BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE),y)
 FWTS_MODULE_SUBDIRS = efi_runtime
 $(eval $(kernel-module))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
