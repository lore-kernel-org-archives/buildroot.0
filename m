Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6242AC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA734167B;
	Mon,  5 Dec 2022 12:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA734167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KUkWi7R8SdZ; Mon,  5 Dec 2022 12:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 187134167F;
	Mon,  5 Dec 2022 12:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187134167F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 112DD1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD27B405E6
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD27B405E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 202ObgQ6HP_2 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159C04052D
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 159C04052D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 006AC85B9E; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:50:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce2db7b986f6735a1ab840d222de5c590fd2431a
X-Git-Newrev: 6bab22ca418f4f1ecde53c178ee301c7dfaab44a
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.006AC85B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: bump to v2.10.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6bab22ca418f4f1ecde53c178ee301c7dfaab44a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Highligts include support for MbedTLS and a serious memory leak fix to
the GnuTLS backend.

Changes:
 - Add support for MbedTLS
 - Add support for per-provider interface to bind to
 - Use HTTP-only for api.ipify.org, default (fallback) checkip service

Fixes:
 - serious memory leak in GnuTLS backend
 - ca-trust-file has no effect for GnuTLS
 - handle easyDNS "no update required" as OK status
 - use configured server:port, don't force port 443 for HTTPS

(From https://github.com/troglobit/inadyn/releases/tag/v2.10.0)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 98af30e9fc..2c0995babf 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  7370eb7ad5d33a9cf2e7e4a6a86c09587fbf9592cd357c6f472c33f575bac26d  inadyn-2.9.1.tar.gz
+sha256  1727b6aae6727f99eba584e46950369d7b259d2ef09e5bc02566e9c3c1d6daf6  inadyn-2.10.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 041d1eff57..5a24c1eced 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.9.1
+INADYN_VERSION = 2.10.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
@@ -15,6 +15,8 @@ INADYN_CONF_OPTS += --enable-openssl
 INADYN_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 INADYN_DEPENDENCIES += gnutls
+else ifeq ($BR2_PACKAGE_MBEDTLS, y)
+INADYN_DEPENDENCIES += mbedtls
 else
 INADYN_CONF_OPTS += --disable-ssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
