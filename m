Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B7EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D445F61502;
	Fri, 10 Dec 2021 19:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ok1YZ-EOMavq; Fri, 10 Dec 2021 19:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2417961501;
	Fri, 10 Dec 2021 19:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 091511BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB84761501
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZ38Vzp0zjJa for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:09:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B211614FD
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:09:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g14so32145522edb.8
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7TLWCWjJ9cTcS/39G/9Kz/1ZRk7gdMNP5+EHQKHDeaE=;
 b=J75j+qyeu7myTLys3bFaMNeeyXhgvRnsKx3G6BIku8VaU+9XOUaZ9kelSYrSYViieA
 06UzNBxu+pubCDsddThvd65RX0+aKJ2u6b8cYA+RH5A9r4Zj+lnVXDOGBdXriINUMmgS
 ZnhqXkZkmMkB4qnCheijM/UDJs+vJtRFtw1HVe7Os6EXwK8HXvC8xjrKg+qkihYJko/5
 3SP4OdSoud22xJaocNXPejrdZYcep9WD3xMiOIvZLcuN+Y8FarIPy+hRGuOtCbuczMn/
 HOkqjwwigO1vHx5aGfz1GbBnVPK26ntKg5UhlswJ+V/wZRssGVtcG+MCaHu1KA2nSp4s
 sH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7TLWCWjJ9cTcS/39G/9Kz/1ZRk7gdMNP5+EHQKHDeaE=;
 b=tcfsYALj9kLsvTGH/xm7RkITCV6pJjwPZuEOE2bQzHw9gWBUFb4sfwLfHvB5w9VEFh
 l0bsVvXutIT2wG/jWsRqzk8VuSiMDUAl6w3J5D18cU/E9n8oTS6syjoirp74/XJ77CwX
 GH/3motb6ddShUE+J9lmeWNzVJPkeNLCnFAbUQB3FayUjPoL+bECgunIjohulhNh4YuE
 RK3oP0fhK1y+dollgzv3S+bt/+1NzX2Ox2TcJNX/CllOj4z7ZYej9GFfHZyyeriDYoP0
 xFsJ8kCE3AGwL/XRbK/BA6ilviKFV+8RmAuk4LGN5HMmp7GeQsv5SiRMm4BTPmKuYQfc
 O9Rw==
X-Gm-Message-State: AOAM533km3DFlZNwC/FbPX+U9U8Kng/L1svW+dT5syZ4hRyoPmHzNBfY
 2x463o596jZvXiIofBjYlJ0xDQ==
X-Google-Smtp-Source: ABdhPJwxUEvFFIsYqXjpMwbijG0u45x4QFwOo+6Yj1v2q+hFDCZ+SNaaTlJWfDGGN1sNpHe9zy/KQg==
X-Received: by 2002:a17:907:a088:: with SMTP id
 hu8mr26506190ejc.234.1639163354332; 
 Fri, 10 Dec 2021 11:09:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id de15sm1873567ejc.70.2021.12.10.11.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:09:13 -0800 (PST)
Message-ID: <dc96f683-275c-d135-6cf7-2e2ce383d982@mind.be>
Date: Fri, 10 Dec 2021 20:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211110175218.1927678-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211110175218.1927678-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/checkpackagelib/lib_mk.py: check
 DEPENDENCIES
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/11/2021 18:52, Fabrice Fontaine wrote:
> Check that {FOO}_DEPENDENCIES are never overriden in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/checkpackagelib/lib_mk.py | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 0278354434..d09922f724 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -88,6 +88,8 @@ class OverriddenVariable(_CheckFunction):
>           r"_SITE\s*=\s*",
>           r"_SOURCE\s*=\s*",
>           r"_VERSION\s*=\s*"])))
> +    FORBIDDEN_OVERRIDDEN = re.compile(r"^[A-Z0-9_]+({})".format("|".join([
> +        r"_DEPENDENCIES\s*=\s*"])))
>   
>       def before(self):
>           self.conditional = 0
> @@ -123,6 +125,10 @@ class OverriddenVariable(_CheckFunction):
>                           .format(self.filename, lineno, variable),
>                           text]
>           else:
> +            if self.FORBIDDEN_OVERRIDDEN.search(text):
> +                return ["{}:{}: conditional override of variable {}"
> +                        .format(self.filename, lineno, variable),
> +                        text]
>               if variable not in self.unconditionally_set:
>                   self.conditionally_set.append(variable)
>                   return
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
