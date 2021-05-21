Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D95C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7416E6104F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7416E6104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE494159F;
	Tue,  3 Aug 2021 22:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNeOr8BSNsJv; Tue,  3 Aug 2021 22:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CDC41593;
	Tue,  3 Aug 2021 22:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8111BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7F60405C5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62VR16iGKZ6x for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 219BE404B4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7896D7FCEC; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 May 2021 22:33:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 48fd63e50440aabf463a65a9d7c5c32ba46f6af7
X-Git-Newrev: 96c23d1d0f5fbe3da903507afa39393be844b565
X-Patchwork-Hint: ignore
Message-Id: <20210803210943.7896D7FCEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/runc: security bump to
 version 1.0.0-rc95
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

commit: https://git.buildroot.net/buildroot/commit/?id=96c23d1d0f5fbe3da903507afa39393be844b565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2021-30465: runc 1.0.0-rc94 and earlier are vulnerable to a symlink
exchange attack whereby an attacker can request a seemingly-innocuous container
configuration that actually results in the host filesystem being bind-mounted
into the container, allowing for a container escape.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d792947d5f..598bd3067f 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	28378df983a3c586ed3ec8c76a774a9b10f36a0c323590a284b801cce95cc61f  runc-1.0.0-rc92.tar.gz
+sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 14689bbde1..62b9f09bf2 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUNC_VERSION_MAJOR = 1.0.0
-RUNC_VERSION_MINOR = rc92
+RUNC_VERSION_MINOR = rc95
 RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
