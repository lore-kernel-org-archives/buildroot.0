Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F5FC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 12:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CCF41BE2;
	Sun,  7 Jan 2024 12:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CCF41BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siZQGLLlhh6B; Sun,  7 Jan 2024 12:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF3341BD8;
	Sun,  7 Jan 2024 12:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF3341BD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA1C1BF310
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 441D14031E
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441D14031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78gLMueF0sKE for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 12:05:41 +0000 (UTC)
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5A1B4015A
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 12:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A1B4015A
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MRuMrZ0opz7kwMRuMrrnfo; Sun, 07 Jan 2024 13:05:38 +0100
Message-ID: <2af6ddd2-b24f-44ff-9ba2-687586a55190@benettiengineering.com>
Date: Sun, 7 Jan 2024 13:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240105140611.6a19a037@windsurf>
 <20240107115958.173945-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240107115958.173945-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfJTBXVz0c7aaxTanqDwqE94lIT+u3i0+ys0ObB7fDRhGF0xPoKP5ip1kPBqxZAdSF+mPtm9X7T0x17MH1iDvvobnTzA6EqpgoGa1dWZ0oxgKpnsWuhVZ
 lDI6+frRDiO0x/PjX8CjbCmJCztwhPtSEtfVQIWuu+bIOdBW5Hb/gAa3HtNBrlwAgiSavSAh2F5cr7g5HCHDWCyWt9oCDWazyk31gn/rug9oibnRyFItXNsL
 o2aoFfLjvJlCrSSPJ/pVnBWtX6DaLXujhsrqkvCKqz2eKMuLmWZkHcJimVhF0ABK6h/3pah3TQOM+jsgkLDlQaD6wg4qDnJw6A43Vbd7KIs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704629138; bh=D7npAF8uTxcbbNFobNvQXXDKZnGbjTy83QFH3ht5FYE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=B0NJo3Tsl5GjzXmRFtcwC89YTyXTxWrmtKNHWs1Z/5UvT/xCg8oAuRa5qxyOawDRe
 cpfjrIY0KMcA5UzzAlyqMsSw5QzPwu4jZ3WFjbRUyTkIlhlmWepaqZ2G0HPvsu3AXp
 bH9paKHrlHYEAM6GCi5ILkYF0ySrV0eNl3MEd/9xjauhuUyFJwycb04IsSfCQqhAFq
 m/vEuVDf1ciLKJtCtf+yDwNA85x0jzLpgsm5VYu6ZYZr8PMTFztKPidjI0o0XBPRUA
 WS6R3iCJtg+RFJlAFNVuqW0HibcEkJuMd3urM3YwYLHhdOjxAR+AESyQF/tlE6q+/a
 UAZ6PBLqQlpEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=B0NJo3Ts
Subject: Re: [Buildroot] [PATCH v3] package/swugenerator: add missing
 runtime dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Re-reading again...

On 07/01/24 12:59, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Package swugenerator can use openssl to encrypt files in .swu(cpio)
> resulting output archive and gzip or zlib to compress the same files but
> we're not sure build environment have or not openssl, gzip and zlib
> installed 

and this can lead to runtime execution failure,

> so add them as host dependencies like:
> * host-openssl
> * host-gzip
> * host-zlib
> 

Could please a Maintainer reword this commit log adding that missing 
line that completes the answer to *why* we need *what*(add missing 
dependencies)?

I hope this time I've got close to a sufficient commit log :-)

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> ---
> V1->V2:
> * V1->V2:
> * add host-zstd and clarify in commit log these are runtime dependencies as
>    pointed by Thomas Petazzoni
> V2->V3:
> * improve commit log explaining why we need this patch as pointed by
>    Thomas Petazzoni
> ---
>   package/swugenerator/swugenerator.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
> index f4ead1d229..466fe1f046 100644
> --- a/package/swugenerator/swugenerator.mk
> +++ b/package/swugenerator/swugenerator.mk
> @@ -9,6 +9,10 @@ SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
>   SWUGENERATOR_LICENSE = GPL-3.0
>   SWUGENERATOR_LICENSE_FILES = LICENSE
>   HOST_SWUGENERATOR_SETUP_TYPE = setuptools
> -HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
> +HOST_SWUGENERATOR_DEPENDENCIES = \
> +	host-gzip \
> +	host-openssl \
> +	host-python-libconf \
> +	host-zstd
>   
>   $(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
