Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1E5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:02:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C1E60F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30C1E60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D6D60AD5;
	Tue, 26 Oct 2021 20:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtj8Vmod6zYc; Tue, 26 Oct 2021 20:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48562606AF;
	Tue, 26 Oct 2021 20:02:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 464B81BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AA544011F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVePIxrzVgeC for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:02:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D28A400ED
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 93D5C88F3D; Tue, 26 Oct 2021 19:58:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:48:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a98cfa16b21c4ce18b8f33423ae6dec424a07092
X-Git-Newrev: 9aa735f64a245bb3369cfd7e29db875733a9d437
X-Patchwork-Hint: ignore
Message-Id: <20211026195844.93D5C88F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: Add Open POSIX and
 realtime test suite opts
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aa735f64a245bb3369cfd7e29db875733a9d437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During LTP and/or kernel development it's very rare that I want the
Open POSIX and the realtime tests. Open POSIX in particular takes
considerable time to build. So this adds the option of disabling them.

They default to on so as not to break existing test automation.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Cc: io@richiejp.com
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ltp-testsuite/Config.in        | 16 ++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk | 12 +++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 32e1b6ad76..272c2ede37 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -20,6 +20,22 @@ config BR2_PACKAGE_LTP_TESTSUITE
 
 	  http://linux-test-project.github.io
 
+if BR2_PACKAGE_LTP_TESTSUITE
+
+config BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX
+	bool "Open POSIX testsuite"
+	default y
+	help
+	  Test suite for POSIX compliance. Included with the LTP.
+
+config BR2_PACKAGE_LTP_TESTSUITE_REALTIME
+	bool "Realtime testsuite"
+	default y
+	help
+	  Test suite for realtime kernels. Included with the LTP.
+
+endif
+
 comment "ltp-testsuite needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 3d8fe3b78c..cc6d3c63b6 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -11,9 +11,15 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
-LTP_TESTSUITE_CONF_OPTS += \
-	--with-realtime-testsuite --with-open-posix-testsuite \
-	--disable-metadata
+LTP_TESTSUITE_CONF_OPTS += --disable-metadata
+
+ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
+LTP_TESTSUITE_CONF_OPTS += --with-open-posix-testsuite
+endif
+
+ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_REALTIME),y)
+LTP_TESTSUITE_CONF_OPTS += --with-realtime-testsuite
+endif
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 LTP_TESTSUITE_DEPENDENCIES += linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
