Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D9EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:07:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC54760F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC54760F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7CB88447B;
	Wed,  4 Aug 2021 01:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgF9kfDCngAF; Wed,  4 Aug 2021 01:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03BBC84446;
	Wed,  4 Aug 2021 01:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C1C41BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0239B414B8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB9DvFPIXkBC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 783E2414CD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCDD8878C2; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:14:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 61a47bb1037ac20772f4e0106aab956adffeee12
X-Git-Newrev: c1d8b030707dcf45313d0a0c703716c2acb677e6
X-Patchwork-Hint: ignore
Message-Id: <20210803211026.BCDD8878C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/proftpd: add SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1d8b030707dcf45313d0a0c703716c2acb677e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for proftpd is added by the services/ftp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/proftpd/proftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 7dc3f267e0..64c16a84eb 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -9,6 +9,7 @@ PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
 PROFTPD_CPE_ID_VENDOR = proftpd
+PROFTPD_SELINUX_MODULES = ftp
 
 PROFTPD_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
