Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BBDEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 18:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5469F6124A;
	Mon, 19 Jun 2023 18:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5469F6124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gV9EcL69sHg8; Mon, 19 Jun 2023 18:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8656116B;
	Mon, 19 Jun 2023 18:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C8656116B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AD541BF344
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 18:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF7F04051E
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 18:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF7F04051E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtgucjwNuXyF for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 18:15:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB53404E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BB53404E2
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 18:15:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A05ECA4C06CE;
 Mon, 19 Jun 2023 20:14:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57524)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qBJP0-0007V8-0s;
 Mon, 19 Jun 2023 20:14:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 20:14:57 +0200
Message-Id: <20230619181458.1596060-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687198498;
 bh=LBoq4R+y8UEwquxHFdpGTNSQRZqtEY7md6v3BPrbXHc=;
 h=From:To:Cc:Subject:Date:From;
 b=gbgwKYahAMysdHXna0d6fTWJ+pSML+HTdZ8OmqJZ4v7vGLgYkGsIu1xAa3X+eaO8L
 D6ii8lHgW7F5bcDDWtCXY5rJnXHotIzNl/UyIgn4ZRdia3e94LpeI0rCaK4/tpzRg4
 KAgdM6YAY7IwF4NvjOawMJzaGanJH4hNSmH+rcXVfSTmwh2uxd0vnMzR8n70CEV0S5
 kksx5hWkpPGlpXiDs3M4steY4tT06xAES5km7hFxnLSguLVNwj67iZrNyCLTyXpT5U
 RO3vm4jQQd7e8oSrX37T2H5k7xMd5zLKvF5rFNhOUpbGvIRNgvIjR3OlGIz9/K5pLm
 za9VndIoLGPwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gbgwKYah
Subject: [Buildroot] [PATCH 1/2] package/syslog-ng: disable python support
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added a list of python modules declared as runtime dependencies
https://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95d891ebb24a4ace9c652621
most of them with fixed (and outdated) versions.

Disable python support for the time being.

Fixes:
http://autobuild.buildroot.net/results/436/436e90bb1f77143b05cb98df78934555bbb7df35/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/syslog-ng/syslog-ng.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 1c4cec6adb..ecc8eeddce 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -16,7 +16,8 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 # We're patching configure.ac
 SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
-	--disable-java --disable-java-modules --disable-mongodb
+	--disable-java --disable-java-modules --disable-mongodb \
+	--disable-python
 SYSLOG_NG_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
@@ -39,15 +40,6 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-linux-caps
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SYSLOG_NG_DEPENDENCIES += python3
-SYSLOG_NG_CONF_OPTS += \
-	--enable-python \
-	--with-python=$(PYTHON3_VERSION_MAJOR)
-else
-SYSLOG_NG_CONF_OPTS += --disable-python
-endif
-
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 SYSLOG_NG_DEPENDENCIES += libesmtp
 SYSLOG_NG_CONF_OPTS += --enable-smtp
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
