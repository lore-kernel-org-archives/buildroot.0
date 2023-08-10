Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83827C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD7540A70;
	Thu, 10 Aug 2023 22:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD7540A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04wuwUtrlFTI; Thu, 10 Aug 2023 22:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F88A417F0;
	Thu, 10 Aug 2023 22:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F88A417F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0581BF982
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233C683F26
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233C683F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Spdc89AYQOPO for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:06:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3071F8211D
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3071F8211D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EA6F85A5C; Thu, 10 Aug 2023 22:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 00:04:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 928b7219cd7079864eadadc66dbff21c5cd72804
X-Git-Newrev: 21d5d592a427686b3421d694a50dd96004d23ce8
X-Patchwork-Hint: ignore
Message-Id: <20230810220619.1EA6F85A5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fft_eval: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21d5d592a427686b3421d694a50dd96004d23ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/fft-eval/Config.in     | 13 +++++++++++++
 package/fft-eval/fft-eval.hash |  5 +++++
 package/fft-eval/fft-eval.mk   | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f9b29fe46..88b05e8ea8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2405,6 +2405,7 @@ F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	package/dotconf/
+F:	package/fft-eval/
 F:	package/python-blinker/
 F:	package/qt5/qt5speech/
 F:	package/speechd/
diff --git a/package/Config.in b/package/Config.in
index 4c763447e4..79142315ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2243,6 +2243,7 @@ menu "Miscellaneous"
 	source "package/collectl/Config.in"
 	source "package/domoticz/Config.in"
 	source "package/empty/Config.in"
+	source "package/fft-eval/Config.in"
 	source "package/gitlab-runner/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/fft-eval/Config.in b/package/fft-eval/Config.in
new file mode 100644
index 0000000000..e979e7aeb4
--- /dev/null
+++ b/package/fft-eval/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FFT_EVAL
+	bool "fft-eval"
+	help
+	  Program to aid open source spectrum analyzer development for
+	  Qualcomm/Atheros AR92xx and AR93xx based chipsets.
+
+	  It visualizes the FFT data reported by the chips to help
+	  interpreting and understanding the data.
+
+	  Enable sdl2 and sdl2_ttf for the graphic output tool
+	  fft_eval_sdl.
+
+	  https://github.com/simonwunderlich/FFT_eval
diff --git a/package/fft-eval/fft-eval.hash b/package/fft-eval/fft-eval.hash
new file mode 100644
index 0000000000..1ffa854be3
--- /dev/null
+++ b/package/fft-eval/fft-eval.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  154f99c3567835bbbbc9ec4c58bc79961f9fa5342effb6f0bc41475fc9a6d11f  fft-eval-6a82b383ce79afc4c1ba26ffcf34b15d3e95894b.tar.gz
+sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
+sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
+sha256  797832eda5ff4360a10fee3be94a3250995e76423b79675c9c44204c37ca492d  LICENSES/OFL-1.1.txt
diff --git a/package/fft-eval/fft-eval.mk b/package/fft-eval/fft-eval.mk
new file mode 100644
index 0000000000..3dd3cec0b4
--- /dev/null
+++ b/package/fft-eval/fft-eval.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# fft-eval
+#
+################################################################################
+
+FFT_EVAL_VERSION = 6a82b383ce79afc4c1ba26ffcf34b15d3e95894b
+FFT_EVAL_SITE = $(call github,simonwunderlich,FFT_eval,$(FFT_EVAL_VERSION))
+FFT_EVAL_LICENSE = CC0-1.0 (doc), GPL-2.0, OFL-1.1 (LiberationSans-Regular.ttf)
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
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CROSS=$(STAGING_DIR)/usr/bin/ $(FFT_EVAL_CONV_OPTS) -C $(@D) all
+endef
+
+define FFT_EVAL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CROSS=$(STAGING_DIR)/usr/bin/ $(FFT_EVAL_CONV_OPTS) \
+		-C $(@D) DESTDIR=$(TARGET_DIR) BINDIR=/usr/bin install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
