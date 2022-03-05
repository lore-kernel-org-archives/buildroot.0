Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC4DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0679E60B86;
	Sat,  5 Mar 2022 14:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9a9TkCLOW-sx; Sat,  5 Mar 2022 14:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EC5B60AE5;
	Sat,  5 Mar 2022 14:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7E7E1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 972A760AE5
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIYKs4SKjHxA for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC861606E7
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:50:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id dr20so23115380ejc.6
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BNTUQdgcD6V0pZkuoNB+a2mUFRGHLMIaDWPfGU2pyyE=;
 b=hWKR1FfFd90ApdpTCKaX7rNC5nYMUvJ0YYiOBD9DKOnzKG76+Xeh/lwiNAuE9TiE2u
 hwu8Q2cskOgUnXUnNjNK3qpkB2yqh1ToZ1n6az+UZ2W1qU1X/20KO3rvDUwdig9U7onP
 d7dzG3sd8bna6hldcyPrUTDe5qJuBB3pX76I5cDhg+2EdueA9GdgdCt2iy12+iBQ/Kxg
 DAb2elwOR/q08qUOWjfmbgwpmpzIRMqdwKsVEgqP/NkjFTfWGs0qx/Sj+OoBJV6MbCEn
 B04KEjN4LpPwPyZdh/5lPk+LhXLeS8vj1MoVB2YODlmLLzIA44JCVDOE1QLOVOARp5E8
 w4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BNTUQdgcD6V0pZkuoNB+a2mUFRGHLMIaDWPfGU2pyyE=;
 b=IOW/UwauHhtz2JHpNOJnLi0GNsNnGm+rFp3jYwFdUVdwvU5VomUfQ0xDgeSqsHKjdj
 khBDS7HxKEtM4rzIBxpMphG0hAIFbNDjDCnbBsDwyYStckjv/bkK7yezzzx0tV/zQ251
 lqSVfANB+XLXpZImNa559MoBcHc/GAwdqqaE8dGdH9wfoI/GylPvdH4/DqUwfp4GU4JH
 seUfAz3aYMzLhFwLwDeTlcMlQfcUTVox6pg/QbaklN+PDxNk89GXdO7z2cgwRDIKmeUa
 IJzlf1tJkLR49w0S6SImE7flPgNtl8RYEANv81JFGZfnnmb1uIJbONHkX1Y/5La29VJv
 RI1g==
X-Gm-Message-State: AOAM530LR9uvTQMSZsrPF5cixLxz0O+pPZlLxbO0UTOuJJjKJh+MUcsF
 Dfot5JMewd5xk6KvfHq8ked5Xw==
X-Google-Smtp-Source: ABdhPJzlqKlcL9iFX41IxbXuNEBIPBWyBNogL6DEQqEkFVNrgz8rd3wZ+h1jsKLpZaFiIWxWDiM4xQ==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr2965774ejn.437.1646491813034; 
 Sat, 05 Mar 2022 06:50:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 dm11-20020a170907948b00b006cf488e72e3sm2927707ejc.25.2022.03.05.06.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:50:12 -0800 (PST)
Message-ID: <03a17198-1047-f356-908e-358a2936f899@mind.be>
Date: Sat, 5 Mar 2022 15:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220214102829.156331-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214102829.156331-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/python-cryptography: needs cargo
 env when downloading
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



On 14/02/2022 11:28, Yann E. MORIN wrote:
> python-cryptography is a python package, but it internally builds a rust
> crate. As such, it needs to be vendored at install time.
> 
> Currently, we only pass the path to the sub-directory where the rust
> source is in the package tree, but calling cargo needs additional
> variables, most notably it needs CARGO_HOME to be set in the
> environment, otherwise it ends up writing in the user's own cargo home,
> which is by default ~/.cargo/
> 
> We do not really know what variables are used at vendor tie, so we pass
> the full Cargo environment, that we pass when building target packages.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Asaf Kahlon <asafka7@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cryptography/python-cryptography.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index e642691bc5..a524f729c8 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -24,6 +24,7 @@ PYTHON_CRYPTOGRAPHY_ENV = \
>   PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
>   PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
>   PYTHON_CRYPTOGRAPHY_DL_ENV = \
> +	$(PKG_CARGO_ENV) \
>   	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
