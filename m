Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41D6C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDB76F4D0;
	Thu,  2 Dec 2021 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOOhOQPLzl-C; Thu,  2 Dec 2021 19:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B34736F4CD;
	Thu,  2 Dec 2021 19:55:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69D9B1BF30F
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 653C66F4CD
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcjoeKG3bewu for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 19:55:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B73EF607BC
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 19:55:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 137so665584wma.1
 for <buildroot@buildroot.org>; Thu, 02 Dec 2021 11:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NEDdNOm/CedfcllwGRxhI4CND53VluYnb5IZ5QOsXD0=;
 b=VHwk8RYPjy4zXMrQlVjgGr7lYMYq1UxmizDZ6t86/zpTc6rp+9EUHN4ZUZJAeVVMol
 tuVGgfrAXIgjBYxNp9K8a6fhYu4Mpg80jsOJG7u2Kv4uw1sN3WrPHo9qln3RViLmu0No
 iAXP5hUzn0whOfczMr0cdgGnkhQXWrLAk36exk2JzqQDFMpeI5W0U/798vy2+4dkxw3D
 VmllHDkjm5H91Ljw0bm7VxcmTAhAL7EKTNV30Cn4cDUs4JsoXdfCzQQ38G1sOmKsmlc+
 yso17DhQ9sQ+NXVL7ReH5KLorOeRvOn2wYunUQMtc5voNVxg4QjG4rlc2e26xGMXKD1v
 EPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEDdNOm/CedfcllwGRxhI4CND53VluYnb5IZ5QOsXD0=;
 b=gpszgPM5c59LiTt9dte3/9rIW6sm5eSHqr3r75GbkI/W0zq0o+UIMXvi0irdX/wipt
 shTaMD/kFN3tKR9JfWYyXNgrXF6iV5MKJ9vxdIOTk+3BZ2R2/uhVqWDJ229zc7tntzO6
 Usn+PslP91no5gaE6f/QTpRO/y5Ni6uka65fnt2IZ9DJDV6odUGFeMHFdjYVVoTQpWVV
 e46D5CyceNyyUNgX9QyKTSovW8Asomam4EBeaXauiiti2+PUkIEKrJK0ESc0B0ObKZSU
 3WdX1HreEp3uYQ+fpap2oqC+krYG6In++A7lwvmRFL3yXXZ/hngs8o3bQ0ijlT83mT8+
 Q9cQ==
X-Gm-Message-State: AOAM531uSmj8heAmI+jU0hmB0qYUXap+BjYfCRoDVHkObPIDexdXtd1J
 ocHGWRSPWOJalzwUnnutY0V4JINhMqQ=
X-Google-Smtp-Source: ABdhPJxEdAj2QW1BjCn2HRvAc0bTG9yKMxMwlJDK2tTd1/z7pdaYakXuXs5EIhePTRLLN3W/7dczGw==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr9037577wmp.147.1638474952725; 
 Thu, 02 Dec 2021 11:55:52 -0800 (PST)
Received: from ?IPv6:2a01:cb19:190:c500:edd6:3522:21c:3a62?
 ([2a01:cb19:190:c500:edd6:3522:21c:3a62])
 by smtp.gmail.com with ESMTPSA id d1sm596762wrz.92.2021.12.02.11.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 11:55:52 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
References: <20211128131842.274555-1-texier.pj2@gmail.com>
 <87tuftfw70.fsf@dell.be.48ers.dk>
From: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <173c3a28-f826-5352-5b7d-35b177ac372c@gmail.com>
Date: Thu, 2 Dec 2021 20:55:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87tuftfw70.fsf@dell.be.48ers.dk>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/genimage: bump to version 15
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpMZSAzMC8xMS8yMDIxIMOgIDE3OjI0LCBQZXRlciBLb3JzZ2FhcmQgYSDDqWNy
aXTCoDoKPj4+Pj4+ICJQaWVycmUtSmVhbiIgPT0gUGllcnJlLUplYW4gVGV4aWVyIDx0ZXhpZXIu
cGoyQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+ICAgPiBUaGlzIGluY2x1ZGVzIHRoZSBmb2xsb3dp
bmcgY2hhbmdlczoKPiAKPiBbc25pcF0KPiAKPiBOb3QgZXhhY3RseSB0aGUgbW9zdCB1c2VmdWwg
c3VtbWFyeSB0byByZWFkLCBidXQgT0suIERpZmYnaW5nIHRoZQo+IHJlYWRtZSwgSSBub3RpY2U6
Cj4gCj4gICA+IDFkNzJkODAgaW1hZ2UtaGQ6IHN0cmljdGVyIG9wdGlvbiBoYW5kbGluZwo+IAo+
IFdoaWNoIGludHJvZHVjZXMgYSBwYXJ0aXRpb24tdGFibGUtdHlwZSA9IG5vbmUvbWJyL2dwdC9o
eWJyaWQgYW5kCj4gZGVwcmVjYXRlcyBwYXJ0aXRpb24tdGFibGUsIHdoaWNoIGlzIHVzZWQgYnk6
Cj4gCj4gYm9hcmQvYWx0ZXJhL3NvY3JhdGVzX2N5Y2xvbmU1L2dlbmltYWdlLmNmZwo+IAo+IENh
cmUgdG8gc2VuZCBhIGZvbGxvd3VwIHBhdGNoIHRvIHVwZGF0ZSB0aGF0PyBHaXZlbgo+IAo+ICAg
PiA1YmQ3MjgzIGltYWdlLWhkLmM6IGlnbm9yZSBpbi1wYXJ0aXRpb24tdGFibGUgd2hlbiB0aGUg
aW1hZ2UgaGFzIG5vIHBhcnRpdGlvbiB0YWJsZQo+IAo+IFlvdSBjYW4gcHJlc3VtYWJseSBkcm9w
IHRoZSBleHBsaWNpdCBpbi1wYXJ0aXRpb24tdGFibGUgZnJvbSB0aGF0IGZpbGUKPiBhcyB3ZWxs
Lgo+IAoKU3VyZSwgd2lsbCBzZW5kIGEgcGF0Y2guCgoKVGhhbmtzICEKCi0tClBpZXJyZS1KZWFu
IFRleGllcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
