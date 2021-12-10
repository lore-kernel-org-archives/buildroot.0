Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 18:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9171541297;
	Fri, 10 Dec 2021 18:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0h3-TN-abD4i; Fri, 10 Dec 2021 18:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6D6041294;
	Fri, 10 Dec 2021 18:15:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22DFE1BF2B7
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 18:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F804852AD
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 18:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyeC60kJ7jFy for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 18:15:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29CE0852A9
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 18:15:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r11so31926120edd.9
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 10:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7W1REqtH/JgDNUcpRAhGxzY4Ct9UO03V0dyxppl+8gY=;
 b=YAFyWYcBlkMB3cfmZvrAA4He3EkJPKGkYfOgLG30MrD1oeDfrQq1yJUt+lmSPyAhXG
 z84Iu+Htk8NzC6Au2BFH7CrnQBZg0w3UhqpNY7dTC4xUfjaGIxozkTZ70xbOGOYBPKjz
 /5KIUIRgFS4OYhY1hE+rQEx7Vf0k80F7dtdHGdgVzUzDkTMqT4SZarTQx0WcE3it7ptA
 Lu6PrA13h8kh6UtHKSTVsdMKMddnMwcJkgrN0UDmNT6mM9O4wrCFkjCTbb7QsP4T1uBy
 wj5G5pkJAILHsEY4GWuQ9c547pu340CZHjbw1tbGQ/TB6g+C9HH2R98+B4wsVWwWHjeJ
 CAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7W1REqtH/JgDNUcpRAhGxzY4Ct9UO03V0dyxppl+8gY=;
 b=BppFoYMR2b5tAVzMKfRzMmLR/6D1yPodntYGfpTqOrkT+sNJIu35WbL4FdVmr+Wae7
 77ZVtebWSErlYdP6iPq+DNGrvaP3L2hH1jXQTxW9q/gAWRyKfWQMWDxCJzw3NWl+H0HS
 foYR236qCZvo8tIZhgF2XWilPl0fsaJmhpcG+kGy62/MXf4bWaFNq6PyHBW1nehdix9L
 8Oswg1N86RhYLSKlGRIKEWf7temKPJ7lH2vY9tQdq7qofaCBpU1BnKMyjhZJlaQNBql1
 0HE0Po8EjMtGJfLAnD2n6BxsOeTH1rB8FmD7pd9/80Tsa0251CPeap+gSMhtzRa2JnW9
 a2cw==
X-Gm-Message-State: AOAM531SibNNw58kwv6Edys7/QwArlryASBtw/5fhkDqoWV7DHU2RRXr
 EsmGdHBK7iz2FAdDbK+5QsulDeMLjbnOgA==
X-Google-Smtp-Source: ABdhPJxRaJICkiNMDyRjQVdcpyXJBP2N7lwOXl0iyyml7nyosXX2iTu2YAQ98998Eav+x7pTegzkMA==
X-Received: by 2002:aa7:c415:: with SMTP id j21mr39945791edq.289.1639160125332; 
 Fri, 10 Dec 2021 10:15:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m6sm1783306edc.36.2021.12.10.10.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:15:24 -0800 (PST)
Message-ID: <c2931bcc-68eb-e00e-5fc1-a67357c853b1@mind.be>
Date: Fri, 10 Dec 2021 19:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
 <179763b9-2a53-2ed4-49cf-9ba0fc903831@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <179763b9-2a53-2ed4-49cf-9ba0fc903831@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMi8yMDIxIDE1OjQ4LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBKb3PDqSwK
PiAKPiBPbiAxMC8xMi8yMSAxNToxMiwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPj4gVGhpcyBw
YXRjaCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIG1pbmlqYWlsLgo+IAo+IFJld29yZCAiVGhpcyBw
YXRjaCBhZGQgcGFja2FnZSBtaW5pamFpbCIKCiAgQWN0dWFsbHksIG5vLiBGb3Igc29tZXRoaW5n
IHRoaXMgc2ltcGxlLCBpdCdzIGJldHRlciB0byBsZWF2ZSB0aGUgYm9keSBlbXB0eSAKKGkuZS4g
anVzdCB0aGUgU29CKSwgYmVjYXVzZSB0aGUgc3ViamVjdCBzYXlzIGl0IGFsbCBhbHJlYWR5LgoK
ICBSZWdhcmRzLAogIEFybm91dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
