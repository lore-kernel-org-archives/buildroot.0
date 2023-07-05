Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD77EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 16:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56DBB82135;
	Wed,  5 Jul 2023 16:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56DBB82135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXE8b6QW__jR; Wed,  5 Jul 2023 16:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05B682116;
	Wed,  5 Jul 2023 16:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05B682116
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 649EA1BF59F
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B2DB61051
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2DB61051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZtaR9xp5Rnh for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 16:10:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8426F6103B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8426F6103B
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:10:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FE7FA4C0C64;
 Wed,  5 Jul 2023 18:10:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59534)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qH55Z-0004fA-2v;
 Wed, 05 Jul 2023 18:10:45 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 18:10:42 +0200
Message-Id: <20230705161042.700055-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688573446;
 bh=w8vmb8E1lQMbEbb8vbj5JFUnXaw+p2IOpkW7U+0Q5Dw=;
 h=From:To:Cc:Subject:Date:From;
 b=I5upelzjaoJ+56NaKEub2+x2JtHynCqbG8ZmqSW0SYAjkBEsFHH8lYAH1pbayB3HP
 7gx02ycGlpjkv4q3z9mMRFy9YPC88vS5j26rVmj1XDsYgqAMntIbJecgDGId7Z/+xj
 LGhKU1V/KlRzyyqe9toJtah+ELu+TB42tNPNcT39YZ6499unlms4HAvbPuquaE2e51
 /HgKYJfuQPYfxYOwOJiQF3hT1MRpFqut+gER6a39pwvs/AGZWKTrnozWp7MJLt91cE
 5Bv65ezqPOJU5ZsxAW0++VTDpQsDyTxvDOMR3aZi7q4IltJK4lgKfiNEJ48VxOVzRa
 JtDLI8Ku6kDmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=I5upelzj
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: mmal is not available on
 aarch64
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Guillermo G <ggalan3@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/aa5/aa589b38e1591a0ec4d400891bf86f5138cf4542/

For details see:
https://lists.buildroot.org/pipermail/buildroot/2023-July/669839.html
https://github.com/raspberrypi/userland/issues/688

Reported-by: Guillermo G <ggalan3@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 59e13b503e..9d9209706a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -282,9 +282,14 @@ FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-FFMPEG_CONF_OPTS += --enable-mmal --enable-omx --enable-omx-rpi \
+FFMPEG_CONF_OPTS += --enable-omx --enable-omx-rpi \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
 FFMPEG_DEPENDENCIES += rpi-userland
+ifeq ($(BR2_arm),y)
+FFMPEG_CONF_OPTS += --enable-mmal
+else
+FFMPEG_CONF_OPTS += --disable-mmal
+endif
 else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
