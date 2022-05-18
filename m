Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E67A41C7A;
	Wed, 18 May 2022 19:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyXPBMkC7WkJ; Wed, 18 May 2022 19:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091B241C7E;
	Wed, 18 May 2022 19:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5451BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9F084309
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRVLhHRw91DX for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6367884307
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:19:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id y7so4180698ejr.13
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=znwhF4khyC3jQ+B1VKhPLv3/X13bsiUBeIW037j74Mo=;
 b=WxPUvaSo3weo+uNDvKqUGmn8sgGdKvyYATotHxX2mv7PRieLlGLHuMfDarnux8RnYK
 lJEYu5fT/fvLxVjH5KeqW2zgBlIPcSJA0AzIKBPxDNWp1ag+K6yq9lkT9r4+R9AMMdnS
 FPfqwdWYpc0YZz0HQBr+pnqEhTdkYS0DesV42zc7MRWGzc5YkHDV6r63sX1Zsk4HEiIo
 ZgvPH5WYQPygRaVX95IEi7b9YOB0L7tR5ivCUT+IUwxg2/531EUwu7c3XwRNS6Qxn0cx
 O0/YAN7Q3zuDR8UHdx7qy7zvTl6p2QdsnWkcXsBRSi2BqfnIeMA8wa4DZyRfW5mBw7uc
 YDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=znwhF4khyC3jQ+B1VKhPLv3/X13bsiUBeIW037j74Mo=;
 b=Q5XTQgOZJreej96Xo1YlNj+zOR5jCvLhuss8tAep1DL0c9uxJETxCeISAasDMbxcJG
 /Md9tsFEH6cIkbiCvlwmEIx2VZSED+tsZB92YNKc32cPdtxE7KV54RwOWJoJ3TyeknK+
 d0KmkkhCfkKov9BF+NJ+aEkoS07GhQeIyyl956hgIs5JU9trqMWGJlGEQxoiKqJZzfNf
 r2CA1s5Zq4XxrP/wU9kfB/+lTy5BuyIikmNBibHC1x6MDa0nv8/G8WX5d5sJh9vx+thj
 XSu1jtJjqj7ISkeatGF5tPM/D643KMFBJqvUZQ+YhxgNqtf+gc3XTwqiYmoqmz7D8sPH
 GHIw==
X-Gm-Message-State: AOAM531hSweOV+cIVLidQDZPj+h8wjHMGYyofZEYMwWZVIz1RvlMGLAz
 afpxqzIXWBoKI9CEiOObm+njjw==
X-Google-Smtp-Source: ABdhPJzqNHB1TvqWFSHi1DmM6biNIa5x0Oj7nr5Vckhuu6JKzrdycBCD1ZglxvFM+Iw6yZfcvFhd0g==
X-Received: by 2002:a17:907:9492:b0:6f4:f618:b575 with SMTP id
 dm18-20020a170907949200b006f4f618b575mr987940ejc.39.1652901594604; 
 Wed, 18 May 2022 12:19:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ml16-20020a170906cc1000b006f3ef214e23sm1249683ejb.137.2022.05.18.12.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:19:54 -0700 (PDT)
