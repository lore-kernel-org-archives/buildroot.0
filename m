Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014D3C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:14:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5FBA61057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 18:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5FBA61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87DB7834B9;
	Sat,  7 Aug 2021 18:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSKOQE_oe4AN; Sat,  7 Aug 2021 18:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2322827B5;
	Sat,  7 Aug 2021 18:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B151B1BF964
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EFA840330
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 18:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnKWo_RrACid for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2335403BF
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 18:11:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D47E83FF0; Sat,  7 Aug 2021 18:11:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:56:34 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: bde89f9a0fa34e07a7203e73b489d8569498ac46
X-Git-Newrev: 1f4fad7c587b140ee301cc28bd083a32e520aea6
X-Patchwork-Hint: ignore
Message-Id: <20210807181139.0D47E83FF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ibrdtn-tools: fix
 build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f4fad7c587b140ee301cc28bd083a32e520aea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 278072520c76bae03916cdcd2f5d3324f4626c5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ibrdtn-tools/ibrdtn-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
index 97ec3c9e17..77dbfc1032 100644
--- a/package/ibrdtn-tools/ibrdtn-tools.mk
+++ b/package/ibrdtn-tools/ibrdtn-tools.mk
@@ -9,6 +9,7 @@ IBRDTN_TOOLS_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTN_TOOLS_LICENSE = Apache-2.0
 IBRDTN_TOOLS_LICENSE_FILES = COPYING
 IBRDTN_TOOLS_DEPENDENCIES = ibrcommon ibrdtn host-pkgconf
+IBRDTN_TOOLS_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 IBRDTN_TOOLS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
