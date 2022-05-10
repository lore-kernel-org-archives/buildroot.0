Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F19C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9B1417C3;
	Tue, 10 May 2022 19:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBhDmY8Y4kQj; Tue, 10 May 2022 19:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E94416C3;
	Tue, 10 May 2022 19:45:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D34CB1BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D092D82F13
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72gK_bgNfCf0 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A08D82AF8
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:45:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id m20so34981894ejj.10
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UMf3AO8g4I+eMD5eoLd4NotnwBpUQnQvfOv7KMgCOws=;
 b=h+NH+8tpNmG1evtzFR/s/V5ZmAVZ/hIuG0fd5Oa9tpkPdlJu077I2ZNhjR5iGTh1F9
 hlwdYdFa+hPBjiYRpfPMsbJvzbNDcctdXOVZR+ZP7ishKoztt8r7MzdcIPmoLyck/2n3
 7DolrwLUiXS8qPkdkFKx+oEsIQQ79/dySEoYP3LciQXg7wOtFSxyJAn7p/N1tC5qQ7QJ
 iv4z1DFvaDLLFDiyTIeT8C20W8rCiufU6QymknRBQJq0HkU57XTcB3QBVfzl9KZH/o71
 R2366A2V7gl1mwDHapMkQ4Z5o9FfZ7F3McI6hxptOdbXi1jqqvW8P6IhHGf8J5Yyi34c
 0A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UMf3AO8g4I+eMD5eoLd4NotnwBpUQnQvfOv7KMgCOws=;
 b=6ACo8L6RYCyplzxz/2QmWOSNLligjJI53cZqOtmfwNFKySAjhQzyIVI0smBt9LAV7k
 4nhrKdRjZ4tTTrFfUDidOOu2jiNZm5h0mx0WF5h3gWevrpLqUmKD4Da8PKoVSJyAq9is
 o8Ku1dSA/S9qUFe0JgUpUwWaQsBtQr+z1yokd5q9IVLaIRB0SiitxuTakxaIGNLpfPD7
 ZB+6vChGrT20IN3MDgHL8351EsdnRk62Kp730QHBLplinJOCPneaxl99G+d/rKOyFCnX
 wlyM+Rum9Eo9hJXTtttiiLkUj/ECZ3v+Q1ymBIB8QRtSffkHbFrvui23gsXzBN8+faV9
 xL7w==
X-Gm-Message-State: AOAM530Q5tUCP6YD9GdY4DLVWkNndUsWrqy9F0VuGVtPiOD18g1l/5MK
 K36BkPkHSzNXgyFqDiWCzMWI/w==
X-Google-Smtp-Source: ABdhPJxBikX7wodKVxVMm/5sMSTl3jNh6Si6NPjRWD5lzw+K7cwscDtTVzjzYDiFJTaF4bPEtwstfw==
X-Received: by 2002:a17:907:3da2:b0:6f4:78d8:7c23 with SMTP id
 he34-20020a1709073da200b006f478d87c23mr21484272ejc.233.1652211934382; 
 Tue, 10 May 2022 12:45:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 br23-20020a170906d15700b006f3ef214dd8sm102228ejb.62.2022.05.10.12.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:45:33 -0700 (PDT)
Message-ID: <8b5f69d6-46e5-e567-57e8-6ab2e34354cd@mind.be>
Date: Tue, 10 May 2022 21:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, wbx@openadk.org
References: <YguL6gkGFVEhpb1H@waldemar-brodkorb.de>
 <20220507203256.259115-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220507203256.259115-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/{glibc,
 localedef}: update to 2.35
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2022 22:32, Petr Vorel wrote:
> Hi,
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Tested-by: Petr Vorel <petr.vorel@gmail.com>
> 
> What blocks accepting this?

  It just came at an inopportune time, and later got snowed under.


  Applied to master, thanks. I just changed the localedef.hash file to a symlink 
instead of a copy.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
