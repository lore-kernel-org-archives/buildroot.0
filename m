Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A318C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097B660F25;
	Sat, 13 Jan 2024 21:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097B660F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B07lmEyGDkxR; Sat, 13 Jan 2024 21:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9E060F33;
	Sat, 13 Jan 2024 21:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF9E060F33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0348F1BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E7A660EF6
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E7A660EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IszqjIKEnKbs for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B688360EE4
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B688360EE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3B6986065; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:43:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a959e1baab92426335325cc6dba3e90c7654ed2d
X-Git-Newrev: 8fba83e5f975c779c26cbb9cdd80e3790088da0d
X-Patchwork-Hint: ignore
Message-Id: <20240113211501.A3B6986065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: bump version to 20.3-Nexus
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8fba83e5f975c779c26cbb9cdd80e3790088da0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 ...ome-use-AnnouncementFlagToString-when-log.patch | 31 ------------
 ...ttonControl-use-explicit-cast-to-UTILS-CO.patch | 32 ------------
 ...using-fmt-enums-format_as-for-explicit-en.patch | 33 ------------
 ...rmatter-for-std-atomic-for-explicit-atomi.patch | 37 --------------
 ...ngs-TypeInfo-add-initialization-of-tp_wat.patch | 59 ----------------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               |  2 +-
 9 files changed, 4 insertions(+), 196 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index e017aa8d9c..2ed4961e68 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 20.2-Nexus
