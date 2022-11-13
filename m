Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0CCC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57D8B4059E;
	Sun, 13 Nov 2022 16:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57D8B4059E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yokRuxG03Ief; Sun, 13 Nov 2022 16:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09CD0405A0;
	Sun, 13 Nov 2022 16:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09CD0405A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9F01BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB0A60759
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB0A60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3bSONy-r6yb for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB6960BC8
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB6960BC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56354836E9; Sun, 13 Nov 2022 16:04:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:01:16 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3d5700d81e9e17ec68d17a3154c72bfbb91b5b70
X-Git-Newrev: aab6601753ff59c775eb387ddddf19224afa7238
X-Patchwork-Hint: ignore
Message-Id: <20221113160416.56354836E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/openvmtools: add
 CPE ID information
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

commit: https://git.buildroot.net/buildroot/commit/?id=aab6601753ff59c775eb387ddddf19224afa7238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

See:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avmware%3Atools

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 267188242e4edcfbca272168e62c2e9bc70864ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvmtools/openvmtools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 59080c05aa..d536e5e819 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -10,6 +10,8 @@ OPENVMTOOLS_SITE = https://github.com/vmware/open-vm-tools/releases/download/sta
 OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
 OPENVMTOOLS_LICENSE = LGPL-2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
+OPENVMTOOLS_CPE_ID_VENDOR = vmware
+OPENVMTOOLS_CPE_ID_PRODUCT = tools
 
 # configure.ac is patched
 OPENVMTOOLS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
