Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD46C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 20:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C0283143;
	Thu,  4 Aug 2022 20:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C0283143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EAsZuFJjeZg; Thu,  4 Aug 2022 20:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0628318C;
	Thu,  4 Aug 2022 20:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0628318C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0B31BF402
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C4283139
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C4283139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGyPkRk6vAf3 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 20:42:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7442830E6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7442830E6
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 20:42:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 18713240003;
 Thu,  4 Aug 2022 20:42:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 22:41:55 +0200
Message-Id: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659645720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8kF3Qv8HQdxqXkz6oPIDomwvSbmpGER33C3nUm+7kPc=;
 b=c9TRz6nExVh40f61Vf5oHwHzUDhpkR7SJ2pOGdMQi2thLsFCMjqb+4bbE3mFDtOpfD1mL9
 y2FkqCo/LtSL/JvX3fAZ7cPGoX3Y/H6agd1QGdggYdb7qwQkYh3kKgwW30tMUZDsz4BsXT
 yFQVp5n9mnb0JFAJfDazd0dAaJD9VKrS0axfbqP2r/WtfjYcisr/R6dCMy3upKnTqWvEmD
 VsQye1s3IK4LJyNCG6ebZXpOb26I31NCoRENi29jNZ/oDy8gmmBM+1b+zdnfwYzW23WTVh
 DwnrAvY/lUxV4eWmmKw+aBg1jh/MTZe3hKMcI7EJFkB1uHnTHcqaa0XjTTo9bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c9TRz6nE
Subject: [Buildroot] [PATCH 1/2] package/gcnano-binaries: create symlinks
 for libGLESv2 and libGLESv1_CM.so
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
Cc: kory.maincent@bootlin.com, Jens Kleintje <scooby22@web.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At least libepoxy, a user of OpenGL ES, expects libraries to be
available as libGLESv2.so.2 and libGLESv1_CM.so.1. While other OpenGL
implementations comply with this, gcnano-binaries does not, and
installs its libraries directly as .so, without any ABI version,
causing runtime failures with libepoxy or SDL2, as it tries to
dlopen() the OpenGL ES libraries with their ABI suffix.

See for example the libepoxy code:

  https://github.com/anholt/libepoxy/blob/master/src/dispatch_common.c#L191

Fix this issue by adding the relevant symlinks.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index dc309ec3c2..ce9b24cc3a 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -44,10 +44,17 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
 
+# This creates:
+#   libGLESv2.so.2    -> libGLESv2.so
+#   libGLESv1_CM.so.1 -> libGLESv1_CM.so
+# symlinks, as most OpenGL implementations have them, and they are
+# expected by some users such as libepoxy.
 define GCNANO_BINARIES_INSTALL
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
 	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
 	find . -type l -exec cp -a {} $(1)/usr/lib \;
+	ln -sf libGLESv2.so $(1)/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv1_CM.so $(1)/usr/lib/libGLESv1_CM.so.1
 	mkdir -p $(1)/usr/include
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
 	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
