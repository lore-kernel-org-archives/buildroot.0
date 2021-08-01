Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697AEC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FA3B610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FA3B610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB4A8405AA;
	Sun,  1 Aug 2021 12:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ven244CehrhZ; Sun,  1 Aug 2021 12:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFB14050F;
	Sun,  1 Aug 2021 12:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5621BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1970B83C82
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4V2YKtnWtMq for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8321783C7A
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6CB248A44D; Sun,  1 Aug 2021 12:07:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 14:05:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2b90705603ec1a865a3464dd2c54ec0da908e68
X-Git-Newrev: c4f4b3b6fe0d6914b0d2b8aab99c515761cff96c
X-Patchwork-Hint: ignore
Message-Id: <20210801120745.6CB248A44D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ulogd: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4f4b3b6fe0d6914b0d2b8aab99c515761cff96c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for ulogd is added by the services/ulogd module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ulogd/ulogd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 1b86c12773..c00a53f3d5 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -13,6 +13,7 @@ ULOGD_DEPENDENCIES = host-pkgconf \
 	libnfnetlink
 ULOGD_LICENSE = GPL-2.0
 ULOGD_LICENSE_FILES = COPYING
+ULOGD_SELINUX_MODULES = ulogd
 
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
