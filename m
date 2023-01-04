Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B8EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9394F06A;
	Tue, 21 Feb 2023 00:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9394F06A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3yLHgLUn4Do; Tue, 21 Feb 2023 00:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674D84F082;
	Tue, 21 Feb 2023 00:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674D84F082
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29BB71BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B9E6FA00
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48B9E6FA00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1x2hxSuhN8d2 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DBA961B07
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DBA961B07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DF09828C8; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:56:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec6e8c632bf372c1fad7889ca6323166b90e1599
X-Git-Newrev: 1ad6b4e10e4538532c00f8c04363da64f19c313a
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.7DF09828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libtalloc: drop bogus
 LIBTALLOC_{C, LD}FLAGS
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
