Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45185EEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B41405A9;
	Thu,  1 Jan 2026 22:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPyQdd9JHrCw; Thu,  1 Jan 2026 22:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41251405FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304889;
	bh=kFBi09zBwnWfIAFky3ZqDusr+aGUN5JJX3ITfD7xu+A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nSVC/R4pUIiPh3UE7Le/e1j1bTCmYZL4pJLe7q1jt6xAsr2ZqRU+C0TVLZisz1jJH
	 RJpSWXWktIh/fxxzdE6veErXa4hgtNmRSsF1aBKwNPV6X/OziYDlErRnYkawFozn1I
	 DTuECL2ylBW3H76ULT5GWtF89Fx26fVlSlmGhydUzyM1o434rf7HBmRtR7qTwQTb/O
	 myFUwO/c5rCeTMTBpKBXzPgrEaI1k1flSUq6kOancvP+I77j2x0IqoGtae2KGRpgtl
	 IN5wlYBdX9hyzDgRdW1N5AtGbc/WyBdimfUhcrwq9Fg7+Be0PwoDnErPFU8bhj/4qy
	 FysaKmH+02VmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41251405FF;
	Thu,  1 Jan 2026 22:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4402019D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70AFB405A9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABYyyCIPvZks for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B38405FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97B38405FF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71B3B851FF; Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:56:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f226b2923a478326f56052310c59ca908402a19
X-Git-Newrev: 53044437c8ba83eb4409a4af89fdfe13de7fb737
X-Patchwork-Hint: ignore
Message-Id: <20260101220125.71B3B851FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: add option to
 build/install tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=53044437c8ba83eb4409a4af89fdfe13de7fb737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/Config.in | 11 +++++++++++
 package/quazip/quazip.mk | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index 4c7a187571..c6099719e5 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -10,3 +10,14 @@ config BR2_PACKAGE_QUAZIP
 	  archives. It uses the Qt toolkit.
 
 	  http://quazip.sourceforge.net
+
+if BR2_PACKAGE_QUAZIP
+
+config BR2_PACKAGE_QUAZIP_INSTALL_TESTS
+	bool "Build tests"
+	select BR2_PACKAGE_QT6BASE_TEST if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
+	help
+	  Build and install unit test binaries
+
+endif
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 06b702e732..a388b161ca 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -16,6 +16,18 @@ ifeq ($(BR2_PACKAGE_QT6BASE),y)
 QUAZIP_DEPENDENCIES +=  qt6base qt6core5compat
 endif
 
+ifeq ($(BR2_PACKAGE_QUAZIP_INSTALL_TESTS),y)
+QUAZIP_CONF_OPTS += -DQUAZIP_ENABLE_TESTS=ON
+
+define QUAZIP_INSTALL_TESTS
+	$(INSTALL) -D -m 0755 $(@D)/qztest/qztest $(TARGET_DIR)/usr/bin
+endef
+
+QUAZIP_POST_INSTALL_TARGET_HOOKS += QUAZIP_INSTALL_TESTS
+else
+QUAZIP_CONF_OPTS += -DQUAZIP_ENABLE_TESTS=OFF
+endif
+
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 QUAZIP_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
