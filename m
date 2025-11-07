Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3EDCCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AB64039E;
	Sat,  8 Nov 2025 10:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucwQOC-uMRsc; Sat,  8 Nov 2025 10:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A6C403A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A6C403A2;
	Sat,  8 Nov 2025 10:16:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C06AE25D
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2D0540270
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8F6czBMrLc7 for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9311A40231
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9311A40231
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C02983F26; Sat,  8 Nov 2025 10:16:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Nov 2025 23:27:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d94d536c37e62287514acd5c184c468c20f0a823
X-Git-Newrev: f8bf78911576672443a8d11eaf99bed4d383acef
X-Patchwork-Hint: ignore
Message-Id: <20251108101651.7C02983F26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump to version 2.6.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f8bf78911576672443a8d11eaf99bed4d383acef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- new dependencies on icu and jsoncpp
- fixes most deprecations of fmt >= 12

- add upstream patch which fixes another deprecation of fmt >=12

Release Notes:
https://github.com/gerbera/gerbera/releases/tag/v2.5.0
https://github.com/gerbera/gerbera/releases/tag/v2.6.0
https://github.com/gerbera/gerbera/releases/tag/v2.6.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gerbera/0001-fix_fmt_12.patch | 29 +++++++++++++++++++++++++++++
 package/gerbera/Config.in             |  2 ++
 package/gerbera/gerbera.hash          |  2 +-
 package/gerbera/gerbera.mk            |  4 +++-
 4 files changed, 35 insertions(+), 2 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
