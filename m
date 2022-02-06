Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EFFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFD4040549;
	Sun,  6 Feb 2022 14:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6fO6L_7gCGU; Sun,  6 Feb 2022 14:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA32B40289;
	Sun,  6 Feb 2022 14:54:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E42F21BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2043400A6
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWGKCK4YAFb5 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:54:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3DD5400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:54:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60FD382BBB; Sun,  6 Feb 2022 14:47:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:52:29 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 6400186971ac3430e3827563b8bce73f15f18583
X-Git-Newrev: 95f5dcef1ba2c05a5ef23f619dac24c067148624
X-Patchwork-Hint: ignore
Message-Id: <20220206144700.60FD382BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/pkcs11-helper:
 drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=95f5dcef1ba2c05a5ef23f619dac24c067148624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

autoreconf is not needed since commit
dbf8047f64f081ffbc97b67dd891690632377692 as the official tarball already
ships a configure file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 59f8a971ae6c8f88bf99dede56946e701a2c1b40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkcs11-helper/pkcs11-helper.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 805e000759..90929404be 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -10,7 +10,6 @@ PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/p
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
-PKCS11_HELPER_AUTORECONF = YES
 PKCS11_HELPER_INSTALL_STAGING = YES
 
 PKCS11_HELPER_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
