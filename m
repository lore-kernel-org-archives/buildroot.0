Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40931C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABF6840650;
	Wed,  1 Jun 2022 19:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-l32uKYwNkH; Wed,  1 Jun 2022 19:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E4C3405BB;
	Wed,  1 Jun 2022 19:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B30061BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EB9341836
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9Vs8B2-AAQG for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:15:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ECAD4182A
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:15:55 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2e0a41009so3979709fac.6
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BRr3fwe6IPQr0r+13weYLYhyFfmz2iRySwn8nYtXMN0=;
 b=OSDv1BzCO1h3SMHNScQulzNLu0Hg2Mgwlo8iVBghSXNnFJvftIpLEjvCLQsPJ/FJfe
 TVRb9g+Xb6m+ta7TIFQz9desiIeWkZcsomsuWERukevyn9Jc2iO3y6bY/SlanfoHx7Ri
 ItswWSRn03gd0SLK/O9cPLGXAzYmwL5j8OiJLvp2lViMRg8HoEKyiiEdqDflK+wavySM
 Kq80v4M8xfz7xTwH3F175fJ7veEwyaNApKeKgyInplBEboNzzSjUKZ7m68GoMXFT0YIu
 opv6rA8W38TEkU4XuoPYb9SN9vEXbZMOHOLlSTeo6U1bja8DUWmHoGH1ZrRG7KZ012ZJ
 /GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BRr3fwe6IPQr0r+13weYLYhyFfmz2iRySwn8nYtXMN0=;
 b=z10lF/g6YfjeSvPVDuw97gGXLVRzizQrF6+AmrJl3TCyka0wLBZyinBI5AsusOYvfC
 vY8vJT+Lezddsp1THJfO8QCCTrGgwbBae9LdzQHjkX0fGTmJupFAXt+y1u6M+aRbopa6
 uXTHNKzmJp06uBFiI7ilItrRAdAzU+9pP7RhiPsjry2kBCZP/fSPsazXRenvB6P5x17t
 YsXrit51qQhdy4Z2f61Koet8wp1h6JhbYHIrL/ll25BbiYOZ3JFp4z4q60M1RGBmYZ+t
 1HhGfhRw2b84IhwTeRS7OTQsh7b3BSVbbGWQGXMZVUKWf13ZBFM6UE4zkdA2QMBTCM4j
 EKsw==
X-Gm-Message-State: AOAM53172340IZEheoTTU70IFme54SlswNH1H34dkyFF2SAQ41PDnCLw
 jf4S1JHlwr9LEOrHe3qSQ6h+K7xTnyzPHTG/TArzLloRj/c=
X-Google-Smtp-Source: ABdhPJyV4PSJC/FnZqESUxZYi4syJ1hci6Vo2euFjX7w51qOt2fwtoanvg34E7m5Lyoramijw+26opAHhVVv2QvTfyE=
X-Received: by 2002:a05:6870:4184:b0:f1:97d2:6696 with SMTP id
 y4-20020a056870418400b000f197d26696mr648569oac.148.1654110954122; Wed, 01 Jun
 2022 12:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220531190702.107175-1-fontaine.fabrice@gmail.com>
 <20220601142718.45c24583@windsurf>
