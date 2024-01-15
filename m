Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FCC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791B584392;
	Mon, 15 Jan 2024 21:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 791B584392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5uhBiXkWSZz; Mon, 15 Jan 2024 21:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D09FC8404F;
	Mon, 15 Jan 2024 21:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D09FC8404F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC8D51BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83E9242F28
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E9242F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuCGyWKndpbf for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:57:15 +0000 (UTC)
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E047642F1E
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E047642F1E
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PUxDrwWJhSo8WPUxDrwDM3; Mon, 15 Jan 2024 22:57:12 +0100
Message-ID: <e971b0bc-6242-4a28-b203-5e0326466f13@benettiengineering.com>
Date: Mon, 15 Jan 2024 22:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfM1OW28lLOw41c6dlWhwt4+nyBh3kUO9Sinc4HHIOqVlkSdTLaCY+OTCILF+wd81Ew8wCEP30AZtIO5cJL6Kk/61VQGAgpCABgZ31+yHUOCuCWmkiHbG
 1aqpOSbbX/rUvtxZ/276PDncqt6IMLmlAaosvfjfTbyuQqsQJHgV8/snSFO6SKzSIQbjEMnIF0D9q4pMhf8hE4CwIZ3lDZ10RZ2Cj0FD2obbx9SFyypmToBL
 twnMKj+Thf4BJ/GftCcR4N1dmSxoBx3UuVnVR0qxB2bu1kg/JYVPQK3ddGoBNLIatY1ytHYQ/ms6epzk6IYOQQnQnbttpwccO1InVp+io8fsdv7bm/r66JEC
 Zlm4NtBf6AA/Lo5TALHQDHMJTzRL2KPweFL3LseV6Fy0btwBFXB0weH3obxZrpwyRaQMCVeB8W/JPuy8NXydi6saaRtE3ACF+Zzya1Xf/ocMogVz70wIkQvr
 q40yXPYD/A5prpy8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705355832; bh=TX3i40Yz32J6F8z43eABGcxw4g5Nfg0iZ9dbpm7jTck=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fBivhhFEJ9dnt/5zbW4EGKXVMGCbpDaJ/Z+wwt4Sa3xbauzri75MjAi764cnROMFw
 vBfYWf4ZRSwGtwCSCDTa4XsUSIfJYpwRQs/t2YUOQDDIeXd96xxTt/vw0a+AqPftVA
 iUWMBb/TklYnEeUtdexi1ypd/mlL/rZvv+FLa4lb08ec0q4Eo3YmICDZqHlIyZns+F
 lbVx4C6YLgSwctrvYV4aDwzRFqaPnViMTr0GlMJMYKdQ+zCvdaWy5Hlr/027KjlfQr
 QS410z5H6IQp3qSDupriFXOpbtQCOLxiDVBY6afHpgvnHwPo2uAGUeYCZTSey+ZSaS
 Xz5mSq+BztEoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fBivhhFE
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_101766
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 15/01/24 22:34, Fabrice Fontaine wrote:
> BR2_TOOLCHAIN_HAS_GCC_BUG_101766 will be used to fix a build a build
> failure on attr and elfutils with microblaze
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   toolchain/Config.in | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index f1f9212f25..dc4e52bb3d 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -210,6 +210,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
>   	bool
>   	default y if BR2_sh
>   
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
> +# Microblaze gcc can't use .symver attribute leading to:
> +# error: symver is only supported on ELF platforms
> +# however __has_attribute(symver) returns true
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_101766
> +	bool
> +	default y if BR2_microblaze || BR2_microblazeel
> +

Thank you for providing such gcc bug:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
>   # ICE: in extract_insn, at recog.c:2294 on microblaze.
>   # This bug still exists in gcc = 12.1.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
