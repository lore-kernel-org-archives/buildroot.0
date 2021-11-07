Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978C2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65AD061101
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65AD061101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44ECD4025A;
	Sun,  7 Nov 2021 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YPSvmf-Uk9u; Sun,  7 Nov 2021 20:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBE740255;
	Sun,  7 Nov 2021 20:29:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 768AD1BF977
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7367040255
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VfFdTTZanVNo for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E31F401FC
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82EB48B50B; Sun,  7 Nov 2021 20:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:24:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c922c71e4463e21b06dd8c0a4a26279e14a9a19f
X-Git-Newrev: 2bb820cb9ef7d52dd97504761c13fc5e65fe556a
X-Patchwork-Hint: ignore
Message-Id: <20211107202455.82EB48B50B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socketcand: don't override
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bb820cb9ef7d52dd97504761c13fc5e65fe556a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override SOCKETCAND_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socketcand/socketcand.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index b11aa3c91e..dbf859d3f9 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -11,7 +11,7 @@ SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
 SOCKETCAND_LICENSE_FILES = socketcand.c
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
-SOCKETCAND_DEPENDENCIES = libconfig
+SOCKETCAND_DEPENDENCIES += libconfig
 else
 SOCKETCAND_CONF_OPTS = --without-config
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
