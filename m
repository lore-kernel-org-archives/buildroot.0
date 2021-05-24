Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888BEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:47:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471076056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 471076056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 204B583D6B;
	Tue,  3 Aug 2021 22:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMnkAdm1BQ_f; Tue,  3 Aug 2021 22:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6345883D62;
	Tue,  3 Aug 2021 22:47:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE021BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 382DB405FA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSw96ieS2_uA for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FA3F40488
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8672085F62; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 May 2021 14:01:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5022410324a4c1bcc9873c3ef2060c570a7ea31b
X-Git-Newrev: 888546e5273d77d49bec564a515e85d7acee6bdd
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.8672085F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pifmrds: use pkg-config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=888546e5273d77d49bec564a515e85d7acee6bdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use pkg-config to retrieve libsndfile dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pifmrds/0003-Makefile-fix-static-link.patch | 6 ++++--
 package/pifmrds/pifmrds.mk                          | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pifmrds/0003-Makefile-fix-static-link.patch b/package/pifmrds/0003-Makefile-fix-static-link.patch
index ecd7c4fc4c..3bd91c981f 100644
--- a/package/pifmrds/0003-Makefile-fix-static-link.patch
+++ b/package/pifmrds/0003-Makefile-fix-static-link.patch
@@ -4,6 +4,8 @@ Since libsndfile uses funtions from libm, the -lm should be specified
 after libsndfile for static linking.
 
 Signed-off-by: "Eric Limpens" <Limpens@gmail.com>
+[Fabrice: add $(SNDFILE_LIBS) to pass all dependencies from pkg-config]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2/src/Makefile
 --- pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile	2016-02-26 08:06:43.102962592 +0100
@@ -13,11 +15,11 @@ diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pi
  
  app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
 -	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
-+	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lsndfile -lm
++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS)
  
  rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
 -	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
-+	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lsndfile -lm
++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS)
  
  rds.o: rds.c waveforms.h
  	$(CC) $(CFLAGS) rds.c
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 509ec80876..33c13bae33 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -6,13 +6,14 @@
 
 PIFMRDS_VERSION = 0bf57f9ce0d954365a38d8af8e7be6f28521c3f2
 PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
-PIFMRDS_DEPENDENCIES = libsndfile
+PIFMRDS_DEPENDENCIES = host-pkgconf libsndfile
 PIFMRDS_LICENSE = GPL-3.0+
 PIFMRDS_LICENSE_FILES = LICENSE
 
 define PIFMRDS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
 		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
+		SNDFILE_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs sndfile`" \
 		app rds_wav
 endef
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
