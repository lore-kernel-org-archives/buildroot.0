Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4263CC53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B2B60907;
	Tue, 28 Jul 2026 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95Qit_4qhfVd; Tue, 28 Jul 2026 14:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCAB60A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247267;
	bh=MpIbiwyruds8+God0bOn5sS8dHFbjFh5wiVZHpvfiZw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qiWHgKioLs8s9Yq9YtTIwo/sievBwoWFRxZoMmp2mmszsH2AeGVi3Hg4nOqYWKNib
	 K3WUe58fvVL0gmpnDnpvrs1MpkJBVsn0p6rjDh8pvu650EaFxJ/NpdwUIMnAHF2SuT
	 48Q/WgfKSUfiErGe2i0rygdDumbV7LPJdoff+Tintxe2OeXP4avnYsjFOa1jiXEGFm
	 XSb/GeR9Rq7Vds3woDGv8cSFCKX6h/VOuDdcUa0w8U9XdaVnwPG0gWNmx5hCr7KQD4
	 bG09czxRZgrW36J4hFsOKVNcJIuO1BGTdwtc8nwoL6XWMcPnaEBroLoCL5EqBATUEQ
	 bkDOM1JMwRoCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCAB60A3E;
	Tue, 28 Jul 2026 14:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C40F788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 426984058F
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IKIqdI9SR09 for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 14:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 681D0409A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 681D0409A8
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B46678B410; Tue, 28 Jul 2026 14:00:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 15:56:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81f7c82740102f3d770f6320620450c6aa66a690
X-Git-Newrev: 0946c924686a451053df1954bf95ab1e785fede3
X-Patchwork-Hint: ignore
Message-Id: <20260728140016.B46678B410@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version to git
 c0cbd14550
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0946c924686a451053df1954bf95ab1e785fede3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Disable some new configure options which we do not support.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 1062dd2c81..8b18bb247b 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ced1ea6ce8b78ac9bfc7e6e8cdc908a57840d25276b5248039661483faad705  tvheadend-37453bc3fe5f9e10f3428ebb1abdc613f8b07186.tar.gz
+sha256  f907bda7faf93fc95c3a705b70c6ce2a21f63ac824a610e39ab58075fca43356  tvheadend-c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4.tar.gz
 sha256  bd98338d78a253979b9b3040de83c8a6546de499c9a648b8d2d6dedb891c3605  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 73563acb8e..d74adcfe14 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 37453bc3fe5f9e10f3428ebb1abdc613f8b07186
+TVHEADEND_VERSION = c0cbd14550aa40b4f4eb32d1baea1e7a1ed89cf4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -18,7 +18,9 @@ TVHEADEND_DEPENDENCIES = \
 TVHEADEND_CONF_OPTS = \
 	--disable-hdhomerun_client \
 	--disable-omx \
-	--disable-pcre
+	--disable-pcloud_cache \
+	--disable-pcre \
+	--disable-vue_build
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
