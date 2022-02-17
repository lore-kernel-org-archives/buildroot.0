Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF72C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CCC84001;
	Thu, 17 Feb 2022 21:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTUbCTIh0NF6; Thu, 17 Feb 2022 21:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A8283FFD;
	Thu, 17 Feb 2022 21:52:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 335CB1C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22A2C6F73B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fd_CODXoPrl9 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F6866F6FE
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:51:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5D9497F8A8; Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:47:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3c1efd5d2e60435f4863b8c2b5a97dc21756810
X-Git-Newrev: 37ba37d516772ade08abf00badc5a6592222972c
X-Patchwork-Hint: ignore
Message-Id: <20220217214408.5D9497F8A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arp-scan: don't override
 ARP_SCAN_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=37ba37d516772ade08abf00badc5a6592222972c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARP_SCAN_CONF_OPTS is wrongly overriden in a conditional since commit
df578c86eddfb5d115195d3650d5ecba5431e8fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/arp-scan/arp-scan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index cc1efe84a7..3fdbd463c2 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -12,7 +12,7 @@ ARP_SCAN_DEPENDENCIES = libpcap
 ARP_SCAN_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-ARP_SCAN_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+ARP_SCAN_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
 
 ARP_SCAN_CONF_ENV = pgac_cv_snprintf_long_long_int_format='%lld'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
