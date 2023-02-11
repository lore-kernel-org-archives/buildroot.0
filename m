Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F72C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E5760AE8;
	Sat, 11 Feb 2023 16:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E5760AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jo9b1A-w_lbv; Sat, 11 Feb 2023 16:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2779660A69;
	Sat, 11 Feb 2023 16:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2779660A69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2636F1BF2BF
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 16:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0070881EC2
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 16:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0070881EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeWPONXahoXa for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 16:34:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D56781E93
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D56781E93
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 16:34:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.210]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MZkpR-1p2wbQ0HkF-00WkWU; Sat, 11 Feb 2023 17:34:23 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 17:34:22 +0100
Message-Id: <20230211163422.25944-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Z8tj5zqJJGOPaOG4au0FKNqGvYng8Nqqi9LRfl3sy7vj0hzuvBd
 9bHeCyJHnVd7C/aKb2bOEsrHamt8rV780IQv+ODVfC45UlWdamZltc31TPbc1RvhYQUVSY9
 kBFv9N7WyYj5sceCTNvyylSDtkB1tA2QvHkl9gzrWxiQEvMeZ08Unxux8khfd9AAn4A6KsS
 kxCm7eqqV/yY3NGlbyeRw==
UI-OutboundReport: notjunk:1;M01:P0:OSrdd+vB6JU=;cOJ27M252f2+8pHpzeKl4SLzwOx
 5raR7lx4qQrvA6c6V7nKyv5MMuiQCsmSzK0nWmPJ1rojvGISgoNQnOXD6vAznPkvNlXuhzVg3
 Bc/7nou7GGKCheXa3V14Pwl5TLu8GOUQuMP0IxxPcOelKYjEkgtXyXlYt10HsdKptpoy3TQpd
 TTBkrBpTr8FoNFoKzQKtHzy7dCfVVJAq+GF8vVBGcIsWbKPUabwr3qS05buABc+gFZJf0qtmt
 fd6cnNlE/AeWlbDV9fRgvzs2tBfi/eDFTPaWFIWVaVzWIT8UTtAywo9TwTCUPQtX4mkQdlsup
 Oy7YAJ7dUBVyIX0ADYGLwZf5h53BmFVsz/X0V+GOADCFgmo0OfhLySH3A92cVAzB1bxVgKzLX
 bR4LX4+aYZN0FcKCw0ofAuj4HCfkDISr+8bVcM2zEAXQl8X6GZDN9GAwcJfc6TyaPIiVjrxeh
 ngeTlsL/M8IpyRot3VWLxQUQkt3JhG779okBde2AyYmN0WNq5BVps/AKOkPF0tg85fI3G78kW
 8nf4jzFuj0BFVqm7M+QMec1kfxsAKLC8yh36zC1m32t8VgUHEpnZ0P0SfgzL4NUH3pezLGJIX
 pqudoP6+Yprnd8UdjoLz7/Io50ephwlxoTRE2QgOaCYzgbzRwo2FBhtU2Netw9VXwIqhvZrh2
 yM2Fs2ia3RI5TktONr8xw92lAaKC0LCpq2jJ22ecsSysAN4z8QAvFIlji+d5POc78Epty7OBW
 r5Usz/gsI3Sax/KzOhHesqVDpFPxoj+yUipLy/w9LJfCbQ5fN0BXavwI1RkT6FWIkK2y9yJJD
 VoaQrQHdwLEyrymEZFIEoDJmXO0ls0sUNgJHI6Z9ow+EjNV8RJ1kCU8i1h/QoOPpZb9cGEjCO
 USpvME9YWWJp2YSOrVXL9vHTBAS4Gw7v97S2LPlrUn2TLvbe2xDjbqZmeeh872zGvafePfye3
 8H2zD5qMwBkwhF3nCJdirOhfVcc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1676133263; bh=UNcXlMrbXlmzNjeGEIkMS3huXEgLalVJrEFIlPMHaEs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=aimZnsU26GjfDHNmbIeqKybVNOXcfqXoKiGBZ2x4gDgm1y4fMi98S+OrIcjQDts2Y
 kg1ioLTVP0Fj5aicAtYkXKSXYyDqq4sT0m0sEJhkhBHM2h8fqduQIAXu8lNKvBsELQ
 KHpxq833uV04IW/FMhev41UsWow2wyc0Y7nPRvEGwB0F5ASYvGAT3HJmGzJWZATI59
 XMwlMQT5Wk/sWn2s2vsDrEb3gdeoNO6mWkHuLO4HnXotjkqWF4libmA2XNu5AHr+Id
 IllRHfXcbI62YAGRMLnMXLaVLOB7Oji2No1nq2F3/EjORfJNhzYaAiFxMH1foTjWzj
 AF/dxsRDJTY7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=aimZnsU2
