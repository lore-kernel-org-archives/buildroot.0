Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF80C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 08:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5855E80D83;
	Fri, 16 Aug 2024 08:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzwdiyWrFUC4; Fri, 16 Aug 2024 08:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CCD80D39
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CCD80D39;
	Fri, 16 Aug 2024 08:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2DD1BF3FD
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 08:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5658680D37
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 08:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eryh45stTIKJ for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 08:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 339A280D42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339A280D42
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 339A280D42
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 08:35:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BEB9635211D8; Fri, 16 Aug 2024 10:35:01 +0200 (CEST)
Date: Fri, 16 Aug 2024 10:35:01 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zr8PNUDzJOp3zuii@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723797301; bh=g6leOfl3jPfJ3o8lcfIz0j9RkgTo+kQ4R+T2ciHQ43E=;
 h=Date:From:To:Cc:Subject:From;
 b=CK7KBNFVAHil4mC+5t37/UixYvy2u/1rbCtCcDHSc7o9nn8cY1Spaj/ARXHXkgJzF
 y0iFZI83c5Yd+hT10bpBLT/4FpJK5HkeJGhLhowRvbu2wn6r2CQ9LWe8dFlKxeFPiq
 V4eppC3qTFmsWlZni1SWu5fCKsgfxSJfK/2v/fYgsm4rO9b1eQNWnSLUP2gZndxg8y
 jeFTa3/H277KisRKtdRcndrKu9JPvx+kffG3p4G0NcKKyrujhCBhHcOnzk+xKaOSSB
 yyi7bSPbdIoyWBpU3lziWEXW5hRBMzbJyclBO13KBuSTjtUIx/fGGVe+9lKVP26nye
 udvkBZnPXvkHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=CK7KBNFV
Subject: [Buildroot] [PATCH next] package/gerbera: update to 2.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for changelogs:
https://github.com/gerbera/gerbera/releases/tag/v2.2.0
https://github.com/gerbera/gerbera/releases/tag/v2.1.0
https://github.com/gerbera/gerbera/releases/tag/v2.0.0

Patch 0001 is no longer required.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-buildfix-support-fmtlib-10.patch     | 166 ------------------
 package/gerbera/gerbera.hash                  |   2 +-
 package/gerbera/gerbera.mk                    |   2 +-
 3 files changed, 2 insertions(+), 168 deletions(-)
 delete mode 100644 package/gerbera/0001-buildfix-support-fmtlib-10.patch

