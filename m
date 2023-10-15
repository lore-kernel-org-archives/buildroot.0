Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A88CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0EBE4149D;
	Sun, 15 Oct 2023 18:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EBE4149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tuaq8PLdrYjv; Sun, 15 Oct 2023 18:33:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85F8A4149E;
	Sun, 15 Oct 2023 18:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F8A4149E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1538A1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F34E416D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F34E416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRJ8BqmfJIRR for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A53E4416D2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A53E4416D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 911D7855AA; Sun, 15 Oct 2023 18:32:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:25:19 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: eaad8eda679a93ba10a3a6b773af5147bf73a647
X-Git-Newrev: f72ce56f8d59cc31af934ef07f95172d0cdc00f2
X-Patchwork-Hint: ignore
Message-Id: <20231015183250.911D7855AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mutt: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=f72ce56f8d59cc31af934ef07f95172d0cdc00f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
