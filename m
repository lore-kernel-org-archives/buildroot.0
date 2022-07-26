Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60332C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C17840192;
	Tue, 26 Jul 2022 21:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C17840192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SgbBcjBoK2ZX; Tue, 26 Jul 2022 21:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B026240167;
	Tue, 26 Jul 2022 21:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B026240167
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE89E1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D62C160671
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D62C160671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxDVWo-XcNKM for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:49:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3286605A6
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3286605A6
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:49:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GSR7oifD4LCiqGSR8oTU2s; Tue, 26 Jul 2022 23:49:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:49:52 +0200
Message-Id: <20220726214952.1075209-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLufi3EVz0jmdKWa3LZGFc4Pg0M08qryUuGLQmIgXcY5snfXgZdwdA04AxGwf2XhCHqUWL2O4V7EGwhQWddEVD2vi9pmjba8YHGspp3PwlwTmEbGE8mL
 frqXxOok2W6U2//Zg6y40AfHDU4gh1Z6pCjh+y8lzzx3XOwq+K2n5UuyNTs82A/73JGsC5c6MByXkafF0SUc20YJvFfMkaTAV7djQ1H1Qmr3o3PyXVp7Tpin
 F111/sMSMm3Q5Rkc2xiL1REBqPhisFrXCA7FhLz+G88pNs2TYXn6Tuj3VuMKjnre
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658872194; bh=xYzx9Z7J3TWfZJK4W8ItPHuICNgEgwJ0o/ttef+sjwk=;
 h=From:To:Subject:Date:MIME-Version;
 b=f2nsdI+EMdzCq4WSTchlAIrgfMIsRmYcj+eUgUsVtZSfZSzkgUN5OQs7DkmqsqTKx
 4cFpDsIEn8s6w/URcRkcc0wvxQejZ/OHAxmWzV+Q2CPjkGZLkcRwVxv5WXRfL0l70Z
 3O/LiIUrWYXfXCi8R5jC4abZ9N5zKJ/KjaXNtqTpp/GDyp+KVJvli229nfTAK5lNy/
 76Dp/M9JCppy12oxISVw7VT7myzXOgpWg0gfLTF11fpy8Ju+1YkKKvmhlVI12Xkn/e
 xrLwuSPvdjLBttQYXfCUMFU0SLZ6bZSDc+TGcOJ1+Gk4aGhkY/43Ooy6tif211sbR2
 XZxVLrnIyH4Aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=f2nsdI+E
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 5.0.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the major release changed I've built successfully all packages that
have direct dependency to harfbuzz:
- efl
- libass
- mupdf
- pango
- qt5base
- sdl2_ttf
- supertuxkart
- vlc
- webkitgtk
- wpewebkit

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0002-cplusplus-Fix-build-on-GCC-7.patch   | 50 ----------
 .../0003-GSUB-Fix-build-on-GCC-7.patch        | 56 -----------
 .../0004-GPOS-Fix-build-on-GCC-7.patch        | 97 -------------------
 package/harfbuzz/harfbuzz.hash                |  2 +-
 package/harfbuzz/harfbuzz.mk                  |  2 +-
 5 files changed, 2 insertions(+), 205 deletions(-)
 delete mode 100644 package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
 delete mode 100644 package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
 delete mode 100644 package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch

