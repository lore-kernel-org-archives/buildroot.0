Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A2EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5D661075
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C5D661075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A7980DEC;
	Sun,  7 Nov 2021 20:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDWvZALzz0XO; Sun,  7 Nov 2021 20:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B01880DE4;
	Sun,  7 Nov 2021 20:29:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28D571BF97C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 177F540258
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IhcXq3QCBZN for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C56240255
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A593A8B50C; Sun,  7 Nov 2021 20:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:25:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0be1b16269ce271cdd213b0ed229e27976484f11
X-Git-Newrev: 7f1fa3b615aacee8846387eb975bb35309f36015
X-Patchwork-Hint: ignore
Message-Id: <20211107202455.A593A8B50C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1fa3b615aacee8846387eb975bb35309f36015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override KEXEC_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 13b852c8ed..81d35815d8 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -16,7 +16,7 @@ KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPTS += --with-zlib
-KEXEC_DEPENDENCIES = zlib
+KEXEC_DEPENDENCIES += zlib
 else
 KEXEC_CONF_OPTS += --without-zlib
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
