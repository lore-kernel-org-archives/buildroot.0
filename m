Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62498C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF0A8332A;
	Thu,  6 Jan 2022 21:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFgxaAmBYxen; Thu,  6 Jan 2022 21:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7957783313;
	Thu,  6 Jan 2022 21:39:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEDE1BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 593EC40131
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWHN-BGIpyYS for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:39:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2711B400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:39:48 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id o1so6922331uap.4
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FcERr1wQhMY3vEB09Pdd1yrQip1yb3JRG6HXAYxqpVg=;
 b=CqL7Qgr4ek8fDe8YXaPAb1ACStL2M8DnNtV/TCA1/cL9weA9QFbyCuVEAXalfI7Ti2
 C0MqH5JHIaGg4oI4GgzoFCvLPbqmEDi0XBuCmEzI6yi34XeyPjPni8xh3ZS9I6s1Qz7A
 GSArosY/FybbkmHdYB2fYhvfVb/f6++OkRRZLEIavbdqSZISDJQU0gMzsMHjjjW7Zz3x
 wu1URSrMyE7ekG8omvcKgvgypLPYhlEcDg6EjVn6d/6TTeN4NyWVh/1FezCk7O+2EDir
 HNgEEqeWVx8hVolyOT/XDk1091MQ3ISGjtCuiyQPWwamflUZkrmkj3Py9W1hAdJW27Q9
 Wuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FcERr1wQhMY3vEB09Pdd1yrQip1yb3JRG6HXAYxqpVg=;
 b=zWPpraEgviasAwv2J8vBVMqflZhtCCZJUvLol7hpq0VlU5wyZ7r/3afwgTwDIPVgia
 J1/d4Ycywr5wplOzRHvrQ6Ijn6eY8NCva1y/LaAlYqqEIIcBJb3OXuaPfJdXj0EEmXnJ
 f7YXl2AXCkwH216+QhVPafxwX7QTubFHnwvCK97R7BQQ0mpschaY8swARrZFNs8wLT8P
 IDEWRr3lffEG9QeqKZyCoTc1q5FEExTZ7i3/iHd52svwCHKUjQMhv8RxW82kTlns9XGM
 2tXnaMhS6fDAM2psG3zFMERGcOFMbrm+ebl/gdyrqbCn8XsYuDldkiRcwngVuiJLmsNE
 qN8g==
X-Gm-Message-State: AOAM533BtneMorysng3zh+txhhKsUlP3mQNUE3+FmyD70kUaXZExGyit
 ivtPb44qmx5eIAHtx//QIWXrd9ANriZ4Xg==
X-Google-Smtp-Source: ABdhPJwKVmtpf1kW5XeJeVmyxmtfBOaxrNY5vW5ktcf2h9e6ZYw+jIH7mXEJG8VClRefGVGXYReydQ==
X-Received: by 2002:a05:6102:f12:: with SMTP id
 v18mr18794358vss.21.1641505186683; 
 Thu, 06 Jan 2022 13:39:46 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id j11sm2225126vkd.38.2022.01.06.13.39.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:39:46 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id s144so2549052vkb.8
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:39:46 -0800 (PST)
X-Received: by 2002:a05:6122:c58:: with SMTP id
 i24mr7411137vkr.31.1641505186010; 
 Thu, 06 Jan 2022 13:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20211212090107.2975294-1-christian@paral.in>
In-Reply-To: <20211212090107.2975294-1-christian@paral.in>
Date: Thu, 6 Jan 2022 13:39:35 -0800
X-Gmail-Original-Message-ID: <CA+h8R2o_bHkD2g+mJGsxMbNfDSSiOXj3wn_uhC+90xVeT-ceDA@mail.gmail.com>
Message-ID: <CA+h8R2o_bHkD2g+mJGsxMbNfDSSiOXj3wn_uhC+90xVeT-ceDA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi maintainers, all,

Currently 2021.11.x branch is at version 1.17.3 which is vulnerable to:

 - CVE-2021-44716
 - CVE-2021-44717

Is it currently policy to backport security patches?

Similarly the 2021.02.x LTS branch is at 1.16.10, when the security
fixes landed in 1.16.12.

I've just submitted 1.17.6 to the list and will submit 1.16.12 for
2021.02.x as well.

On Sun, Dec 12, 2021 at 1:01 AM Christian Stewart <christian@paral.in> wrote:
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>  # From https://golang.org/dl/
> -sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
> +sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
>  sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 59177e54db..0d9ceab2bb 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GO_VERSION = 1.17.3
> +GO_VERSION = 1.17.5
>  GO_SITE = https://storage.googleapis.com/golang
>  GO_SOURCE = go$(GO_VERSION).src.tar.gz

Thanks & best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
