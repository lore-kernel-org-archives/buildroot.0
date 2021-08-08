Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923D3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:27:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206A360243
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 206A360243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA4B76069F;
	Sun,  8 Aug 2021 20:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbTK4OHodMkX; Sun,  8 Aug 2021 20:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4B5605EA;
	Sun,  8 Aug 2021 20:27:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E03091BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0196605EA
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bn0exlHBR--3 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:27:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3483060590
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:27:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC0D08A425; Sun,  8 Aug 2021 20:26:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:26:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f979d4906482147b913585a3b89bffaf29ca554
X-Git-Newrev: 93be993591d2f45bbcab7cb88271ff081dec9bac
X-Patchwork-Hint: ignore
Message-Id: <20210808202643.CC0D08A425@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: fix rdisc server option
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

commit: https://git.buildroot.net/buildroot/commit/?id=93be993591d2f45bbcab7cb88271ff081dec9bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 95b0078cc089b48be8973b9507599cc836397869 wrongly added
BUILD_RDISC_SERVER instead of ENABLE_RDISC_SERVER:

WARNING: Unknown options: "BUILD_RDISC_SERVER"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 6e182e6a70..5721436221 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -23,7 +23,7 @@ IPUTILS_CONF_OPTS += \
 	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
 	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
 	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
-	-DBUILD_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
+	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
 	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
 	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