+KODI_JSONSCHEMABUILDER_VERSION = 20.3-Nexus
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index c0bc767dd4..728e25606c 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 20.2-Nexus
+KODI_TEXTUREPACKER_VERSION = 20.3-Nexus
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
diff --git a/package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch b/package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch
deleted file mode 100644
index 3aa41adc86..0000000000
--- a/package/kodi/0002-CGUIWindowHome-use-AnnouncementFlagToString-when-log.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cfbc0ec1b2cf2952fa4a279cf5fc71c15bf56f23 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Tue, 27 Jun 2023 11:21:50 -0700
-Subject: [PATCH] CGUIWindowHome: use AnnouncementFlagToString when logging
-
-Upstream: https://github.com/xbmc/xbmc/commit/3a20f5b67ff32cc3663e0ccd72941e666e8756a4
-Upstream: https://github.com/xbmc/xbmc/pull/23571
-
-Signed-off-by: Lukas Rusak <lorusak@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/windows/GUIWindowHome.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/xbmc/windows/GUIWindowHome.cpp b/xbmc/windows/GUIWindowHome.cpp
-index c42e073c48..abc6cfc94d 100644
---- a/xbmc/windows/GUIWindowHome.cpp
-+++ b/xbmc/windows/GUIWindowHome.cpp
-@@ -78,7 +78,8 @@ void CGUIWindowHome::Announce(ANNOUNCEMENT::AnnouncementFlag flag,
- {
-   int ra_flag = 0;
- 
--  CLog::Log(LOGDEBUG, LOGANNOUNCE, "GOT ANNOUNCEMENT, type: {}, from {}, message {}", flag, sender, message);
-+  CLog::Log(LOGDEBUG, LOGANNOUNCE, "GOT ANNOUNCEMENT, type: {}, from {}, message {}",
-+            AnnouncementFlagToString(flag), sender, message);
- 
-   // we are only interested in library changes
-   if ((flag & (ANNOUNCEMENT::VideoLibrary | ANNOUNCEMENT::AudioLibrary)) == 0)
--- 
-2.39.2
-
diff --git a/package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch b/package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch
deleted file mode 100644
index 8ac29dcd20..0000000000
--- a/package/kodi/0003-CGUIColorButtonControl-use-explicit-cast-to-UTILS-CO.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8b1673044971cae84de7d34015230b9503f292f4 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Tue, 27 Jun 2023 11:22:32 -0700
-Subject: [PATCH] CGUIColorButtonControl: use explicit cast to
- UTILS::COLOR::Color when formatting
-
-Upstream: https://github.com/xbmc/xbmc/commit/c82006b575b78efbb3f5aff40a159b90f245ea9d
-Upstream: https://github.com/xbmc/xbmc/pull/23571
-
-Signed-off-by: Lukas Rusak <lorusak@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/guilib/GUIColorButtonControl.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/xbmc/guilib/GUIColorButtonControl.cpp b/xbmc/guilib/GUIColorButtonControl.cpp
-index 940834cb68..67597d7ab5 100644
---- a/xbmc/guilib/GUIColorButtonControl.cpp
-+++ b/xbmc/guilib/GUIColorButtonControl.cpp
-@@ -188,7 +188,8 @@ void CGUIColorButtonControl::RenderInfoText()
- void CGUIColorButtonControl::ProcessInfoText(unsigned int currentTime)
- {
-   CRect labelRenderRect = m_labelInfo.GetRenderRect();
--  bool changed = m_labelInfo.SetText(StringUtils::Format("#{:08X}", m_imgBoxColor));
-+  bool changed = m_labelInfo.SetText(
-+      StringUtils::Format("#{:08X}", static_cast<UTILS::COLOR::Color>(m_imgBoxColor)));
-   // Set Label X position based on image mask control position
-   float textWidth = m_labelInfo.GetTextWidth() + 2 * m_labelInfo.GetLabelInfo().offsetX;
-   float textPosX = m_imgColorMask->GetXPosition() - textWidth;
--- 
-2.39.2
-
diff --git a/package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch b/package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch
deleted file mode 100644
index 4e09218361..0000000000
--- a/package/kodi/0004-CLog-allow-using-fmt-enums-format_as-for-explicit-en.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ec1fd134e31b8c667ff06e02e21a75c4c3e87dfd Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Tue, 27 Jun 2023 11:24:02 -0700
-Subject: [PATCH] CLog: allow using fmt::enums::format_as for explicit enum
- conversion when using libfmt>=10
-
-Upstream: https://github.com/xbmc/xbmc/commit/e4b1aa8450fabfb41379953c8ccec0a512421531
-Upstream: https://github.com/xbmc/xbmc/pull/23571
-
-Signed-off-by: Lukas Rusak <lorusak@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/utils/log.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/xbmc/utils/log.h b/xbmc/utils/log.h
-index 9fc4aae368..adf46905a8 100644
---- a/xbmc/utils/log.h
-+++ b/xbmc/utils/log.h
-@@ -46,6 +46,10 @@ class dist_sink;
- } // namespace sinks
- } // namespace spdlog
- 
-+#if FMT_VERSION >= 100000
-+using fmt::enums::format_as;
-+#endif
-+
- class CLog : public ISettingsHandler, public ISettingCallback
- {
- public:
--- 
-2.39.2
-
diff --git a/package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch b/package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch
deleted file mode 100644
index b87a60f809..0000000000
--- a/package/kodi/0005-CLog-add-formatter-for-std-atomic-for-explicit-atomi.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 46f6d97f46254600bd34f77f335a475178d7aaa5 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Tue, 27 Jun 2023 11:24:34 -0700
-Subject: [PATCH] CLog: add formatter for std::atomic for explicit atomic
- conversion when using libfmt>=10
-
-Upstream: https://github.com/xbmc/xbmc/commit/26c164a28cfd18ceef7a1f2bbba5bf8a4a5a750c
-Upstream: https://github.com/xbmc/xbmc/pull/23571
-
-Signed-off-by: Lukas Rusak <lorusak@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/utils/log.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/xbmc/utils/log.h b/xbmc/utils/log.h
-index adf46905a8..1c42c888cb 100644
---- a/xbmc/utils/log.h
-+++ b/xbmc/utils/log.h
-@@ -48,6 +48,14 @@ class dist_sink;
- 
- #if FMT_VERSION >= 100000
- using fmt::enums::format_as;
-+
-+namespace fmt
-+{
-+template<typename T, typename Char>
-+struct formatter<std::atomic<T>, Char> : formatter<T, Char>
-+{
-+};
-+} // namespace fmt
- #endif
- 
- class CLog : public ISettingsHandler, public ISettingCallback
--- 
-2.39.2
-
diff --git a/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch b/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
deleted file mode 100644
index ed0c340f52..0000000000
--- a/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From cbfee0e6add2b57c6a2a8641a60b4322543f4675 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Wed, 12 Jul 2023 19:58:08 -0700
-Subject: [PATCH] PythonBindings: TypeInfo: add initialization of
- tp_watched for PyTypeObject
-
-This member was added in upstream commit https://github.com/python/cpython/commit/82ccbf69a842db25d8117f1c41b47aa5b4ed96ab
-
-This change first appeared in Python v3.12.0a1
-
-Signed-off-by: Lukas Rusak <lorusak@gmail.com>
-
-Upstream: https://github.com/xbmc/xbmc/commit/2c84ee54a75770e291f38d4ebb2c31c8f2c3b8c5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/interfaces/python/swig.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/xbmc/interfaces/python/swig.cpp b/xbmc/interfaces/python/swig.cpp
-index 5a2599a84ea0f..74baa72ee5c4c 100644
---- a/xbmc/interfaces/python/swig.cpp
-+++ b/xbmc/interfaces/python/swig.cpp
-@@ -71,6 +71,9 @@ namespace PythonBindings
- #endif
- #if PY_VERSION_HEX < 0x03090000
-       0,
-+#endif
-+#if PY_VERSION_HEX >= 0x030C00A1
-+      0,
- #endif
-     };
- 
-
-From e3ba40936cc10de05c46d507851568ee3e351f43 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Thu, 13 Jul 2023 08:57:38 -0700
-Subject: [PATCH] swig.cpp: add clang-format formatting
-
-Signed-off-by: Lukas Rusak <lorusak@gmail.com>
----
- xbmc/interfaces/python/swig.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xbmc/interfaces/python/swig.cpp b/xbmc/interfaces/python/swig.cpp
-index 74baa72ee5c4c..0c49f87ca84e1 100644
---- a/xbmc/interfaces/python/swig.cpp
-+++ b/xbmc/interfaces/python/swig.cpp
-@@ -18,8 +18,8 @@ namespace PythonBindings
- {
-   TypeInfo::TypeInfo(const std::type_info& ti) : swigType(NULL), parentType(NULL), typeIndex(ti)
-   {
--    static PyTypeObject py_type_object_header =
--    { PyVarObject_HEAD_INIT(nullptr, 0) 0,
-+    static PyTypeObject py_type_object_header = {
-+      PyVarObject_HEAD_INIT(nullptr, 0) 0,
-       0,
-       0,
-       0,
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 37fbf0c004..81d26f1cb1 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4e81abf81172812bc8891f69a7a80a2b846298cecaae7b5009725e28a3040c23  kodi-20.2-Nexus.tar.gz
+sha256  1dbf1d9f4d5eeeb6aa2593813703343a8a377e88a00c68226354e4d67467f64d  kodi-20.3-Nexus.tar.gz
 sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
 sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
 sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 4fe6ea46cc..97d02e9b92 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 20.2
+KODI_VERSION_MAJOR = 20.3
 KODI_VERSION_NAME = Nexus
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
