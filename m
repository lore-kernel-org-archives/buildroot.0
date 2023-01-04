Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18FBC46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 823F282052;
	Wed,  4 Jan 2023 22:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 823F282052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH_vLmsEDyfR; Wed,  4 Jan 2023 22:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14DD8204B;
	Wed,  4 Jan 2023 22:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D14DD8204B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 889ED1BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6413D82051
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6413D82051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDXxUacmTZ4I for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D2B78204B
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D2B78204B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AD51875A9; Wed,  4 Jan 2023 22:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:56:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec6e8c632bf372c1fad7889ca6323166b90e1599
X-Git-Newrev: 1ad6b4e10e4538532c00f8c04363da64f19c313a
X-Patchwork-Hint: ignore
Message-Id: <20230104220538.8AD51875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtalloc: drop bogus LIBTALLOC_{C,
 LD}FLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ad6b4e10e4538532c00f8c04363da64f19c313a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "f0d37e275a package/libtalloc: new package" added these symbols
but they are not used in the package and also not recognized by the waf
package infra.

So drop the ignored symbols.

Cc: David GOUARIN <dgouarin@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtalloc/libtalloc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 75d3da263b..ca15180d22 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -31,8 +31,6 @@ LIBTALLOC_CONF_OPTS += --cross-compile \
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
