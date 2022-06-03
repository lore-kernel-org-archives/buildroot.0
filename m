Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0691FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 14:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A7641A41;
	Fri,  3 Jun 2022 14:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2M4HFQ38a4IR; Fri,  3 Jun 2022 14:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7197141A22;
	Fri,  3 Jun 2022 14:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 873771BF2F3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73344405E0
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUXOfwyvIm97 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 14:05:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C7FD40519
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 14:05:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id m20so16104593ejj.10
 for <buildroot@buildroot.org>; Fri, 03 Jun 2022 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :references:from:to:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=my8oLNGsd41WXzu3vM4jRY5GfaOCKZGJ5Dl02BK9WJ0=;
 b=EYnyR+bxfgt1SVusHFXzmesvXnU3Tp+mYQqA/5sO+yYfTPoID/9Hzvc/IE2gjVzk7y
 5CwT6UDojbsfR2+F40jYhbJ2ZLE1I9xXAIQPTVMrJkvc+lg3jprM1s7lZUnpcBQziVbV
 qRSBgSUcAWtPi1wiSEkWJDKAIPIW+kKHFundNahwYEPCY7DkMHCZqvolTY1gJra0u7Xc
 itD2eYxUlNLNaA/Kb7/bK54nNtpq4ryM+OoJdnHON8YeMK0ydiCoYLu1XO7Zyx5b9Jo4
 GbYuFhxKGmXGqfKSrEsNQd5VMjs23My7hI5FDVHsyCvSE8akbWHYhEPy5JUeE7tObr8h
 qIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:references:from:to:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=my8oLNGsd41WXzu3vM4jRY5GfaOCKZGJ5Dl02BK9WJ0=;
 b=UtIPlaBkMwhaXFy82KbXBjkcFyEezf1ItRNxcnMi14Hp8Sfk3Lb5jlOwI6VO+ZFm49
 k+i2J0Xeiqzi8JJDyUfHSmndy5dHHj2+is6GAOP6BqGmE9FLQ20ZRGLJQOSKYcTqGNjb
 FsLWtUJElr/GpF21yqR1Lo9g10dS8DHpyqWkSOaoIat7Z23sR1O60NeB082ukcJlPOkM
 aOipQWa2f2RjIljnFmEP2vIZhbO1VeRLfNyTsWOWv7ZcD7Ep2/q27BPKv4y2M1IFwTgw
 /hs2/GNT3VQAIasDnNKJHxngLbBbfR+ZmZGeJsYjZFBPg+qM5iecnxESu/gSjxfUsx7z
 0/lA==
X-Gm-Message-State: AOAM532XEwds3uuYDo2r88yY1DzKxxCYx+oySsaiiF+rXd+EohAAlJ69
 DmYgpGtKhCyt47r6E+Koa9NJGDbIi5nl4g==
X-Google-Smtp-Source: ABdhPJwRCPC+HH9j/yzSoBKeN1W5fQxdcMAR0qHetag6KWL5dtGWnAtvOvP9H+jp/0JorzOTspS2VA==
X-Received: by 2002:a17:907:72d0:b0:6f5:108c:a34 with SMTP id
 du16-20020a17090772d000b006f5108c0a34mr8699006ejc.218.1654265122037; 
 Fri, 03 Jun 2022 07:05:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 p3-20020aa7c4c3000000b0042db87b5ff4sm4025032edr.88.2022.06.03.07.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 07:05:21 -0700 (PDT)
Message-ID: <6478648f-ffb3-cda2-66ad-3758ead25319@mind.be>
Date: Fri, 3 Jun 2022 16:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
References: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
From: Arnout Vandecappelle <arnout@mind.be>
To: Buildroot Mailing List <buildroot@buildroot.org>
Organization: Essensium/Mind
In-Reply-To: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
X-Forwarded-Message-Id: <e123582d-c613-f81a-ac0d-b23bc4d3e74a@cartal.fr>
Subject: [Buildroot] Make 4.3 and printvars
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
Cc: Jean-Pierre Cartal <jean-pierre@cartal.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Sending this in name of Jean-Pierre, who is not on the list.

> Hello,
> 
> A quick mail to let you know that I also faced the make 4.3 printvars issue you mentioned in Buildroot mailing list.
> 
> On my side increasing the stack size limit as follow:
> 
> ulimit -s 16000
> 
> solved this issue.
> 
> Regards.


  I tested it myself and indeed, it works!

  It would be great if someone could hack this into the Makefile itself (so that 
it recurses if ulimit -s is not high enough) and revert 25cec5ea733251.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
