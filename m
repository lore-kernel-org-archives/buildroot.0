Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F34BE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 23:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA7560879;
	Tue, 10 Dec 2024 23:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERriV_N-aCOV; Tue, 10 Dec 2024 23:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D836C608A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D836C608A0;
	Tue, 10 Dec 2024 23:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6882ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0FA5403CF
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42PbdhMx_klA for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 23:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CE95403B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE95403B0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CE95403B0
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:01:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2448DB0053D;
 Wed, 11 Dec 2024 00:01:51 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 00:01:44 +0100
Message-ID: <20241210230144.348409-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733871713;
 bh=LVMKtD3Vdf3vf5fUodoP0Fgi7Tu5SCSOxPmMPZBlbE0=;
 h=From:To:Cc:Subject:Date:From;
 b=oYta+kE5eWwlGBoHqhDXLjBeYBJ+e6Vrea3oN2gwRHvwOZJvWrrF7vMQI+3cnX8Qy
 H5YBpB4rjjtyqjPy2yVcE51g9P1Y+vvfWEeDjbgt4Jyo9+4cDDtrtBD4TJCZ6MBRHE
 Q3VQGzT1acscpG5dQvgYtV3SKcolKEraCYignYySZF8wVEjQnalQBxNplK7Ff6Mj8W
 VodkbzwW1J1Sp+udvUJcjHMsqm/oZTwr3jLxxAond4Cv9Vo/6iDOcqAfvIhWYN9g4g
 Q/RbsTi518rkD5YSLAicCrKRH8ZyAhdsz1CJumxH0qC38L3NpfXD6abCPehHKzA52z
 6f9g+A4J9+AJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oYta+kE5
Subject: [Buildroot] [PATCH 1/1] package/feh: bump to version 3.10.3
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1].

This commit also adds the "file" package optional dependency, for
libmagic. This support was introduced in commit [2].

This commit also updates the project home page and download site URL
to use https.

Finally, the LICENSE file hash is updated to reflect change in [3].

[1] https://github.com/derf/feh/blob/3.10.3/ChangeLog
[2] https://github.com/derf/feh/commit/4affafe91579799efd83f4c8e05c291eeb684c9c
[3] https://github.com/derf/feh/commit/1197dafc110fb0a2e322b977d2dced15456bf7df

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1582964080
---
 package/feh/Config.in |  2 +-
 package/feh/feh.hash  |  4 ++--
 package/feh/feh.mk    | 11 +++++++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/feh/Config.in b/package/feh/Config.in
index 7a348a1507..6f0bdd3242 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_FEH
 	help
 	  feh is an X11 image viewer aimed mostly at console users.
 
-	  http://feh.finalrewind.org/
+	  https://feh.finalrewind.org/
diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index f74b8fa335..f86a7ef6d7 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  57ab1ca61f57c96595878069f550d36f518530f88fa31b74cc39cd739f9258b6  feh-3.7.1.tar.bz2
-sha256  2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
+sha256  5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8  feh-3.10.3.tar.bz2
+sha256  881f1b901b5b99bce372fd9498106724a1ea52450f7bfc6fc1cce6736a2faf4d  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index df03deedde..be3b67aff9 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,14 +4,21 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.7.1
+FEH_VERSION = 3.10.3
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
-FEH_SITE = http://feh.finalrewind.org
+FEH_SITE = https://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
 FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 FEH_CPE_ID_VALID = YES
 
+ifeq ($(BR2_PACKAGE_FILE),y)
+FEH_DEPENDENCIES += file
+FEH_MAKE_OPTS += magic=1
+else
+FEH_MAKE_OPTS += magic=0
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 FEH_DEPENDENCIES += libcurl
 FEH_MAKE_OPTS += curl=1
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
