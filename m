Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281D5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0F2C41088;
	Thu, 24 Mar 2022 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYpeDg1qAejb; Thu, 24 Mar 2022 21:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 849AA4107E;
	Thu, 24 Mar 2022 21:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B536E1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34264107E
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTpduLcgD9r6 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:44:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7348B401E1
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:44:39 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lr4so3373042ejb.11
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w3PeyLdjOSqPXvUar5W7fO1LOVpF091Y/lg2gYWoi8I=;
 b=Dl2zsjdO78KLsC4lfRiVTppBkiQD3u2K2tpO4EyLoNFQQabaZzkbhc8GsExiMY7sUx
 iRtwQgQEaYpUBZeUyuWeJZcUZk8XBkxTEXctTL03PvjZ30NlmkBXLMHTi+DQgYnvcM5I
 tvksGa39gYn53e+Rth++RBWjpekhEAthHyi1PorMKGLsJ0MK26zYQVKnKAnBxOv2nV+K
 EANG/QrPdqAUI6U9M1HLqfjWghxCiqnmm+h39Mg431MQiH+p2VbRWf2PocQiCY2m3mlU
 iWMrVVvlk78G0zolJ2oSWHaVVFfHlAuxU7iRBAsVGW6m9NECHACDBCyDA0iQf5zc+ln9
 BxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w3PeyLdjOSqPXvUar5W7fO1LOVpF091Y/lg2gYWoi8I=;
 b=KLyeU8xXzDUGeHuvYRwq/4q7TBYHbo3+Pl2dLliRx/4sUcvgMAaDfeFeyzQGtRJR9J
 ZCev+/Dh9v/KA3MMfGAN5Q6+IcB0OIIES0YahRpHbiZAbkTtpFsG525Hm/erDhBU1f73
 Ud9d1L8pgCISho+W3o5lKtCbdhjJwKadLONYUlHTNWmqqOcPlPbHdHl0zt8SakEIPalx
 AGwlFnSFIfp3+Xu+oQ8Kjf4v7MnZ4JBUG+evwnoOqGnFhEDAgic4v/b9NsPZUfBWKR5r
 C2EaZNPPCK8ta7fNfYwBGAEMt3UTeqy7hfF9yPqs1nkjNQpOQ27mkKBQLKfOwbLP4cOm
 NC4Q==
X-Gm-Message-State: AOAM533Ir7YfZkQxWj/F7srqMTn+zOs9u9kfNeOKyHsPBqxwXwQtJJb8
 PvZKknMpHj3vXXXhVz9094cUqA==
X-Google-Smtp-Source: ABdhPJy97y/Wp+PF+p+jrGTTUJRAMrrzgVnAQNyw05ukcMf+0BWdWARjRzEySwHEL97M9OIQw0Nt5w==
X-Received: by 2002:a17:907:7205:b0:6df:b8c9:e68e with SMTP id
 dr5-20020a170907720500b006dfb8c9e68emr7935924ejc.507.1648158277686; 
 Thu, 24 Mar 2022 14:44:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a1709067f8300b006ce051bf215sm1565432ejr.192.2022.03.24.14.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:44:37 -0700 (PDT)
Message-ID: <898e1009-dbc1-9f4b-9cdf-ae3edfb1d299@mind.be>
Date: Thu, 24 Mar 2022 22:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Kyle Harding <kyle@balena.io>, buildroot@buildroot.org
References: <20220317162530.427876-1-kyle@balena.io>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220317162530.427876-1-kyle@balena.io>
Subject: Re: [Buildroot] [PATCH] package/unbound: use system libevent
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
Cc: Stefan Ott <stefan@ott.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2022 17:25, Kyle Harding via buildroot wrote:
> The file descriptor limit when using the builtin mini-event
> cannot handle more than 1024 file descriptors.

  It was already the intention to use the system libevent, so I've extended the 
commit message to clarify that a bit.


  Applied to master, thanks.

  Regards,
  Arnout

> 
> https://unbound.docs.nlnetlabs.nl/en/latest/topics/performance.html?highlight=libevent#using-libevent
> 
> Signed-off-by: Kyle Harding <kyle@balena.io>
> ---
>   package/unbound/unbound.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index 1e6e0d99d7..782ed2b049 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -17,6 +17,7 @@ UNBOUND_CONF_OPTS = \
>   	--with-pidfile=/var/run/unbound.pid \
>   	--with-rootkey-file=/etc/unbound/root.key \
>   	--enable-tfo-server \
> +	--with-libevent=$(STAGING_DIR)/usr \
>   	--with-libexpat=$(STAGING_DIR)/usr \
>   	--with-ssl=$(STAGING_DIR)/usr
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
