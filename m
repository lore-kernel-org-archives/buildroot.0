Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F125C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:48:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2041160EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2041160EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87298378A;
	Tue,  3 Aug 2021 20:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSTZILyfj6oy; Tue,  3 Aug 2021 20:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 632DC83187;
	Tue,  3 Aug 2021 20:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F29171BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF33B4015B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDecQgJccqgj for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:48:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB22400C7
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:48:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 330E58B3CE; Tue,  3 Aug 2021 20:48:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:41:14 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 4b4ac2a50970f71d327c6f04ac61221149f6b94e
X-Git-Newrev: 57c22491e3f3a0897e7c6b92a37dae1c4fddc7a7
X-Patchwork-Hint: ignore
Message-Id: <20210803204800.330E58B3CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libuci: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=57c22491e3f3a0897e7c6b92a37dae1c4fddc7a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
index fcfda95b3a..a8922a96e1 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -8,6 +8,7 @@ LIBUCI_VERSION = 52bbc99f69ea6f67b6fe264f424dac91bde5016c
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
+LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
