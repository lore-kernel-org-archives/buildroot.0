Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DA7C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B92A81167;
	Fri,  2 May 2025 11:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHMdbbuRWeaW; Fri,  2 May 2025 11:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D14980E70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D14980E70;
	Fri,  2 May 2025 11:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 499F9EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3993540E07
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQcqgSHtaDyI for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C1E740D97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C1E740D97
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C1E740D97
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:01:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 947621C0D89; Fri,  2 May 2025 13:01:42 +0200 (CEST)
Message-ID: <b45011f9-106b-48a4-ab2d-2454293b92fd@rnout.be>
Date: Fri, 2 May 2025 13:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
References: <20250422131054.1115455-1-festevam@gmail.com>
 <20250422131054.1115455-2-festevam@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422131054.1115455-2-festevam@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183702; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6npw73HhUwoI7mCsZdMMB0Hrji8k0rP+bezzKN7l5Mk=;
 b=CuwYUr2+PIJLIpcl9LSVX8Rk9GFGt01C3R+wpdqapod8PN5skYtODJVauUrO+OX7R6j7MG
 w+CFHw+MaNLvPKmhYjcphxcJ9hQ2lF5iKR6I8gQO9+MgLqCuZAArEsorR/CQlvwO/cf+cB
 /qiz2g1OnqhUrpNpgeYrkSk3CXuESCv8tD/brrQdhcgd1o1dIm88mKOkCOCnnUcmzxctnM
 /lvRS65xAJ937aHA32/hpqP2chL9BIc65rU4iMOmkSrkr9gu7figahCl9RM6+4o+WE3iHp
 wKa7SB2iEzdu3/4Tf4v6dUeSV5eYoVOeOztRlhE9BtoG6sK2rgScQg0sgeHcQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CuwYUr2+
Subject: Re: [Buildroot] [PATCH 2/2] configs/warp7: Improve Wifi instructions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2025 15:10, Fabio Estevam wrote:
> The "modprobe brcmfmac" command is not necessary because this driver
> is automatically loaded.
> 
> Remove the "iwconfig" line as it is considered deprecated:
> 
> warning: `iwconfig' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
> 
> Remove the "-Dwext" parameter as it is not supported by the default kernel
> configuration:
> 
> wlan0: Unsupported driver 'wext'
> 
> Tested Wifi by following the updated commands.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   board/warp7/readme.txt | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
> index aff7a601e5..39d845bd32 100644
> --- a/board/warp7/readme.txt
> +++ b/board/warp7/readme.txt
> @@ -107,11 +107,9 @@ To boot your newly created system:
>   Using Wifi
>   ==========
>   
> -# modprobe brcmfmac
> -# iwconfig wlan0 essid ACCESSPOINTNAME
>   # wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
>   (enter the wifi password and press enter)
> -# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
> +# wpa_supplicant -iwlan0 -c /etc/wpa.conf &
>   # udhcpc -i wlan0
>   # ping buildroot.org
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
