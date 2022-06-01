Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64088C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169F841969;
	Tue,  7 Jun 2022 19:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3bG41sxmkN9; Tue,  7 Jun 2022 19:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A96841926;
	Tue,  7 Jun 2022 19:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C59CC1BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDA2418FD
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NbOs1SIZHxr for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA7BA418FE
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BC32D86E21; Tue,  7 Jun 2022 19:04:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:04:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 549f5f07785448c94454bdedf57b39304ac67e43
X-Git-Newrev: 1713777f3a3e0d3c223cf29869db86c4df99892f
X-Patchwork-Hint: ignore
Message-Id: <20220607190457.BC32D86E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: post-process
 wolfssl-config script
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

commit: https://git.buildroot.net/buildroot/commit/?id=1713777f3a3e0d3c223cf29869db86c4df99892f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wolfssl package installs $(STAGING_DIR)/usr/bin/wolfssl-config,
which needs to be post-processed to return correct results. Use
<pkg>_CONFIG_SCRIPTS to achieve this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index bfb54445e4..58b6f296ab 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -11,7 +11,7 @@ WOLFSSL_INSTALL_STAGING = YES
 WOLFSSL_LICENSE = GPL-2.0+
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
 WOLFSSL_CPE_ID_VENDOR = wolfssl
-
+WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
 # wolfssl's source code is released without a configure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
