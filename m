Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E53EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 725FE40FC1;
	Wed, 11 Sep 2024 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eahdkGz-Nlt0; Wed, 11 Sep 2024 19:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D80641004
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D80641004;
	Wed, 11 Sep 2024 19:42:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BD991BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78EAD40197
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ujs8DOAtpoeY for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A72B40525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A72B40525
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9775A86FB8; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:41:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cda3504086e4c4b6acd24212e4d568684442243
X-Git-Newrev: c4b723ecaaa5ec5b719478f471aa1f54becdc809
X-Patchwork-Hint: ignore
Message-Id: <20240911194152.9775A86FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: update to 2.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4b723ecaaa5ec5b719478f471aa1f54becdc809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for changelogs:
https://github.com/gerbera/gerbera/releases/tag/v2.2.0
https://github.com/gerbera/gerbera/releases/tag/v2.1.0
https://github.com/gerbera/gerbera/releases/tag/v2.0.0

Patches 0001 and 0002 are upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../gerbera/0001-buildfix-support-fmtlib-10.patch  | 166 ---------------------
 .../gerbera/0002-Build-against-fmt-11.0.0.patch    | 136 -----------------
 package/gerbera/gerbera.hash                       |   2 +-
 package/gerbera/gerbera.mk                         |   2 +-
 4 files changed, 2 insertions(+), 304 deletions(-)

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
diff --git a/package/gerbera/0002-Build-against-fmt-11.0.0.patch b/package/gerbera/0002-Build-against-fmt-11.0.0.patch
deleted file mode 100644
index 27dc05e5cb..0000000000
--- a/package/gerbera/0002-Build-against-fmt-11.0.0.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From bb9e80f4225d4ecb0d75d80c16b0ba3ddb12b1dc Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Mon, 2 Sep 2024 23:30:19 +0200
-Subject: [PATCH] Build against fmt 11.0.0
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: backport from upstream https://github.com/gerbera/gerbera/commit/f1f266efbb0a6adac160e428cd14c20f6ecd3e5d
----
- README.md                         | 2 +-
- scripts/install-spdlog.sh         | 4 +++-
- scripts/versions.sh               | 2 +-
- src/database/sql_format.h         | 3 +++
- src/util/logger.h                 | 5 ++++-
- src/util/url_utils.cc             | 7 ++++++-
- test/scripting/mock/duk_helper.cc | 4 +++-
- 7 files changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/README.md b/README.md
-index a1992738f009..990a9af8855f 100644
---- a/README.md
-+++ b/README.md
-@@ -53,7 +53,7 @@ sudo make install
- | libiconv            |             |             |               | Required      | Charset conversion         |          |
- | sqlite3             | 3.7.0       | 3.35.5      | 3.36.0        | Required      | Database storage           |          |
- | zlib                |             |             |               | Required      | Data compression           |          |
--| [fmtlib]            | 7.1.3       | 7.1.3       | 9.1.0         | Required      | Fast string formatting     |          |
-+| [fmtlib]            | 7.1.3       | 9.1.0       | 11.0.0        | Required      | Fast string formatting     |          |
- | [spdlog]            | 1.8.1       | 1.8.5       | 1.11.0        | Required      | Runtime logging            |          |
- | [duktape]           | 2.1.0       | 2.6.0       | 2.7.0         | Optional      | Scripting Support          | Enabled  |
- | mysql               |             |             |               | Optional      | Alternate database storage | Disabled |
-diff --git a/scripts/install-spdlog.sh b/scripts/install-spdlog.sh
-index 8a758e35b579..5c1426e3d44f 100755
---- a/scripts/install-spdlog.sh
-+++ b/scripts/install-spdlog.sh
-@@ -39,7 +39,9 @@ fi
- mkdir build
- cd build
- 
--cmake .. -DSPDLOG_FMT_EXTERNAL=ON -DBUILD_SHARED_LIBS=${BUILD_SHARED}
-+cmake .. -DSPDLOG_FMT_EXTERNAL=ON \
-+         -DBUILD_SHARED_LIBS=${BUILD_SHARED} \
-+         -DSPDLOG_BUILD_EXAMPLE=OFF
- 
- if command -v nproc >/dev/null 2>&1; then
-     make "-j$(nproc)"
-diff --git a/scripts/versions.sh b/scripts/versions.sh
-index 19a0f80f79ac..8c1ffe7d590d 100644
---- a/scripts/versions.sh
-+++ b/scripts/versions.sh
-@@ -36,7 +36,7 @@ else
-     EBML="1.4.4"
-     EXIV2="v0.27.5"
-     FFMPEGTHUMBNAILER="2.2.2"
--    FMT="9.1.0"
-+    FMT="11.0.0"
-     GOOGLETEST="1.12.1"
-     LASTFM="0.4.0"
-     MATROSKA="1.7.1"
-diff --git a/src/database/sql_format.h b/src/database/sql_format.h
-index 551122eb7cf7..d64edae69372 100644
---- a/src/database/sql_format.h
-+++ b/src/database/sql_format.h
-@@ -26,6 +26,9 @@
- #define __SQL_FORMAT_H__
- 
- #include <fmt/format.h>
-+#if FMT_VERSION >= 100202
-+#include <fmt/ranges.h>
-+#endif
- 
- struct SQLIdentifier {
-     constexpr SQLIdentifier(std::string_view name, char quote_begin, char quote_end)
-diff --git a/src/util/logger.h b/src/util/logger.h
-index a121ead31e95..d51e60430ed9 100644
---- a/src/util/logger.h
-+++ b/src/util/logger.h
-@@ -36,6 +36,9 @@
- 
- #include <array>
- #include <fmt/format.h>
-+#if FMT_VERSION >= 100202
-+#include <fmt/ranges.h>
-+#endif
- #include <map>
- #include <spdlog/spdlog.h>
- #include <type_traits>
-@@ -135,7 +138,7 @@ template <typename T>
- struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
-     : formatter<std::underlying_type_t<T>> {
-     template <typename FormatContext>
--    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
-+    auto format(const T& value, FormatContext& ctx) const -> decltype(ctx.out())
-     {
-         return fmt::formatter<std::underlying_type_t<T>>::format(
-             static_cast<std::underlying_type_t<T>>(value), ctx);
-diff --git a/src/util/url_utils.cc b/src/util/url_utils.cc
-index b1c9fecef863..84f6f3be43d4 100644
---- a/src/util/url_utils.cc
-+++ b/src/util/url_utils.cc
-@@ -23,11 +23,16 @@ Gerbera - https://gerbera.io/
- 
- #include "url_utils.h" // API
- 
-+#include "exceptions.h"
-+
-+
- #include <fmt/format.h>
-+#if FMT_VERSION >= 100202
-+#include <fmt/ranges.h>
-+#endif
- #include <sstream>
- 
- #include "common.h"
--#include "exceptions.h"
- 
- namespace URLUtils {
- 
-diff --git a/test/scripting/mock/duk_helper.cc b/test/scripting/mock/duk_helper.cc
-index 71bdc5d025f7..f1ab1cfef8a7 100644
---- a/test/scripting/mock/duk_helper.cc
-+++ b/test/scripting/mock/duk_helper.cc
-@@ -24,8 +24,10 @@
- #include "duk_helper.h"
- #include <duk_config.h>
- #include <duktape.h>
--#include <fmt/core.h>
- #include <fmt/format.h>
-+#if FMT_VERSION >= 100202
-+#include <fmt/ranges.h>
-+#endif
- #include <regex>
- 
- std::vector<std::string> DukTestHelper::arrayToVector(duk_context* ctx, duk_idx_t idx)
--- 
-2.43.0
-
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
index f3f05b364d..ac5b69b681 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
