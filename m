Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB8DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE19360F55
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE19360F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7558140469;
	Sun,  1 Aug 2021 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_slZrSRQte1; Sun,  1 Aug 2021 21:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D91244045B;
	Sun,  1 Aug 2021 21:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2351BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03BF3605AA
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pNvSIVy2pMTB for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:02:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F5B606ED
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4A71E8A501; Sun,  1 Aug 2021 21:02:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:59:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9fa248598da41b3291dde834d87218f5c798d4e
X-Git-Newrev: db380596e3a6b65f6a0272c342ea7247e7305fcd
X-Patchwork-Hint: ignore
Message-Id: <20210801210232.4A71E8A501@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysstat: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=db380596e3a6b65f6a0272c342ea7247e7305fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for sysstat is added by the services/sysstat module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysstat/sysstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 8ec4966813..6948f6b390 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -12,6 +12,7 @@ SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
 SYSSTAT_CPE_ID_VENDOR = sysstat_project
+SYSSTAT_SELINUX_MODULES = sysstat
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 SYSSTAT_DEPENDENCIES += lm-sensors
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
