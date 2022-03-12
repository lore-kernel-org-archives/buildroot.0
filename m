Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D73C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD8E410B4;
	Sat, 12 Mar 2022 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgM8aREeeLUx; Sat, 12 Mar 2022 20:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0659410AF;
	Sat, 12 Mar 2022 20:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFFF1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A111410AF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6_MvK5dyAng for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:17:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8866F410AE
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:17:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g3so14948782edu.1
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O5F4QAWbxF1yJz11XHQwn32hZ32hJOpLF0MpgqFmT2k=;
 b=fbRBVnb1cS9BRv058XxtCU0XSGkoF0dNqgELxnVkrSQ+NnWlxWHo9DqfFAn3xJsqCN
 KOERFyuiyb6xdX51QEodpfltPHEO24kLeywVFw0GyO0Ff/lwGdImjWKYbQvPy+/X6+vN
 OQFuXTiBu8uMk/vvr5qFyhjgC7W8WDeiV7aFaGDRC3pSacs3CRpLZDbk/3kLBiyqpF91
 97w5eMbFd+46lLRKTg/DjWeqoOAqy/xp4wwdufOkQ4a4mW2HjERW9yOD3HQyvpM8dvlZ
 q4TpzuXu2tbnt9y8oacJYUwelAb9vfJ33Axu5464y9Y69OIr7H/rq3NXFgx7y1jETBcM
 igKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O5F4QAWbxF1yJz11XHQwn32hZ32hJOpLF0MpgqFmT2k=;
 b=KjqQX3aJj9Qo3t23C/L45aEjtauaxReaCRdS996UdgEYbGx/qCS8YH3q7ToWo6wiSr
 LUI9662bRjkSuhtoidf2D6X67sMDBVc5ocEMgVfjDIxHf+iYP3d3NefsDR94XZJaUYWz
 rF/PBIoPzDxHyUy82n8Yc/T48+5HB/Rb9sHdtXIXV6zl8S5qviAF/KnJH423hPndn5Do
 iKK14xzvXZUpEr5vwcAa0wvtKTiHHftmwX+ZBYiEpQoWvPypdvKrkQQKG8C0cDsyqsCE
 h/NKJOKsfh56DJdpa7LXFqFOWiF7ptyiw8YQWfcPCzx+nbUM9eUp8szQNr6318OrLn+s
 fOHQ==
X-Gm-Message-State: AOAM5329z2uhIf3SBeaEWCPJAFuLqoMsc+F5MY/2Mtu8Dqh6w98ocOcq
 41pEdaqw4GqDAc354LcstPeR0g==
X-Google-Smtp-Source: ABdhPJyRIoBisU3R9NhxNq3NCGTwZyufmfX7+5K6YsdlIVWe9zxjxs8xvlNX8HjruMEKK68djXXAhg==
X-Received: by 2002:aa7:d390:0:b0:416:16ad:2483 with SMTP id
 x16-20020aa7d390000000b0041616ad2483mr14403667edq.122.1647116219795; 
 Sat, 12 Mar 2022 12:16:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1709061d0300b006da94efcc7esm4618621ejh.204.2022.03.12.12.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:16:59 -0800 (PST)
Message-ID: <b9ca6ee6-51bb-7aef-0b88-ccd1c9373ac7@mind.be>
Date: Sat, 12 Mar 2022 21:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220224152339.442421-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224152339.442421-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/erlang-jiffy: bump version to 1.1.1
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI0LzAyLzIwMjIgMTY6MjMsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
PgoKIMKgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoK
PiAtLS0KPiAgIHBhY2thZ2UvZXJsYW5nLWppZmZ5L2VybGFuZy1qaWZmeS5oYXNoIHwgMiArLQo+
ICAgcGFja2FnZS9lcmxhbmctamlmZnkvZXJsYW5nLWppZmZ5Lm1rICAgfCAyICstCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2VybGFuZy1qaWZmeS9lcmxhbmctamlmZnkuaGFzaCBiL3BhY2thZ2UvZXJs
YW5nLWppZmZ5L2VybGFuZy1qaWZmeS5oYXNoCj4gaW5kZXggOTNjNWUxZjhjOC4uZjE3MmQxNDc2
ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2VybGFuZy1qaWZmeS9lcmxhbmctamlmZnkuaGFzaAo+
ICsrKyBiL3BhY2thZ2UvZXJsYW5nLWppZmZ5L2VybGFuZy1qaWZmeS5oYXNoCj4gQEAgLTEsMyAr
MSwzIEBACj4gICAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hhMjU2ICA0NWMyMjRhZmUwZWEyZDNl
Y2UzOWUyMjdmMDFmNTU4NWFkNTNiOGI5MWQyZDY5MjRmOWY1MDU0ODg3NGFlODc5ICBlcmxhbmct
amlmZnktMS4wLjkudGFyLmd6Cj4gK3NoYTI1NiAgYTk5OTM1MWQ5NTZkM2VkMTBjMzNhNmRkN2U5
NDM1ZTY3NGU1MTliNWI4MmE0NmQ2MDM2MWFmZGI4MzA2MmZkOCAgZXJsYW5nLWppZmZ5LTEuMS4x
LnRhci5nego+ICAgc2hhMjU2ICAwZmE4YWZhZDJmMDJjMDg4NTBhMTZlMzZmZTU1Mzc2ZWUxOTcz
MmIzYTExNmEwMjA3ZjJhNzNjODU3Nzc3YTQ5ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvZXJsYW5nLWppZmZ5L2VybGFuZy1qaWZmeS5tayBiL3BhY2thZ2UvZXJsYW5nLWppZmZ5L2Vy
bGFuZy1qaWZmeS5tawo+IGluZGV4IGNkOTQ2MzI5NjIuLmRlMmU0NzQ5ZmIgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9lcmxhbmctamlmZnkvZXJsYW5nLWppZmZ5Lm1rCj4gKysrIGIvcGFja2FnZS9l
cmxhbmctamlmZnkvZXJsYW5nLWppZmZ5Lm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUVSTEFOR19KSUZGWV9WRVJTSU9OID0gMS4w
LjkKPiArRVJMQU5HX0pJRkZZX1ZFUlNJT04gPSAxLjEuMQo+ICAgRVJMQU5HX0pJRkZZX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLGRhdmlzcCxqaWZmeSwkKEVSTEFOR19KSUZGWV9WRVJTSU9OKSkKPiAg
IEVSTEFOR19KSUZGWV9MSUNFTlNFID0gTUlUIChjb3JlKSwgXAo+ICAgCUJTRC0zLUNsYXVzZSAo
R29vZ2xlIGRvdWJsZSBjb252ZXJzaW9uIGxpYnJhcnkpLCBcCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
