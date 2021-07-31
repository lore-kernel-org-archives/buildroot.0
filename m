Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C383BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:59:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BEA260F38
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BEA260F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D86C40630;
	Wed,  4 Aug 2021 00:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0Qk_yfsUNNL; Wed,  4 Aug 2021 00:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73BDF40330;
	Wed,  4 Aug 2021 00:59:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3BD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8132D40F27
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om2426Dy1AFZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ECAA41468
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DFB3887C2D; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 11:11:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7905ac1f3458e9eea9762101625d372d6311ad79
X-Git-Newrev: b3a68c2cf8695b156a215fa6d0dcb7bfa7df44e5
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.DFB3887C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/apcupsd: fix SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3a68c2cf8695b156a215fa6d0dcb7bfa7df44e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add apache module as for now it is unconditionally used in apcupsd.fc to
fix build failure raised since dc8b2905f1161918b856a9aff01a0607a50184ab

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/apcupsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 34815ffc1c..502d1b7152 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -9,7 +9,7 @@ APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20St
 APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CPE_ID_VENDOR = apcupsd
-APCUPSD_SELINUX_MODULES = apcupsd
+APCUPSD_SELINUX_MODULES = apache apcupsd
 APCUPSD_CONF_OPTS = --disable-test
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
