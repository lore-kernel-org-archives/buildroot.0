Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745FC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7302741936;
	Thu, 29 Feb 2024 15:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezmeJoJGIXMI; Thu, 29 Feb 2024 15:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ABF541928
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ABF541928;
	Thu, 29 Feb 2024 15:52:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 821CA1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE0360ED8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BL92DiUCCnq5 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1186460A5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1186460A5E
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB28687D72; Thu, 29 Feb 2024 15:33:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:27:08 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ccf4a64464790d211800fd17fb8bd6b392d14ea0
X-Git-Newrev: 9bea8aa5cc6456d911cfcf9f73add4b6b5839325
X-Patchwork-Hint: ignore
Message-Id: <20240229153304.EB28687D72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/leptonica:
 affected by gcc bug 101737
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bea8aa5cc6456d911cfcf9f73add4b6b5839325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

leptonica is affected by gcc bug 101737 resulting in the following build
failure since at least bump to version 1.82.0 in commit
81a961c545cc9f240841b75d6c21f13b334bc274:

sh4eb-buildroot-linux-gnu-gcc.br_real: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report, with preprocessed source (by using -freport-bug).
See <http://bugs.buildroot.net/> for instructions.

Fixes:
 - http://autobuild.buildroot.org/results/f18979454399d9c728f9e017e4cc3a1b27458f5b
 - http://autobuild.buildroot.org/results/f3c803892175b3bb2ce68e3140c879b4a4d4b302

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 31b488337921d57c14893c34766ac22c53e5382b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leptonica/leptonica.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 8791b0c4c2..569d2829c3 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -14,6 +14,10 @@ LEPTONICA_DEPENDENCIES = host-pkgconf
 
 LEPTONICA_CONF_OPTS += --disable-programs
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+LEPTONICA_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_GIFLIB),y)
 LEPTONICA_DEPENDENCIES += giflib
 LEPTONICA_CONF_OPTS += --with-giflib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
