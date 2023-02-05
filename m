Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E3C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 08:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6EE5400AF;
	Sun,  5 Feb 2023 08:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6EE5400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyzzkbzeev5C; Sun,  5 Feb 2023 08:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1EA4400D7;
	Sun,  5 Feb 2023 08:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1EA4400D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 063121BF20B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDC58183D
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFDC58183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjggwAD0HewV for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 08:16:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68EA2815CC
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68EA2815CC
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 08:16:21 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout07.t-online.de (Postfix) with SMTP id B42EEA624;
 Sun,  5 Feb 2023 09:16:18 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.195.67]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pOaCA-3PMHgH0; Sun, 5 Feb 2023 09:16:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:34828)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pOaCA-0008Sg-0h;
 Sun, 05 Feb 2023 09:16:18 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 09:16:17 +0100
Message-Id: <20230205081617.113018-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205081617.113018-1-bernd.kuhls@t-online.de>
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675584978-39FF2A0B-07E92BFB/0/0 CLEAN NORMAL
X-TOI-MSGID: 9caefc65-d0ba-46cf-b9b0-4bdacc42f700
Subject: [Buildroot] [PATCH 3/3] package/freeswitch: security bump version
 to 1.10.9
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.9

Upstream removed zrtp support:
https://github.com/signalwire/freeswitch/pull/1848

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Upstream release notes declares:
"This is an important release containing security fixes and stability
 improvements." without mentioning any CVEs.

 package/freeswitch/freeswitch.hash |  5 ++---
 package/freeswitch/freeswitch.mk   | 11 +----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 18a36ff23c..3518d60b49 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,11 +1,10 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.8.-release.tar.xz.sha256
-sha256  1176b26b2f463de2980e5be953f81ced94d23c784452bd41e086d3933a88be5f  freeswitch-1.10.8.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.9.-release.tar.xz.sha256
+sha256  f649d53af7beccb59c1d03864cd8f2d287e4ea26ef652b5c4969d29121ced063 freeswitch-1.10.9.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
 sha256  e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
-sha256  7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
 sha256  ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 6234dd8e97..7497cc4964 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.8
+FREESWITCH_VERSION = 1.10.9
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
@@ -81,15 +81,6 @@ FREESWITCH_CONF_OPTS = \
 	--without-python \
 	--disable-system-xmlrpc-c
 
-# zrtp supports a limited set of archs, sparc support is also broken due
-# to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
-ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le)$(BR2_x86_64),y)
-FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c
-FREESWITCH_CONF_OPTS += --enable-zrtp
-else
-FREESWITCH_CONF_OPTS += --disable-zrtp
-endif
-
 # Enable optional modules
 FREESWITCH_ENABLED_MODULES += \
 	applications/mod_avmd \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
