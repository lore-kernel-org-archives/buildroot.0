Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE99ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 19:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC162843A8;
	Fri, 16 Sep 2022 19:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC162843A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ1qMBGJJPpm; Fri, 16 Sep 2022 19:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 003768432C;
	Fri, 16 Sep 2022 19:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 003768432C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 923881BF5B5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 19:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B01440217
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 19:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B01440217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpK1HUpQKDpu for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 19:04:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E9C40180
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9E9C40180
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 19:04:30 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZGdZoV1bFy85RZGdZon1DR; Fri, 16 Sep 2022 21:04:29 +0200
Message-ID: <b6a33131-022e-9306-294d-a3d65e2dea65@benettiengineering.com>
Date: Fri, 16 Sep 2022 21:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: buildroot@buildroot.org
References: <20220916185137.462176-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220916185137.462176-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfCnC0OIQqVvfkL9v9fpNebt7u1WDRPQgIsApvcX0gfyLZ/OJirp9PXUPeujsRHlTrGfjmpPPSrUKwjDDq9IqL3TeRcdgDMkFdYR8Ggqjyc88ghB0eeIT
 LVEQkyotFqkYumTuAKfWyOJju2D9NB2kVg8YrSGwrw3dtH4jdgoMb7CY49j61XFeIjFlwhDKZ2iZkl4W2xk9wHDQK5hD5SYaO9Ec8ZTKc6idbchmwxFpTnoF
 IbRJ36jhVQan0CtXQw0lo6AqO2+KQEVP4XxhzIBaeI8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663355069; bh=K7puivz7SXBFRc5Hr3+PbtDNF8PQb1PlyTNs7zLrz6Q=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ln+h11cQeQ7Z7xH1V84P5lE/ICiqgZtLizFwMtsWFzEmMQGk7WrJXSZ/RfyhqoFKe
 2y7wjWXZaItlxGOvKG6oQQIgA437MF5ItgUYtx6rcZPEgfn1+GJ2KY61QQYAFnu7Iw
 ds3GJwZYNVK1qXzULsfqg6m2ZiN2LYXJ7MT41/W4wVK181AMWhsXzjbgWn4QuG05CR
 CZNEKb0DB7IZ93i00PDcCWiVaOQy+EoYzmbYA9cBgk/Uv8SPDGLurigJ6JzhzcZ+F3
 41HNCcmWT1TpLSFEXkRVPZghRyB1VIoPv02Q5Pmmmz5nc8Uil6GBgnYOLuMAgLPD+Z
 LmdaS+bdUYDbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ln+h11cQ
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds/rtl8723ds: fix build
 failure due to missing Linux CONFIG_MMC
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Subject has a typo, it must be:
package/rtl8723ds: fix build failure due to missing Linux CONFIG_MMC

Can you please reword it while committing?

Thanks in advance
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 16/09/22 20:51, Giulio Benetti wrote:
> This Wi-Fi module has an SDIO interface so we need to make sure Linux has
> CONFIG_MMC(that include SDIO APIs) enabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1bb/1bb71019b7edd7f195223a85c81f70e5a60518f0/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8723ds/rtl8723ds.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index da25ffe9a7..8598f906a9 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -17,6 +17,7 @@ define RTL8723DS_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
>   endef
>   
>   $(eval $(kernel-module))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
