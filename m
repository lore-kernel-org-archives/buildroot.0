Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502ADC43334
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDBC34103A;
	Tue, 12 Jul 2022 21:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDBC34103A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpqokZ_1lT1O; Tue, 12 Jul 2022 21:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF82140462;
	Tue, 12 Jul 2022 21:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF82140462
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA211BF389
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 21:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD83C612B3
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 21:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD83C612B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24ltPDbaMvkt for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 21:08:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03209612AF
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03209612AF
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 21:08:14 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.49.253])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BN76og1jNXOlABN77oNcoG; Tue, 12 Jul 2022 23:08:13 +0200
Message-ID: <d0608d3b-51f0-d069-866f-11efcd1240f1@benettiengineering.com>
Date: Tue, 12 Jul 2022 23:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220712162712.1582871-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220712162712.1582871-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfPfqrdRduz71JHMd5vYQCWDYZ4Se7YH+ihJzSIgxpBnt7T1yjyaWP4JGcWJ6BaQ2ODAeEaHMjTyGLYnC8jDbc5tmCgJ9a51Y8kv0IomYQXofy1HaAaMY
 PnnC1pM25FzcOmIoUgbLj0Q/vhLf2AYe3WAND5wI+DhJgYhOQ2IDNt4K/S5CRAorfFgJWA82/I6oH47U3Uz3iSgRd+Ciamxs0n/RlvIJTV/o2fO84+mgS5/0
 KZDxHJgVvQfqlTyi+0pWm9JnBuaXXMNUba3MubiLMqA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1657660093; bh=4714dAU4O3XJpA89zq75kPs6VMD4B8e4bS4zHviK2G0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=H1HfRjXJypPQY4/YOKEBdpchAzaSMKJOPluUk6+4Cwpwc4iagPYl7SDs8/QZUqqdE
 E5mgE9stNS+UDLbGxUa/Gh1PaA82BLfUA4OjFQ8kqNFHhhao6AZZqv+WAvNDDU9fVx
 GEJivErc3BByccPXWb9KUgE8zWLbbwm34G2KT48KB71xnBwbPXDDelL+DhsLdWfevM
 GGYejNLDT+13aBU/Jfy0Y39OgDxMULA7I+vhfnbJL32nnOuy6A4YpWlHsNIna+RfES
 6x/68T1HJ7XKRsidNzZ0xEcg3rwFkDz6jK/fHyskOQ658H/GqlNYaUrayYOtAFrOLD
 DjEt7wzA16esg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=H1HfRjXJ
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

Hi Fabrice,

On 12/07/22 18:27, Fabrice Fontaine wrote:
> Fix the following build failure with gcc < 7 raised since bump to
> version 4.4.0 in commit e186b4d89dcd3eb9fae557959181d7176e7c873c:
> 
> In file included from ../src/hb.hh:473:0,
>                   from ../src/hb-buffer-verify.cc:27:
> ../src/hb-cplusplus.hh:170:13: error: specialization of 'template<class _Tp> struct std::hash' in different namespace [-fpermissive]
>   struct std::hash<hb::shared_ptr<T>>
>               ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

thank you for providing such fix.

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CTO/CEO@Benetti Engineering sas

