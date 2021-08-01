Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819E5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C2F560F6F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C2F560F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180AF8448A;
	Wed,  4 Aug 2021 01:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 378Nvh82OITj; Wed,  4 Aug 2021 01:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536B984493;
	Wed,  4 Aug 2021 01:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 121121BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64AC54053D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlLVWVKjSeDE for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE2AE40647
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1F48785E2F; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:59:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d9fa248598da41b3291dde834d87218f5c798d4e
X-Git-Newrev: db380596e3a6b65f6a0272c342ea7247e7305fcd
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.1F48785E2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysstat: add SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=db380596e3a6b65f6a0272c342ea7247e7305fcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
