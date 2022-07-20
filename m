Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED7FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 23:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96C241A5B;
	Wed, 20 Jul 2022 23:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96C241A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDIpcUD_eQTy; Wed, 20 Jul 2022 23:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34705419B4;
	Wed, 20 Jul 2022 23:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34705419B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 538C91BF3EA
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 23:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D5D040475
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 23:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D5D040475
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzoEzJ-Kl2I8 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 23:28:16 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3116540131
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3116540131
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 23:28:15 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.55.53])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EJ09oMgfsrvmbEJ0AoTd1E; Thu, 21 Jul 2022 01:21:10 +0200
Message-ID: <1ea32636-a741-d7c8-1326-77fa90200ee4@benettiengineering.com>
Date: Thu, 21 Jul 2022 01:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220720171756.307458-1-bernd.kuhls@t-online.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220720171756.307458-1-bernd.kuhls@t-online.de>
X-CMAE-Envelope: MS4xfMyN673JQYCqUd4Qn2sLHap2senlXFznFaJs2tMm6Y+659p7ayQIrUmQPuDo/sg0cJB68/t1T2yUqU7Ya3IDzYaz7Y6ZU87QdJgE+mMKHEv8TH1H6O5f
 JIKp7DV6ppRVdUapjqSUP9bQ3l7hiugYfqwVqupDVCMG8c89ZLPxZ44kLI3cR75uSC8961fU3yZDp7YCa9d/0wlULMhACN1kNYLD6TTpitUQqJEB7W+Tbpiu
 rJ3AeC8J/0dgodFnYr4roQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1658359270; bh=uBlSu1Ey1AW5Kts33jq2Q9wT9JP2mqIFdbDC4v4tDuc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EinTSK8CNPzpV+Zp9Nv6NDWk4cS6iZhq2t4Qp3WWbyZBF96tfGXwXyA7Y54R6uD3n
 iu58jzxYUR0rSz+XNaDF0rSBA70GgtHj7VpF1C76YhFf7eHMjrBQKbCJhoknhA+2Q1
 vtTI/UIli4GINo81O/5fN9ia9RotKBLDHLtcLdlg0i6UB5jDd4w7miLXp+UfdcYJ1h
 7E5/HExSmeUZwjSXUC8+jWmuGC7GU9g0iOSQ0VjRydk86HkAZoM8tw5fTmYZ7cxLBG
 kllQIzqSbtOCLVATz+3550/Ei1WKvvsB4z5UYeGnpohavNVJAjxt7WuuVgEk9WaLWI
 de+X7W/1Jt1MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EinTSK8C
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with gcc < 7
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 20/07/22 19:17, Bernd Kuhls wrote:
> Fixes various build errors
> 
> In file included from ../src/hb-kern.hh:32:0,
>                   from ../src/hb-ot-shape-fallback.cc:32:
> ../src/hb-ot-layout-gpos-table.hh:50:117: error: specialization of 'template<class context_t> static typename context_t::return_t OT::Layout::GPOS_impl::PosLookup::dispatch_recurse_func(context_t*, unsigned int)' in different namespace [-fpermissive]
> 
> introduced by bumping harfbuzz to 4.4.1 in
> 03022329e02332c22f44e0e0a9b17d8454ba26ae
> 
> The build error was not yet caught by the autobuilders but can be
> reproduced using this defconfig:
> http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thank you for the patch. I've confused the your patch(GPOS) with already
committed patch(GSUB). I've reproduced the bug and with this patch it's 
fixed, so:

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards!
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   .../0004-GPOS-Fix-build-on-GCC-7.patch        | 97 +++++++++++++++++++
>   1 file changed, 97 insertions(+)
>   create mode 100644 package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
> 
> diff --git a/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
> new file mode 100644
> index 0000000000..ead6fc024f
> --- /dev/null
> +++ b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
> @@ -0,0 +1,97 @@
> +From 3238cb744bb570a75326ab4438968c59069e9af2 Mon Sep 17 00:00:00 2001
> +From: Kleis Auke Wolthuizen <github@kleisauke.nl>
> +Date: Wed, 6 Jul 2022 13:18:14 +0200
> +Subject: [PATCH] [GPOS] Fix build on GCC < 7
> +
> +[Retrieved (and backported) from:
> +https://github.com/harfbuzz/harfbuzz/commit/3238cb744bb570a75326ab4438968c59069e9af2]
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/OT/Layout/GPOS/GPOS.hh     | 17 ++++++++++-------
> + src/hb-ot-layout-gpos-table.hh |  6 ++++--
> + 2 files changed, 14 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/OT/Layout/GPOS/GPOS.hh b/src/OT/Layout/GPOS/GPOS.hh
> +index 7fb97d7568..23b0b090a2 100644
> +--- a/src/OT/Layout/GPOS.hh
> ++++ b/src/OT/Layout/GPOS.hh
> +@@ -7,6 +7,9 @@
> + #include "GPOS/PosLookup.hh"
> +
> + namespace OT {
> ++
> ++using Layout::GPOS_impl::PosLookup;
> ++
> + namespace Layout {
> +
> + static void
> +@@ -25,10 +28,10 @@ struct GPOS : GSUBGPOS
> + {
> +   static constexpr hb_tag_t tableTag = HB_OT_TAG_GPOS;
> +
> +-  using Lookup = GPOS_impl::PosLookup;
> ++  using Lookup = PosLookup;
> +
> +-  const GPOS_impl::PosLookup& get_lookup (unsigned int i) const
> +-  { return static_cast<const GPOS_impl::PosLookup &> (GSUBGPOS::get_lookup (i)); }
> ++  const PosLookup& get_lookup (unsigned int i) const
> ++  { return static_cast<const PosLookup &> (GSUBGPOS::get_lookup (i)); }
> +
> +   static inline void position_start (hb_font_t *font, hb_buffer_t *buffer);
> +   static inline void position_finish_advances (hb_font_t *font, hb_buffer_t *buffer);
> +@@ -37,11 +40,11 @@ struct GPOS : GSUBGPOS
> +   bool subset (hb_subset_context_t *c) const
> +   {
> +     hb_subset_layout_context_t l (c, tableTag, c->plan->gpos_lookups, c->plan->gpos_langsys, c->plan->gpos_features);
> +-    return GSUBGPOS::subset<GPOS_impl::PosLookup> (&l);
> ++    return GSUBGPOS::subset<PosLookup> (&l);
> +   }
> +
> +   bool sanitize (hb_sanitize_context_t *c) const
> +-  { return GSUBGPOS::sanitize<GPOS_impl::PosLookup> (c); }
> ++  { return GSUBGPOS::sanitize<PosLookup> (c); }
> +
> +   HB_INTERNAL bool is_blocklisted (hb_blob_t *blob,
> +                                    hb_face_t *face) const;
> +@@ -51,7 +54,7 @@ struct GPOS : GSUBGPOS
> +     for (unsigned i = 0; i < GSUBGPOS::get_lookup_count (); i++)
> +     {
> +       if (!c->gpos_lookups->has (i)) continue;
> +-      const GPOS_impl::PosLookup &l = get_lookup (i);
> ++      const PosLookup &l = get_lookup (i);
> +       l.dispatch (c);
> +     }
> +   }
> +@@ -59,7 +62,7 @@ struct GPOS : GSUBGPOS
> +   void closure_lookups (hb_face_t      *face,
> +                         const hb_set_t *glyphs,
> +                         hb_set_t       *lookup_indexes /* IN/OUT */) const
> +-  { GSUBGPOS::closure_lookups<GPOS_impl::PosLookup> (face, glyphs, lookup_indexes); }
> ++  { GSUBGPOS::closure_lookups<PosLookup> (face, glyphs, lookup_indexes); }
> +
> +   typedef GSUBGPOS::accelerator_t<GPOS> accelerator_t;
> + };
> +diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
> +index f5059cfa83..8fe987fc50 100644
> +--- a/src/hb-ot-layout-gpos-table.hh
> ++++ b/src/hb-ot-layout-gpos-table.hh
> +@@ -32,8 +32,8 @@
> + #include "OT/Layout/GPOS.hh"
> +
> + namespace OT {
> +-
> +-using Layout::GPOS_impl::PosLookup;
> ++namespace Layout {
> ++namespace GPOS_impl {
> +
> + // TODO(garretrieger): Move into new layout directory.
> + /* Out-of-class implementation for methods recursing */
> +@@ -68,6 +68,8 @@ inline bool PosLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_apply
> + }
> + #endif
> +
> ++} /* namespace GPOS_impl */
> ++} /* namespace Layout */
> + } /* namespace OT */
> +
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
