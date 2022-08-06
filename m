Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E43C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 15:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC26860AC9;
	Sat,  6 Aug 2022 15:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC26860AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbG30tc5xxCz; Sat,  6 Aug 2022 15:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFD960A98;
	Sat,  6 Aug 2022 15:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFD960A98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8D81BF5A8
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 15:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A2C828F2
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 15:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A2C828F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwMSoVOiI4i9 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 15:47:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C23828C5
Received: from smtpcmd09100.aruba.it (smtpcmd09100.aruba.it [62.149.156.100])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3C23828C5
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 15:47:24 +0000 (UTC)
Received: from [192.168.8.155] ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KM1LoNaC3ij11KM1LokdES; Sat, 06 Aug 2022 17:47:23 +0200
Message-ID: <bad4b4a5-2e2b-0ec9-93a9-98fa4495736a@benettiengineering.com>
Date: Sat, 6 Aug 2022 17:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220806154610.4106492-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220806154610.4106492-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfDVG1wB1QRbRvaV7N+v6u1vlF2P8gC5e2wkLroPsZlS458iE4GIU2bXayjZRS8eln6W1ULZ2h0jbQ48WX/W2pzfaEH83EEQ6f2mG93ufbJ1ChVjFeePh
 tFq806eGuyXk5eLijgAyu1d35xWdtf3YWrSBo4YEdJPxmZp2wo86twFTXBc2uiNCC37nWnZL8gKojXg5XNbieeN7wOFDHJDTr3bShUfn9/FVMp3Lo/jvTYHj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659800843; bh=ApJSGF86fH+bW4lmrSWYeWlWOBMEqcRzKZfC7BWVtHQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=eoQWz/2ehcwzwIZU/TGS5EjvuyFK9nzr3RL7n1yBlXdUKZ6KfPBuHXFpth2hw2snQ
 svu76Ooc3hu3u1iEP+442fnBmlRPiPSShCxo5dI2piFZXOsJdkjH7gcVrHy4R/9Nce
 BskSNqoF1R0nEKSsm65UH9fw5AyAplam6hihaZNkuwrO8YH9LPRRTRUB7ybb123sCe
 O/fuI09l+3MylUObgMNlaYmec6e5qb0W5zGH2RlTZo71uXGvt+pnsgPoag5SiU4oAP
 TcjQZ+Et8JKRXtpkDVMQbS0GwACoO3nBPGNLBfaO2gAWLl11K7q+O6CalZ5VDnVI34
 7l0yqeSFySKRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eoQWz/2e
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: fix host building
 trying to call asciidoctor
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

On 06/08/22 17:46, Giulio Benetti wrote:
> While bumping version I've fixed build failure due to missing host
> asciidoctor by passing --disable-asciidoc to CRYPTSETUP_CONF_OPTS but that
> is missing in HOST_CRYPTSETUP_CONF_OPTS and this leads the same build
> failure of target building. So let's fix it by adding --disable-asciidoc
> to host HOST_CRYPTSETUP_CONF_OPTS too.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0c1/0c1a6a8e59653afaa09303550f74475b4a3898bf/build-end.log

s/build-end.log/

sorry, I was too fast to submit.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/cryptsetup/cryptsetup.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 01902c3f6a..4a52bb62dd 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -65,7 +65,8 @@ HOST_CRYPTSETUP_CONF_OPTS = --with-crypto_backend=openssl \
>   	--disable-kernel_crypto \
>   	--disable-ssh-token \
>   	--enable-blkid \
> -	--with-tmpfilesdir=no
> +	--with-tmpfilesdir=no \
> +	--disable-asciidoc
>   
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
