Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DBEC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9E88177A;
	Tue, 26 Jul 2022 22:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9E88177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQQYs8br_U6R; Tue, 26 Jul 2022 22:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A4581773;
	Tue, 26 Jul 2022 22:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A4581773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41F501BF311
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DB9B4018E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DB9B4018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVxcMU4R1tEd for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E319240012
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E319240012
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4289086404; Tue, 26 Jul 2022 21:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 00:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d366a2ad26ac16b9d2c7ab5980a5301d21bf391
X-Git-Newrev: dc535f7b933def7d07d6f1d897c1e1f3689b077f
X-Patchwork-Hint: ignore
Message-Id: <20220726215850.4289086404@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 5.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc535f7b933def7d07d6f1d897c1e1f3689b077f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-cplusplus-Fix-build-on-GCC-7.patch        | 50 -----------
 .../harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch    | 56 -------------
 .../harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch    | 97 ----------------------
 package/harfbuzz/harfbuzz.hash                     |  2 +-
 package/harfbuzz/harfbuzz.mk                       |  2 +-
 5 files changed, 2 insertions(+), 205 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
