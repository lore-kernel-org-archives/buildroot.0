Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485DBCCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 11:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FA0608C6;
	Mon,  3 Nov 2025 11:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQtwhke8_hB4; Mon,  3 Nov 2025 11:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1897B60A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1897B60A6A;
	Mon,  3 Nov 2025 11:53:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1678C278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1164403DE
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYUFV2ny8UtE for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 11:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80F64404F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F64404F7
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80F64404F7
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6313F1814B9; Mon,  3 Nov 2025 12:53:06 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  3 Nov 2025 12:52:07 +0100
Message-ID: <20251103115220.2911208-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1762170786; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=sb15SGmf7rpUzw0vgIIx1xMH+o60IgV8Kg1GBt5ditA=;
 b=qPLne97SMwVEpcw4AVlqenz4S7RdS4CuYCvFBcoBUkVEFzE1Segv6jVTO2Ltt8LzizvyaN
 O1qm7GUWn+7EvTGiPYaEixeyTS+9/PGcvRN2lJrqRlDZdGHkYWPDTE8h/tudVjuqNPI3+8
 o33ZWGYHBSzjMO037St+kGuOrAcZOj0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=qPLne97S
Subject: [Buildroot] [PATCH 1/2] package/gerbera: bump to version 2.6.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- new dependencies on icu and jsoncpp
- fixes most deprecations of fmt >= 12

- add upstream patch which fixes another deprecation of fmt >=12

Release Notes:
https://github.com/gerbera/gerbera/releases/tag/v2.5.0
https://github.com/gerbera/gerbera/releases/tag/v2.6.0
https://github.com/gerbera/gerbera/releases/tag/v2.6.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/gerbera/0001-fix_fmt_12.patch | 29 +++++++++++++++++++++++++++
 package/gerbera/Config.in             |  2 ++
 package/gerbera/gerbera.hash          |  2 +-
 package/gerbera/gerbera.mk            |  4 +++-
 4 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 package/gerbera/0001-fix_fmt_12.patch

diff --git a/package/gerbera/0001-fix_fmt_12.patch b/package/gerbera/0001-fix_fmt_12.patch
new file mode 100644
index 0000000000..a10b78dae6
--- /dev/null
+++ b/package/gerbera/0001-fix_fmt_12.patch
@@ -0,0 +1,29 @@
+From f8e158bc72986e46b93d05358c29db0c10f2fe9f Mon Sep 17 00:00:00 2001
+From: Karlchen <k_straussberger@netzland.net>
+Date: Wed, 17 Sep 2025 21:18:49 +0200
+Subject: [PATCH] Update to fmt 12.0.0
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Upstream: https://github.com/gerbera/gerbera/commit/f8e158bc72986e46b93d05358c29db0c10f2fe9f
+[buildroot@heine.tech: removed all patch content not patching actual code]
+
+---
+ src/web/config_load.cc            | 4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/web/config_load.cc b/src/web/config_load.cc
+index 8b296c43e0..4259ae3331 100644
+--- a/src/web/config_load.cc
++++ b/src/web/config_load.cc
+@@ -150,7 +150,11 @@ void Web::ConfigLoad::addNewValue(
+ template <typename T>
+ void Web::ConfigLoad::setValue(Json::Value& item, const T& value)
+ {
++#if FMT_VERSION >= 120000
++    static_assert(fmt::is_formattable<T, fmt::format_context>::value, "T must be formattable");
++#else
+     static_assert(fmt::has_formatter<T, fmt::format_context>::value, "T must be formattable");
++#endif
+     item[CONFIG_LOAD_VALUE] = fmt::to_string(value);
+ }
+ 
diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 46a163ec78..3372d86fba 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_GERBERA
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
 	select BR2_PACKAGE_PUGIXML
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index edbe655dde..3056ff11ac 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  563ee3941b0347a91f5a3e9fe151032bd0e26868bfe7b7c68a7c095f8b07677b  gerbera-2.4.1.tar.gz
+sha256  6a7ed1c73bd86bdddd76bcb6c4bcd2e42788a20eb1f3165e0ea9f456abccd3ed  gerbera-2.6.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 9434f6fe64..d2d68db686 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 2.4.1
+GERBERA_VERSION = 2.6.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
 GERBERA_DEPENDENCIES = \
 	fmt \
+	icu \
+	jsoncpp \
 	host-pkgconf \
 	pugixml \
 	spdlog \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
