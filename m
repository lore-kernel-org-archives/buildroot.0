Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07EFC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8804340010;
	Fri,  7 Jan 2022 21:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOsucGBbqg69; Fri,  7 Jan 2022 21:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE21A424C0;
	Fri,  7 Jan 2022 21:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9061BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A4DA813D1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljBUFe-edxCB for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:49:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7888D813D0
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 21:49:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s1so13520648wra.6
 for <buildroot@busybox.net>; Fri, 07 Jan 2022 13:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NKmNnunqEzHZ9BszxnCOuslRAeeAexZkRKEQev2YI8I=;
 b=IHsiXjDn4V3DAFFG2fLs7JPppjfaHhH8Z5/MX++znnXCNlp9S/xZB+c99sviMuE1Mq
 NO0zeIWKWhj/tYkYNIwcp7GEDdbYUU2OxCryUEDV96MV/p4jaEfhjl011qQNn39lfWbS
 HWqFWZxvIW8/mYGQZESOlKEwHBcmHw82u3zozpSQu/MOPvcCeYlXePHm6U+gqqt0DkhU
 RqwaEsvwI7uRl0egAQ5BeNs6Msj39crS6YEpcqqqlKCpK1NoQWlzQXK9+qGJcve8PK8b
 /Y5Swj2Ql58C/EEq5GhGtoi9sYheeW+R3unYVrI+NAIqlZ9bGS5ZHla2bzRpBQOPV1FG
 CzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NKmNnunqEzHZ9BszxnCOuslRAeeAexZkRKEQev2YI8I=;
 b=Bc80ESCPEhZnWuHPkfpKO010Bey4eBc9NsXMQSg0imdMcR3TYx5qbx5vP3LgJimUzm
 9N1I2MxRW4o9FszSAZcQXNoWPGqZZy8fuwwV7lz1ISopZCqHCC/EcrZ5LhcNEoq3Hzx9
 dWm4J8/osSoBb28Ca5mW8C4n8gqC0keFAA8cce2Lm8aPZhH7EoXJL6/waGJ/d/1VxwjQ
 kQoNywIEp2Je7MQthq8saVzGFe3Qi/+9mE+8aRIp/xLrvRvv9nYmNkdNpMRTYZFfxSH1
 GA1BvXiJ5yUl87TaQzS9mTvYMSQJA5bHdVPF723fPiLUZE9rg47fuunuCn0x7qruy9mB
 yLrw==
X-Gm-Message-State: AOAM53099TNGcmtyu2cXFOCbpcTO+apDDftYdSGIqdzf2qMKxDb2KpcU
 9T11Le1ZD5hC3c4VWDRWtv49EA==
X-Google-Smtp-Source: ABdhPJz7nFlkQsSrpBCdKaBgqMNQ5XMKGbEidMDbICbO3u9flt8IIgHimnMGS/DPbjVqrUefIQoiow==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr56225338wri.590.1641592149538; 
 Fri, 07 Jan 2022 13:49:09 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g8sm5229484wmh.17.2022.01.07.13.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:49:09 -0800 (PST)
Message-ID: <7605fae5-42db-115c-e87a-0dbc3597a99a@mind.be>
Date: Fri, 7 Jan 2022 22:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer>
 <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/01/2022 09:24, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/12/2021 23:57, Yann E. MORIN wrote:
> 
>> So I think we really, really need a package (like scipy) that actually
>> makes use of pybind, so we can see how it works, and to fix it...
> 
> Jfyi, there are two relatively simple packages in buildroot that can use pybind: 
> kmsxx and rwmem. Both use meson for building.
> 
> I can test the next version of this series with those packages.

  I tried to do that. Unfortunately, it turns out that both of those packages 
use the CMake way of finding the pybind11 dependency, and apparently our 
cross-compilation.conf doesn't support cmake yet... So it's not that trivial.

  I merged the pybind stuff but wasn't able to test the cmake handling, so it's 
even possible that that is broken as well...

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
