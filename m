Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6F3C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:20:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D1860F9B
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60D1860F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF0040375;
	Mon, 26 Jul 2021 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ox7ZdBsw765r; Mon, 26 Jul 2021 20:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 910BE4036A;
	Mon, 26 Jul 2021 20:20:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB1A1BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C06583112
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VufC4-d97Rc8 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C64B482FCB
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3EA7088EF5; Mon, 26 Jul 2021 19:40:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a73a2d4aff98012606572d4fd3b6e300ef54f991
X-Git-Newrev: 6aeee4007322574083533a71c2be9a74e2faed55
X-Patchwork-Hint: ignore
Message-Id: <20210726194026.3EA7088EF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=6aeee4007322574083533a71c2be9a74e2faed55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for exim is added by the services/exim module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/exim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index dd39208469..bfb14dcb23 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -10,6 +10,7 @@ EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
 EXIM_CPE_ID_VENDOR = exim
+EXIM_SELINUX_MODULES = exim
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
