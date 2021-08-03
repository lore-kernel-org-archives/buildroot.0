Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E926C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:49:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE2060ED6
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFE2060ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA612605C0;
	Tue,  3 Aug 2021 20:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xnY_LjKdU90; Tue,  3 Aug 2021 20:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DFCE608C6;
	Tue,  3 Aug 2021 20:49:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4591BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 076CA400E7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RglKUBZKz8kX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:48:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 151E1400C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 671B28B3E2; Tue,  3 Aug 2021 20:48:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:41:08 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 46c475f3f41b4682f8c7ad808f72f833a5a26b1c
X-Git-Newrev: 8cbd69147887b6cd6cd953c436e7caf8b2f25e75
X-Patchwork-Hint: ignore
Message-Id: <20210803204805.671B28B3E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libuci: add
 LIBUCI_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cbd69147887b6cd6cd953c436e7caf8b2f25e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:openwrt:libuci is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenwrt%3Alibuci

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9852113fcd2cd0e98ee7222af5ed9dc2b1df42b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuci/libuci.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 55afd53c10..dc9b999787 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -7,6 +7,7 @@
 LIBUCI_VERSION = 49ec6efbdac4819033d34f08927d795f83a3932d
 LIBUCI_SITE = git://git.openwrt.org/project/uci.git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
+LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
