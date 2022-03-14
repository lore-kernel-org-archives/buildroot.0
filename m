Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68880C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 17:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01CE3819B8;
	Mon, 14 Mar 2022 17:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lu2H_Hu_RMdd; Mon, 14 Mar 2022 17:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04425819D1;
	Mon, 14 Mar 2022 17:21:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 376EB1BF34C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 17:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20CD6819B8
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 17:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OeP7ylP2E_G for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 17:21:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4743B8190B
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 17:21:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hw13so34231532ejc.9
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q+Wp8WA0mxeCC0H6DFm7r15Zn9ktWn+ZcG/k/9ISB/o=;
 b=zsAErAiy4Q0tqyo70b6qJiUlO0kQUSktr8a/kCaERvXTyXRlakK219dAK6xNExnKFE
 RoNCgphu19yBTa1rCy9RVvhZnVH9U2+W5by3l//Oehc93CAljg0OrqMe63mIzKYyZf5o
 I9R8A8Xnzjd/4x/sIXJOmr5lPzG0dbM8jGcXZol+pIk8iE1oIaakuH2Ki8pxeFcKQehO
 meixT1dRu0Hue5qysYvUXACX6qViJkyEix/8t5k1B96Ap9431d0pWPjvz1upU+4PNBAz
 qeFQsdIumlAXSkgN9ZNFkueRCpgrPZl+eAeIrWcyJcY85ElALQfHBiM1JbYb+plQ7met
 7kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q+Wp8WA0mxeCC0H6DFm7r15Zn9ktWn+ZcG/k/9ISB/o=;
 b=Qgpl8uEqyxwvtsWWtMTlAVPlKQkXC5UVQ2+X290wQgPYqwD582aEvBUjYiD7J3PTq7
 6nk838g00qKG1FXSsit7hODfX/a+VwcKQG6Ps657E4TgkFrcOjYLFkQm/xLOJK7aTBm0
 uLTpzcPNTDN4XNpzA5aGfS8mNwvKzb5Hq9N8ei31Qof/TmkbpUkEb+u7c/ipWL2/l1SV
 uEKmYFHvYImyGMbV8IA3Z9Qhv2HDkwgwaIIGAmPf8VjGuskXgGqacjT2mg25Dtp5No5h
 md61t/EhYQQjHBJEDCeH/4zXHuryyao0inw1HrZLDaeHsZYPujS4d9Ftnd/j1xiXlE9K
 cEHA==
X-Gm-Message-State: AOAM531Vq02/PhOF4kuRHEikI9XFHimFAHBgy7VbwK5RVXqvkMExWTgk
 q/WjKTmlvTmyIbRov0HaDwfsaDYd6LPGUXgevRAkXz89jJCxpA==
X-Google-Smtp-Source: ABdhPJycgD7OHHmNtNGaiSFpynL6v+gfgv6YxiPEvj/JVHRbjrOcCB25CrB8FnxMSWZn6rBVnu9UKi9dQ5891IFceck=
X-Received: by 2002:a17:906:8488:b0:6da:bebf:98b with SMTP id
 m8-20020a170906848800b006dabebf098bmr19101855ejx.587.1647278458580; Mon, 14
 Mar 2022 10:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-4-clement.leger@bootlin.com>
