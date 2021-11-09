Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C252EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785946115B
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 785946115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCE680D55;
	Tue,  9 Nov 2021 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgdiqhpBoCxm; Tue,  9 Nov 2021 10:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9354E80D3C;
	Tue,  9 Nov 2021 10:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAA981BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA9BB80D24
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZm0R0xGMdzm for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:24:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BFF280D3C
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:24:01 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kOHImznITyoivkOHJmOdqb; Tue, 09 Nov 2021 11:23:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453380; bh=z+1J5wnixw2V2nq73TvQDxk1pgaRLKR7tTQwm96ZAJY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HgWqA8Fu6mf6eij1JzUsC03SkdZyWcIGgaszE3BFs+7MmqDTMnN6aFrtfmR9useO8
 ka1q0eDj6vQth1jR9o6BAY+ce1AYf24uhSI1DWKcY3n6HChYoqp06yKJevMPaI1Cqi
 3oQdyyTg1IjUQFEAADYwEscoxl+s4nSSnnMVHP/HX4EXTOyRpvFUMPdKLkWjQ+uCH8
 ZtQHHiqw0A1aL39Q3X5QawRr9jyKiFxcV/EMtRv+wFhLYYkSmDgjeeR0cpjzxktGLS
 4NeUq4q47LOtSbybChvrmOk2ueTdEshic0wcKL/Iv3u2J6rQ40s1S9hKbmp6LhIlNV
 K6NFy8eehHjxg==
To: buildroot@buildroot.org
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
 <20211109101844.1132067-7-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <7d1554f8-b16a-f21a-47da-c9d29d6016d3@benettiengineering.com>
Date: Tue, 9 Nov 2021 11:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109101844.1132067-7-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfELfsz2s7NS2FYpqyMexlnmxS4wU2TY6GJ6iAO7VgKFuO84lJkfPwgkwp/W47R7uie4C4QF+pdR4CoeJhiPAGXVQg1WDp8fNDC+w2uhedYaMg2YmbOsr
 DEKytecuTwmDrlFilNkV9ubbnTS+nIqv8+y/SHFfTn55/v+h8rsnsq99lGZBM6zf/cqqvTTFj8WMKBkflghdWPMbVreLDza2Foh9E4hCmI297meu7YNRcqxd
 wvD3j3rfQXNunMcmsje4+MuriI5F0+AkYP8HFu61brXp9Nbrvl9YZTwFQBbq1lqp+uYyeJAxEOePH6l0KAqKFTStmtAuz5+bmIdsa8I0TYXQ8laL1o3Wrjdl
 8qv4IuHH2fHnDDnZKWl+5vmgpJgymI3koFkzSUGpq6veVjcPWF54+ptV0OvQATtll57sQ8d+OumDVWWcL0mZ8LZeI4/ttfV6Gr6dm+PirX8uykJpUhhtvWyo
 eKG5B89GQy0cQhebfE9ka78CzmexzGsGYdLt+EMYH3oi9LtQszciK7GncuM=
Subject: Re: [Buildroot] [PATCH v2 6/9]
 board/kontron/pitx-imx8m/genimage.cfg: fix option suffix
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
Cc: Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry, I've forgotten,

On 11/9/21 11:18 AM, Giulio Benetti wrote:
> Option 'offset = 4k' must be 'offset = 4K'.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Acked-by: Heiko Thiery <heiko.thiery@gmail.com>

---
V1->V2:
* reworded 'option = 4K' to 'offset = 4K' as suggested by Heiko Thiery
> ---
>   board/kontron/pitx-imx8m/genimage.cfg | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
> index c335b0c026..c78ef0f910 100644
> --- a/board/kontron/pitx-imx8m/genimage.cfg
> +++ b/board/kontron/pitx-imx8m/genimage.cfg
> @@ -5,7 +5,7 @@ image sdcard.img {
>   	partition imx-boot {
>   		in-partition-table = "no"
>   		image = "imx8-boot-sd.bin"
> -		offset = 33k
> +		offset = 33K
>   	}
>   
>   	partition rootfs {
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
