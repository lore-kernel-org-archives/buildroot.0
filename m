Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB84C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:17:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C7F60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16C7F60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5BB1405D5;
	Tue,  3 Aug 2021 21:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkSCyV0xhtk1; Tue,  3 Aug 2021 21:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E34B3405A5;
	Tue,  3 Aug 2021 21:17:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE0E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90CE660662
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mq1YaVvASQOW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6C8C60673
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4A0118B43E; Tue,  3 Aug 2021 21:09:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 May 2021 13:58:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fffc5534854b7077bd534dde9005f34d4b3025d8
X-Git-Newrev: fd7312940aeffe015592396a9b24e014839e0eb3
X-Patchwork-Hint: ignore
Message-Id: <20210803210938.4A0118B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Makefile: add new missing-cpe
 target
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd7312940aeffe015592396a9b24e014839e0eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It invokes the recently introduced gen-missing-cpe script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index 76f14888ea..75ef7f5eb5 100644
--- a/Makefile
+++ b/Makefile
@@ -945,6 +945,14 @@ pkg-stats:
 		--html $(O)/pkg-stats.html \
 		--nvd-path $(DL_DIR)/buildroot-nvd
 
+.PHONY: missing-cpe
+missing-cpe:
+	$(Q)mkdir -p $(O)/cpe-updates
+	$(Q)cd "$(CONFIG_DIR)" ; \
+	$(TOPDIR)/support/scripts/gen-missing-cpe \
+		--nvd-path $(DL_DIR)/buildroot-nvd \
+		--output $(O)/cpe-updates
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # Some subdirectories are also package names. To avoid that "make linux"
@@ -1163,6 +1171,7 @@ help:
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
+	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
