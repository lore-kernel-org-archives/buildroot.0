Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6F8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82EF3417BF;
	Thu, 16 Dec 2021 18:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjwYUEdKi4jp; Thu, 16 Dec 2021 18:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBBE1417B6;
	Thu, 16 Dec 2021 18:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12CBA1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 714D541674
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdIJlsOynqIQ for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:57:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD4BD417AC
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:57:15 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r11so89553962edd.9
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=HMlhbbFvz3avKAUQo583J5WPo+qrHUxbKlOgVhpSbGk=;
 b=JYdheRZ9S0CdCpLC+3g7reshQ4cWTsBeRDPLZP+tWSL3t7EMjDPZwAJzMs1PM0RPyL
 Hg+WN3XuQQ/EE371/zBQh3My4CfT5NDDmmY8d2zjWbHrrL47ybfyldT06J26pFIPX4d3
 cVJfwiM0o39IW4Py3hgf0JlubNW70Wzks3ypMMvBGw8XE8A17FtPz7SDsBf/XXxFjAgf
 DhpchZcNOFbeaPjsBSkrk7lJnBHQhaKdXvsb8xR8Jjz1Kl+jYZUVSoIzR/zXs4nxqcaU
 uBbQokSAX8EZUXiGmVv+JeGuyf/4Qcij5ecuZqPpVxJPVmKEwLmVJs8JGdFB8I+sB59j
 vQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=HMlhbbFvz3avKAUQo583J5WPo+qrHUxbKlOgVhpSbGk=;
 b=rRG/KwIosNry9+Ib3dHrEA5NnP5byo0veo2ozPiKLtb70MifzKb4PSdRmO1x1T2djd
 JKWDCevFb2IM5PeFsrQGM47ouZi5O/rCBW5DFMDf4HdAyE6pYNIqO5hGU0SK1Yne3aKS
 zBpK8W3d2vACCXNOGweyL5uFeu3anfyST7nOp3LzRnNslxHvGbzYFOwcmcN37jYMyFeR
 UT0AJv1LKtKbzEJFa4lD+PWFgpcn6s9jHeXqivGuW5XkHYLJunznzQBbQo37fUTIGKo+
 5tGaIgLjGRDvrw5OzKkaXEaqDwD4/fW2/yA+7+tG8KQ0dJmWXpTMdjRqtfxcWSVDr6fZ
 1LUQ==
X-Gm-Message-State: AOAM532V+QdrjBQC7XUZdfJsKoSIUfUEMNXPDIbNH3tF+Llf5qZjarNk
 JXEeV6m43pvZEWasNG+wCh0XwQ==
X-Google-Smtp-Source: ABdhPJwCnlrYuRbPEqYT67oJW6YeiJ0m3z+ESROratlyGKTpV4Ojr9LVNJoOg3xspxO9ZfAvJnGJDg==
X-Received: by 2002:a17:906:7009:: with SMTP id
 n9mr16916779ejj.431.1639681033919; 
 Thu, 16 Dec 2021 10:57:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm2629729edo.87.2021.12.16.10.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:57:13 -0800 (PST)
Message-ID: <eae21240-93fb-92df-4fc5-7afd69da2908@mind.be>
Date: Thu, 16 Dec 2021 19:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211215135421.1168030-1-br015@umbiko.net>
 <348e15d4-8c24-65df-723d-136e2f762144@mind.be>
