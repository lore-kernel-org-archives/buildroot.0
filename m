Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8807C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:43:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73AEA61283
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73AEA61283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F370605F4;
	Wed, 21 Jul 2021 21:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXkwZHZ3hhDW; Wed, 21 Jul 2021 21:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92312605D2;
	Wed, 21 Jul 2021 21:43:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93D8E1C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90AE7400F3
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atdgogT0h9qn for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:43:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5201400E1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:43:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 810378462F; Wed, 21 Jul 2021 21:09:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 23:43:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dc1fc23c8ffee0720fa42ca13ec5cd229949c1e
X-Git-Newrev: aa460c23dde2d8b575b7f76d37fcdc4834c2d6a7
X-Patchwork-Hint: ignore
Message-Id: <20210721210928.810378462F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boinc: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa460c23dde2d8b575b7f76d37fcdc4834c2d6a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for boinc is added by the services/boinc module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boinc/boinc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index c8eecdc559..5d9a8abe3b 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -11,6 +11,7 @@ BOINC_SITE = \
 BOINC_LICENSE = LGPL-3.0+
 BOINC_LICENSE_FILES = COPYING COPYING.LESSER
 BOINC_CPE_ID_VENDOR = rom_walton
+BOINC_SELINUX_MODULES = boinc
 BOINC_DEPENDENCIES = host-pkgconf libcurl openssl
 BOINC_AUTORECONF = YES
 BOINC_CONF_ENV = ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
