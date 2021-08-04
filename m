Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B5EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:36:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD3B61029
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD3B61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF9A405EE;
	Wed,  4 Aug 2021 20:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ix94OPFXg8ei; Wed,  4 Aug 2021 20:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5131140697;
	Wed,  4 Aug 2021 20:36:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B77C1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AB1D40697
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dQmOFrrf_rt for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:36:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FF5A405F0
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:36:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75CB88B769; Wed,  4 Aug 2021 20:36:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:04:37 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d924dbcf034b742fbb93258ac5d5d0468c1c4202
X-Git-Newrev: 5f78aaa18a833212a260e0ab42413bcda1724467
X-Patchwork-Hint: ignore
Message-Id: <20210804203610.75CB88B769@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/boinc: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f78aaa18a833212a260e0ab42413bcda1724467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Support for boinc is added by the services/boinc module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aa460c23dde2d8b575b7f76d37fcdc4834c2d6a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