diff --git a/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
deleted file mode 100644
index de2955d8b5..0000000000
--- a/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927 Mon Sep 17 00:00:00 2001
-From: Kleis Auke Wolthuizen <github@kleisauke.nl>
-Date: Wed, 6 Jul 2022 12:58:15 +0200
-Subject: [PATCH] [cplusplus] Fix build on GCC < 7
-
-[Retrieved from:
-https://github.com/harfbuzz/harfbuzz/commit/7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/hb-cplusplus.hh | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/hb-cplusplus.hh b/src/hb-cplusplus.hh
-index 86d0452080..f06a32d912 100644
---- a/src/hb-cplusplus.hh
-+++ b/src/hb-cplusplus.hh
-@@ -166,8 +166,14 @@ HB_DEFINE_VTABLE (unicode_funcs);
- 
- } // namespace hb
- 
-+/* Workaround for GCC < 7, see:
-+ * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56480
-+ * https://stackoverflow.com/a/25594741 */
-+namespace std {
-+
-+
- template<typename T>
--struct std::hash<hb::shared_ptr<T>>
-+struct hash<hb::shared_ptr<T>>
- {
-     std::size_t operator()(const hb::shared_ptr<T>& v) const noexcept
-     {
-@@ -177,7 +183,7 @@ struct std::hash<hb::shared_ptr<T>>
- };
- 
- template<typename T>
--struct std::hash<hb::unique_ptr<T>>
-+struct hash<hb::unique_ptr<T>>
- {
-     std::size_t operator()(const hb::unique_ptr<T>& v) const noexcept
-     {
-@@ -187,6 +193,8 @@ struct std::hash<hb::unique_ptr<T>>
- };
- 
- 
-+} // namespace std
-+
- #endif /* __cplusplus */
- 
- #endif /* HB_CPLUSPLUS_HH */
diff --git a/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
deleted file mode 100644
index d3355443b7..0000000000
--- a/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 79eb0f74860fb6309e3162b4f17f98481c05a318 Mon Sep 17 00:00:00 2001
-From: Kleis Auke Wolthuizen <github@kleisauke.nl>
-Date: Wed, 6 Jul 2022 13:29:55 +0200
-Subject: [PATCH] [GSUB] Fix build on GCC < 7
-
-[Retrieved (and backported) from:
-https://github.com/harfbuzz/harfbuzz/commit/79eb0f74860fb6309e3162b4f17f98481c05a318]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/OT/Layout/GSUB/GSUB.hh     | 5 +++--
- src/hb-ot-layout-gsub-table.hh | 8 ++++----
- 2 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/OT/Layout/GSUB/GSUB.hh b/src/OT/Layout/GSUB/GSUB.hh
-index 372862e2bb..750dca1da3 100644
---- a/src/OT/Layout/GSUB/GSUB.hh
-+++ b/src/OT/Layout/GSUB/GSUB.hh
-@@ -5,9 +5,10 @@
- #include "Common.hh"
- #include "SubstLookup.hh"
- 
--using OT::Layout::GSUB::SubstLookup;
--
- namespace OT {
-+
-+using Layout::GSUB::SubstLookup;
-+
- namespace Layout {
- 
- /*
-diff --git a/src/hb-ot-layout-gsub-table.hh b/src/hb-ot-layout-gsub-table.hh
-index 1eca613b6a..50301ff1d9 100644
---- a/src/hb-ot-layout-gsub-table.hh
-+++ b/src/hb-ot-layout-gsub-table.hh
-@@ -32,9 +32,8 @@
- #include "OT/Layout/GSUB/GSUB.hh"
- 
- namespace OT {
--
--using Layout::GSUB::SubstLookup;
--using Layout::GSUB::ExtensionSubst;
-+namespace Layout {
-+namespace GSUB {
- 
- // TODO(garretrieger): Move into the new layout directory.
- /* Out-of-class implementation for methods recursing */
-@@ -82,7 +81,8 @@ inline bool SubstLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_app
- }
- #endif
- 
--
-+} /* namespace GSUB */
-+} /* namespace Layout */
- } /* namespace OT */
- 
- 
diff --git a/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
deleted file mode 100644
index ead6fc024f..0000000000
--- a/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 3238cb744bb570a75326ab4438968c59069e9af2 Mon Sep 17 00:00:00 2001
-From: Kleis Auke Wolthuizen <github@kleisauke.nl>
-Date: Wed, 6 Jul 2022 13:18:14 +0200
-Subject: [PATCH] [GPOS] Fix build on GCC < 7
-
-[Retrieved (and backported) from:
-https://github.com/harfbuzz/harfbuzz/commit/3238cb744bb570a75326ab4438968c59069e9af2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/OT/Layout/GPOS/GPOS.hh     | 17 ++++++++++-------
- src/hb-ot-layout-gpos-table.hh |  6 ++++--
- 2 files changed, 14 insertions(+), 9 deletions(-)
-
-diff --git a/src/OT/Layout/GPOS/GPOS.hh b/src/OT/Layout/GPOS/GPOS.hh
-index 7fb97d7568..23b0b090a2 100644
---- a/src/OT/Layout/GPOS.hh
-+++ b/src/OT/Layout/GPOS.hh
-@@ -7,6 +7,9 @@
- #include "GPOS/PosLookup.hh"
- 
- namespace OT {
-+
-+using Layout::GPOS_impl::PosLookup;
-+
- namespace Layout {
- 
- static void
-@@ -25,10 +28,10 @@ struct GPOS : GSUBGPOS
- {
-   static constexpr hb_tag_t tableTag = HB_OT_TAG_GPOS;
- 
--  using Lookup = GPOS_impl::PosLookup;
-+  using Lookup = PosLookup;
- 
--  const GPOS_impl::PosLookup& get_lookup (unsigned int i) const
--  { return static_cast<const GPOS_impl::PosLookup &> (GSUBGPOS::get_lookup (i)); }
-+  const PosLookup& get_lookup (unsigned int i) const
-+  { return static_cast<const PosLookup &> (GSUBGPOS::get_lookup (i)); }
- 
-   static inline void position_start (hb_font_t *font, hb_buffer_t *buffer);
-   static inline void position_finish_advances (hb_font_t *font, hb_buffer_t *buffer);
-@@ -37,11 +40,11 @@ struct GPOS : GSUBGPOS
-   bool subset (hb_subset_context_t *c) const
-   {
-     hb_subset_layout_context_t l (c, tableTag, c->plan->gpos_lookups, c->plan->gpos_langsys, c->plan->gpos_features);
--    return GSUBGPOS::subset<GPOS_impl::PosLookup> (&l);
-+    return GSUBGPOS::subset<PosLookup> (&l);
-   }
- 
-   bool sanitize (hb_sanitize_context_t *c) const
--  { return GSUBGPOS::sanitize<GPOS_impl::PosLookup> (c); }
-+  { return GSUBGPOS::sanitize<PosLookup> (c); }
- 
-   HB_INTERNAL bool is_blocklisted (hb_blob_t *blob,
-                                    hb_face_t *face) const;
-@@ -51,7 +54,7 @@ struct GPOS : GSUBGPOS
-     for (unsigned i = 0; i < GSUBGPOS::get_lookup_count (); i++)
-     {
-       if (!c->gpos_lookups->has (i)) continue;
--      const GPOS_impl::PosLookup &l = get_lookup (i);
-+      const PosLookup &l = get_lookup (i);
-       l.dispatch (c);
-     }
-   }
-@@ -59,7 +62,7 @@ struct GPOS : GSUBGPOS
-   void closure_lookups (hb_face_t      *face,
-                         const hb_set_t *glyphs,
-                         hb_set_t       *lookup_indexes /* IN/OUT */) const
--  { GSUBGPOS::closure_lookups<GPOS_impl::PosLookup> (face, glyphs, lookup_indexes); }
-+  { GSUBGPOS::closure_lookups<PosLookup> (face, glyphs, lookup_indexes); }
- 
-   typedef GSUBGPOS::accelerator_t<GPOS> accelerator_t;
- };
-diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
-index f5059cfa83..8fe987fc50 100644
---- a/src/hb-ot-layout-gpos-table.hh
-+++ b/src/hb-ot-layout-gpos-table.hh
-@@ -32,8 +32,8 @@
- #include "OT/Layout/GPOS.hh"
- 
- namespace OT {
--
--using Layout::GPOS_impl::PosLookup;
-+namespace Layout {
-+namespace GPOS_impl {
- 
- // TODO(garretrieger): Move into new layout directory.
- /* Out-of-class implementation for methods recursing */
-@@ -68,6 +68,8 @@ inline bool PosLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_apply
- }
- #endif
- 
-+} /* namespace GPOS_impl */
-+} /* namespace Layout */
- } /* namespace OT */
- 
- 
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index b054291ff7..b1d236a055 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5bc33ac099b2e52f01d27cde21cee4281b9d5bfec7684135e268512478bc9ee  harfbuzz-4.4.1.tar.xz
+sha256  d0094299a36346b9f5540aa159b358425c022b19fcdf72165eaf94046a179166  harfbuzz-5.0.1.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 726abaa61e..c9ff28a526 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 4.4.1
+HARFBUZZ_VERSION = 5.0.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
