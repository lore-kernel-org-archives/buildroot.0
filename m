Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DDEA83E57;
	Tue, 31 May 2022 08:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBdTFdcxwiFH; Tue, 31 May 2022 08:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD4B8346C;
	Tue, 31 May 2022 08:22:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 295991BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2597540C72
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvmlmSGuyZe3 for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8048C40A6D
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7E0548686A; Tue, 31 May 2022 08:11:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:21:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74a4bb58fe45d6218655f81e7158ac6dc8c28271
X-Git-Newrev: eb5e2d2d43c5c0f71ae8243081625261de2cd134
X-Patchwork-Hint: ignore
Message-Id: <20220531081105.7E0548686A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: drop unrecognized option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb5e2d2d43c5c0f71ae8243081625261de2cd134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HAVE_DATE_BIN has been dropped since version 4.0.5 and
https://github.com/Pulse-Eight/libcec/commit/d04037825e8c49075ddd3ae6f8f0b94a0fef2709

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcec/libcec.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8b5d70d008..33e0463eb8 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -39,7 +39,6 @@ endif
 
 # Disable information about how libCEC is compiled.
 LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
-	-DHAVE_DATE_BIN="" \
 	-DHAVE_WHOAMI_BIN="" \
 	-DHAVE_HOSTNAME_BIN="" \
 	-DHAVE_UNAME_BIN=""
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
