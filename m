Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5F8C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:15:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D8E86108F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D8E86108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E896E4011B;
	Thu, 19 Aug 2021 21:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5fxoDET-hFH; Thu, 19 Aug 2021 21:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9F2B4011D;
	Thu, 19 Aug 2021 21:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54B521BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4432960629
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1gJmjmQeMB9 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:15:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6A40605EE
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:15:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 759608D626; Thu, 19 Aug 2021 21:14:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:14:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4b6ae4d732d9cc91bcf6d2efcd858e826863ce4
X-Git-Newrev: 885e8792d3478a73a7a27b7ffd8a7c8303234cbb
X-Patchwork-Hint: ignore
Message-Id: <20210819211450.759608D626@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/policycoreutils:
 Install scripts folder
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
Content-Type: multipart/mixed; boundary="===============6853426140799943694=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6853426140799943694==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=885e8792d3478a73a7a27b7ffd8a7c8303234cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This folder includes the fixfiles script that is used
by selinux autorelabel feature. Currently it installs
it under /usr/sbin.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/policycoreutils/policycoreutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index a486f8ddc3..60575ac644 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -43,7 +43,7 @@ POLICYCOREUTILS_MAKE_OPTS += \
 POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
 	secon semodule sestatus setfiles \
-	setsebool
+	setsebool scripts
 
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.

--===============6853426140799943694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6853426140799943694==--
