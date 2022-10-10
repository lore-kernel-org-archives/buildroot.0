Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35260C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 18:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9540040A96;
	Mon, 10 Oct 2022 18:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9540040A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ja5o3b0GX1bI; Mon, 10 Oct 2022 18:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C285040983;
	Mon, 10 Oct 2022 18:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C285040983
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEF451BF3A3
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 18:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA9CE812EC
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 18:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9CE812EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Of4DAdSGo4OD for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 18:13:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C99F80CC8
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C99F80CC8
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 18:13:27 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hxHKoQvI7SfRFhxHKot0lm; Mon, 10 Oct 2022 20:13:26 +0200
Message-ID: <120fd0f6-2ea1-d80a-1126-d1498ef9d35d@benettiengineering.com>
Date: Mon, 10 Oct 2022 20:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: buildroot@buildroot.org
References: <20220918000859.837023-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220918000859.837023-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfCazzsmypfPLfY47bIcw38Yy+IRvdA32AHQdydLROsahNpqHGLJ2AktKOTHl/MZSmOhQ38DjpH5EGfzJPD4rOqxNADNJ/q04xkfLflKYkHeydPNwsCoR
 HMYr+Dw6MOh2aOBsOW/uV4X4lIpUp3Fzmt0rrUvTD+PWwZXWV7Ta/l+sEXA6cGKsX0upVRSx9wuNRSM3c/odlSslT1HfuFyjt0IOd5AAFSCucy1cr/XB/r5U
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665425606; bh=67x1JgHY7cPeI/+fwZMaYFNbsyRvdFF87DaO0BZvt28=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jVrpKV24PoNZFQfbuo7v+ouSTIGxQNcGE5I1aXZyo0kIqrKJB6gMGc8PmGpEcX3tH
 K3rFH/TZaWftKhb1Ql7dakUK0ottVIXr26pkEjIda7XYwdawbe8KXdFWjUXS/hxaCS
 JH0jOaoppAf/6dCmbUAnS2TEdjbj6JFMcY6QQaNf7jaP316TOVwIuSF6k0lyIlYKHx
 eRmoTV+5rtAf8vAKSlpUXs1OmCGGq9njxJJtVfPPkCiJTweXfXqpIz3ZLfXmm8TrMK
 Au+wj/avQocmScfHWGnstq0QZ4Ngt0hNCLihyf3rjAwjCKIfUhowNyDb4yKFTN+AbO
 Yxjnfp5aOKeWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jVrpKV24
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.2.0
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

Hi All,

please drop this patch in favor of this:
https://patchwork.ozlabs.org/project/buildroot/patch/20221010181148.18858-1-giulio.benetti@benettiengineering.com/
that bumps to version 5.3.0 that's been released in the meanwhile.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 18/09/22 02:08, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 9ec5c63f55..0d55c15f79 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05  harfbuzz-5.1.0.tar.xz
> +sha256  735a94917b47936575acb4d4fa7e7986522f8a89527e4635721474dee2bc942c  harfbuzz-5.2.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 75d55106ea..15a58c4bf4 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 5.1.0
> +HARFBUZZ_VERSION = 5.2.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
