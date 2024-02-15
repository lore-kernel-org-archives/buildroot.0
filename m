Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2DC48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E616067B;
	Thu, 15 Feb 2024 14:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlNOBbS4Odrd; Thu, 15 Feb 2024 14:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F9A606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F9A606B1;
	Thu, 15 Feb 2024 14:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45BF31BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3219041D8E
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNlSxmIa0KTP for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD2CD41C56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD2CD41C56
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD2CD41C56
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:42:47 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A1C412C800D1;
 Thu, 15 Feb 2024 15:42:44 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 15:42:41 +0100
Message-Id: <20240215144243.3538255-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708008165; bh=MCnms7Wdon1nDRWpHU3ufe/oHXb7A2lKrXmP/76dn7k=;
 h=From:To:Cc:Subject:Date;
 b=Mh47a80/25n5dCKyoDsOOYsFHvNO8UD/D7jVwH8nVmLfYYfUTVLaeKqeEs8YAOZ7n
 UYdrkgdAEmrdLNneDKr2XlBD6anBayoUeKcMTBybxM/DZqz3QqV3gMwFiPhGp6KhPi
 /9s8MeRiAah914ZMG8EganIWISzgbswjy3Hqqu1PncCkuWCxDM+0tvlDQFvM53C5o3
 qYv2ZFtsQP9gtdvbpSHV5qsgHkJWdS5UY4q0YGDqArWlycbvvTswdYILPmwYlSAPLs
 sfY1NYK7BLJVIbFmsrhjPe2it8DkypTcD6EsfYVg0R30mN14PDa6V56FhIjQ3NfP9W
 kV9+Z7pZcPjvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Mh47a80/
Subject: [Buildroot] [PATCH 1/3] package/libmbim: bump to 1.30.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explicitly disable newly introduced fuzzer build option.

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/mbim-1-30/NEWS

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 8e7633cb94..ebc37504c5 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  cf74682c56f4c34ca4aee86de3b8c425a89fc2c0782052815295faf6a8e0a9fb  libmbim-1.28.2.tar.gz
+sha256  cfc729d23b9bf699b23a7ef2f5d732d6eff96234e31fed36b778771a6e3d3ee5  libmbim-1.30.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 59f55a57bc..717c2396f7 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.28.2
+LIBMBIM_VERSION = 1.30.0
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = \
@@ -13,7 +13,7 @@ LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
-LIBMBIM_CONF_OPTS = -Dman=false
+LIBMBIM_CONF_OPTS = -Dman=false -Dfuzzer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBMBIM_DEPENDENCIES += gobject-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
