Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438A1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 22:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F5C40FDD;
	Sun, 17 Apr 2022 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0zSGQ-Nk19W; Sun, 17 Apr 2022 22:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE9E40FD9;
	Sun, 17 Apr 2022 22:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1F951BF38C
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 22:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F8104159F
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tqdf2wXSvsSs for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 22:00:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A2A740A00
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 22:00:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t1so16695338wra.4
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 15:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nm2HZ6OPNXMewIt9TSGvsL8W+3hWQ5eLLkbeQqZUiU4=;
 b=OuFcUn92TMLhKiTfLPP7Vcuk/8KRFdodlKuGmKYCA8QteRbTQRC7yuVhoqHm3x3nz6
 n/16TVh8cV9CO1dBaoQPQIo0PsLrNsCuXgM+mZdAK2AkhPLEzCvHF3GowvJgq056QwNP
 KRN4lVzHJ96mUvstNvrbVnhi/VPOvFjvwkotqVSgXII2DEqMZmmVb0/1iggg8qkzNUfY
 OQuJP2A5+QclffA5ytyq4O4eCdBXLlS0SNx09vReVX1SFKji5MbTvJyNWZ9Ckiu5XyYz
 3kCFeUeMU6BAP05SUlsCUQbq8udkcAdYDdf9owz13t8XTRgrnl9I+4wSo0g9zV2SeOO/
 yWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nm2HZ6OPNXMewIt9TSGvsL8W+3hWQ5eLLkbeQqZUiU4=;
 b=Jv2Gdkmwh6RhJ0fltqj8ml+MWL8pz0guhZd6K2uNaaWpo8CCqwKEh+76nbunT/h1fP
 R6HKld4UynkcMvTKegqyixGw3ZunFaFVDqhOd4LX16aH2Fm7yPJVddoOTeeM/V/ShJx5
 DTHdlK8xt2Ti2dcXw/JCWyNzd2d4kZRSSXtph4MuIy0Qc2TUTOVDl6duHLFpg/auJsJq
 yaj+lvqyK7wsQVxXXM4+m0bjdtt1ppdLEOHCVwBF2W/LiJx6/rS3ptMnmwqx/z7tc63O
 Si0J6v618cUPUPN3fEAGOZFYLSfOyow4wmREDL6fsXwNGSOjZ5kF6KMv+/4DUSaBLfPf
 COOQ==
X-Gm-Message-State: AOAM530zF/kFshZZdOyr97rU5A+dTl0XKJRM3xKbxh8BUSrXnvTHClZe
 J5dFyDpebBuHW+sw12fc0JQvar1/gcc=
X-Google-Smtp-Source: ABdhPJx1NDjRDgC7qnKIc1kLwl/mpryE5o2o/mhGsQu+pgcQkOu1pTIp+FPy5ZthWZ91rNVHVfL4PA==
X-Received: by 2002:a05:6000:15ce:b0:20a:85e7:f200 with SMTP id
 y14-20020a05600015ce00b0020a85e7f200mr6373807wry.529.1650232821206; 
 Sun, 17 Apr 2022 15:00:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfec91000000b0020a98f5f8a7sm987908wrn.6.2022.04.17.15.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 15:00:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Apr 2022 23:58:22 +0200
Message-Id: <20220417215822.1070695-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/espeak: fix pulseaudio build
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
Cc: Arnaud Aujon <arnaud@intelibre.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass $(TARGET_CONFIGURE_OPTS) AUDIO="$(ESPEAK_AUDIO_BACKEND)" to
ESPEAK_INSTALL_TARGET_CMDS to avoid the following build failure with
pulseaudio raised since the addition of the package in commit
10b6d10009c70262cfb492b2abaa3a091a8fb4aa:

>>> espeak 1.48.04 Installing to target
PATH="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/bin:/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" /usr/bin/make -j1 -C /nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src DESTDIR="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/target" install
make[1]: Entering directory '/nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src'
g++ -O2 -DUSE_PORTAUDIO -D PATH_ESPEAK_DATA=\"/usr/share/espeak-data\" -Wall -fPIC -fvisibility=hidden -pedantic \
-I. -D LIBRARY -c -fno-exceptions  wave.cpp  -o x_wave.o
g++  -shared -Wl,-soname,libespeak.so.1 -o libespeak.so \
x_speak_lib.o x_compiledict.o x_dictionary.o x_intonation.o x_readclause.o x_setlengths.o x_numbers.o x_synth_mbrola.o x_synthdata.o x_synthesize.o x_translate.o x_mbrowrap.o x_tr_languages.o x_voices.o x_wavegen.o x_phonemelist.o x_espeak_command.o x_event.o x_fifo.o x_wave.o x_debug.o x_klatt.o x_sonic.o -lstdc++ -lportaudio -lpthread
/usr/bin/ld: cannot find -lportaudio

Fixes:
 - http://autobuild.buildroot.org/results/a4a6e3203ad70cd724da8130ee1648141ab39a6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/espeak/espeak.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index d592673ac5..44893ac9be 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -37,7 +37,8 @@ define ESPEAK_BUILD_CMDS
 endef
 
 define ESPEAK_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) \
+		AUDIO="$(ESPEAK_AUDIO_BACKEND)" DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
