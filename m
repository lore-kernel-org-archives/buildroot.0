Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACDEC4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 21:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0DD4102E;
	Thu,  1 Dec 2022 21:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE0DD4102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahpZhhRInaga; Thu,  1 Dec 2022 21:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 234824048C;
	Thu,  1 Dec 2022 21:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 234824048C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 329E21BF2C5
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B6B94048C
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B6B94048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RO7d7JlxY7Z2 for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 21:21:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 923D540112
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 923D540112
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 21:21:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68FB9C0007;
 Thu,  1 Dec 2022 21:21:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p0qzT-0076lv-3U; Thu, 01 Dec 2022 22:21:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 22:21:04 +0100
Message-Id: <20221201212105.1694279-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/netsnmp: drop autoreconf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 83b4337354014 (package/netsnmp: security bump to version 5.9.3)
dropped the patches, but forgot to remove the autoreconf.  Do so now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 56a07e2ccd..15bc318e36 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -40,7 +40,6 @@ NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true inst
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
-NETSNMP_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
