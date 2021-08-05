Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B590AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFA961078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BFA961078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F21E40240;
	Thu,  5 Aug 2021 21:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHzVUvD1uS6y; Thu,  5 Aug 2021 21:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6BAD4026E;
	Thu,  5 Aug 2021 21:47:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B65D91BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A515C40581
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xsw2ludmOItq for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:47:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA9640478
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:47:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6B5F28C96D; Thu,  5 Aug 2021 21:47:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 23:47:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb340dfbdc771d71a3fbe89492ea229459d55681
X-Git-Newrev: b72401692e1ea73a37fcf4c0b421b654e8a2100f
X-Patchwork-Hint: ignore
Message-Id: <20210805214727.6B5F28C96D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libesmtp: security bump to version
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b72401692e1ea73a37fcf4c0b421b654e8a2100f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After more than a decade, libESMTP version 1.0.6 is superceded. Despite
proving robust a little bitrot has occurred, especially regarding
OpenSSL support. The original application data APIs are prone to memory
leaks and are deprecated in favour of safer replacements. Version 1.1
updates libESMTP without breaking API and ABI compatibility and
provides a basis for future development.

In addition to updates to the codebase, documentation is modernised and
is more comprehensive.

All libESMTP users are encouraged to upgrade from version 1.0.6.

- Update license files
- Update indentation in hash file (two spaces)
- Switch to meson-package
- Handle threads and tls meson options
- libesmtp-config has been dropped:
  https://github.com/libesmtp/libESMTP/issues/8
- Fix CVE-2019-19977: libESMTP through 1.0.6 mishandles domain copying
  into a fixed-size buffer in ntlm_build_type_2 in ntlm/ntlmstruct.c, as
  demonstrated by a stack-based buffer over-read.

https://github.com/libesmtp/libESMTP/releases/tag/v1.1.0
https://libesmtp.github.io/changes-since-v1.0.6.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libesmtp/Config.in     |  1 +
 package/libesmtp/libesmtp.hash |  6 +++---
 package/libesmtp/libesmtp.mk   | 24 +++++++++++++++++-------
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index db2dc8ec9c..5c6a412134 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Library for sending emails through SMTP.
 
diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
index 9e1ca22b5b..596ed4eaca 100644
--- a/package/libesmtp/libesmtp.hash
+++ b/package/libesmtp/libesmtp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b	libesmtp-1.0.6.tar.bz2
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
-sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	COPYING.LIB
+sha256  32bc3614ca12d21c7d933f32d43410e8744b6f91fdca7732da9877a385e4e6c3  libesmtp-1.1.0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING.GPL
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 1f5cdec191..10fe7bf324 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -4,14 +4,24 @@
 #
 ################################################################################
 
-LIBESMTP_VERSION = 1.0.6
-LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
-LIBESMTP_SITE = http://sources.buildroot.net/libesmtp
+LIBESMTP_VERSION = 1.1.0
+LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
 LIBESMTP_INSTALL_STAGING = YES
-LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
-LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
-LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
+LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
 LIBESMTP_CPE_ID_VENDOR = libesmtp_project
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBESMTP_CONF_OPTS += -Dtls=enabled
+LIBESMTP_DEPENDENCIES += openssl
+else
+LIBESMTP_CONF_OPTS += -Dtls=disabled
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBESMTP_CONF_OPTS += -Dpthreads=enabled
+else
+LIBESMTP_CONF_OPTS += -Dpthreads=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
