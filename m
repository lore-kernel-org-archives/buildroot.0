Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD403E7DF16
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A4DE60782;
	Mon,  2 Feb 2026 18:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSbMYhYcC0KF; Mon,  2 Feb 2026 18:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C8DA60793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770055476;
	bh=gTAnk0DToP18ozU8Q6NvapDXiEzJystSWXvZD04hO5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l8DoWKHLlGaERPnrKudpMUs5T5MybMY5l6lbBsvS07ro8uIZIju27CxJAQdaM8aPT
	 j4YRxUjlxaAldk/0WqacQuxjRKCjcCmBcLAM9mhH0LURJdgY5OpRA1GEWP4vyEjv8y
	 DCxfybiNoGiw5eCb4f9Ibm58eA84RaeGOVWiHENOe+I2izGWEDQ7j7bMwAKOObIwew
	 wrSNHfbsqBAhZH2ZiLEeeGL6q8UFfqgDBFyYS0+JLgjtk/IOuc0eM6AdES4o77y88/
	 a4l9xCMe6G85WJRC8p8ICgTM+aivl14jYXUPgA/tUg43ad/beItPFx6iNvm21O5FZ/
	 jE8/aQMcUPORw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8DA60793;
	Mon,  2 Feb 2026 18:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1A5C23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFEC560793
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4Tw6S-0QDsi for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F5660781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60F5660781
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:04:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52A9A86487; Mon,  2 Feb 2026 18:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 19:04:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12472fe6fff968b8fb17ad7c1c166706c696479d
X-Git-Newrev: f45bec1edfc684e9fa0506903b2bf882d16ddb47
X-Patchwork-Hint: ignore
Message-Id: <20260202180433.52A9A86487@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpir: use working upstream site
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=f45bec1edfc684e9fa0506903b2bf882d16ddb47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update project URL and _SITE as the previous site is no longer
available, see: https://github.com/wbhart/mpir/pull/298

Fixes:

  https://autobuild.buildroot.net/results/7e961af4261a6c883d0b5c37e2ebf20c632f842f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpir/Config.in | 2 +-
 package/mpir/mpir.hash | 2 +-
 package/mpir/mpir.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mpir/Config.in b/package/mpir/Config.in
index da4cc9f44e..b22350b23b 100644
--- a/package/mpir/Config.in
+++ b/package/mpir/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_MPIR
 	  MPIR is a highly optimised library for bignum arithmetic
 	  forked from the GMP bignum library.
 
-	  http://www.mpir.org/
+	  https://github.com/wbhart/mpir
diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
index 71d0c19d12..3b1b3e877d 100644
--- a/package/mpir/mpir.hash
+++ b/package/mpir/mpir.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
+sha256  86a5039badc3e6738219a262873a1db5513405e15ece9527b718fcd0fac09bb2  mpir-3.0.0.tar.gz
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 46cd35e436..87bf8247a5 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 MPIR_VERSION = 3.0.0
-MPIR_SITE = http://www.mpir.org
-MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
+MPIR_SITE = $(call github,wbhart,mpir,refs/tags/mpir-$(MPIR_VERSION))
 MPIR_LICENSE = LGPL-3.0+
 MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
@@ -14,6 +13,9 @@ MPIR_DEPENDENCIES = gmp host-yasm
 # 0002-Fix-configure-failures-with-Xcode12.patch
 MPIR_AUTORECONF = YES
 
+# We don't care about the documentation
+MPIR_CONF_ENV = MAKEINFO=true
+
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
