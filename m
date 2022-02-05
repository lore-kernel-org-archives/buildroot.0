Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10867C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B351160AA0;
	Sat,  5 Feb 2022 23:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E17I8ImbYJY2; Sat,  5 Feb 2022 23:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 021FA6079D;
	Sat,  5 Feb 2022 23:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCBBA1BF863
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC7D68186E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQHK1nOBpVu5 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62D728186A
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:50:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a28so19782303lfl.7
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 15:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nOIKRY6A86XeLhyNpKU94qxfAmNp82ghun03+ylWouo=;
 b=RB10IeNK3mMlN87X+A7KVLjoOB7PYMgPAePBINFTQmmWpessSIVSG6jPP5R0+mMeJZ
 yneJ0Fq9O8/ZVmj5G9hH7ZMC6ltIIL04CVn7V/jfGf9/+QItrxSseL4NN8q1vRQT6/FW
 B44OVM5gT1WmkW33RQDVsXhd/FBSkzgdvL50c88i9nuzkU0dnN0a7Cp/09AuC0D3IX8y
 1q7+PgmqRyUSA8sTR3mq3JxMrUFNpVJrNAplJVsMEKhB4ozwhvelbjyc9SSx0TpTzFGM
 Lrb3oQYVu9mfwl9XczD3+FiSApVQU/BXai9OHRi9oMEZM2GCEt4QgnBRMrgIKr422GQz
 HObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nOIKRY6A86XeLhyNpKU94qxfAmNp82ghun03+ylWouo=;
 b=2ShWHWEHL77mDrGs9vKgPEf61UWKAR1x0a8IyVuEjnKPzTZl4WvKAEtgFSUk5UtO8w
 MCzF/zW0PrZ99+Z3kJtlcRWl6nHNMmAkUSf1qk+t44+E8d+nAxEBg2rATLr1A+HKT2Il
 BDFvW6wWo7vE+/zayH6Q8GvvRu9mH2F1sbfBT2++ptzEXbcfr7Oh1obgVXXevUcIszq/
 aGDpOKMnYJ101vJ81Cx/lkwkBkU9VURtaAkh6QksweJz7MoBMsKsOJ76sRheGdjX0TDT
 hMI3OeorWJszPhBnNydSLc7JcihstLILrPoJ2A6PTRCuwMuOSJpEqUq++TktViRrJOCY
 GUqQ==
X-Gm-Message-State: AOAM530ZfUjtvsuLJu3YHoIDSBXh+ZJzBG5jufCSBiwOYNlVrozbcWBu
 kj+YcS6Rxj4wW7zGrHJkJ/qn74dSV0Y=
X-Google-Smtp-Source: ABdhPJz6cbTff/h0KxdCXWZ84Nu4xiIQzPf6YWGHoxbE9yuHVitRcID/IEAQvbpdq2WCAsOKwS5fyA==
X-Received: by 2002:a05:6512:3e9:: with SMTP id
 n9mr3846989lfq.452.1644105041455; 
 Sat, 05 Feb 2022 15:50:41 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id i18sm899441ljg.107.2022.02.05.15.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:50:41 -0800 (PST)
Message-ID: <7d81f185-699c-9fc4-f392-07b332ce8184@gmail.com>
Date: Sun, 6 Feb 2022 02:50:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220205232918.27091-1-kuzminov.sergey81@gmail.com>
 <583B80CF-6F5A-4E96-BAF6-FC019E12868E@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <583B80CF-6F5A-4E96-BAF6-FC019E12868E@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v3] configs/orangepi_zero_defconfig: switch
 to extlinux
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

MDYuMDIuMjAyMiAwMjozNCwgR2l1bGlvIEJlbmV0dGk6Cj4+IElsIGdpb3JubyA2IGZlYiAyMDIy
LCBhbGxlIG9yZSAwMDoyOSwgU2VyZ2V5IEt1em1pbm92PGt1em1pbm92LnNlcmdleTgxQGdtYWls
LmNvbT4gIGhhIHNjcml0dG86Cj4+Cj4+IO+7v0NoYW5nZXM6Cj4+ICogRXhjbHVkZSBGQVQgcGFy
dGl0aW9uLCBpdCBpcyBubyBsb25nZXIgbmVlZGVkIGZvciBVLUJvb3QuCj4+ICogU3dpdGNoIHRo
ZSByb290ZnMgcGFydGl0aW9uIGZyb20gTUJSIHRvIEdQVCBmb3IgcGFydGl0aW9uLXV1aWQgdG8g
d29yay4KPj4gKiBTd2l0Y2ggdG8gZXh0bGludXgsIHRoaXMgaXMgY29udmVuaWVudCBmb3IgZGVi
dWdnaW5nLgo+PiAqIENyZWF0ZSBjb21tb24gc2NlbmFyaW9zIGZvciBtdWx0aXBsZSBib2FyZHMg
dG8gY3JlYXRlIGFuIFNEIGltYWdlOiBib2FyZC9vcmFuZ2VwaS9jb21tb24uCj4+ICogQWRkIEJS
Ml9UQVJHRVRfR0VORVJJQ19SRU1PVU5UX1JPT1RGU19SVz15LCByZW1vdW50IHJvb3QgZmlsZXN5
c3RlbSByZWFkLXdyaXRlIGR1cmluZyBib290Lgo+IFlvdXIgU29CIGdvZXMgaGVyZSBhbG9uZyBt
eSBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5KG9uZSBwZXIgbGluZSkgSeKAmXZlIGdpdmVuIHlv
dSBvbiBWMS4KPiAKPj4gLS0tCj4+IFYxLT5WMjoKPj4gKiBpbXByb3ZlZCBjb21taXQgbG9nCj4+
ICogcmVtb3ZlZCBjb21tZW50ZWQgbGluZSBpbiBleHRsaW51eC5jb25mCj4+ICogcmVtb3ZlZCBv
bmUgYm9vdCBvcHRpb24gZnJvbSBleHRsaW51eC5jb25mCj4+Cj4+IFYyLT5WMzoKPj4gKiBpbXBy
b3ZlZCBjb21taXQgbG9nCj4+ICogcmVtb3ZlZCBjb21tZW50IGZyb20gYm9hcmQvb3JhbmdlcGkv
Y29tbW9uL2dlbmltYWdlLmNmZwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS3V6bWlub3Y8
a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPgo+IEFuZCBoZXJlIHlvdSByZW1vdmUgeW91ciBT
b0IgXl5eCj4gCj4gUGxlYXNlIHNlbmQgYSBWNCBwb2ludGluZyB5b3XigJl2ZSBmaXhlZCB5b3Vy
IFNpZ25lZC1vZmYtYnkgcG9zaXRpb24gYW5kIHdl4oCZcmUgZG9uZTotKQoKSSBkb24ndCB1bmRl
cnN0YW5kIGhvdyB0byBkbyB3aGF0IHlvdSBhcmUgYXNraW5nLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
