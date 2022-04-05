Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AB4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 13:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D870A61031;
	Tue,  5 Apr 2022 13:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4KbUrLUeQYV; Tue,  5 Apr 2022 13:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624ED61036;
	Tue,  5 Apr 2022 13:51:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4CA1BF3AD
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 13:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B6A640A87
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 13:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TjqwETVQgbMX for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 13:51:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33EEC40A77
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GYsBIv7g8BMkkArT+q+vYtWK0AtaTp9qQn1d2MtAW+c=; b=Aw31X+Im5Dl2/Pps76uHfCci2a
 UkaHif7PzMtkMmxk/knrPLlmB+RUkHj+1U/JMuUsnwBffh9hwf1vXKGaikXIZTk/KefBndELb3coE
 T69efRRg0VGgFd/NSiHK1R2QV28kvvXuioj9TeUXQodQVZsCz7vkFI/A0epNGOFqwdbqQgEYeRLwJ
 HYDYVnCWg4RkCtEZv+3mKq2FmbqaaMu1OZVuR7feYeyU2HTDemno5ZphVp+LyvXkJt+N+wzRN+k8j
 OqU4+6b9H/0msnTlywgPk/dV5Nrx12YKODL58A6ipZ9oWEDNf3LQeUc1Pw7QqWbCFkS88qZfSDCeM
 GBOZs8qA==;
Received: from 91-153-34-241.elisa-laajakaista.fi ([91.153.34.241] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nbjab-000Cbf-Oz; Tue, 05 Apr 2022 15:51:21 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 2a77aed4;
 Tue, 5 Apr 2022 13:51:11 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 16:51:11 +0300
Message-Id: <20220405135111.827101-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version 2.36.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to a new major release which brings in improvements and a few new
features. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.0.html

None of the new features need additional dependencies. The build option
USE_SYSTEMD has been renamed to ENABLE_JOURNALD_LOG, though.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 231bbc447d..1e1aa62117 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.6.tar.xz.sums
-md5  c9705270b342474cca28cf51632ccbbe  wpewebkit-2.34.6.tar.xz
-sha1  44ae95de1b5ebf0a2b0ea3630b3677153c597402  wpewebkit-2.34.6.tar.xz
-sha256  301e895c8ed08ce7dccef3192b972f2ccfc2020463244c64069a636f2b05265f  wpewebkit-2.34.6.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.0.tar.xz.sums
+md5  b7b951cd7f6eb4a8585338505ce71234  wpewebkit-2.36.0.tar.xz
+sha1  904629a9ce3a4ab67d47315b008dc3152d504205  wpewebkit-2.36.0.tar.xz
+sha256  096aa9f87d9bfbfc80f558388a86721cdcc508b42ddef10bd270aec9aee96d5a  wpewebkit-2.36.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index aa04e78623..3ce38d8c27 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.6
+WPEWEBKIT_VERSION = 2.36.0
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -81,10 +81,10 @@ WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=ON
+WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WPEWEBKIT_DEPENDENCIES += systemd
 else
-WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=OFF
+WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
 # JIT is not supported for MIPS r6, but the WebKit build system does not
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
