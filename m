Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F6FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:14:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6653360EFD
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6653360EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F3D440137;
	Sun,  1 Aug 2021 14:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZP5F4BbdzrQs; Sun,  1 Aug 2021 14:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA24340502;
	Sun,  1 Aug 2021 14:14:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 502491BF31A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E4D240109
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lzRZeyPhvQd for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 14:11:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A81400FC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 14:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F31A58A470; Sun,  1 Aug 2021 14:11:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 16:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcf01c247d1501ad4071364eaa1db0e5470cbc4a
X-Git-Newrev: b966e655b1f868a88251b5b95d8e62a8e4781634
X-Patchwork-Hint: ignore
Message-Id: <20210801141122.F31A58A470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: cli tool needs dynamic
 library
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b966e655b1f868a88251b5b95d8e62a8e4781634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cli tool, added in commit bc3dc2b44ba1d80ed93f43a8d43c3d80ff548077,
needs dynamic library

Fixes:
 - http://autobuild.buildroot.org/results/18a1a45a0fda7fc95e9d865b4b8a90a99494717e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxmlrpc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index f8b8c411e1..33d512328e 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -14,9 +14,13 @@ if BR2_PACKAGE_LIBXMLRPC
 
 config BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC
 	bool "install cli tool"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Command line tool xmlrpc.
 
+comment "cli tool needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif # BR2_PACKAGE_LIBXMLRPC
 
 comment "libxmlrpc needs a toolchain w/ threads"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
