Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D009C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 11:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70CC0813FA;
	Mon, 27 Dec 2021 11:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFWhNt0WBiAP; Mon, 27 Dec 2021 11:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F43813F4;
	Mon, 27 Dec 2021 11:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB901BF4DA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 11:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77B06402CA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 11:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7pg4gb6qAsq for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 11:20:40 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE99D4028D
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 11:20:39 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1nwcnLdSCLDgd1nwcnGCR7; Mon, 27 Dec 2021 12:13:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640603614; bh=kO9gPJ3DIuJN2DPsolrMIzQtJFZShn6ql+wOJ5ut8xc=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=f83LHLRX/cGCwxqzkq8yotas8SIaRKfYGqYKHVu2gFRWYx2VNWTslrUUeBqw6F3Lq
 kzSb4F0cVkM9RHliv4M6UrBtNL65oHQV9Y4iBSeXj1QRQQ5gujnBM/0JBiA3AEPf0C
 e7ALJo4ROLTpipkGUh1LLPW/b2hGb7jT+H2lcxBeWivW5Yr1Fx11pyROVDHWOum3ru
 gCGSkxu+gQspjflOdPVJCQxs/h0mRdwq7xxZPbTsMTi3YmzH1kqbREhj0wCn76rcJ8
 lXBKjBCBgekcFvYz3lNkPTlnOkkXMTqm7SY8/vfBSeybKh7eycsfVXX+Jr6Ze0doPc
 rtZFg1B/VKr8g==
To: Michael Walle <michael@walle.cc>, buildroot@buildroot.org
References: <20211227105550.916883-1-michael@walle.cc>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f6c053dc-cf4b-82ac-25b2-ec4a3ccaa7fa@benettiengineering.com>
Date: Mon, 27 Dec 2021 12:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227105550.916883-1-michael@walle.cc>
Content-Language: en-US
X-CMAE-Envelope: MS4wfLZ6J24YsnZTwBtzSSEbfnBU3frUN4UrZRFbf2Jr0PLPXOYqlkdDEwOXuM33x/EWR7PEnS4gFUhoPtxm4xxTRzEUsfYozsbvvJ+x9oZCVctqObXUZCa7
 t2xfPZ/FMNB5rFsBeS2NKKevFfyzYNurmXgZR5wc2VboqB0ICkxv5xcXx8JKCjuMgE7mRytKmtQTGMW4/GWGaa8yI+JqsFhS0VX6jJJBRrZ9U3Y9hYFlM27C
Subject: Re: [Buildroot] [PATCH] configs/kontron_smarc_sal28: move gpt
 between rcw and bootloader
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

Hi Michael, All,

On 27/12/21 11:55, Michael Walle wrote:
> genimage v15 complains about the GPT overlapping with the RCW. Move it
> to offset 16k which is between the rcw (which isn't expected to grow
> much more) and the bootloader.
> 
> This will fix the following error:
> ERROR: hdimage(sdcard-emmc.img): partition [GPT array] (offset 0x400, size 0x4000) overlaps previous partition rcw (offset 0x1000, size 0x580)
> ERROR: hdimage(sdcard-emmc.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
> 
> Please note, that this patch applies on top of
> https://lore.kernel.org/buildroot/20211219142035.6220-2-peter@korsgaard.com/
> 
>   board/kontron/smarc-sal28/genimage.cfg | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
> index 0ad020b347..c885cd51a6 100644
> --- a/board/kontron/smarc-sal28/genimage.cfg
> +++ b/board/kontron/smarc-sal28/genimage.cfg
> @@ -1,6 +1,7 @@
>   image sdcard-emmc.img {
>   	hdimage {
>   		partition-table-type = "gpt"
> +		gpt-location = 16K
>   	}
>   
>   	partition rcw {
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