Organization: Essensium/Mind
In-Reply-To: <348e15d4-8c24-65df-723d-136e2f762144@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: add missing
 static_assert macro
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE2LzEyLzIwMjEgMTk6NTIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
QW5kcmVhcywKPgo+IE9uIDE1LzEyLzIwMjEgMTQ6NTQsIEFuZHJlYXMgWmllZ2xlciB3cm90ZToK
Pj4gRml4ZXMgYnVpbGQgZmFpbHVyZSBpbiB0b29sY2hhaW5zIHVzaW5nIHVDbGliYzoKPj4KPj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9hbGdvX3h4aGFzaC5jOjQ4Ogo+PiAuLi9zcmMv
YWxnb194eGhhc2guaDogSW4gZnVuY3Rpb24g4oCYWFhIMzJfY2Fub25pY2FsRnJvbUhhc2jigJk6
Cj4+IC4uL3NyYy9hbGdvX3h4aGFzaC5oOjE1NjY6NTQ6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIAo+PiDigJhzdGF0aWNfYXNzZXJ04oCZIFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQo+PiDCoCAxNTY2IHwgI8KgwqDCoCBkZWZpbmUgWFhIX1NUQVRJ
Q19BU1NFUlRfV0lUSF9NRVNTQUdFKGMsbSkgZG8geyAKPj4gc3RhdGljX2Fzc2VydCgoYyksbSk7
IH0gd2hpbGUoMCkKPj4gwqDCoMKgwqDCoMKgIHwgXn5+fn5+fn5+fn5+fgo+PiAuLi9zcmMvYWxn
b194eGhhc2guaDoxNTcyOjMyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gCj4+IOKAmFhY
SF9TVEFUSUNfQVNTRVJUX1dJVEhfTUVTU0FHReKAmQo+PiDCoCAxNTcyIHwgI8KgIGRlZmluZSBY
WEhfU1RBVElDX0FTU0VSVChjKSBYWEhfU1RBVElDX0FTU0VSVF9XSVRIX01FU1NBR0UoKGMpLCNj
KQo+PiDCoMKgwqDCoMKgwqAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gLi4v
c3JjL2FsZ29feHhoYXNoLmg6MjI4Mjo1OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCY
WFhIX1NUQVRJQ19BU1NFUlTigJkKPj4gwqAgMjI4MiB8wqDCoMKgwqAgWFhIX1NUQVRJQ19BU1NF
UlQoc2l6ZW9mKFhYSDMyX2Nhbm9uaWNhbF90KSA9PSAKPj4gc2l6ZW9mKFhYSDMyX2hhc2hfdCkp
Owo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+Cj4+Cj4+IC4uLiBh
bmQgbGF0ZXI6Cj4+Cj4+IC4uL3NyYy9hbGdvX3h4aGFzaC5oOjIyODI6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYHN0YXRpY19hc3NlcnQnCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgWmll
Z2xlciA8YnIwMTVAdW1iaWtvLm5ldD4KPj4gLS0tCj4+IMKgIC4uLmxnb194eGhhc2gtYWRkLW1p
c3Npbmctc3RhdGljX2Fzc2VydC1tYWNyby5wYXRjaCB8IDEzICsrKysrKysrKysrKysKPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0
IAo+PiBwYWNrYWdlL2xpZ2h0dHBkLzAwMDItYWxnb194eGhhc2gtYWRkLW1pc3Npbmctc3RhdGlj
X2Fzc2VydC1tYWNyby5wYXRjaAo+Pgo+PiBkaWZmIC0tZ2l0IAo+PiBhL3BhY2thZ2UvbGlnaHR0
cGQvMDAwMi1hbGdvX3h4aGFzaC1hZGQtbWlzc2luZy1zdGF0aWNfYXNzZXJ0LW1hY3JvLnBhdGNo
IAo+PiBiL3BhY2thZ2UvbGlnaHR0cGQvMDAwMi1hbGdvX3h4aGFzaC1hZGQtbWlzc2luZy1zdGF0
aWNfYXNzZXJ0LW1hY3JvLnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAuLjFmYzhjYTNhZmUKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL2xp
Z2h0dHBkLzAwMDItYWxnb194eGhhc2gtYWRkLW1pc3Npbmctc3RhdGljX2Fzc2VydC1tYWNyby5w
YXRjaAo+PiBAQCAtMCwwICsxLDEzIEBACj4KPiDCoFRoZSBwYXRjaCBzaG91bGQgaGF2ZSBhIGNv
bW1pdCBtZXNzYWdlIGluY2x1ZGluZyBhIHNpZ25lZC1vZmYtYnksIGFuZCAKPiBwcmVmZXJhYmx5
IGJlIGdpdCBmb3JtYXR0ZWQuIEl0IHNob3VsZCBhbHNvIGhhdmUgYSByZWZlcmVuY2UgdG8gdGhl
IHVwc3RyZWFtIAo+IGJ1ZyByZXBvcnQgb3IgTVIgb3IgY29tbWl0Lgo+Cj4gwqBJJ3ZlIGFkZGVk
IHRoYXQgYW5kIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogwqBBY3R1YWxseSwgc2NyYXRj
aCB0aGF0LiBGYWJyaWNlIHN1Ym1pdHRlZCBhIHBhdGNoIHNlcmllcyB0aGF0IGluc3RlYWQgCnVu
YnVuZGxlcyB4eGhhc2gsIHNvIEknbSBnb2luZyB0byBhcHBseSB0aGF0IG9uZS4KCgogwqBSZWdh
cmRzLAogwqBBcm5vdXQKCgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4gKy0tLSBsaWdo
dHRwZC0xLjQuNjMvc3JjL2FsZ29feHhoYXNoLmggMjAyMS0xMi0wNCAxNTo0MDoyNC4wMDAwMDAw
MDAgKzAxMDAKPj4gKysrKyBsaWdodHRwZC0xLjQuNjQvc3JjL2FsZ29feHhoYXNoLmjCoMKgwqAg
MjAyMS0xMi0xNSAxMDo1MDoxNy44MDExNTUwMDcgKzAxMDAKPj4gK0BAIC0xNTYzLDYgKzE1NjMs
MTAgQEAKPj4gKyAjaWZuZGVmIFhYSF9TVEFUSUNfQVNTRVJUCj4+ICsgI8KgIGlmIGRlZmluZWQo
X19TVERDX1ZFUlNJT05fXykgJiYgKF9fU1REQ19WRVJTSU9OX18gPj0gMjAxMTEyTCnCoMKgwqAg
LyogQzExICovCj4+ICsgI8KgwqDCoCBpbmNsdWRlIDxhc3NlcnQuaD4KPj4gKysvKiB1Q2xpYmMg
ZG9lcyBub3QgZGVmaW5lIHN0YXRpY19hc3NlcnQgKi8KPj4gKysjwqDCoMKgIGlmbmRlZiBzdGF0
aWNfYXNzZXJ0Cj4+ICsrI8KgwqDCoMKgwqAgZGVmaW5lIHN0YXRpY19hc3NlcnQgX1N0YXRpY19h
c3NlcnQKPj4gKysjwqDCoMKgIGVuZGlmCj4+ICsgI8KgwqDCoCBkZWZpbmUgWFhIX1NUQVRJQ19B
U1NFUlRfV0lUSF9NRVNTQUdFKGMsbSkgZG8geyBzdGF0aWNfYXNzZXJ0KChjKSxtKTsgCj4+IH0g
d2hpbGUoMCkKPj4gKyAjwqAgZWxpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKSAmJiAoX19jcGx1c3Bs
dXMgPj0gMjAxMTAzTCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIAo+PiBDKysxMSAqLwo+PiAr
ICPCoMKgwqAgZGVmaW5lIFhYSF9TVEFUSUNfQVNTRVJUX1dJVEhfTUVTU0FHRShjLG0pIGRvIHsg
c3RhdGljX2Fzc2VydCgoYyksbSk7IAo+PiB9IHdoaWxlKDApCj4+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
