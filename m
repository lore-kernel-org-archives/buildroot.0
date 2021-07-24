Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F98C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:25:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB13608FB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AB13608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9FA5835CA;
	Sat, 24 Jul 2021 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3RGysV-WoAa; Sat, 24 Jul 2021 20:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5547B835C8;
	Sat, 24 Jul 2021 20:25:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8C3E1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990EE400CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prq-_zF77dp2 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 294EA400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 65C348899E; Sat, 24 Jul 2021 19:49:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:22:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3c31814adaa3e773c310cd97e28ffea9b980a10
X-Git-Newrev: 8c474ffaad158230bf2d04ccf0544f5b3b1d5738
X-Patchwork-Hint: ignore
Message-Id: <20210724194941.65C348899E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: add SELinux refpolicy
 module
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c474ffaad158230bf2d04ccf0544f5b3b1d5738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SELinux support for stunnel is added by the services/stunnel refpolicy
module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stunnel/stunnel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 68d3c85534..cf2e29cb9b 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -16,6 +16,7 @@ STUNNEL_CONF_ENV = \
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
 STUNNEL_CPE_ID_VENDOR = stunnel
+STUNNEL_SELINUX_MODULES = stunnel
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