> ---
>   .../0002-cplusplus-Fix-build-on-GCC-7.patch   | 50 +++++++++++++++++
>   .../0003-GSUB-Fix-build-on-GCC-7.patch        | 56 +++++++++++++++++++
>   2 files changed, 106 insertions(+)
>   create mode 100644 package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
>   create mode 100644 package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
> 
> diff --git a/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
> new file mode 100644
> index 0000000000..de2955d8b5
> --- /dev/null
> +++ b/package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
> @@ -0,0 +1,50 @@
> +From 7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927 Mon Sep 17 00:00:00 2001
> +From: Kleis Auke Wolthuizen <github@kleisauke.nl>
> +Date: Wed, 6 Jul 2022 12:58:15 +0200
> +Subject: [PATCH] [cplusplus] Fix build on GCC < 7
> +
> +[Retrieved from:
> +https://github.com/harfbuzz/harfbuzz/commit/7b51bc95d9cf0d9a2e91a37319fa34e4e5f26927]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/hb-cplusplus.hh | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/hb-cplusplus.hh b/src/hb-cplusplus.hh
> +index 86d0452080..f06a32d912 100644
> +--- a/src/hb-cplusplus.hh
> ++++ b/src/hb-cplusplus.hh
> +@@ -166,8 +166,14 @@ HB_DEFINE_VTABLE (unicode_funcs);
> +
> + } // namespace hb
> +
> ++/* Workaround for GCC < 7, see:
> ++ * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56480
> ++ * https://stackoverflow.com/a/25594741 */
> ++namespace std {
> ++
> ++
> + template<typename T>
> +-struct std::hash<hb::shared_ptr<T>>
> ++struct hash<hb::shared_ptr<T>>
> + {
> +     std::size_t operator()(const hb::shared_ptr<T>& v) const noexcept
> +     {
> +@@ -177,7 +183,7 @@ struct std::hash<hb::shared_ptr<T>>
> + };
> +
> + template<typename T>
> +-struct std::hash<hb::unique_ptr<T>>
> ++struct hash<hb::unique_ptr<T>>
> + {
> +     std::size_t operator()(const hb::unique_ptr<T>& v) const noexcept
> +     {
> +@@ -187,6 +193,8 @@ struct std::hash<hb::unique_ptr<T>>
> + };
> +
> +
> ++} // namespace std
> ++
> + #endif /* __cplusplus */
> +
> + #endif /* HB_CPLUSPLUS_HH */
> diff --git a/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
> new file mode 100644
> index 0000000000..d3355443b7
> --- /dev/null
> +++ b/package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
> @@ -0,0 +1,56 @@
> +From 79eb0f74860fb6309e3162b4f17f98481c05a318 Mon Sep 17 00:00:00 2001
> +From: Kleis Auke Wolthuizen <github@kleisauke.nl>
> +Date: Wed, 6 Jul 2022 13:29:55 +0200
> +Subject: [PATCH] [GSUB] Fix build on GCC < 7
> +
> +[Retrieved (and backported) from:
> +https://github.com/harfbuzz/harfbuzz/commit/79eb0f74860fb6309e3162b4f17f98481c05a318]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/OT/Layout/GSUB/GSUB.hh     | 5 +++--
> + src/hb-ot-layout-gsub-table.hh | 8 ++++----
> + 2 files changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/OT/Layout/GSUB/GSUB.hh b/src/OT/Layout/GSUB/GSUB.hh
> +index 372862e2bb..750dca1da3 100644
> +--- a/src/OT/Layout/GSUB/GSUB.hh
> ++++ b/src/OT/Layout/GSUB/GSUB.hh
> +@@ -5,9 +5,10 @@
> + #include "Common.hh"
> + #include "SubstLookup.hh"
> +
> +-using OT::Layout::GSUB::SubstLookup;
> +-
> + namespace OT {
> ++
> ++using Layout::GSUB::SubstLookup;
> ++
> + namespace Layout {
> +
> + /*
> +diff --git a/src/hb-ot-layout-gsub-table.hh b/src/hb-ot-layout-gsub-table.hh
> +index 1eca613b6a..50301ff1d9 100644
> +--- a/src/hb-ot-layout-gsub-table.hh
> ++++ b/src/hb-ot-layout-gsub-table.hh
> +@@ -32,9 +32,8 @@
> + #include "OT/Layout/GSUB/GSUB.hh"
> +
> + namespace OT {
> +-
> +-using Layout::GSUB::SubstLookup;
> +-using Layout::GSUB::ExtensionSubst;
> ++namespace Layout {
> ++namespace GSUB {
> +
> + // TODO(garretrieger): Move into the new layout directory.
> + /* Out-of-class implementation for methods recursing */
> +@@ -82,7 +81,8 @@ inline bool SubstLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_app
> + }
> + #endif
> +
> +-
> ++} /* namespace GSUB */
> ++} /* namespace Layout */
> + } /* namespace OT */
> +
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
