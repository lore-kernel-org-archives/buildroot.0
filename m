Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A521BC4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FEB60F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68FEB60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462C883CB4;
	Wed,  4 Aug 2021 18:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIGuRACSlhOr; Wed,  4 Aug 2021 18:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55E083CC9;
	Wed,  4 Aug 2021 18:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 719A71BF381
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 449D083A7E
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSNet99u0mRg for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:06:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E9B583B2B
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AC6CF8B618; Wed,  4 Aug 2021 18:06:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 19:46:41 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9d8a996ad554e5d4f76d833519cbec31590e936e
X-Git-Newrev: 6a02b01f74675825da7a91ec8ae23fa0c04e2b2b
X-Patchwork-Hint: ignore
Message-Id: <20210804180635.AC6CF8B618@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dnsmasq: add
 SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a02b01f74675825da7a91ec8ae23fa0c04e2b2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Support for dnsmasq is added by the services/dnsmasq module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 68d886c4ea74601aca1f9ed0249f4a71f74d8aa3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 2006757590..972be10935 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -15,6 +15,7 @@ DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 DNSMASQ_CPE_ID_VENDOR = thekelleys
+DNSMASQ_SELINUX_MODULES = dnsmasq
 
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
