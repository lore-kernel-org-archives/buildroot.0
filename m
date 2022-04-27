Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795DFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2923040621;
	Wed, 27 Apr 2022 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGEUnAvksCfF; Wed, 27 Apr 2022 19:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D0E04036A;
	Wed, 27 Apr 2022 19:37:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B999C1BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B62944036A
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUflm3AiQ-fk for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:37:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACC90400BA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:37:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b24so3104751edu.10
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lxkvD//yDSc5gQ1knPVtZHljuZJOF4bUqLHXoRRLZtw=;
 b=FgpWhyZ3TSx9RHzx80R9kKA8jwzorR7yHr141POsN1GptLph83P8JP/imJD8AyrqXL
 Fuu3GQe6tBl7SsFytCXOGN5XjwJh0RA1ZbBr74JURCZ0QHNKpt2AwBshcM2gQq3GsTpZ
 miteO9h3hGdg6fFJYtuRoqBGBJeLbFKxmETlg5YqTjGL/MmF5w8B/0+N8jLhVPWTRtW2
 GkHRlxc9wr8EswdbmKi9WOwXXNu3FZFaw5tv4olK1uY4b22kKL0Lez+20/Gj+dpkAgOX
 XSeumrRu8XnrhYoOKyfZ6irY/bJtVmjS/CMAZF1SwCJAD6GHgXBJEg/ul5LR5ZYMYEHF
 xypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lxkvD//yDSc5gQ1knPVtZHljuZJOF4bUqLHXoRRLZtw=;
 b=3ycrTdE7JBOjVUTRUsnUSRNG7Onrohw05TAGPY1pwUNSu8AECZpzN+6OHE+p02vtd+
 I/8JMldJBpEasfG0spcr4Bcqw3O6k/XMWYA4O/Pp6LW6EvtTAJ1v8kcg1I2rWU3dBdo6
 Ev0WZJwBNbzOoXbj2vfi4C6Hjr5DOJ0psGGzTkLgtmZBdOEfgUs9NOOaW3U1+8G03p2f
 Q668hddSewiwW1g396u8zCfYtNmo0yt1ZaFMzyIR+CwQcg7GiCUilwEU4TRQSz+nd/71
 2FmLCh4y2G23L6af2RNzzfKhD1Z/DWjAiakNDYkGM5umjow6t8ng8O4YGip9ICViP/6g
 QoDA==
X-Gm-Message-State: AOAM530MFUW6oCrAVIlFkNRx3HC94oMRaA8JLPAVJKcGW5M3Ks018Tuo
 Xo14Lz3EprZA9Lnep7GlrdkL5A==
X-Google-Smtp-Source: ABdhPJzKWxjmK1pidC78ltb5KIIzLUFFNN4Wf20W+Q8+en/Dpb0Hsur1xOQVmGwv7/gHvqs9ch7HDw==
X-Received: by 2002:a05:6402:11cd:b0:425:ee49:58cb with SMTP id
 j13-20020a05640211cd00b00425ee4958cbmr16607465edw.157.1651088265930; 
 Wed, 27 Apr 2022 12:37:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a1709064b0e00b006f3867ebe45sm5372964eju.123.2022.04.27.12.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:37:45 -0700 (PDT)
Message-ID: <1e8d6af8-43e0-2c26-e77d-a72a044b24cb@mind.be>
Date: Wed, 27 Apr 2022 21:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220427035556.1814178-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427035556.1814178-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix unsafe openssl
 header path
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 05:55, James Hilliard wrote:
> Explicitely set the openssl path so that python3 doesn't search host
> header paths for target openssl headers.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/c27/c27fe795e079350dd1c9af45be417d41b55e57c3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python3/python3.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 3a334fb28d..7f3b7cc8a5 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -103,6 +103,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
>   PYTHON3_DEPENDENCIES += openssl
> +PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
>   else
>   PYTHON3_CONF_OPTS += --disable-openssl
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
