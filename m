Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCACAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774D960F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 774D960F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42F0A4025C;
	Tue,  3 Aug 2021 21:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WArBAaxIazyN; Tue,  3 Aug 2021 21:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ECAA40266;
	Tue,  3 Aug 2021 21:48:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4886B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FF014035F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kK_fagElQMt0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9DC9404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 404F2873E2; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Jun 2021 22:21:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aad8bbf58842dd62a4911d2c671ad9598e26b459
X-Git-Newrev: 51cc28485e17127807c5e511e02e2f087d32e8c6
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.404F2873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zstd: Simplify
 host-build
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

commit: https://git.buildroot.net/buildroot/commit/?id=51cc28485e17127807c5e511e02e2f087d32e8c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

1.5.0 uses Threads by default for cli tool and DSO,
should not be necessary to do anything special.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zstd/zstd.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 194974147c..2a876376a2 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -78,21 +78,16 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
 endef
 
-# note: only limited 'HAVE_...' options for host library build only
-HOST_ZSTD_OPTS = HAVE_THREAD=1
+HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
 
 define HOST_ZSTD_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		-C $(@D)/lib libzstd.a-mt libzstd-mt
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		-C $(@D) zstd
+		-C $(@D) zstd-release lib-release
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
-		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/programs install
+		-C $(@D) install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
