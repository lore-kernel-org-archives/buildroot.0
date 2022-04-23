Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A30C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784C260D50;
	Sat, 23 Apr 2022 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yOOHSFDmUib; Sat, 23 Apr 2022 16:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD49E60BC8;
	Sat, 23 Apr 2022 16:30:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B637C1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A42D0408E1
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7PGq_PcV8o4 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 751D5408D2
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:30:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id w16so580687ejb.13
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CLfpIiGpAnoo8VQlG8ltr1qHRDqe/QxxbgE3L68bCwI=;
 b=ZD+hk4Ck1rtX1Hu33b02RnMJ1z2MDGP6LUgb4c6h5heQlNg10iI1WlImTr08DIW/2D
 oFnVvP2K6TXUmC1zpNXI224vu91n45bTzd6+yHKJbrfS6KZwgdKxkeT2wQPxEuQTRt9o
 iHVLdr29mx51Cg0PG+htCdsa0ckTFqlPQsZLHrgDZKIJA2JjJmp6eksRE4OoxC6zZvJj
 lfW554mWV58H8by5bCt7DKhrtFzNXadwvG47s+PyBjv9OWs2c1FcY5iD1FU5RDz/Oh/H
 8KLuzHvcfyEP/5SaLxp9RKc2lIcDlGvWKpADHestX1yxwDrGsBOdjvbB0eNPphl279dS
 91rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CLfpIiGpAnoo8VQlG8ltr1qHRDqe/QxxbgE3L68bCwI=;
 b=lkzjM84oljZBWeRUB30n2R+Kjzv8HOz5t1SBwUWEeHLqtsxGfVInR1KnYvK/Dru5VK
 JsLamh90BljCJxttL4lGY/9JbL3xzcoJlTgapgfKEFHFg0TSJ/sSgvc2h5VnhDRZeXXl
 c2GH+q/DW1g+mSZK1O3IzjMVuxcPVInHtxQM//zZwJOT4x1wLiTkdMxuw0X6fNqKdvKE
 yeHoHecdtYR2eiatXb6kfq41doZDVbpLDYdEZq/yZfX3i8PP1Su1MtO9n2E3gZ5ALVZC
 E2BlvWbD9Zb9TU9RQsxZnoEFjAerUq8g9wwcSlFNXShJh+8TDh072jGnud/7PTiDLoQb
 lcSA==
X-Gm-Message-State: AOAM532Fzfmrt3/tefw0xbytycvsYWrhnVV5+vulGMIftY2FsWWsJOb6
 Hl0pjsNDv6/kgsIPbVCXwDHvtYG7ct3Qnw==
X-Google-Smtp-Source: ABdhPJww7zC/7OQLIAhPvmo1tkKyETRJ4HhpRsW/R9xtcYill+iiRdFuwgsu0Jd84ZUFDQNjXRtJDg==
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr8971541ejc.285.1650731420746; 
 Sat, 23 Apr 2022 09:30:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 tc3-20020a1709078d0300b006f00345be60sm1743526ejc.22.2022.04.23.09.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:30:20 -0700 (PDT)
Message-ID: <53e35dcc-6ace-0c5d-bd41-b3efbbd94c41@mind.be>
Date: Sat, 23 Apr 2022 18:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20220421102410.3794-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421102410.3794-1-dariobin@libero.it>
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: fix compilation for
 uclibc
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/04/2022 12:24, Dario Binacchi wrote:
> - Add upstream patch ([1]) to fix compilation for uclibc
> 
> - Add autoreconf as the patch touches configure.ac
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=9c9fd9ae24b45f915f0759d32f662835c26d37c3
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

[snip]
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index 52f2a04ffa..a5600a81b8 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -14,6 +14,7 @@ VALGRIND_CONF_OPTS = \
>   	--disable-ubsan \
>   	--without-mpicc
>   VALGRIND_INSTALL_STAGING = YES
> +VALGRIND_AUTORECONF=YES

  You should add a comment above to track why autoreconf is needed.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   
>   # Valgrind must be compiled with no stack protection, so forcefully
>   # pass -fno-stack-protector to override what Buildroot may have in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
