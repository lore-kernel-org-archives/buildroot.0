Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,URI_NOVOWEL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ABDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:21:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B67160F46
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B67160F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC96C84340;
	Wed,  4 Aug 2021 00:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NroiqfzGORod; Wed,  4 Aug 2021 00:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE8A8433C;
	Wed,  4 Aug 2021 00:21:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE401BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B649F41476
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCOF7QJJggKY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA3A40F25
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0D58E81484; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:59:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8189dc03ad4890842d4764cf7aa4f4856d94d4ba
X-Git-Newrev: bc3dc2b44ba1d80ed93f43a8d43c3d80ff548077
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.0D58E81484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxmlrpc: add option
 to install xmlrpc tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc3dc2b44ba1d80ed93f43a8d43c3d80ff548077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxmlrpc/Config.in    |  9 +++++++++
 package/libxmlrpc/libxmlrpc.mk | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index d24a79163d..f8b8c411e1 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -10,5 +10,14 @@ config BR2_PACKAGE_LIBXMLRPC
 
 	  http://xmlrpc-c.sourceforge.net/
 
+if BR2_PACKAGE_LIBXMLRPC
+
+config BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC
+	bool "install cli tool"
+	help
+	  Command line tool xmlrpc.
+
+endif # BR2_PACKAGE_LIBXMLRPC
+
 comment "libxmlrpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 833dca5065..c1b0eae8ee 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -53,4 +53,16 @@ LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 LIBXMLRPC_INSTALL_TARGET_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(TARGET_DIR) install
 
+ifeq ($(BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC),y)
+define LIBXMLRPC_TOOLS_XMLRPC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBXMLRPC_MAKE_OPTS) -C $(@D)/tools/xmlrpc
+endef
+LIBXMLRPC_POST_BUILD_HOOKS += LIBXMLRPC_TOOLS_XMLRPC_BUILD_CMDS
+define LIBXMLRPC_TOOLS_XMLRPC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LIBXMLRPC_MAKE_OPTS) -C $(@D)/tools/xmlrpc \
+		DESTDIR=$(TARGET_DIR) install
+endef
+LIBXMLRPC_POST_INSTALL_TARGET_HOOKS += LIBXMLRPC_TOOLS_XMLRPC_INSTALL_TARGET_CMDS
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
