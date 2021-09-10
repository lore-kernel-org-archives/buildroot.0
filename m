Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B8FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:15:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 616A56121D
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 616A56121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A09B40438;
	Fri, 10 Sep 2021 20:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYkl5VFM-Ydu; Fri, 10 Sep 2021 20:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939E640445;
	Fri, 10 Sep 2021 20:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3A551BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE6F540445
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnqOLEr7BXTl for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:15:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADA7440438
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:15:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5062E88E66; Fri, 10 Sep 2021 20:13:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:14:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5045cab63d0ed033ce1a1b3c7ee6b098ed2abaeb
X-Git-Newrev: b6ff11fd9db0732bf3ba4ccb8cc0f14811f992ae
X-Patchwork-Hint: ignore
Message-Id: <20210910201336.5062E88E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sox: install to staging
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6ff11fd9db0732bf3ba4ccb8cc0f14811f992ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sox also provides one or more libraries with headers, so also install
sox to staging.

Signed-off-by: Adrian Amaglio <nainformatique@gresille.org>
[Giulio: reword commit log]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr:
  - further refine commit log
  - move assignment in a more sensible location
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sox/sox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index dcc1a670b4..4b09b94bc3 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -15,6 +15,7 @@ SOX_CPE_ID_PRODUCT = sound_exchange
 # From git and we're patching configure.ac
 SOX_AUTORECONF = YES
 SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+SOX_INSTALL_STAGING = YES
 
 SOX_IGNORE_CVES += CVE-2017-11332 CVE-2017-11358 CVE-2017-11359 \
 	CVE-2017-15370 CVE-2017-15371 CVE-2017-15372 CVE-2017-15642 \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