Message-ID: <6806041a-f12d-e65c-2228-5e97878c31cc@mind.be>
Date: Wed, 18 May 2022 21:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220518044859.2901762-1-clg@kaod.org>
 <20220518044859.2901762-2-clg@kaod.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220518044859.2901762-2-clg@kaod.org>
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/qemu_ppc64*: downgrade
 binutils to 2.36.1
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wNS8yMDIyIDA2OjQ4LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPiBwcGM2NCBv
ciBwb3dlcm52IExpbnV4IGRlZmNvbmZpZyBmYWlsIHRvIGJ1aWxkIHdpdGggZ2NjIDExIGFuZC9v
cgo+IGJpbnV0aWxzIDIuMzcgWzFdIDoKPiAKPiAgICBDQyAgICAgIGtlcm5lbC9rZXhlY19maWxl
Lm8KPiAgICBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTA6IC50ZXh0LnVubGlrZWx5
Lgo+ICAgIGtlcm5lbC9rZXhlY19maWxlLm86IGZhaWxlZAo+IAo+IFBhdGNoZXMgaGF2ZSBiZWVu
IHNlbnQgdXBzdHJlYW0gYW5kIHNob3VsZCByZWFjaCBMaW51eCA1LjE4LiBVbnRpbAo+IHRoZW4s
IGxpbWl0IGJpbnV0aWxzIHRvIDIuMzYuMSB3aGljaCBkb2Vzbid0IHJhaXNlIHRoZSBpc3N1ZS4K
PiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1ZXMvMzg4Cj4g
Cj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gU2lnbmVkLW9mZi1ieTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KCiAgVGhlIG90aGVyIHBhdGNoIGlzIGZvciBuZXh0IEkgdGhpbmsuCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+IC0tLQo+IAo+ICAgaHR0cHM6Ly9naXRsYWIuY29tL2xlZ29hdGVyL2J1aWxkcm9v
dC8tL3BpcGVsaW5lcy81Mzk1NTkyMDkKPiAgIAo+ICAgY29uZmlncy9xZW11X3BwYzY0X2U1NTAw
X2RlZmNvbmZpZyAgICAgIHwgMSArCj4gICBjb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZj
b25maWcgICAgfCAxICsKPiAgIGNvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZp
ZyB8IDEgKwo+ICAgY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgIHwgMSAr
Cj4gICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9j
b25maWdzL3FlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwYzY0X2U1
NTAwX2RlZmNvbmZpZwo+IGluZGV4IDA4MjVkMGFiOWIzMC4uODQ1OGYyNzM5YTY2IDEwMDY0NAo+
IC0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZjb25maWcKPiArKysgYi9jb25maWdz
L3FlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnCj4gQEAgLTMsNiArMyw3IEBAIEJSMl9wb3dlcnBj
NjQ9eQo+ICAgQlIyX3Bvd2VycGNfZTU1MDA9eQo+ICAgCj4gICAjIFN5c3RlbQo+ICtCUjJfQklO
VVRJTFNfVkVSU0lPTl8yXzM2X1g9eQo+ICAgQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICAgQlIy
X1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eVMwIgo+ICAgCj4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9w
c2VyaWVzX2RlZmNvbmZpZwo+IGluZGV4IGM0NTAxNGYyYWMzZi4uNDgwZWJlYTI5ZDcwIDEwMDY0
NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZwo+ICsrKyBiL2Nv
bmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZwo+IEBAIC0zLDYgKzMsNyBAQCBCUjJf
cG93ZXJwYzY0PXkKPiAgIEJSMl9wb3dlcnBjX3Bvd2VyNz15Cj4gICAKPiAgICMgU3lzdGVtCj4g
K0JSMl9CSU5VVElMU19WRVJTSU9OXzJfMzZfWD15Cj4gICBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAi
Cj4gICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKPiAgIAo+IGRpZmYgLS1n
aXQgYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcgYi9jb25maWdzL3Fl
bXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKPiBpbmRleCA4MjIxNDVlOTI3YTEuLjhkZTRj
ZjUxODliNSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZj
b25maWcKPiArKysgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKPiBA
QCAtMyw2ICszLDcgQEAgQlIyX3Bvd2VycGM2NGxlPXkKPiAgIEJSMl9wb3dlcnBjX3Bvd2VyOD15
Cj4gICAKPiAgICMgU3lzdGVtCj4gK0JSMl9CSU5VVElMU19WRVJTSU9OXzJfMzZfWD15Cj4gICBC
UjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKPiAgIEJSMl9TWVNURU1fREhDUD0i
ZXRoMCIKPiAgIAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3BzZXJpZXNfZGVmY29uZmlnCj4gaW5kZXgg
NWVhYTNlOTUzZjc4Li45OGM2YWZkZjkzOTkgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9xZW11X3Bw
YzY0bGVfcHNlcmllc19kZWZjb25maWcKPiArKysgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2Vy
aWVzX2RlZmNvbmZpZwo+IEBAIC0zLDYgKzMsNyBAQCBCUjJfcG93ZXJwYzY0bGU9eQo+ICAgQlIy
X3Bvd2VycGNfcG93ZXI4PXkKPiAgIAo+ICAgIyBTeXN0ZW0KPiArQlIyX0JJTlVUSUxTX1ZFUlNJ
T05fMl8zNl9YPXkKPiAgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJodmMwIgo+ICAg
QlIyX1NZU1RFTV9ESENQPSJldGgwIgo+ICAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
