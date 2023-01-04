Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCE0C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B40004EBE1;
	Mon, 20 Feb 2023 23:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40004EBE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EO_6HOUvXS-Q; Mon, 20 Feb 2023 23:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 840814ECFF;
	Mon, 20 Feb 2023 23:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 840814ECFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27E7E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25C8B6F971
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C8B6F971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrnrkIdY2eZv for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7976B6F983
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7976B6F983
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 703C28648F; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:45:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aa35d8d071faf68abc4538be2a3bb636ea6b4a2c
X-Git-Newrev: 7aeeb632d66dd59e0dbcff8ad6fee724c4e829d3
X-Patchwork-Hint: ignore
Message-Id: <20230220205223.703C28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmng: fix optional
 dependency to lcms2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7aeeb632d66dd59e0dbcff8ad6fee724c4e829d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

"0ce9b533e3 libmng: new package" introduced a typo that makes the
optional dependency to lcms2 ineffective.

Fix the typo LIBMNG_DEPDENDENCIES -> LIBMNG_DEPENDENCIES.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmng/libmng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmng/libmng.mk b/package/libmng/libmng.mk
index 090fe18380..8ffd74c05b 100644
--- a/package/libmng/libmng.mk
+++ b/package/libmng/libmng.mk
@@ -14,7 +14,7 @@ LIBMNG_LICENSE = libmng license
 LIBMNG_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-LIBMNG_DEPDENDENCIES += lcms2
+LIBMNG_DEPENDENCIES += lcms2
 else
 LIBMNG_CONF_OPTS += --without-lcms2
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
