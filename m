Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67C4C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 815674035A;
	Sat,  8 Jan 2022 15:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TFuSmbfEbRO; Sat,  8 Jan 2022 15:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C847F4030C;
	Sat,  8 Jan 2022 15:13:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2FD1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 691D66076C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzNkJje0ltTj for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:13:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7662C60B36
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:13:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q8so17092234wra.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h9qYXAS2/asyJin9YvxxmZM3FUGFtReS8JNQUCxV9x8=;
 b=ANPOTW7k+vwQlLIxhcGyBmxjFEc1yl5jIM1nFccjY7sYzd8pb1wXAvdUDy61xy1XbN
 Vtg2hF1uHAOZlQp8cedfkhWgtpFfEA3Prd2KSto20A96CvJc4h6pDcbM9mTRvS0noi3l
 mUGz+Wl5VoTqPsZJef1iQg4nRjxlhOk6XYOHg88yWPrAPek6NCsQ7In18GlA0Mxy8Ijp
 pqfY7vvi2d2tZPd4vTIc0VemWYZw/vC5UnZJfG5V50P6mKwVuwNP1mM6LNw+RqXAwAGK
 SONJ/QRB1n3DaAVF1MGHR3tzIKrme3eESYuMdK4RGZGoCMz56DZ1W0qFzXCWp7so/6uK
 KgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h9qYXAS2/asyJin9YvxxmZM3FUGFtReS8JNQUCxV9x8=;
 b=HoEe+NhxiVsC6+oNIDHPEP6LrJdXeWRX8Rb0xfSn0uqksJTPuIs4M2v6HjQLFwZ+I1
 b9yGfOPfr5TOzQnednqXRuTfnEECuWkt+I0SvMt/SD8+A+lZnRYGREMm99G/QbyKYYny
 crHZgKnjAoaBFmTfWi+0vNX/28G6/zICtKjbBvrSH+j1bdQvIEdH7Hx8+4Ucz2bcMerf
 E4l9lhdBRmn7ukEbCK7ymq3VL35YijY7VqYfwq43DgIqjyglbQDqNtcs1NYwzsckrOK9
 788UKYDPY4i7H0LqaNEWtvYuWeBw41tFJW4t6lGI4cOxF9gd77tee5xwJKrX2PnEbDHM
 AFjQ==
X-Gm-Message-State: AOAM533cB/Wg7lcQ4XmSd8w5l5ISzxwkr1TK8h2lZubYrNxLDZxHfJ0Y
 ZFnEpWzNG8OGQvzZuIERizIapg==
X-Google-Smtp-Source: ABdhPJwuf4f7Sp6SjNDKu9qzL4HL+Com9At9jnT497LdqatQyeqKtjTbBof4e2TDUBdJvcuczlmWGg==
X-Received: by 2002:a5d:48c2:: with SMTP id p2mr51550322wrs.543.1641654779818; 
 Sat, 08 Jan 2022 07:12:59 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id y8sm1985309wrd.10.2022.01.08.07.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:12:59 -0800 (PST)
Message-ID: <37ccb64c-8d9b-ae34-1822-ed3aad14a047@mind.be>
Date: Sat, 8 Jan 2022 16:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220108075018.22567-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108075018.22567-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: fix pthread
 detection
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
Cc: Will Newton <will.newton@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 08:50, Bernd Kuhls wrote:
> Fix autobuild failures after bumping the package to 0.9.75 in commit
> 8ec001b467e22904c0a7ec5780d83afd44ad78f3:
> 
> conftest.c:64:26: error: #error "_REENTRANT must be defined"
> 
> Fixes:
> http://autobuild.buildroot.net/results/f76/f7668104dd64a93f0b343ce3ebbe50b12584184d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libmicrohttpd/libmicrohttpd.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index f75178bc0a..344e1443fd 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -12,6 +12,10 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
>   LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
>   LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +LIBMICROHTTPD_CFLAGS += -D_REENTRANT
> +endif
> +
>   LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
>   
>   ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
