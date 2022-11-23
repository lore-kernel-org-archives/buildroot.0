Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ACBC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A20B240BB9;
	Wed, 23 Nov 2022 09:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A20B240BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GsJrz54SJ6N; Wed, 23 Nov 2022 09:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4FE740462;
	Wed, 23 Nov 2022 09:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FE740462
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 812A21BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB97440158
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB97440158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FkmK0-K7Mu1r for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8F4840BCD
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F4840BCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A23BE842E4; Wed, 23 Nov 2022 09:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:52:34 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: d25bad9b3004a4da00e84a6eadbbd1d7f040becd
X-Git-Newrev: 6b5773da49c6177809c0f2f13a6dbab7b1d4521e
X-Patchwork-Hint: ignore
Message-Id: <20221123095358.A23BE842E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/asterisk:
 security bump to version 16.28.0
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
Content-Type: multipart/mixed; boundary="===============7614565661546702580=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7614565661546702580==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b5773da49c6177809c0f2f13a6dbab7b1d4521e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Asterisk 16.26.0 fixed the following security issues:

- [ASTERISK-29476] – res_stir_shaken: Blind SSRF vulnerabilities
  https://issues.asterisk.org/jira/browse/ASTERISK-29476

- [ASTERISK-29838] – ${SQL_ESC()} not correctly escaping a terminating \
  https://issues.asterisk.org/jira/browse/ASTERISK-29838

- [ASTERISK-29872] – res_stir_shaken: Resource exhaustion with large files
  https://issues.asterisk.org/jira/browse/ASTERISK-29872

https://www.asterisk.org/asterisk-news/asterisk-16-26-0-now-available/

It unfortunately also introduced a change to chan_iax2, breaking builds
without OpenSSL:
https://github.com/asterisk/asterisk/commit/59a8cdaca2dbb5eeb7382dfbe78c0c1cbed8ce6d

Which was again fixed in 16.28.0:
https://github.com/asterisk/asterisk/commit/f812dfb68c6ed7ae55b4c163716fd1ddc063ff54

So bump to 16.28.0:
https://www.asterisk.org/asterisk-news/asterisk-16-28-0-now-available/

The libxml2 support now uses pkg-config, so drop the libxml2-config handling:
https://github.com/asterisk/asterisk/commit/bf9dafa7c22302b2f1a12b8216da63102116d9c9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr:
  - add host-pkgconf dep, don't rely on implicit dep from host-asterisk
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bd42aa1d0a3ed7a5845c7b5e7c8aeb82d899699c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 880d67562d..9792d82ac5 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0fb817943a276f5e540c2a9432e8841cd3393e7c1bd1250055c620902f6eafc8  asterisk-16.25.2.tar.gz
+sha256  6e9c2f350db018df854b1301687ced8993facb2787698336e55cd19e0ae3ebfe  asterisk-16.28.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 9b59997b80..e0f28ae7ee 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.25.2
+ASTERISK_VERSION = 16.28.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
@@ -31,6 +31,7 @@ ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ith
 
 ASTERISK_DEPENDENCIES = \
 	host-asterisk \
+	host-pkgconf \
 	jansson \
 	libcurl \
 	libedit \
@@ -115,8 +116,7 @@ ASTERISK_CONF_OPTS += --without-avcodec
 ASTERISK_CONF_OPTS += --without-spandsp
 
 ASTERISK_CONF_ENV = \
-	ac_cv_file_bridges_bridge_softmix_include_hrirs_h=true \
-	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
+	ac_cv_file_bridges_bridge_softmix_include_hrirs_h=true
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
@@ -314,8 +314,6 @@ HOST_ASTERISK_LICENSE_FILES = COPYING
 # so do not inherit the target setup.
 HOST_ASTERISK_AUTORECONF = NO
 
-HOST_ASTERISK_CONF_ENV = CONFIG_LIBXML2=$(HOST_DIR)/bin/xml2-config
-
 HOST_ASTERISK_CONF_OPTS = \
 	--without-newt \
 	--without-curses \

--===============7614565661546702580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7614565661546702580==--
