Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4861C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9314025D;
	Mon, 24 Jan 2022 08:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXqUCGa9bbGh; Mon, 24 Jan 2022 08:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 673394015C;
	Mon, 24 Jan 2022 08:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A84E1BF2AA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 765B3826C8
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Yk0mdwpwInE for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71F6382695
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:09:44 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id 19so9622096vkl.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 00:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wq/VgEsiP0CZoyFxRzH3iMsYMMeyj0Z5RrKchAriWbM=;
 b=Fky86wZQ3h6Amx8TkIbqwqb8f6p/LZkyfMR4LJFehqiI4hnGbYVrW9FdxqWXsFRwFc
 4TlYRlOZmIML0b/e6W3kXfw0H884uPC2LdpLo7g/Q9Nmh7TK4U1HM+bcsjpJ3AaHmdVz
 GlXYWXCXsuZTynpziU0kj8grGZEPsRhML+Xy+1rSOz1qjy63mplRQo3X0wP6Olb3XNPe
 bn7q3q7s3xUgyQbNCOdrNZc10HWmrG8aKVVIK8qbN7/EZhSjJ29GuFh9taJBRrAf/Ily
 xqniGeYgc5G8yYXD+fr/wjzR2pCBTevrsxmIvw/q2frcFfaQ+jXtB5KMNwiCWRFVrTrj
 tjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wq/VgEsiP0CZoyFxRzH3iMsYMMeyj0Z5RrKchAriWbM=;
 b=xy5dhtMmU8mhA17Dg2eNYtDHuQ+nZcJxexXOJma1T1nDlnQqYi4uAftkl7ZmLTU9fn
 BatO3fhHDfcvuWYGk46DkIFhPsX/L+9IqEAxYnHQdcOlWnVazFfYXBVWFK51YUWMPj9N
 fF0gAL63+Jr61mO7kwgtgf6QEdj4zH6fWimbvethPMwGQ5IL5SDZvbwn4/yIx2tAY1bi
 LGiZ7EHXJ29p5jREf9pvOl9cOwihbSuPdsDjsP7LBi/vs7ulk+akYxAlwhqOu9UbobHM
 msLNFEOXKsSIP3Y/k0slCaV1zkdQUuNK3ndQBGaIQTVWG6NsmHIAvm8Fl+Cpygu29I2I
 8sBg==
X-Gm-Message-State: AOAM531DciSXgFkWyfyCRdXTF9FHat+0bXYbcC9ZRSCf9tsu1wq4Zdm/
 Y4hPVRcJDMkisKtOCCvHBkJj7EdqcSbnFA==
X-Google-Smtp-Source: ABdhPJytYi3kSvUCDCgYzxHrs4TtZcdiDuP5/yCjxuowEHa6qzWeZzXbe4RxR7LoNpeWphAE8mKPFA==
X-Received: by 2002:a05:6122:130c:: with SMTP id
 e12mr496282vkp.41.1643011782822; 
 Mon, 24 Jan 2022 00:09:42 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id d19sm20075vsh.18.2022.01.24.00.09.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 00:09:42 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id m90so29449932uam.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 00:09:42 -0800 (PST)
X-Received: by 2002:a67:fb82:: with SMTP id n2mr4705065vsr.4.1643011781797;
 Mon, 24 Jan 2022 00:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20220124071143.15869-1-christian@paral.in>
In-Reply-To: <20220124071143.15869-1-christian@paral.in>
Date: Mon, 24 Jan 2022 00:09:30 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oDpxOW0mapqNmfuBVJAbB1XTZ+DFHqANcQzY_G_sux7g@mail.gmail.com>
Message-ID: <CA+h8R2oDpxOW0mapqNmfuBVJAbB1XTZ+DFHqANcQzY_G_sux7g@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version
 2021.04
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Sun, Jan 23, 2022 at 11:11 PM Christian Stewart <christian@paral.in> wrote:
> --- a/package/batman-adv/batman-adv.hash
> +++ b/package/batman-adv/batman-adv.hash
> @@ -1,7 +1,7 @@
>  # From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.1/batman-adv-2021.1.tar.gz.sha1
> -sha1  27a0dc7cb74b868bc0ab52794ecedd0448f0fb61  batman-adv-2021.1.tar.gz
> +sha1  80a3e4d763b6bf35db6e561ed9d6775dc874d7c6  batman-adv-2021.4.tar.gz

... comment should read:

# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.4/batman-adv-2021.4.tar.gz.sha1

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
