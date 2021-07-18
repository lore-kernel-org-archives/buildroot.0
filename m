Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D221EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:47:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCA960F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DCA960F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561654059E;
	Tue,  3 Aug 2021 23:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVNmquZEm_Fu; Tue,  3 Aug 2021 23:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F1144052E;
	Tue,  3 Aug 2021 23:47:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 129431BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C96940F3D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0XMadwdIz8H for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7018840EC5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C525D86AA7; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:26:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f6cd888f4d0befd179693bb4f6d7f5d50e7864b
X-Git-Newrev: a9f273b6730bbf027200ddd662748a26fcabb922
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.C525D86AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flannel: bump version
 to 0.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9f273b6730bbf027200ddd662748a26fcabb922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump flannel version from 0.12.0 to 0.14.0.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 8195140f8e..0d0f75e6b4 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 7375318b288bcff733aabfe1a1007d478cb9091cdaffe68c8253ddd93bc070ed v0.12.0.tar.gz
+sha256 e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca v0.14.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index a8a3c7a3cd..231cf90dfd 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = 0.12.0
+FLANNEL_VERSION = 0.14.0
 FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
 FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