In-Reply-To: <20220601142718.45c24583@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 1 Jun 2022 21:13:21 +0200
Message-ID: <CAPi7W81C49Pd2Ampfy+wRYG4eQzno80cKfRPfjPh4uaphSUR-A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix
 BR2_SHARED_STATIC_LIBS
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgbWVyLiAxIGp1aW4gMjAyMiDDoCAxNDoyNywgVGhvbWFzIFBldGF6
em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGVsbG8g
RmFicmljZSwKPgo+IE9uIFR1ZSwgMzEgTWF5IDIwMjIgMjE6MDc6MDIgKzAyMDAKPiBGYWJyaWNl
IEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IC0tc3Rh
dGljIGlzIGFkZGVkIHRvIHBrZy1jb25maWcgY2FsbCB3aXRoIEJSMl9TSEFSRURfU1RBVElDX0xJ
QlMKCkkgbWFkZSBhIHR5cG8gaGVyZTogLS1zdGF0aWMgaXMgKk5PVCogYWRkZWQgdG8gcGtnLWNv
bmZpZyBjYWxsIHdpdGgKQlIyX1NIQVJFRF9TVEFUSUNfTElCUyAuLi4KCj4gPiByZXN1bHRpbmcg
aW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGggb3BlbnNzbCBvciBsaWJjdXJsOgo+
ID4KPiA+IGNvbmZpZ3VyZToxMzEzMjogL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5j
ZS02L291dHB1dC0xL2hvc3QvYmluL29yMWstYnVpbGRyb290LWxpbnV4LWdudS1nY2MgLW8gY29u
ZnRlc3QgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9P
RkZTRVRfQklUUz02NCAgLU9mYXN0IC1nMCAgLUkvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2lu
c3RhbmNlLTYvb3V0cHV0LTEvaG9zdC9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91
c3IvaW5jbHVkZSAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9G
SUxFX09GRlNFVF9CSVRTPTY0IC1yZHluYW1pYyAgLXN0YXRpYyAtTC9ob21lL2F1dG9idWlsZC9h
dXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9ob3N0L29yMWstYnVpbGRyb290LWxpbnV4LWdu
dS9zeXNyb290L3Vzci9saWIgY29uZnRlc3QuYyAtbHNzbCAtbGNyeXB0byAtbG0gICA+JjUKPiA+
IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9ob3N0L2xpYi9n
Y2Mvb3Ixay1idWlsZHJvb3QtbGludXgtZ251LzEwLjMuMC8uLi8uLi8uLi8uLi9vcjFrLWJ1aWxk
cm9vdC1saW51eC1nbnUvYmluL2xkOiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNl
LTYvb3V0cHV0LTEvaG9zdC9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvbGli
L2xpYmNyeXB0by5hKGRzb19kbGZjbi5vKTogaW4gZnVuY3Rpb24gYGRsZmNuX2dsb2JhbGxvb2t1
cCc6Cj4gPiBkc29fZGxmY24uYzooLnRleHQrMHgyYyk6IHdhcm5pbmc6IFVzaW5nICdkbG9wZW4n
IGluIHN0YXRpY2FsbHkgbGlua2VkIGFwcGxpY2F0aW9ucyByZXF1aXJlcyBhdCBydW50aW1lIHRo
ZSBzaGFyZWQgbGlicmFyaWVzIGZyb20gdGhlIGdsaWJjIHZlcnNpb24gdXNlZCBmb3IgbGlua2lu
Zwo+ID4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS02L291dHB1dC0xL2hvc3Qv
bGliL2djYy9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4uL29yMWst
YnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5z
dGFuY2UtNi9vdXRwdXQtMS9ob3N0L29yMWstYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vz
ci9saWIvbGliY3J5cHRvLmEoYl9hZGRyLm8pOiBpbiBmdW5jdGlvbiBgQklPX2xvb2t1cF9leCc6
Cj4gPiBiX2FkZHIuYzooLnRleHQrMHgxMTI4KTogd2FybmluZzogVXNpbmcgJ2dldGFkZHJpbmZv
JyBpbiBzdGF0aWNhbGx5IGxpbmtlZCBhcHBsaWNhdGlvbnMgcmVxdWlyZXMgYXQgcnVudGltZSB0
aGUgc2hhcmVkIGxpYnJhcmllcyBmcm9tIHRoZSBnbGliYyB2ZXJzaW9uIHVzZWQgZm9yIGxpbmtp
bmcKPiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9ob3N0
L2xpYi9nY2Mvb3Ixay1idWlsZHJvb3QtbGludXgtZ251LzEwLjMuMC8uLi8uLi8uLi8uLi9vcjFr
LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2lu
c3RhbmNlLTYvb3V0cHV0LTEvaG9zdC9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91
c3IvbGliL2xpYmNyeXB0by5hKGJfc29jay5vKTogaW4gZnVuY3Rpb24gYEJJT19nZXRob3N0Ynlu
YW1lJzoKPiA+IGJfc29jay5jOigudGV4dCsweDkwKTogd2FybmluZzogVXNpbmcgJ2dldGhvc3Ri
eW5hbWUnIGluIHN0YXRpY2FsbHkgbGlua2VkIGFwcGxpY2F0aW9ucyByZXF1aXJlcyBhdCBydW50
aW1lIHRoZSBzaGFyZWQgbGlicmFyaWVzIGZyb20gdGhlIGdsaWJjIHZlcnNpb24gdXNlZCBmb3Ig
bGlua2luZwo+ID4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS02L291dHB1dC0x
L2hvc3QvbGliL2djYy9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4u
L29yMWstYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IC90bXAvY2NlV0hqRGkubzogaW4gZnVu
Y3Rpb24gYG1haW4nOgo+ID4gY29uZnRlc3QuYzooLnRleHQuc3RhcnR1cCsweDgpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBTU0xfY29ubmVjdCcKPgo+IFdoeSBpcyB0aGlzIGVycm9yIG9jY3Vy
cmluZyBpbiB0aGUgZmlyc3QgcGxhY2U/IGNvbmZ0ZXN0LmMgaGFzIGEgbWFpbigpCj4gZnVuY3Rp
b24gY2FsbGluZyBTU0xfY29ubmVjdCgpLCBhbmQgdGhlIGdjYyBjb21tYW5kIGxpbmUgaW5jbHVk
ZXMgLWxzc2wKPiAtbGNyeXB0by4gU28gd2h5IGlzIGdjYyBmYWlsaW5nIGhlcmU/CgpJJ20gdW5h
YmxlIHRvIHJlcHJvZHVjZSB0aGlzIGJ1aWxkIGZhaWx1cmUgd2l0aCBvcGVuc3NsIGFuZCBjdXJy
ZW50Cm1hc3Rlci4gU28sIGluZGVlZCwgdGhlcmUgaXMgc29tZXRoaW5nIGZpc2h5LgpJbnN0ZWFk
LCBJIGdvdCBhIGJ1aWxkIGZhaWx1cmUgd2l0aCBvcGVubGRhcCBbMV0gYXMgemFiYml4IHdyb25n
bHkKYXNzdW1lcyB0aGF0IGdudXRscyBtdXN0IGJlIGF2YWlsYWJsZSBbMl0gKHdoaWNoIEkgYWdy
ZWUgaXMgdW5yZWxhdGVkCnRvIHRoaXMgYnVpbGQgZmFpbHVyZSkuCkhvd2V2ZXIsIElmIEkgZGlz
YWJsZSBvcGVubGRhcCwgemFiYml4IGZhaWxzIHRvIGJ1aWxkIHdpdGggbGliY3VybCBbM10KYmVj
YXVzZSBjdXJsLWNvbmZpZyB3aWxsIG5vdCByZXRyaWV2ZSBpZG4yIGRlcGVuZGVuY2llcyBzdWNo
IGFzCi1sdW5pc3RyaW5nLiBjdXJsIGRvZXNuJ3QgcmV0cmlldmUgdGhlbSBiZWNhdXNlIHBrZy1j
b25maWcgaXMgbm90CmNhbGxlZCB3aXRoIC0tc3RhdGljIHBhcmFtZXRlci4KCkFub3RoZXIgc29s
dXRpb24gd291bGQgYmUgdG8gZHJvcCB0aGUgQlIyX1NIQVJFRF9TVEFUSUNfTElCUyBvcHRpb24g
YXMKc3VnZ2VzdGVkIGJ5IEFybm91dCBbNF0uCkRvIHlvdSB0aGluayB0aGF0IHRoaXMgc29sdXRp
b24gd291bGQgYmUgYmV0dGVyPwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS96YWJiaXgvemFiYml4
L2Jsb2IvYTM4YjFjZWNkOTc2MDE3YzkzYTdhMmQ1YzBmNWZkOTAzYzNkNjViYS9tNC9sZGFwLm00
I0wxMjIKWzJdIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2RjMC9kYzA4
YzRiZTRiZDJjMGYwMmJjNzBiOWIwYjhkYTkxZTljZWZhODZiLy96YWJiaXgtNS40LjkvY29uZmln
LmxvZwpbM10gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzlmLzM5ZmFj
ZTM1YTYxNmM5ZDc3MmVkY2QzY2UxYjdiNzVlNjJjMGVjZWMvemFiYml4LTUuNC45L2NvbmZpZy5s
b2cKWzRdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjAyMjA0MTYyMTEzMjMuMzIwMDY2OS0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLwoK
Pgo+ID4gKyMgV2l0aCBCUjJfU0hBUkVEX1NUQVRJQ19MSUJTPXksIHRoZSBnZW5lcmljIGluZnJh
c3RydWN0dXJlIGFkZHMKPiA+ICsjIC0tc3RhdGljIHdoZW4gY2FsbGluZyBwa2ctY29uZmlnIHJl
c3VsdGluZyBpbiBhIGJ1aWxkIGZhaWx1cmUgd2l0aAo+ID4gKyMgbGliY3VybCBvciBvcGVuc3Ns
LiBBZGRpbmcgLS1kaXNhYmxlLXN0YXRpYyByZXZlcnRzIHRoaXMKPgo+IFRoaXMgc2VlbXMgdG8g
cGFwZXIgb3ZlciB0aGUgcmVhbCBwcm9ibGVtLCBidXQgbm90IHRvIGJlIGFuIGFjdHVhbCBmaXgu
Cj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
