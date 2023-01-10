Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F5EC5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DEEA60B43;
	Wed, 11 Jan 2023 09:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DEEA60B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5WatSOltRfO; Wed, 11 Jan 2023 09:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA34760B2A;
	Wed, 11 Jan 2023 09:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA34760B2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED0F1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D8C360B25
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D8C360B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n__7GTQjOZP8 for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF9260B2A
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF9260B2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48BA887815; Wed, 11 Jan 2023 09:25:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 22:40:33 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: c694e0787b49f040843b4388c7513c93094be20b
X-Git-Newrev: a69e24cf2044f0ff29acef53a41041750cfc6e7e
X-Patchwork-Hint: ignore
Message-Id: <20230111092533.48BA887815@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libmng: fix
 optional dependency to lcms2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a69e24cf2044f0ff29acef53a41041750cfc6e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

"0ce9b533e3 libmng: new package" introduced a typo that makes the
optional dependency to lcms2 ineffective.

Fix the typo LIBMNG_DEPDENDENCIES -> LIBMNG_DEPENDENCIES.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7aeeb632d66dd59e0dbcff8ad6fee724c4e829d3)
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
