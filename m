Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C354C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:14:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2314261038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2314261038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAD10401F8;
	Fri, 13 Aug 2021 13:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YLAEsFkCCgI; Fri, 13 Aug 2021 13:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4ECF401FF;
	Fri, 13 Aug 2021 13:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC4D1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49635401F8
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqsHanjfKOmc for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:14:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60383401FF
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D94CA85AD6; Fri, 13 Aug 2021 13:13:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:14:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d1e863f893a176691bf40ae8298515f8c3fb22c0
X-Git-Newrev: 54a5036562f9fb6c1e953a9ee50074e10197d570
X-Patchwork-Hint: ignore
Message-Id: <20210813131347.D94CA85AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbpf: bump to
 version 0.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=54a5036562f9fb6c1e953a9ee50074e10197d570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License name typo fixed upsteam.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbpf/libbpf.hash | 4 ++--
 package/libbpf/libbpf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 1afda50c9c..afc7aec1bf 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0f97295987c745eb07c48f8db992f7df307b5cd45c9a20eb352ee6d08cf7bd36  libbpf-0.2.tar.gz
+sha256  21cbee4df093e7fd29e76ed429650d3f3abe3a893f35e346ab9bc3484f6e68c0  libbpf-0.4.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
-sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LPGL-2.1
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index a1aeb7d894..3f09cc38dc 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.2
+LIBBPF_VERSION = 0.4.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
-LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LPGL-2.1
+LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
 LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 LIBBPF_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
