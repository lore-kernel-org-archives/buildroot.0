Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DF2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F7B61038
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 21:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51F7B61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4AB4402C3;
	Fri, 24 Sep 2021 21:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7eTMCOk1-jJ; Fri, 24 Sep 2021 21:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5F0F402C1;
	Fri, 24 Sep 2021 21:27:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A946A1BF3B5
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A480E42351
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 21:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNT3Ovxn0XF9 for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 21:27:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31A342350
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 21:27:06 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TsimmiKqUJzjeTsimmA2km; Fri, 24 Sep 2021 23:27:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632518825; bh=BcdfI5ENXHcP7ihI0r3GeBJ9OotPCPAofAdNlPCDfXU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=CWCsGB3M24r2Owqpit7TSUVOH+c/j0rwjNCJtA86mYZpT0A7ELJRJ7FSq8EvOrh8x
 tEPcHMoh9grQM2aVkUNPm0AGj3J2DPWKANF9EfyAyOG6X9tNlDkZl2wC9l9hAgi2B5
 1FV7NJ26HkamsR6sIrKCiiIMZFBqeu/Ou8yG86RsryzVlcm0QLpjJJZ9bMEFfzFOyW
 1yK0IPjdHq1ZY9WUHhHCdrKjNvowukx2KHbh/Kzy9PSRtqxgCUmQytyZyVsNF57v9C
 P/UjnhMPygtm9PMz8OTOUAV2eqUs4myhJAaCmjp47TlFZLDuh4PXPC2YD0lUCKNR75
 GxitaHGQfcttA==
To: buildroot@buildroot.org
References: <20210923164553.1218801-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0a3bb8bf-27b6-8ee5-7b4e-a57169c7f18e@benettiengineering.com>
Date: Fri, 24 Sep 2021 23:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923164553.1218801-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGjg4du1I1BViZkYWr7Q4XI/7pWWp6pn0mRbcA3LF4uyH3DFs7FYpGm9WBFc//C1gIymV8eUi0hSaLw+nKBCD0VID8KUvIkCJEi3DWcCIcwg27de8DkD
 xVPbxmrq8JGi4KB6TrZoMAma6Uj1TjUeN3RnOc95f9eZxjTINQQYhdhMuKApeOn5rQCSBCnhwhwukvhz442q0G8RgZnDH5i0QYEJxMhFUIy8Fuej8ggXIfNZ
 gApA/TbQt1B/UBdt3ehlRdcL0n92qQyF2anPXdB4tXGMG+/teRLD/J9KbLXB6qoSAj/pj1SlmP/uH60RU0SLW9YNOFR7V7SOD8TMsry81FKh531VoHSy7PV2
 eAcW9bwoUyBdR4KNbSG7e5XBoVUTXgEbUiN9INaJtlVF4oFH4is=
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_102472
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On 9/23/21 6:45 PM, Giulio Benetti wrote:
> python-uvloop package hang while building for the m68k architecture with
> optimization enabled with gcc = 11.2.0:
> http://autobuild.buildroot.net/results/17d/17d6e6422abadcd6313c430c40f2a5d7162dbbd3/

Here it's not true. I've found out that it doesn't really time out, it 
only takes a lot to build with optimization enabled since loop.c file is 
7Mb big. So please drop this patch and the next one. I've marked them 
both as rejected in patchwork already.

Sorry for the noise!

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> It's been reported upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102472
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   toolchain/Config.in | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 8b01067105..adb4d63759 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -210,6 +210,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
>   	bool
>   	default y if BR2_sh4
>   
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102472
> +# ICE: on m68k it enters an infinite loop
> +# This bug still exists in gcc = 11.2.0
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_102472
> +	bool
> +	default y if BR2_m68k
> +
>   config BR2_TOOLCHAIN_HAS_NATIVE_RPC
>   	bool
>   
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
