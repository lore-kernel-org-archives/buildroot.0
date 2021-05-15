Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914E9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B1FF60F22
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B1FF60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1503E60673;
	Tue,  3 Aug 2021 21:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSvYtpXY3jjf; Tue,  3 Aug 2021 21:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622DF60653;
	Tue,  3 Aug 2021 21:13:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC0B1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 446318350A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgRISk3RNGOA for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98B55827D2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E2C9C8B43C; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 18:09:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 12916827e0d4a31b29031102edf21fe5ab6a2f2a
X-Git-Newrev: 68b5b3fbf079b9e89717a01c8f8d1db1b9f25312
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.E2C9C8B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dmalloc: fix static
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=68b5b3fbf079b9e89717a01c8f8d1db1b9f25312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build of dmalloc is broken since commit
19ec872f169a851b48ba04d22432b7c0939847d4 because --enable-shlib is
unconditionally set

Fixes:
 - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dmalloc/dmalloc.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 638fe0fcda..749c35359c 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -13,10 +13,12 @@ DMALLOC_LICENSE = MIT-like
 DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
-DMALLOC_CONF_OPTS = --enable-shlib
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_STATIC_LIBS),)
+ifeq ($(BR2_STATIC_LIBS),y)
+DMALLOC_CONF_OPTS += --disable-shlib
+else
+DMALLOC_CONF_OPTS += --enable-shlib
 DMALLOC_CFLAGS += -fPIC
 endif
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
