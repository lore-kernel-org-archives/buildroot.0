Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A10C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6882A61050
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 18:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6882A61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3221680F7E;
	Mon,  6 Sep 2021 18:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OuvtaEMdplo; Mon,  6 Sep 2021 18:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C2880F19;
	Mon,  6 Sep 2021 18:50:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAB01BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE88403B4
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 18:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaWm2Sf3Z0wi for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 18:50:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2CE8403D2
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 18:50:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E55F188709; Mon,  6 Sep 2021 18:48:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 20:08:32 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e5a984958d65d3e1f2d249038a5415d20b951c84
X-Git-Newrev: 0eac66e0e9de27e0a118ed4c4cc5c88ba1db39b7
X-Patchwork-Hint: ignore
Message-Id: <20210906184835.E55F188709@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libmodsecurity:
 disable -fPIC on m68k_cf
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

commit: https://git.buildroot.net/buildroot/commit/?id=0eac66e0e9de27e0a118ed4c4cc5c88ba1db39b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This package has -fPIC gcc option set by default but we can't use it on
m68k_cf since it doesn't support it throwing a gcc build failure. So let's
disable it by passing -fno-PIC.

Fixes:
http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/libmodsecurity.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 66e7e522a1..be46eb6e02 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -52,4 +52,14 @@ else
 LIBMODSECURITY_CONF_OPTS += --without-maxmind
 endif
 
+LIBMODSECURITY_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+# m68k_cf can't use -fPIC that libmodsecurity forces to use, so we need
+# to disable it to avoid a build failure.
+ifeq ($(BR2_m68k_cf),y)
+LIBMODSECURITY_CXXFLAGS += -fno-PIC
+endif
+
+LIBMODSECURITY_CONF_OPTS += CXXFLAGS="$(LIBMODSECURITY_CXXFLAGS)"
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
