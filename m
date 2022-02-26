Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22455C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 16:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31ED40A05;
	Sat, 26 Feb 2022 16:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpIwfHMV4A7A; Sat, 26 Feb 2022 16:15:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0042D40A01;
	Sat, 26 Feb 2022 16:15:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72F891BF422
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE3583E4E
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 16:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4J2mMUcJ8sxe for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 16:15:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E919C83E4A
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D/E9ZafXpQwK7SLCWiwqnpLbySxBrGzY5MGs37U1DNk=; b=pbOuZ1y/rlNCAPnYay2dWU3oE7
 z2FAG/+d6YIQh/tk7l50xrxdfWw4ZD/p386FjoPGo/LbNmX387nDsNsca83a2YcpPYQoPp4eHr0ZC
 63G85x4cG4QQ9Nl/+5aPvFzyBaFTOFAtiW6kWRU76g19w+iuOmgvNfG666hihDQvaokGXN5aE+1RD
 QiCSald9vrzU7ZQ1ZnNplOtGFyJm+XzLNNtKnT5Fx/8X8TBSllbd9UVDZS2bea+MwPBIl4fr4Z5PJ
 LVZC2GsxNzNUbYVNO5kXzQlZ52MgRgqMv9agoENl4uO49gd/Ba8LJYGKxnTzDb2QI5yN/j1tQUpO6
 KMljdcZQ==;
Received: from 91-153-34-241.elisa-laajakaista.fi ([91.153.34.241] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nNzii-0005o4-QO; Sat, 26 Feb 2022 17:14:56 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 809bd1dc;
 Sat, 26 Feb 2022 16:14:44 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 18:14:43 +0200
Message-Id: <20220226161444.2221042-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224231609.1097793-1-aperez@igalia.com>
References: <20220224231609.1097793-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next v2 1/2] package/bubblewrap: bump to version
 0.6.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version includes a new feature which allows specifying multiple
seccomp filters. There is now a Meson-based build system as well, but
for the moment the build recipe keeps using the autotools based one.
Release notes can be found at:

  https://github.com/containers/bubblewrap/releases/tag/v0.6.0
  https://github.com/containers/bubblewrap/releases/tag/v0.6.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 88aba150cd..c3bf4d8212 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.5.0
-sha256  16fdaf33799d63104e347e0133f909196fe90d0c50515d010bcb422eb5a00818  bubblewrap-0.5.0.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.6.1
+sha256  9609c7dc162bc68abc29abfab566934fdca37520a15ed01b675adcf3a4303282  bubblewrap-0.6.1.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 5f3d95e826..1ca2029700 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.5.0
+BUBBLEWRAP_VERSION = 0.6.1
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
