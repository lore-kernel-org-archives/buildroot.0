Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7113C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74CA44105F;
	Fri, 29 Jul 2022 16:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CA44105F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKCq0ndoWB1i; Fri, 29 Jul 2022 16:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B697B40C4C;
	Fri, 29 Jul 2022 16:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B697B40C4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0028F1BF3BE
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF79C812F6
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 16:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF79C812F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xW_l-jwPyW1E for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 16:43:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFB18127C
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEFB18127C
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 16:43:45 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HT5Toq5JZPF2eHT5Uo7hnb; Fri, 29 Jul 2022 18:43:44 +0200
Message-ID: <11965ba9-5849-597b-acc2-8264579d10dc@benettiengineering.com>
Date: Fri, 29 Jul 2022 18:43:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: buildroot@buildroot.org
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
 <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfOpcQlZKeG0u44pdTIV1HCjJuXF51+82dsa4OdlnAdWwtqJf409ri8TFJZ3JYkEACoXLl18RjwdcXYIC3FIA87/9ReiqCueaWjIoBXPRtiKW75WVKH3m
 wSjOP9oSqWByRdT+nEUey36NL1layOHBLaaOjxkLB6+rn/LuvcbIRjI3Sg582z7CjH+qwLXAxuu9uq/ZAinf2var4+Rf+ne54TCYCMOMOEk7QT8TMBaLtdMP
 eXTEFMPbZ7PSsjc5yC2JhILIXgg5asEFiK0nd1NMIBi4ujpBDWojtyeQRIKU0YCFPB0RYPtrEWuKRkqGT5tqiSaSrJdTkA+6zYKhV9dAw1puz1QUvHOqAwt/
 yvHt+sRdHnREKaJrGGaftnXByrtpQF9F53WJF+xc+rNjDzsoI90=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659113024; bh=jrwLwhIBWY8c7QxTUIUTdm1Z3WM0NZqQHYB+ZJcVtDk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=h2UKYvz9P4oj7H2Ut6SrSndYsyODETa4O4/OHs624eyqnecwCxmE1ZRRsORJL2kZ4
 cSV8V5U7qOIblOdM3Gnybeini5ygsSEJz6rLo6MdDQkajkURQWtygG5Mg/gWBKZWZz
 bJ5AUZeQKgPRLbb+n/OC/xA6GUuhTXAhg5E8gAL0C5bJTU3Qs5uYNjgCsMqnbhWAR5
 1EWpwZ98BWmEan3NaB+wsEa1on09S5OmvFmGDigtU8p/W8hoI8OR0Lq1vLRKGQw3B1
 Kv0SWS6Er2D09BWjk6r6c5m1/YFO1t25ENzywSnL+MNYTkPEZN9oBy5iFAFHmc/OPh
 CgETPoFZAO2uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=h2UKYvz9
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/Config.in: update gcc bug
 99410
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
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/07/22 18:24, Giulio Benetti wrote:
> Gcc bug 99410 reappeared while building with gcc 11.x and while testing it
> also shows up with gcc 12.x, so let's enable this bug for all gcc versions
> except gcc 8.x.
> 
> Fixes:
> autobuild.buildroot.net/results/64e/64e54ef5ba3a3dee391b788315615d57a1dd9fa2/

Sorry, I've forgotten http://

-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   toolchain/Config.in | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 722bdb2de0..a71a0db83b 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -186,12 +186,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>   
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
>   # Error: branch offset out of range on Nios II. This bug
> -# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
> -# fixed on gcc 11.x.
> +# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
> +# on gcc 12.x
>   config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
>   	bool
> -	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
> +		     BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> +		     BR2_TOOLCHAIN_GCC_AT_LEAST_12
>   	depends on BR2_nios2
>   
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
