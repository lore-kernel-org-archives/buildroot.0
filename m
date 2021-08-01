Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF36C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716B6610CE
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 716B6610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 499AC605F8;
	Sun,  1 Aug 2021 12:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQTUCIarbxVP; Sun,  1 Aug 2021 12:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93226605F2;
	Sun,  1 Aug 2021 12:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0961BF977
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B64E415B3
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nljbPQrbYWl for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8000240511
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5B86D8806E; Sun,  1 Aug 2021 12:07:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 14:05:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7033a1ee7ff9155278b860e8bab0c40ae815d078
X-Git-Newrev: b2b90705603ec1a865a3464dd2c54ec0da908e68
X-Patchwork-Hint: ignore
Message-Id: <20210801120745.5B86D8806E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smstools3: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2b90705603ec1a865a3464dd2c54ec0da908e68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for smstools3 is added by the services/smstools module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/smstools3/smstools3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/smstools3/smstools3.mk b/package/smstools3/smstools3.mk
index 87d189baa8..d13900bc03 100644
--- a/package/smstools3/smstools3.mk
+++ b/package/smstools3/smstools3.mk
@@ -8,6 +8,7 @@ SMSTOOLS3_VERSION = 3.1.21
 SMSTOOLS3_SITE = http://smstools3.kekekasvi.com/packages
 SMSTOOLS3_LICENSE = GPL-2.0+
 SMSTOOLS3_LICENSE_FILES = doc/license.html LICENSE
+SMSTOOLS3_SELINUX_MODULES = smstools
 
 SMSTOOLS3_CFLAGS = $(TARGET_CFLAGS)
 SMSTOOLS3_CFLAGS += -D NUMBER_OF_MODEMS=$(BR2_PACKAGE_SMSTOOLS3_NB_MODEMS)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
