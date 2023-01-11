Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A03C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE24941044;
	Wed, 11 Jan 2023 09:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE24941044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCgtIjscXxpP; Wed, 11 Jan 2023 09:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A1BF41066;
	Wed, 11 Jan 2023 09:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1BF41066
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04F871BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F0B040526
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0B040526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kD4bQJanSEBV for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADBDF4056F
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADBDF4056F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABE3F878E0; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:19:03 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8a2e60a43d9473f00ed5cf9b2c768d7447fa908b
X-Git-Newrev: 5e84cc96b255fa7a7190d29b2bff7cca0f775cbd
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.ABE3F878E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libtalloc: drop
 bogus LIBTALLOC_{C, LD}FLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e84cc96b255fa7a7190d29b2bff7cca0f775cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "f0d37e275a package/libtalloc: new package" added these symbols
but they are not used in the package and also not recognized by the waf
package infra.

So drop the ignored symbols.

Cc: David GOUARIN <dgouarin@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1ad6b4e10e4538532c00f8c04363da64f19c313a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtalloc/libtalloc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 8cba699ea1..c6d69a616c 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -25,8 +25,6 @@ LIBTALLOC_CONF_OPTS += --cross-compile \
 		--with-libiconv=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
-LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
