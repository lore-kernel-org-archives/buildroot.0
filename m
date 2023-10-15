Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C4CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 619454149D;
	Sun, 15 Oct 2023 18:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619454149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlwAXCIv7aZI; Sun, 15 Oct 2023 18:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC4A41493;
	Sun, 15 Oct 2023 18:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FC4A41493
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF5E1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1BE9416D1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1BE9416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGx9YcpoK7Fm for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 088E0416D6
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 088E0416D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06CDB8559B; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:25:28 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6f8b4a006a42f8d43d05ea529d936ebea874c7dd
X-Git-Newrev: 9c442c86e5a8b82cf57f08b2b8498bf410def817
X-Patchwork-Hint: ignore
Message-Id: <20231015183252.06CDB8559B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/mutt: fix
 libgpgme static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c442c86e5a8b82cf57f08b2b8498bf410def817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following static build failure with libgpgme raised since at
least bump to version 2.2.9 in commit
7a2afdb7b1180bed3b6ad92c22c908805467ead3:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/11.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/sh4a-buildroot-linux-musl/sysroot/usr/lib/libgpgme.a(assuan-support.o): in function `my_usleep':
assuan-support.c:(.text+0x260): undefined reference to `__assuan_usleep'

Fixes:
 - http://autobuild.buildroot.org/results/0680dbc95601fcd8cdf07b926ea5e9be2079c7bf
 - http://autobuild.buildroot.org/results/b4f2d1ad77fb8b97accc4150d8249de145cb9cf4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b518b0f161c81582f31c79c50552b5106f693df2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 09f547a091..2fe7b92b38 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -40,7 +40,11 @@ MUTT_CONF_OPTS += \
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
-MUTT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+MUTT_GPGRT_CONFIG = $(STAGING_DIR)/usr/bin/gpgrt-config
+ifeq ($(BR2_STATIC_LIBS),y)
+MUTT_GPGRT_CONFIG += --static
+endif
+MUTT_CONF_ENV += GPGRT_CONFIG="$(MUTT_GPGRT_CONFIG)"
 else
 MUTT_CONF_OPTS += --disable-gpgme
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
