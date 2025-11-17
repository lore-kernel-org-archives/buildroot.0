Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7289DCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 18:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9EB60EA1;
	Mon, 17 Nov 2025 18:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_ycUu-Tfxzv; Mon, 17 Nov 2025 18:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EACB60E87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EACB60E87;
	Mon, 17 Nov 2025 18:58:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EE4ED5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15D5F40059
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS33IJUd5lV0 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 18:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2E1F40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2E1F40027
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2E1F40027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 18:58:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9245A4C6F09
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:58:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL4Qw-000000006Zh-1myz
 for buildroot@buildroot.org; Mon, 17 Nov 2025 18:58:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 19:58:37 +0100
Message-ID: <20251117185838.4083475-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117185838.4083475-1-bernd@kuhls.net>
References: <20251117185838.4083475-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763405918;
 bh=/Sqo2KYhQt5yo+nh80vacTHByAEn0DXRC6LO4GlmWZU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Dups7PNfFhcReaE5edctT2mRSVLVMk2p/NbpiiBTfv9vcz95OJ3qwPcMhpIvOIz+E
 JUhzEOmn4jc5/JIJ6+lgMfqGsSwWSDihlTcO9q+lVFAjBt2+OX+Vu6wYng+jvyEa9k
 tgOzn5t1HHUiUiAmPWckdbr0+vqhKsE0oZXBNzKyBOMDBnVJEoDUrBix2q9GkXTtCB
 kbxNUfFxXDLZ26tctsFYF18GYbQFqOTezfBKbK+y+71q1B4sHqCnaSXhFut1ATcsst
 Yh74HDL+yPnc8TSPN/4uR9ofk+Q5s7Zu/q4CQTKnp9X7d4L69Q9ES8t2I5uJgHoTU3
 Uf/khIHI6wnGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Dups7PNf
Subject: [Buildroot] [PATCH 2/3] package/libdecor: bump version to 0.2.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit log:
https://gitlab.freedesktop.org/libdecor/libdecor/-/commits/0.2.4

Switched to xz tarball and hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdecor/libdecor.hash | 3 ++-
 package/libdecor/libdecor.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
index 7572663466..69163f3227 100644
--- a/package/libdecor/libdecor.hash
+++ b/package/libdecor/libdecor.hash
@@ -1,3 +1,4 @@
+# From https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/0.2.4/downloads/libdecor-0.2.4.tar.xz.sha256sum
+sha256  b17cf420e8dcb526bf82da5d36f8443a91fad0777083fa4ec5c1df8ee877416f  libdecor-0.2.4.tar.xz
 # Locally calculated
-sha256  21a471e3f48088d3fd8ecc5999c45258a32198782c0157482f7ebe82de42f79c  libdecor-0.2.3.tar.gz
 sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
index d064c9e9ef..26f4be40a6 100644
--- a/package/libdecor/libdecor.mk
+++ b/package/libdecor/libdecor.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBDECOR_VERSION = 0.2.3
-LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/$(LIBDECOR_VERSION)
+LIBDECOR_VERSION = 0.2.4
+LIBDECOR_SOURCE = libdecor-$(LIBDECOR_VERSION).tar.xz
+LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/$(LIBDECOR_VERSION)/downloads
 LIBDECOR_LICENSE = MIT
 LIBDECOR_LICENSE_FILES = LICENSE
 LIBDECOR_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
