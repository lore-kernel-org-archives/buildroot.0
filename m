Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3014FC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 09:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18B2400F3;
	Sun,  5 Feb 2023 09:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C18B2400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vwi-68pPl-cg; Sun,  5 Feb 2023 09:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E49F4400DC;
	Sun,  5 Feb 2023 09:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E49F4400DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D66761BF28B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 09:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE652400DC
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 09:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE652400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWW7gR-ddTDN for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 09:02:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2211400D7
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 09:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2211400D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD8F4836B0; Sun,  5 Feb 2023 09:02:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 09:53:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b53e11f2ec049002a4c3c2829aaa0e7a31551f1e
X-Git-Newrev: 46683dd4a6e65b5ae3188440e9ae8eaf055d9a85
X-Patchwork-Hint: ignore
Message-Id: <20230205090205.CD8F4836B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: security bump version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=46683dd4a6e65b5ae3188440e9ae8eaf055d9a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.9

Upstream removed zrtp support:
https://github.com/signalwire/freeswitch/pull/1848

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.hash |  5 ++---
 package/freeswitch/freeswitch.mk   | 11 +----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 18a36ff23c..3497a3283f 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,11 +1,10 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.8.-release.tar.xz.sha256
-sha256  1176b26b2f463de2980e5be953f81ced94d23c784452bd41e086d3933a88be5f  freeswitch-1.10.8.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.9.-release.tar.xz.sha256
+sha256  f649d53af7beccb59c1d03864cd8f2d287e4ea26ef652b5c4969d29121ced063  freeswitch-1.10.9.-release.tar.xz
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
