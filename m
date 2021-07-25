Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E63C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1786460BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1786460BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D873D40201;
	Sun, 25 Jul 2021 12:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYLOPS_XZCcQ; Sun, 25 Jul 2021 12:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC8240154;
	Sun, 25 Jul 2021 12:58:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD011BF95A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0D7060688
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyoAOd7GCh-k for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 439F160682
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C4AA88DCB; Sun, 25 Jul 2021 12:23:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:58:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f3c177b4e9736a65f0bf67666ec84392d8c8dff
X-Git-Newrev: dc8b2905f1161918b856a9aff01a0607a50184ab
X-Patchwork-Hint: ignore
Message-Id: <20210725122352.0C4AA88DCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apcupsd: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc8b2905f1161918b856a9aff01a0607a50184ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for apcupsd is added by the services/apcupsd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/apcupsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 9e707e1a5a..34815ffc1c 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -9,6 +9,7 @@ APCUPSD_SITE = http://downloads.sourceforge.net/project/apcupsd/apcupsd%20-%20St
 APCUPSD_LICENSE = GPL-2.0
 APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CPE_ID_VENDOR = apcupsd
+APCUPSD_SELINUX_MODULES = apcupsd
 APCUPSD_CONF_OPTS = --disable-test
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
