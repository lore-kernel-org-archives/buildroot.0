Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748E1ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 18:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0513F84039;
	Sat, 17 Sep 2022 18:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0513F84039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzai8mXCLoyd; Sat, 17 Sep 2022 18:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4534984032;
	Sat, 17 Sep 2022 18:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4534984032
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 058241BF335
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E292D84019
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 18:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E292D84019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oL8IvbuAHr1W for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 18:46:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BDE083EB2
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BDE083EB2
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:46:03 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id ABB48CB833
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 18:42:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BFA5F200005;
 Sat, 17 Sep 2022 18:42:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oZcln-009TO8-Kb; Sat, 17 Sep 2022 20:42:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 20:42:23 +0200
Message-Id: <20220917184224.2257865-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmdbx: drop explicit _REDISTRIBUTE =
 YES
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
Cc: Leonid Yuriev <leo@yuriev.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

<pkg>_REDISTRIBUTE defaults to YES, so no need to explicitly set it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 018c0db840..357b1bac9e 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -10,7 +10,6 @@ LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBMDBX_LICENSE = OLDAP-2.8
 LIBMDBX_LICENSE_FILES = LICENSE
-LIBMDBX_REDISTRIBUTE = YES
 LIBMDBX_STRIP_COMPONENTS = 0
 LIBMDBX_INSTALL_STAGING = YES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
