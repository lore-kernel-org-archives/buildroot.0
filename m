Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4F4ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B247415DE;
	Wed, 14 Sep 2022 22:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B247415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUX6-NpRXvR6; Wed, 14 Sep 2022 22:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C05540913;
	Wed, 14 Sep 2022 22:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C05540913
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15B551C1148
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E604D82423
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E604D82423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCkeiWqhXCao for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B69081D4D
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B69081D4D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C40383B9F; Wed, 14 Sep 2022 22:29:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:14:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 358fa203abe6e5290d823fc81e8f8d113a90daa4
X-Git-Newrev: 963b7acafae89d2b499168e76451c91f8f445b2e
X-Patchwork-Hint: ignore
Message-Id: <20220914222927.0C40383B9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/wolfssl:
 post-process wolfssl-config script
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

commit: https://git.buildroot.net/buildroot/commit/?id=963b7acafae89d2b499168e76451c91f8f445b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The wolfssl package installs $(STAGING_DIR)/usr/bin/wolfssl-config,
which needs to be post-processed to return correct results. Use
<pkg>_CONFIG_SCRIPTS to achieve this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1713777f3a3e0d3c223cf29869db86c4df99892f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
