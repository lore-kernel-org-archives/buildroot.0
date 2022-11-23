Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E4C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 413D3610C5;
	Wed, 23 Nov 2022 21:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 413D3610C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2I6z3xN2Ebb; Wed, 23 Nov 2022 21:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E9E2610C2;
	Wed, 23 Nov 2022 21:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9E2610C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC681BF95E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08B4C60BC2
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B4C60BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlF21ab3ZVR7 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:50:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FA760A9E
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FA760A9E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 278A2843AE; Wed, 23 Nov 2022 21:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:50:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ce2db7b986f6735a1ab840d222de5c590fd2431a
X-Git-Newrev: 6bab22ca418f4f1ecde53c178ee301c7dfaab44a
X-Patchwork-Hint: ignore
Message-Id: <20221123215050.278A2843AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/inadyn: bump to v2.10.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
