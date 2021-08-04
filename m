Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3847C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:45:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3DA660ED6
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3DA660ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AD7040566;
	Wed,  4 Aug 2021 19:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrbnK5FOWBTf; Wed,  4 Aug 2021 19:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D1E74055C;
	Wed,  4 Aug 2021 19:45:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C03D1BF3FB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4421660645
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8yGQEFgitri for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:43:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4328F60A66
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:43:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 568D68B6DD; Wed,  4 Aug 2021 19:42:51 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 21:42:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 613827c5b0a2bf71320047954639dc9003524db0
X-Git-Newrev: a778fbb8ad794ea513101c493971497e20f1bbec
X-Patchwork-Hint: ignore
Message-Id: <20210804194251.568D68B6DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wine: add SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=a778fbb8ad794ea513101c493971497e20f1bbec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for wine is added by the apps/wine module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 08eadb5b7c..c925a58632 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,6 +10,7 @@ WINE_SITE = https://dl.winehq.org/wine/source/6.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
+WINE_SELINUX_MODULES = wine
 WINE_DEPENDENCIES = host-bison host-flex host-wine
 HOST_WINE_DEPENDENCIES = host-bison host-flex
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
