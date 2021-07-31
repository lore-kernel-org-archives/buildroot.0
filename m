Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B436AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 779CC60241
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 779CC60241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DA06402A9;
	Sat, 31 Jul 2021 22:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qxn1jm1H9vT7; Sat, 31 Jul 2021 22:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D8A4014C;
	Sat, 31 Jul 2021 22:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 592061BF95E
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC54540124
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmdpRbKqzUXk for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E80B24014C
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2A5338A3F5; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6b572eb4f35d5385a14760428cc13d9962825a7
X-Git-Newrev: c7981035bd03b22f544278b4d039361b5295d7eb
X-Patchwork-Hint: ignore
Message-Id: <20210731220453.2A5338A3F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/privoxy: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7981035bd03b22f544278b4d039361b5295d7eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for privoxy is added by the services/privoxy module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/privoxy/privoxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index adb5af28ac..c1859ed5f2 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -13,5 +13,6 @@ PRIVOXY_DEPENDENCIES = pcre zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
 PRIVOXY_CPE_ID_VENDOR = privoxy
+PRIVOXY_SELINUX_MODULES = privoxy
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
