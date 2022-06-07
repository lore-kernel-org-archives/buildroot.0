Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E852DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6522424BC;
	Tue,  7 Jun 2022 12:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBQ06KnCZKzc; Tue,  7 Jun 2022 12:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53B9A424B1;
	Tue,  7 Jun 2022 12:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4F51BF33A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26FE2600B8
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yiA1qJ1VXB0b for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C467600BA
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0584786751; Tue,  7 Jun 2022 12:11:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 14:18:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a45f9080d8d5ace6a576749446865399c91880a2
X-Git-Newrev: 747b86ceba9bde7a03b7812b6d32fd588aad3291
X-Patchwork-Hint: ignore
Message-Id: <20220607121133.0584786751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcec: drop
 unrecognized option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=747b86ceba9bde7a03b7812b6d32fd588aad3291
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

HAVE_DATE_BIN has been dropped since version 4.0.5 and
https://github.com/Pulse-Eight/libcec/commit/d04037825e8c49075ddd3ae6f8f0b94a0fef2709

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb5e2d2d43c5c0f71ae8243081625261de2cd134)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
