Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1ACC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C327C60F6E
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C327C60F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E5D5402EA;
	Mon, 26 Jul 2021 20:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_DBwhkV7r50; Mon, 26 Jul 2021 20:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1384402DC;
	Mon, 26 Jul 2021 20:15:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD5751BF9AD
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 953EE402EB
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izWtvFd1Nymg for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF47F40260
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1704588EEA; Mon, 26 Jul 2021 19:40:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a189d3a24e66c8c1d5fd8e63714d2dd79f6c8ac
X-Git-Newrev: da93f38cb19f7f7a9b75232f5f2bad25b8180982
X-Patchwork-Hint: ignore
Message-Id: <20210726194026.1704588EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cvs: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=da93f38cb19f7f7a9b75232f5f2bad25b8180982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for cvs is added by the services/cvs module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cvs/cvs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 3d01f335e2..8200997d3a 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -11,6 +11,7 @@ CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/
 CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
 CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
 CVS_CPE_ID_VENDOR = gnu
+CVS_SELINUX_MODULES = cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
