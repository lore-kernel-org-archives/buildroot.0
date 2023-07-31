Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB1AC001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F327640BAC;
	Mon, 31 Jul 2023 22:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F327640BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiRHYPdMH4zc; Mon, 31 Jul 2023 22:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C625C40C0D;
	Mon, 31 Jul 2023 22:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C625C40C0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12CC81BF419
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3726240253
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3726240253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7Ewqn4VSTb1 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:18:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81B834011A
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B834011A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70343FF802;
 Mon, 31 Jul 2023 22:18:40 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:18:39 +0200
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230801001839.58d7ecb1@windsurf>
In-Reply-To: <20230731191402.1508702-1-vfazio@gmail.com>
References: <20230730173242.6669-1-vfazio@gmail.com>
 <20230731191402.1508702-1-vfazio@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690841920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+EkvUGur+i7RgDnE/tISYSDeHmy2Y0C6UPCG/b7VdI=;
 b=akyV1vaP+YNqOHJ2uGOokFNb1ftWAWuAwQn+piY0be2mYYHWtRhdQc8PZ0pijvgqgslRVA
 SilSi5fEuKubenKi4+2z0OM6OUB6lRO7qVvbdAjas17XEpVRQIveMduXXbg96zLtn1UaFA
 jk9TpfzDMDI+gdqBrIhh+qOV7N5Sr+IwFX1+PrHDKml+VlOc0t5b6vqoC3BevrSRUWX3yq
 SFtisGPPU54f9IgFjrLLD60EIdrGxZmtEqIdIGj7+ZCFDzzSDw4zBCI+lOjbh5LkA4SKXT
 cn8LLB8qve7FeSKTZdY6vul+eEf0lXNEsrQHoSvrJ9HzK5OeqhF8ClzkpG6Dxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=akyV1vaP
Subject: Re: [Buildroot] [PATCH v2 1/1] arch/Config.in.x86: add Intel and
 AMD GCC targets
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Mon, 31 Jul 2023 14:14:02 -0500
Vincent Fazio <vfazio@gmail.com> wrote:

> Sync the Intel and AMD CPU target list with GCC 13.
> 
> Multiple references are used for flags and synonyms [0] [1] [2] [3].
> 
> For Intel:
>   Add Ivy Bridge, Sierra Forest, Grand Ridge, Knights Landing, Knights
>   Mill, Granite Rapids, and Granite Rapids-D.
> 
>   The Sapphire Rapids CPU target supports Emerald Rapids.
>   The Alder Lake CPU target supports Raptor Lake and Meteor Lake.
> 
>   Note: Knights Landing/Mills are based on Xeon Phi and do support
>   some AVX512 extensions, but not the full subset required by
>   BR2_X86_CPU_HAS_AVX512
> 
> For AMD:
>   Add Bobcat, Bulldozer, Piledriver, Excavator, and Zen 1-4.
> 
> Add a comment to BR2_X86_CPU_HAS_AVX512 to explain the expected
> extensions supported by the CPU. This flag was first selected by
> skylake-avx512 and encompasses what appears to be a standard subset
> across CPUs [3] and chapter 3 of the x86-64 psABI [4]:
>   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
> 
> CPUs selecting this flag should, at a minimum, support this subset of
> AVX512 extensions.
> 
> [0]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
> [1]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/config/i386/i386.h;hb=refs/tags/releases/gcc-13.2.0
> [2]: https://gcc.gnu.org/git/?p=gcc.git;a=blob_plain;f=gcc/common/config/i386/i386-common.cc;hb=refs/tags/releases/gcc-13.2.0
> [3]: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
> [4]: https://gitlab.com/x86-psABIs/x86-64-ABI/-/raw/master/x86-64-ABI/low-level-sys-info.tex
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
> Changes v1 -> v2:
>   - Clarify the BR2_X86_CPU_HAS_AVX512 comment (suggested by Thomas)
>   - Flesh out the commit message with the additions made
> ---
>  arch/Config.in.x86 | 200 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 199 insertions(+), 1 deletion(-)

Applied to master, thanks.

Does this mean we can do:

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e6cf4f14bb..7b520cdf3d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -53,9 +53,9 @@ QT6BASE_CONF_OPTS = \
        -DFEATURE_system_zlib=ON \
        -DFEATURE_system_libb2=ON
 
-# x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
-# is not clear yet how it maps to all the avx512* options of Qt, so we
-# for now keeps them disabled.
+# x86 optimization options. AVX512F, AVX512BW, AVX512CD, AVX512DQ,
+# AVX512VL are implied by BR2_X86_CPU_HAS_AVX512. We don't have
+# options for the other AVX512 extensions.
 QT6BASE_CONF_OPTS += \
        -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
        -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
@@ -64,16 +64,16 @@ QT6BASE_CONF_OPTS += \
        -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
        -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
        -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
-       -DFEATURE_avx512bw=OFF \
-       -DFEATURE_avx512cd=OFF \
-       -DFEATURE_avx512dq=OFF \
+       -DFEATURE_avx512bw=$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
+       -DFEATURE_avx512cd=$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
+       -DFEATURE_avx512dq=$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
        -DFEATURE_avx512er=OFF \
-       -DFEATURE_avx512f=OFF \
+       -DFEATURE_avx512f=$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
        -DFEATURE_avx512ifma=OFF \
        -DFEATURE_avx512pf=OFF \
        -DFEATURE_avx512vbmi=OFF \
        -DFEATURE_avx512vbmi2=OFF \
-       -DFEATURE_avx512vl=OFF \
+       -DFEATURE_avx512vl=$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
        -DFEATURE_vaes=OFF
 
 define QT6BASE_BUILD_CMDS

 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
