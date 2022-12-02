Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B184C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51604C62F;
	Mon, 20 Feb 2023 21:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51604C62F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXg4uZ768X5i; Mon, 20 Feb 2023 21:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C8D4C567;
	Mon, 20 Feb 2023 21:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C8D4C567
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2008F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 485B3610CA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485B3610CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9RZp3mvbQXo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FA3610D3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FA3610D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 271A4828C8; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Dec 2022 19:38:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0b71948c32bdc7f849190cb9501f72faa608dc17
X-Git-Newrev: 1ad6bc2f587a31c7e1475103a59c93f6a398e8ae
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.271A4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netsnmp: drop
 autoreconf
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ad6bc2f587a31c7e1475103a59c93f6a398e8ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