In-Reply-To: <20220314153111.1390512-4-clement.leger@bootlin.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 14 Mar 2022 18:20:47 +0100
Message-ID: <CAN5uoS9XLeiApqZUzs_UxPqg5UOKU5oDp-2H03+bq9miYM0iew@mail.gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [Buildroot] [PATCH v4 3/8] boot/optee-os: add support to build
 with python-cryptography
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbmNlIGJ1bXBlZCB0byAzLjE2LjAsIG9wdGVlLW9zIHdvbid0IHJl
dmVydCB0byBweWNyeXB0b2RvbWV4LgpXaHkgbm90IHVzaW5nIGEgc2luZ2xlIGNoYW5nZSB0byB1
cGdyYWRlIG9wdGVlX29zIHRvIDMuMTYuMCBhbmQgdXBkYXRlCmRlcGVuZGVuY2llcz8KVGhpcyB3
b3VsZCBnZXQgcmlkIG9mIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dS
QVBIWS4KCgpCZXN0IHJlZ2FyZHMsCkV0aWVubmUKCk9uIE1vbiwgMTQgTWFyIDIwMjIgYXQgMTY6
MzMsIENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cj4K
PiBOZXdlciB2ZXJzaW9uIG9mIG9wdGVlLW9zICg+PSAzLjE2KSB1c2VzIHB5dGhvbi1jcnlwdG9n
cmFwaHkgaW5zdGVhZCBvZgo+IHB5dGhvbi1weWNyeXB0b2RvbWV4IGluIHB5dGhvbiBzY3JpcHRz
LiBBZGQgc3VwcG9ydCB0byBidWlsZCB0aGVzZQo+IG5ld2VyIHZlcnNpb25zIGJ5IGFkZGluZyBh
IG5ldwo+IEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSBvcHRp
b24gd2hpY2ggd2lsbAo+IHNlbGVjdCBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkgZGVwZW5kZW5j
eSB3aGVuIGJ1aWxkaW5nIG9wdGVlLW9zLgo+Cj4gQWNrZWQtYnk6IEV0aWVubmUgQ2FycmllcmUg
PGV0aWVubmUuY2FycmllcmVAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGJvb3Qvb3B0ZWUtb3Mv
Q29uZmlnLmluICAgfCA5ICsrKysrKysrKwo+ICBib290L29wdGVlLW9zL29wdGVlLW9zLm1rIHwg
OCArKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0
ZWUtb3MvQ29uZmlnLmluCj4gaW5kZXggMmY2MTQzZjFmNC4uMzk5NjAzOTE5MSAxMDA2NDQKPiAt
LS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+ICsrKyBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmln
LmluCj4gQEAgLTEsNiArMSw3IEBACj4gIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TCj4gICAg
ICAgICBib29sICJvcHRlZV9vcyIKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX0FSTV9DUFVfQVJN
VjhBIHx8IEJSMl9BUk1fQ1BVX0FSTVY3QQo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgT1At
VEVFIE9TIHByb3ZpZGVzIHRoZSBzZWN1cmUgd29ybGQgYm9vdCBpbWFnZSBhbmQgdGhlIHRydXN0
Cj4gICAgICAgICAgIGFwcGxpY2F0aW9uIGRldmVsb3BtZW50IGtpdCBvZiB0aGUgT1AtVEVFIHBy
b2plY3QuIE9QLVRFRSBPUwo+IEBAIC01NSw2ICs1NiwxNCBAQCBjb25maWcgQlIyX1RBUkdFVF9P
UFRFRV9PU19ORUVEU19EVEMKPiAgICAgICAgICAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlvdXIg
T1AtVEVFIE9TIHBsYXRmb3JtIGNvbmZpZ3VyYXRpb24KPiAgICAgICAgICAgcmVxdWlyZXMgdGhl
IERldmljZSBUcmVlIGNvbXBpbGVyIHRvIGJlIGF2YWlsYWJsZS4KPgo+ICtjb25maWcgQlIyX1RB
UkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZCj4gKyAgICAgICBib29sICJP
UC1URUUgT1MgbmVlZHMgaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5Igo+ICsgICAgICAgaGVscAo+
ICsgICAgICAgICBPUC1URUUgT1MgdmVyc2lvbiBiZWxvdyAzLjE2IHVzZWQgcHl0aG9uLXB5Y3J5
cHRvZG9tZXgKPiArICAgICAgICAgcGFja2FnZSBpbiBweXRob24gc2NyaXB0cy4gTmV3ZXIgdmVy
c2lvbiB1c2VzCj4gKyAgICAgICAgIHB5dGhvbi1jcnlwdG9ncmFwaHkuIFNlbGVjdCB0aGlzIG9w
dGlvbiBpZiBvcHRlZS1vcyBuZWVkcwo+ICsgICAgICAgICBweXRob24tY3J5cHRvZ3JhcGh5IHRv
IGJlIGJ1aWx0Lgo+ICsKPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfVkVSU0lPTgo+ICAg
ICAgICAgc3RyaW5nCj4gICAgICAgICBkZWZhdWx0ICIzLjE1LjAiICAgICAgICBpZiBCUjJfVEFS
R0VUX09QVEVFX09TX0xBVEVTVAo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL29wdGVlLW9z
Lm1rIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+IGluZGV4IDlmNzZkODQ1MGUuLjUzMTNh
MWJhZGMgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+ICsrKyBiL2Jv
b3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiBAQCAtMjEsNyArMjEsMTMgQEAgZWxzZQo+ICBPUFRF
RV9PU19TSVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfb3MsJChPUFRFRV9PU19WRVJT
SU9OKSkKPiAgZW5kaWYKPgo+IC1PUFRFRV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wg
aG9zdC1weXRob24zIGhvc3QtcHl0aG9uLXB5Y3J5cHRvZG9tZXggaG9zdC1weXRob24tcHllbGZ0
b29scwo+ICtPUFRFRV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1weXRob24z
IGhvc3QtcHl0aG9uLXB5ZWxmdG9vbHMKPiArCj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9PUFRFRV9P
U19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZKSx5KQo+ICtPUFRFRV9PU19ERVBFTkRFTkNJRVMg
Kz0gaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5Cj4gK2Vsc2UKPiArT1BURUVfT1NfREVQRU5ERU5D
SUVTICs9IGhvc3QtcHl0aG9uLXB5Y3J5cHRvZG9tZXgKPiArZW5kaWYKPgo+ICBpZmVxICgkKEJS
Ml9UQVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDKSx5KQo+ICBPUFRFRV9PU19ERVBFTkRFTkNJRVMg
Kz0gaG9zdC1kdGMKPiAtLQo+IDIuMzQuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
