Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E79EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:39:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9BC61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC9BC61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E8383DE6;
	Tue,  3 Aug 2021 23:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fI_guSCAF9gf; Tue,  3 Aug 2021 23:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCFB83DE1;
	Tue,  3 Aug 2021 23:38:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F202F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 587D740F0B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEwQbdAmIQVT for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18D1C40E98
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D3BF86A84; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 09:42:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6202ba67b74e9de7099df8b98e3db8d33490996a
X-Git-Newrev: 9852113fcd2cd0e98ee7222af5ed9dc2b1df42b9
X-Patchwork-Hint: ignore
Message-Id: <20210803211006.6D3BF86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libuci: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=9852113fcd2cd0e98ee7222af5ed9dc2b1df42b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:openwrt:libuci is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenwrt%3Alibuci

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
