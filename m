Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403CC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A128181215;
	Wed,  7 Aug 2024 19:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Od7W882P-OI8; Wed,  7 Aug 2024 19:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADBF081224
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADBF081224;
	Wed,  7 Aug 2024 19:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 368B01BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A106068F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5Da522mVeuQ for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD94C6066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD94C6066A
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD94C6066A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19C9E1814B9; Wed,  7 Aug 2024 21:57:39 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 21:57:31 +0200
Message-Id: <20240807195732.44775-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1723060659; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=h9UkUmJ/DYGBZAC91YhHU+zqKO4lOfMdP/hEocLlUxQ=;
 b=o/mIuyew9XJQlt7gbhYIsc1lYOEcpMuyRjxxHJwBaRuRuvDLC1EVgDCSibVBskCGW6IWmM
 EwQDMYs8YOFptPAWVehcyRxubWarlixcfhtvi+5tOjr3QtRS78eFlVghKUHctkyIMm0Dvr
 3Tgm9QbWj+qkaatF0NdYkiWHYy+iaDU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=o/mIuyew
Subject: [Buildroot] [PATCH] package/libgpiod2: bump to version 2.1.3
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- multiple bugfixes, see [0]
- license hash changed as well as cxx-bindings were relicensed to LGPL-2.1+

[0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.1.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libgpiod2/libgpiod2.hash | 4 ++--
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index b5488496b2..3b498f0eb9 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c  libgpiod-2.1.tar.xz
+sha256  2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58  libgpiod-2.1.3.tar.xz
 # Hash for license file
-sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
+sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 856eb9bd14..142289cb3a 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.1
+LIBGPIOD2_VERSION = 2.1.3
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