Subject: [Buildroot] [PATCH v1] package/fft_eval: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in              |  1 +
 package/fft_eval/Config.in     | 13 ++++++++++++
 package/fft_eval/fft_eval.hash |  5 +++++
 package/fft_eval/fft_eval.mk   | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/fft_eval/Config.in
 create mode 100644 package/fft_eval/fft_eval.hash
 create mode 100644 package/fft_eval/fft_eval.mk

diff --git a/package/Config.in b/package/Config.in
index 511e691ed3..aa19164802 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2206,6 +2206,7 @@ menu "Miscellaneous"
 	source "package/collectl/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
+	source "package/fft_eval/Config.in"
 	source "package/gitlab-runner/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/fft_eval/Config.in b/package/fft_eval/Config.in
new file mode 100644
index 0000000000..4b6aa9b388
--- /dev/null
+++ b/package/fft_eval/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FFT_EVAL
+	bool "fft_eval"
+	help
+	  Pogram to aid open source spectrum analyzer development
+	  for Qualcomm/Atheros AR92xx and AR93xx based chipsets.
+
+	  It visualizes the FFT data reported by the chips to help
+	  interpreting and understanding the data.
+
+	  Enabel sdl2 and sdl2_ttf for the graphic output tool
+	  fft_eval_sdl.
+
+	  https://github.com/simonwunderlich/FFT_eval
diff --git a/package/fft_eval/fft_eval.hash b/package/fft_eval/fft_eval.hash
new file mode 100644
index 0000000000..ab09e916e7
--- /dev/null
+++ b/package/fft_eval/fft_eval.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  154f99c3567835bbbbc9ec4c58bc79961f9fa5342effb6f0bc41475fc9a6d11f  fft_eval-6a82b383ce79afc4c1ba26ffcf34b15d3e95894b.tar.gz
+sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
+sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
+sha256  797832eda5ff4360a10fee3be94a3250995e76423b79675c9c44204c37ca492d  LICENSES/OFL-1.1.txt
diff --git a/package/fft_eval/fft_eval.mk b/package/fft_eval/fft_eval.mk
new file mode 100644
index 0000000000..383b5f9a51
--- /dev/null
+++ b/package/fft_eval/fft_eval.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# fft_eval
+#
+################################################################################
+
+FFT_EVAL_VERSION = 6a82b383ce79afc4c1ba26ffcf34b15d3e95894b
+FFT_EVAL_SITE = $(call github,simonwunderlich,FFT_eval,$(FFT_EVAL_VERSION))
+FFT_EVAL_LICENSE = CC0-1.0 (doc), GPL-2.0-only, OFL-1.1 (LiberationSans-Regular.ttf)
+FFT_EVAL_LICENSE_FILES = \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/OFL-1.1.txt
+
+FFT_EVAL_CONV_OPTS = CONFIG_fft_eval_json=y
+FFT_EVAL_TARGETS = fft_eval_json
+
+ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_TTF),yy)
+FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=y
+FFT_EVAL_DEPENDENCIES += sdl2 sdl2_ttf
+FFT_EVAL_TARGETS += fft_eval_sdl
+else
+FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=n
+endif
+
+define FFT_EVAL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS=$(STAGING_DIR)/usr/bin/ $(FFT_EVAL_CONV_OPTS) -C $(@D) all
+endef
+
+define FFT_EVAL_INSTALL_TARGET_CMDS
+	for i in $(FFT_EVAL_TARGETS); do \
+		$(INSTALL) -D -m 0755 $(@D)/$$i $(TARGET_DIR)/usr/bin || exit 1; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