diff --git a/package/gerbera/0001-buildfix-support-fmtlib-10.patch b/package/gerbera/0001-buildfix-support-fmtlib-10.patch
deleted file mode 100644
index b274aab75b..0000000000
--- a/package/gerbera/0001-buildfix-support-fmtlib-10.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 37957aac0aea776e6f843af2358916f81056a405 Mon Sep 17 00:00:00 2001
-From: Mamoru TASAKA <mtasaka@fedoraproject.org>
-Date: Thu, 29 Jun 2023 22:09:15 +0900
-Subject: [PATCH] buildfix: support fmtlib 10
-
-With fmtlib10, fmt::format does not accept pugi::xml_node as it is.
-Use name() member function, as this usage appear on other places of
-gerbera source code.
-
-Closes #2839 .
-
-Upstream: https://github.com/gerbera/gerbera/commit/37957aac0aea776e6f843af2358916f81056a405
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/config/setup/config_setup_array.cc       | 6 +++---
- src/config/setup/config_setup_autoscan.cc    | 2 +-
- src/config/setup/config_setup_client.cc      | 2 +-
- src/config/setup/config_setup_dictionary.cc  | 6 +++---
- src/config/setup/config_setup_dynamic.cc     | 2 +-
- src/config/setup/config_setup_transcoding.cc | 2 +-
- src/config/setup/config_setup_tweak.cc       | 2 +-
- src/config/setup/config_setup_vector.cc      | 4 ++--
- 8 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/src/config/setup/config_setup_array.cc b/src/config/setup/config_setup_array.cc
-index 62dd5c9a7..a5f8958ce 100644
---- a/src/config/setup/config_setup_array.cc
-+++ b/src/config/setup/config_setup_array.cc
-@@ -137,11 +137,11 @@ std::vector<std::string> ConfigArraySetup::getXmlContent(const pugi::xml_node& o
-     std::vector<std::string> result;
-     if (initArray) {
-         if (!initArray(optValue, result, ConfigDefinition::mapConfigOption(nodeOption))) {
--            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue);
-+            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue.name());
-         }
-     } else {
-         if (!createOptionFromNode(optValue, result)) {
--            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue);
-+            throw_std_runtime_error("Invalid {} array value '{}'", xpath, optValue.name());
-         }
-     }
-     if (result.empty()) {
-@@ -150,7 +150,7 @@ std::vector<std::string> ConfigArraySetup::getXmlContent(const pugi::xml_node& o
-         result = defaultEntries;
-     }
-     if (notEmpty && result.empty()) {
--        throw_std_runtime_error("Invalid array {} empty '{}'", xpath, optValue);
-+        throw_std_runtime_error("Invalid array {} empty '{}'", xpath, optValue.name());
-     }
-     return result;
- }
-diff --git a/src/config/setup/config_setup_autoscan.cc b/src/config/setup/config_setup_autoscan.cc
-index 9ae4e61f8..5e1394585 100644
---- a/src/config/setup/config_setup_autoscan.cc
-+++ b/src/config/setup/config_setup_autoscan.cc
-@@ -245,7 +245,7 @@ std::shared_ptr<ConfigOption> ConfigAutoscanSetup::newOption(const pugi::xml_nod
- {
-     auto result = std::vector<AutoscanDirectory>();
-     if (!createOptionFromNode(optValue, result)) {
--        throw_std_runtime_error("Init {} autoscan failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} autoscan failed '{}'", xpath, optValue.name());
-     }
-     optionValue = std::make_shared<AutoscanListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_client.cc b/src/config/setup/config_setup_client.cc
-index ffd12fc01..857db3c3e 100644
---- a/src/config/setup/config_setup_client.cc
-+++ b/src/config/setup/config_setup_client.cc
-@@ -183,7 +183,7 @@ std::shared_ptr<ConfigOption> ConfigClientSetup::newOption(const pugi::xml_node&
-     auto result = std::make_shared<ClientConfigList>();
- 
-     if (!createOptionFromNode(isEnabled ? optValue : pugi::xml_node(nullptr), result)) {
--        throw_std_runtime_error("Init {} client config failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} client config failed '{}'", xpath, optValue.name());
-     }
-     optionValue = std::make_shared<ClientConfigListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_dictionary.cc b/src/config/setup/config_setup_dictionary.cc
-index 003b4cc59..69d1a7255 100644
---- a/src/config/setup/config_setup_dictionary.cc
-+++ b/src/config/setup/config_setup_dictionary.cc
-@@ -163,11 +163,11 @@ std::map<std::string, std::string> ConfigDictionarySetup::getXmlContent(const pu
-     std::map<std::string, std::string> result;
-     if (initDict) {
-         if (!initDict(optValue, result)) {
--            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue);
-+            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue.name());
-         }
-     } else {
-         if (!createOptionFromNode(optValue, result) && required) {
--            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue);
-+            throw_std_runtime_error("Init {} dictionary failed '{}'", xpath, optValue.name());
-         }
-     }
-     if (result.empty()) {
-@@ -176,7 +176,7 @@ std::map<std::string, std::string> ConfigDictionarySetup::getXmlContent(const pu
-         result = defaultEntries;
-     }
-     if (notEmpty && result.empty()) {
--        throw_std_runtime_error("Invalid dictionary {} empty '{}'", xpath, optValue);
-+        throw_std_runtime_error("Invalid dictionary {} empty '{}'", xpath, optValue.name());
-     }
-     return result;
- }
-diff --git a/src/config/setup/config_setup_dynamic.cc b/src/config/setup/config_setup_dynamic.cc
-index 0074cb6d3..d6962afe6 100644
---- a/src/config/setup/config_setup_dynamic.cc
-+++ b/src/config/setup/config_setup_dynamic.cc
-@@ -192,7 +192,7 @@ std::shared_ptr<ConfigOption> ConfigDynamicContentSetup::newOption(const pugi::x
-     auto result = std::make_shared<DynamicContentList>();
- 
-     if (!createOptionFromNode(optValue, result)) {
--        throw_std_runtime_error("Init {} DynamicContentList failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} DynamicContentList failed '{}'", xpath, optValue.name());
-     }
-     optionValue = std::make_shared<DynamicContentListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_transcoding.cc b/src/config/setup/config_setup_transcoding.cc
-index 17d1780dc..1f6fb0604 100644
---- a/src/config/setup/config_setup_transcoding.cc
-+++ b/src/config/setup/config_setup_transcoding.cc
-@@ -501,7 +501,7 @@ std::shared_ptr<ConfigOption> ConfigTranscodingSetup::newOption(const pugi::xml_
-     auto result = std::make_shared<TranscodingProfileList>();
- 
-     if (!createOptionFromNode(isEnabled ? optValue : pugi::xml_node(nullptr), result)) {
--        throw_std_runtime_error("Init {} transcoding failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} transcoding failed '{}'", xpath, optValue.name());
-     }
-     optionValue = std::make_shared<TranscodingProfileListOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_tweak.cc b/src/config/setup/config_setup_tweak.cc
-index 65dae2759..4da9fca1b 100644
---- a/src/config/setup/config_setup_tweak.cc
-+++ b/src/config/setup/config_setup_tweak.cc
-@@ -257,7 +257,7 @@ std::shared_ptr<ConfigOption> ConfigDirectorySetup::newOption(const pugi::xml_no
-     auto result = std::make_shared<DirectoryConfigList>();
- 
-     if (!createOptionFromNode(optValue, result)) {
--        throw_std_runtime_error("Init {} DirectoryConfigList failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} DirectoryConfigList failed '{}'", xpath, optValue.name());
-     }
-     optionValue = std::make_shared<DirectoryTweakOption>(result);
-     return optionValue;
-diff --git a/src/config/setup/config_setup_vector.cc b/src/config/setup/config_setup_vector.cc
-index e5efe2767..9a9670569 100644
---- a/src/config/setup/config_setup_vector.cc
-+++ b/src/config/setup/config_setup_vector.cc
-@@ -181,7 +181,7 @@ std::vector<std::vector<std::pair<std::string, std::string>>> ConfigVectorSetup:
- {
-     std::vector<std::vector<std::pair<std::string, std::string>>> result;
-     if (!createOptionFromNode(optValue, result) && required) {
--        throw_std_runtime_error("Init {} vector failed '{}'", xpath, optValue);
-+        throw_std_runtime_error("Init {} vector failed '{}'", xpath, optValue.name());
-     }
-     if (result.empty()) {
-         log_debug("{} assigning {} default values", xpath, defaultEntries.size());
-@@ -189,7 +189,7 @@ std::vector<std::vector<std::pair<std::string, std::string>>> ConfigVectorSetup:
-         result = defaultEntries;
-     }
-     if (notEmpty && result.empty()) {
--        throw_std_runtime_error("Invalid vector {} empty '{}'", xpath, optValue);
-+        throw_std_runtime_error("Invalid vector {} empty '{}'", xpath, optValue.name());
-     }
-     return result;
- }
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index ee6e3d9b3a..8a0f052e9e 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2144a7c4a13e8b43aa0c911fbeae65f05e2c42254ddd03be5c41f5fcf103a93c  gerbera-1.12.1.tar.gz
+sha256  c77f4a8ccbed5e18499c0854803fec65ae2f26af633818b52584651fbd3eec13  gerbera-2.2.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 6616a83e74..b6122610df 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.12.1
+GERBERA_VERSION = 2.2.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
