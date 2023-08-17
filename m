Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73937C531DC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE5460A6A;
	Thu, 17 Aug 2023 19:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE5460A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Nj6fjomff2i; Thu, 17 Aug 2023 19:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5A660B5D;
	Thu, 17 Aug 2023 19:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5A660B5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 396231BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 111D141694
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 111D141694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzN__YbwijdV for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:14:31 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2CDF40999
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2CDF40999
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD621A4C1153
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 21:14:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37434)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWiRi-00046p-25
 for buildroot@buildroot.org; Thu, 17 Aug 2023 21:14:14 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 21:14:14 +0200
Message-Id: <20230817191414.106738-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817191414.106738-1-bernd@kuhls.net>
References: <20230817191414.106738-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692299654;
 bh=oMCsMC3mwHnTRW9yRhzoKOROMWDmX9+ybkQQkvlaom4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qv4eJ6XfQFIeEcvFfpWx0S61RNCJseqfYFt4TTaq0OzUNLbiU6OM5nbJxNs9bh7+U
 8CnXav8GjRrAZUjdsurvdIHB1o8QzqED6pLcOxLNmi2F4PWvYUHTKEVzZP7jmcnYx7
 0YS1B9OLsqbej4K/9QuPabjkRBzq1l90UxKNYFr58GPTgzGLls0tagz1c+Daa891vz
 gka+qU5sqtapNZN00vqrsCeKwjWUFUZwAoP3hmuISCG5//VyTndQhANUqa9imAknMA
 fgZqE+bL1plETfBySfYSZKjacGC9cL27jgap2HpO04kIdOhYhnQqrZhUQc7cE+i3h+
 xjdVUvoD4zy1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qv4eJ6Xf
Subject: [Buildroot] [PATCH 2/2] package/freeswitch: security bump version
 to 1.10.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.10
"This is a major release containing critical security fixes, adding
 Debian 12 Bookworm, OpenSSL 3 and FFmpeg5 support."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 3497a3283f..f12446dfef 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.9.-release.tar.xz.sha256
-sha256  f649d53af7beccb59c1d03864cd8f2d287e4ea26ef652b5c4969d29121ced063  freeswitch-1.10.9.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.10.-release.tar.xz.sha256
+sha256  d2c702c7f4bd6eca539c3981cf859ad5c1846d9283829e24cd75686f2322b9df freeswitch-1.10.10.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7497cc4964..07d436cf0b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.9
+FREESWITCH_VERSION = 1.10.10
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
