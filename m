Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3B1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E2F06103A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E2F06103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09E5B40188;
	Wed, 28 Jul 2021 19:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aeNG6C1ilzv7; Wed, 28 Jul 2021 19:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F41AD40520;
	Wed, 28 Jul 2021 19:25:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77E5A1BF2BC
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66ED783A49
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UD4TXMfdRdEU for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:25:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A486383ABB
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:25:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4F2F1890EE; Wed, 28 Jul 2021 18:50:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:24:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b3e72139952e0c953c8649cca55571cec5f3836
X-Git-Newrev: f3ef0723cf7159401de595dbfb2d023d78c9336a
X-Patchwork-Hint: ignore
Message-Id: <20210728185018.4F2F1890EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: enable python support and
 modules
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3ef0723cf7159401de595dbfb2d023d78c9336a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option that enables gpsd python support including modules, tools,
and gpsfake test harness. If python is enabled then install python
modules unconditionally. Note that gpsd python modules run compatibly
under Python 2 and 3.x for x >= 2. So enable gpsd python support when
any Python version is enabled in board configuration. If no Python is
enabled, but gpsd Python support is requested, then select Python 3.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gpsd/Config.in | 11 +++++++++++
 package/gpsd/gpsd.mk   | 13 ++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5dd57c34b8..1da9a5ce2a 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -79,6 +79,17 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
+config BR2_PACKAGE_GPSD_PYTHON
+	bool "build Python support and modules"
+	depends on BR2_USE_WCHAR # python
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	help
+	  Python libraries and tools for the gpsd service daemon
+	  including gpsfake test harness.
+
+comment "GPSD python support not available with toolchain w/o wide characters support"
+	depends on !BR2_USE_WCHAR
+
 comment "Protocols"
 
 config BR2_PACKAGE_GPSD_AIVDM
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 41dff2f155..0fbb5dfa1d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -25,7 +25,6 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr \
 	sysroot=$(STAGING_DIR) \
 	strip=no \
-	python=no \
 	qt=no \
 	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
 
@@ -189,6 +188,18 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
 GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GPSD_SCONS_OPTS += \
+	python=yes \
+	python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
+else ifeq ($(BR2_PACKAGE_PYTHON),y)
+GPSD_SCONS_OPTS += \
+	python=yes \
+	python_libdir="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+else
+GPSD_SCONS_OPTS += python=no
+endif
+
 GPSD_SCONS_ENV += \
 	LDFLAGS="$(GPSD_LDFLAGS)" \
 	CFLAGS="$(GPSD_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
