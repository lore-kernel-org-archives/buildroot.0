Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCA2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05AE683E7E;
	Sat, 12 Feb 2022 13:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUqbOF3Fp4NY; Sat, 12 Feb 2022 13:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3833C83E50;
	Sat, 12 Feb 2022 13:51:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73DE81BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ECC941DED
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xik4QGz5ye_g for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E2A341DEF
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:51:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a8so28278971ejc.8
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wx6qhqNckemc0IiAhh3cJP5/Qv+x0EwlnA6g6pTr07A=;
 b=h9wyIxXiZ+O+zocue8CuEdZzJl5Ol90q3QxvzVJ5c/sI4YsfM+/1GcKGrDkQsZdDzP
 ZzoAKPGB7NASN5zSavwhC1OlpU5BYiy7vQdUx/YUbBW9sA+2o/EGVLvWCCvKJrPZ1GKD
 gHyal0XfbPNPSPeqKbeta3F6dAoJglHy4U78nHSF7wD5aeD4Dm+qTduNiY6mwtLBEVPw
 ptQrlXYT4FPYbR7eSjoimzWOfVW/kSiDac45HVDXSe1ddX/JCiiMH4iZTuRz7PKY/B1o
 nFr8/WqtUThUJQMZWwJuIFM7l4IZTsWagnCQfuHZk0htRlSGtOEsC6GYdVj7dgt2qVTM
 sFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wx6qhqNckemc0IiAhh3cJP5/Qv+x0EwlnA6g6pTr07A=;
 b=d5xK8hSH2L64+oRNFoQdMa8W9VS2QiemXTWRkXcWgWrotiJJ7uuRtfM7Uy8L1hsGJC
 g4nvREw6onUDUr+cr5AOMkowth5zFOyNbZ3DfqGKfJtOfSVtFS0+OCnDadGSRhmHlosX
 Lb3LduzxAEXJ13h2zKBBjjvb0okpetxCmFeYvM4hpn8ngizmUglNzcvAaOYMsgtKpEAC
 PY396M6HE3VUOVP7vDZhIpGyoAjHdXf3MHbsKUI0X8r1460ltTz1Qr8jSIwRQgGL33GN
 dTY3wwTn6mNOnJBUK0PphGkTpvoaJkNXR5p7cLTYQ9p/57EDCpUTJaHglKjzXmRnBUTb
 Ku0g==
X-Gm-Message-State: AOAM530OwT06WSvbwg3k01+1jsSoLua7utE5QHzI+yt1oayTSEJ+vR6R
 4bEAW8lzwzvWIPpZkXGqwgAirQ==
X-Google-Smtp-Source: ABdhPJyBfo2k/hsGUfcc8zwDxGoEIHhIZpr3R/dPx8ImrLgVvfedr8N5lDupByEoyt1qZQvdzux5Ow==
X-Received: by 2002:a17:906:4d5a:: with SMTP id
 b26mr3146970ejv.309.1644673858684; 
 Sat, 12 Feb 2022 05:50:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j19sm8767153ejm.111.2022.02.12.05.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:50:57 -0800 (PST)
Message-ID: <2bda4de0-2931-d25d-9b2b-91390a363143@mind.be>
Date: Sat, 12 Feb 2022 14:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
References: <20220117080616.10563-1-heiko.thiery@gmail.com>
 <20220122151130.59ae7148@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220122151130.59ae7148@windsurf>
Subject: Re: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/01/2022 15:11, Thomas Petazzoni wrote:
> On Mon, 17 Jan 2022 09:06:16 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ---
>>   board/kontron/pitx-imx8m/boot.cmd      | 8 --------
>>   board/kontron/pitx-imx8m/extlinux.conf | 4 ++++
>>   board/kontron/pitx-imx8m/genimage.cfg  | 5 +++--
>>   board/kontron/pitx-imx8m/post-build.sh | 7 +++++--
>>   board/kontron/pitx-imx8m/post-image.sh | 2 +-
>>   configs/kontron_pitx_imx8m_defconfig   | 3 +--
>>   6 files changed, 14 insertions(+), 15 deletions(-)
>>   delete mode 100644 board/kontron/pitx-imx8m/boot.cmd
>>   create mode 100644 board/kontron/pitx-imx8m/extlinux.conf
> 
> I have applied, but I am a bit worried about things are going on with
> this switch to extlinux.conf.
> 
> Indeed, we have:
> 
>   * Platforms where the UUID is hardcoded into genimage.cfg and
>     extlinux.conf, such as board/beaglev/
> 
>   * We have platforms where a "uuid" variable in filled in U-Boot before
>     triggering the extlinux.conf logic, and therefore extlinux.conf uses
>     root=PARTUUID=${uuid}. For example
>     board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf,
>     board/orangepi/orangepi-zero/boot.cmd,
>     board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf,
>     board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf,
>     and a few others.
> 
>   * We now have platforms (kontron/smarc-sal28 and kontron/pitx-imx8m)
>     where a random UUID is generated in the post-build script, and used
>     in genimage and extlinux.conf.
> 
> I'm not sure where we want to go, and how much we want to enforce "best
> practices" that are common on all platforms, or just let each platform
> do its little business.

  It's like the preference we have for extlinux.conf in an ext4 filesystem: we 
prefer it over FAT, but it's not a really hard requirement, and we're definitely 
not going to update existing defconfigs unless an actual developer with the 
board tests them.

  Between all of those options, I think the randomly generated UUID is probably 
the best one. Well, actually, the automatic filling in by U-Boot is the best one 
but not all boards support that I guess.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
