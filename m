Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2369C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98802608FB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98802608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DDC1834E3;
	Sat, 24 Jul 2021 20:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBkPlv4Wq-q1; Sat, 24 Jul 2021 20:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3CA834CB;
	Sat, 24 Jul 2021 20:09:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 156B61BF95E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 124E2400CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkeC9JbE47VI for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C441400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B71EE86FC4; Sat, 24 Jul 2021 19:34:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:08:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 968782ab3c440de006f1a4e555b30cb23df29361
X-Git-Newrev: 66671e57c142492e31a1f16e953737b22df32d8c
X-Patchwork-Hint: ignore
Message-Id: <20210724193419.B71EE86FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmbim: drop unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=66671e57c142492e31a1f16e953737b22df32d8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-more-warnings has been dropped since version 1.22.0 and
https://github.com/freedesktop/libmbim/commit/448e8fe7c50493c2c42399ed903906b9bb35d244

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmbim/libmbim.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index e21194ca20..b343dec238 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -14,9 +14,6 @@ LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
 
-# we don't want -Werror
-LIBMBIM_CONF_OPTS = --enable-more-warnings=no
-
 # if libgudev available, request udev support
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 LIBMBIM_DEPENDENCIES += libgudev
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
