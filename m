Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46370C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBE4960F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBE4960F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EC5605C0;
	Tue,  3 Aug 2021 22:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKlzEERKnzo5; Tue,  3 Aug 2021 22:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27141605CB;
	Tue,  3 Aug 2021 22:04:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93ED61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30589608D0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ahSTK8kS3J0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E3116085C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C4AF0864A8; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:27:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc1c8c3bb1ca4a1f1d2978f3cc100d292c70db8b
X-Git-Newrev: 12551386027dd559554bc70e1c6b644f9af37016
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.C4AF0864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/filemq: bump to
 af4768dcaf2fcb8083a32bad107a22ecb7a5d954
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

commit: https://git.buildroot.net/buildroot/commit/?id=12551386027dd559554bc70e1c6b644f9af37016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This bump will drop -Werror to fix build failure with -DNDEBUG raised
since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

Fixes:
 - http://autobuild.buildroot.org/results/cf4c45ed7ae2c5090ac6ba967497e0d42d5c5224

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/filemq/filemq.hash | 2 +-
 package/filemq/filemq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/filemq/filemq.hash b/package/filemq/filemq.hash
index 611d19208e..cf81eb4f50 100644
--- a/package/filemq/filemq.hash
+++ b/package/filemq/filemq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f3764e1adacfbf7fd09fb9c553e796a80d8159f1ace689fb68307afbc1746d4c  filemq-8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0.tar.gz
+sha256  bdec8584a181e1c9a1d9be567768bcf8c3f7132ea701dd1829f74370c6536991  filemq-af4768dcaf2fcb8083a32bad107a22ecb7a5d954.tar.gz
 sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  LICENSE
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 75d8bd992c..665d6da212 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 8940f34e0f1c8f25c1c693ed8db069f58fbc5ad0
+FILEMQ_VERSION = af4768dcaf2fcb8083a32bad107a22ecb7a5d954
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
