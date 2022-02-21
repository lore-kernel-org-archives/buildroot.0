Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23EAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D76813CD;
	Mon, 21 Feb 2022 20:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9GrgN_cWiOSa; Mon, 21 Feb 2022 20:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E96981394;
	Mon, 21 Feb 2022 20:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D034E1BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAD39402B1
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sY_UuS-6qqqc for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD42B40296
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:49:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c192so10193957wma.4
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 12:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R+On+xmCT4Q3AhgGV0Fzgqge5sqo7Im8mer4BEWepWc=;
 b=FQ0dodONJtRgivqvGfqyV0HDDXAfNJ1vdbzwm6HqQc6fhmbVUlJd5OkQxw/1KLmN7f
 UAj19PEKwmgV+8IpFK/6I0i6sBRTgJk80tqJpctIWWInBbXD5IbKI1oYG2uyWG5Hi+2g
 2Gn9/uVidsa8BJsDk+X1cPmXCBYDJ91ZTZfYaSivCZaqNELaHVaCi8ktof2knWh4QhYH
 V7Gwq2QQDBuN7zDp1vqxmsaH269vlf0mUxVpHaa3/sbwl1XmhmdP86NZKJs+XfSIgDlc
 Ym2dHwlIjPt7URoyY5nfx5eR6wdzX+rRnKgzclWhvwCREvM9D2UKOWJkqDT8JDeLhQp1
 ukcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R+On+xmCT4Q3AhgGV0Fzgqge5sqo7Im8mer4BEWepWc=;
 b=JqfFXna4RlkPq36d8+KKqPjwUN6n+HZKPUqolBclZ9U3mXqTEw/4QouhwTA71AbtDe
 RreVHl3a4FHkREpgqXQVJ3frPwlH62V48BaEpJR2lq0CTYd/LZmn5kvnFoSWHUZn6Kgp
 x3UfOZ/e2t9VMwZqFWf3G6l5855X34oKhSdHfKS7dP2OV9sISwrlrOC/7J6Owo7x3Ba7
 FAAUehKDhFJW5HmoGppNes6Vrc1cxhmHvcdGnz0hvtzGWTVS5Th2jfv2jv7YZw3H/1Uq
 ivcbF2en9iboVjWB2ufDYLdZ99maXFAcrhggHjo0SlbfXVf6y1QXtGBNF3b9O1WVmLFC
 NIYQ==
X-Gm-Message-State: AOAM5336gDSnrMRiFisGFcbufwh1+tneAozCSniDCXF0WUp6VcHvHkeH
 d5cdhNv6qiYsuuSKwnQtZJo=
X-Google-Smtp-Source: ABdhPJzNy20UNMctja7tpaqjwZMUqlbwIesouj8mXx4jsxgV9g1+Y+hSKKn/2yYV/dfLPkstk0iSzw==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr657657wmj.38.1645476584009; 
 Mon, 21 Feb 2022 12:49:44 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id o12sm1867216wrh.89.2022.02.21.12.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:49:43 -0800 (PST)
Message-ID: <57f6d974-4c01-908a-3895-e64a64ef67f8@gmail.com>
Date: Mon, 21 Feb 2022 21:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org,
 james.hilliard1@gmail.com
References: <20220220211055.1273368-1-peter@korsgaard.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220220211055.1273368-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH]
 support/testing/../sample_python_pyyaml_dec.py: unbreak after move to pyaml
 6.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpMZSAyMC8wMi8yMDIyIMOgIDIyOjEwLCBQZXRlciBLb3JzZ2FhcmQgYSDDqWNy
aXTCoDoKPiBGaXhlcyBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzIwODg2ODQwOTEKPiAKPiBweXRob24gc2FtcGxlX3B5dGhvbl9weXlhbWxfZGVjLnB5
Cj4gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+ICAgRmlsZSAiL3Jvb3Qvc2Ft
cGxlX3B5dGhvbl9weXlhbWxfZGVjLnB5IiwgbGluZSA1LCBpbiA8bW9kdWxlPgo+ICAgICBkYXRh
ID0geWFtbC5sb2FkKHNlcmlhbGl6ZWQpCj4gVHlwZUVycm9yOiBsb2FkKCkgbWlzc2luZyAxIHJl
cXVpcmVkIHBvc2l0aW9uYWwgYXJndW1lbnQ6ICdMb2FkZXInCj4gCj4geWFtbC5sb2FkKCkgcmVx
dWlyZXMgYSBsb2FkZXIgYXJndW1lbnQgc2luY2UgdGhlIG1vdmUgdG8gdmVyc2lvbiA2LjA6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3lhbWwvcHl5YW1sL3B1bGwvNTYxCj4gCj4gVGhlIHRlc3QgZG9l
cyBub3QgbmVlZCB0aGUgZXh0cmEgZnVuY3Rpb25hbGl0eSBvZiBsb2FkKCksIHNvIGluc3RlYWQg
bW92ZSB0bwo+IHRoZSByZWNvbW1lbmRlZCBzYWZlX2xvYWQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpJIGRpZCB0aGUgc2FtZSBj
aGFuZ2Ugd2hpbGUgaW52ZXN0aWdhdGluZyB0aGlzIGlzc3VlIGJlZm9yZSByZXBseWluZyB0bzoK
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjItRmVicnVh
cnkvNjM3NDE0Lmh0bWwKClRlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21h
aWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3B5eWFtbF9kZWMucHkgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3B5eWFtbF9kZWMu
cHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3B5eWFtbF9k
ZWMucHkKPiBpbmRleCA5YWI4OTMxMTk3Li5iYjkwOTM0ZjI2IDEwMDY0NAo+IC0tLSBhL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fcHl5YW1sX2RlYy5weQo+ICsr
KyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fcHl5YW1sX2Rl
Yy5weQo+IEBAIC0yLDcgKzIsNyBAQCBpbXBvcnQgeWFtbAo+ICAKPiAgd2l0aCBvcGVuKCIvdG1w
L2RhdGEueW1sIiwgInJiIikgYXMgZjoKPiAgICAgIHNlcmlhbGl6ZWQgPSBmLnJlYWQoKQo+IC1k
YXRhID0geWFtbC5sb2FkKHNlcmlhbGl6ZWQpCj4gK2RhdGEgPSB5YW1sLnNhZmVfbG9hZChzZXJp
YWxpemVkKQo+ICBwcmludChkYXRhKQo+ICBhc3NlcnQoZGF0YVsibmFtZSJdID09ICJweXRob24t
cHl5YW1sIikKPiAgYXNzZXJ0KGRhdGFbInZlcnNpb25zIl0gPT0gWyIxIiwgIjIiXSkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
