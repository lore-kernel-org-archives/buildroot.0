Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A6CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B53B61CBE;
	Sun, 12 Dec 2021 14:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rg4KSJU9cLZ; Sun, 12 Dec 2021 14:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B46D461CD8;
	Sun, 12 Dec 2021 14:41:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB93B1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAEE8833AF
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qC38FCpUBCG for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:41:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3614A83DFB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:41:11 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y12so43592901eda.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XeQs+0mbLi2K4b5WRGSuhv6fC8TU0hXAepeJkQzetdU=;
 b=Y56KNXWCiJi/sINc/XuHoQm9JhLJgJ4G5Tq9OgVDIGfkRRIkAZ4JuRhBLQ1c11nOjW
 z2dCx14G40bF4oYKETaN29QPJnO0vVGVYuUKE1Sa1eHrYnn8ryu+66XJmNlRsk+iIiGw
 njSgyi6pS7MTvs9U+E7MG1W4Tmp7HNPFLee1DL6XnbG4K9LTUKSMsVpiFJpEdHhZvPXQ
 oybceXJN5FwlKnnYBBmRter61yIqAwUyKF52W6cvYf0y0IjIWpPtomqlkanxOzS2FOy5
 BwslKWbuy2kvSjkkvKZ5MO0cl6n2qq3gyoEjfNSCuyvC0wnPmop+mF/z1tZwZouYUEqc
 xQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XeQs+0mbLi2K4b5WRGSuhv6fC8TU0hXAepeJkQzetdU=;
 b=wcM6n45ICEE3tHnl5LBD57P/YB+LbKE/LesS/ggfW/Wj0AO4MisbRSntQY1lvrUD8X
 N/RewKonG4bJRElYtzT1dnLAFyxdJ9ycPEpGugPJFOdE+f4vns6NgCKSmTiFm0uMs4nX
 5FkCQ0Mg2SKCw1B3yCdEKAXN8vgskmZxJPjdsEZ7fpym/ZDEfgPsf1mlTUKRxE2DEpG0
 MA/mmSaTP5jDcQpaosTNdBcAs5cb3OBnMEO1VHb+Sh93p2k/k5v4m/ChwNVaCEtTK0yp
 ZTXyzzxGztUkLyoQpW0O4HEOddFbLuooJHyPi2sxvF4vjcejAf1xQLPGJGN1nQ2bv9FU
 WYog==
X-Gm-Message-State: AOAM532e5hIEDn5YH/exORPgmSXJGyfZKh+5xrnbWIJCaAt6TIqE5svG
 NJXGV5mdAw+70aXBmglmU/8GbIocGi2YJg==
X-Google-Smtp-Source: ABdhPJz36qr02UvhqEuCsiyD/oE+bMkdwRzMeRipYACqH3r4hSlKJiN/B7GNH+oPC5HBA7UA7XIn5w==
X-Received: by 2002:a17:906:b2d0:: with SMTP id
 cf16mr38085659ejb.52.1639320070316; 
 Sun, 12 Dec 2021 06:41:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p13sm4759335eds.38.2021.12.12.06.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:41:09 -0800 (PST)
Message-ID: <d84bde70-7a76-69ea-7b87-7b15b4ee9df8@mind.be>
Date: Sun, 12 Dec 2021 15:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211210142531.14746-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211210142531.14746-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/assimp: disable -Werror compile
 flag
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

CgpPbiAxMC8xMi8yMDIxIDE1OjI1LCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiBBZGQgcGF0Y2gg
dG8gZGlzYWJsZSAtV2Vycm9yIGNvbXBpbGUgZmxhZy4KPiAKPiBGaXhlczoKPiAKPiAgICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzQ5YmViMjY0Yjg0NTRiOWFmMDky
Mjc4MDc0YzQwODcwMTM2OTIwNTIvCj4gCj4gICAgLi4uL2J1aWxkL2Fzc2ltcC01LjEuMy9jb2Rl
L1Bvc3RQcm9jZXNzaW5nL1RyaWFuZ3VsYXRlUHJvY2Vzcy5jcHA6Mjg1OjUwOiBlcnJvcjogYXJn
dW1lbnQgMSB2YWx1ZSDigJg0Mjk0OTY3Mjk04oCZIGV4Y2VlZHMgbWF4aW11bSBvYmplY3Qgc2l6
ZSAyMTQ3NDgzNjQ3IFstV2Vycm9yPWFsbG9jLXNpemUtbGFyZ2VyLXRoYW49XQo+ICAgICAgMjg1
IHwgICAgIHN0ZDo6dW5pcXVlX3B0cjxib29sW10+IGRvbmUobmV3IGJvb2xbbWF4X291dF0pOwo+
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4KPiAgICBbLi4uXQo+ICAgIC4uLi9ob3N0L29wdC9leHQtdG9vbGNoYWluL3Bvd2VycGMt
YnVpbGRyb290LWxpbnV4LXVjbGliYy9pbmNsdWRlL2MrKy85LjMuMC9uZXc6MTI3OjI2OiBub3Rl
OiBpbiBhIGNhbGwgdG8gYWxsb2NhdGlvbiBmdW5jdGlvbiDigJh2b2lkKiBvcGVyYXRvciBuZXcg
W10oc3RkOjpzaXplX3Qp4oCZIGRlY2xhcmVkIGhlcmUKPiAgICAgIDEyNyB8IF9HTElCQ1hYX05P
RElTQ0FSRCB2b2lkKiBvcGVyYXRvciBuZXdbXShzdGQ6OnNpemVfdCkgX0dMSUJDWFhfVEhST1cg
KHN0ZDo6YmFkX2FsbG9jKQo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgu
bmV0Pgo+IC0tLQo+ICAgcGFja2FnZS9hc3NpbXAvMDAwMS1jb2RlLWRpc2FibGUtV2Vycm9yLnBh
dGNoIHwgMzkgKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Fzc2ltcC8wMDAxLWNvZGUt
ZGlzYWJsZS1XZXJyb3IucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hc3NpbXAvMDAw
MS1jb2RlLWRpc2FibGUtV2Vycm9yLnBhdGNoIGIvcGFja2FnZS9hc3NpbXAvMDAwMS1jb2RlLWRp
c2FibGUtV2Vycm9yLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi4zMzg2N2U2MWMzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYXNzaW1wLzAw
MDEtY29kZS1kaXNhYmxlLVdlcnJvci5wYXRjaAo+IEBAIC0wLDAgKzEsMzkgQEAKPiArRnJvbSA1
MTQ2ZTFjNGQ1ODE3NGUzMDJkYmRjZjJhODVjMjAyM2JlMWNmZmM2IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ICtGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gK0Rh
dGU6IEZyaSwgMTAgRGVjIDIwMjEgMTU6MTU6MzAgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBj
b2RlOiBkaXNhYmxlIC1XZXJyb3IKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKPiArCj4gK0ZpeGVzOgo+ICsKPiArICAuLi4vYnVpbGQvYXNzaW1wLTUuMS4zL2NvZGUv
UG9zdFByb2Nlc3NpbmcvVHJpYW5ndWxhdGVQcm9jZXNzLmNwcDoyODU6NTA6IGVycm9yOiBhcmd1
bWVudCAxIHZhbHVlIOKAmDQyOTQ5NjcyOTTigJkgZXhjZWVkcyBtYXhpbXVtIG9iamVjdCBzaXpl
IDIxNDc0ODM2NDcgWy1XZXJyb3I9YWxsb2Mtc2l6ZS1sYXJnZXItdGhhbj1dCj4gKyAgICAyODUg
fCAgICAgc3RkOjp1bmlxdWVfcHRyPGJvb2xbXT4gZG9uZShuZXcgYm9vbFttYXhfb3V0XSk7Cj4g
KyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXgo+ICsgIFsuLi5dCj4gKyAgLi4uL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vcG93ZXJwYy1i
dWlsZHJvb3QtbGludXgtdWNsaWJjL2luY2x1ZGUvYysrLzkuMy4wL25ldzoxMjc6MjY6IG5vdGU6
IGluIGEgY2FsbCB0byBhbGxvY2F0aW9uIGZ1bmN0aW9uIOKAmHZvaWQqIG9wZXJhdG9yIG5ldyBb
XShzdGQ6OnNpemVfdCnigJkgZGVjbGFyZWQgaGVyZQo+ICsgICAgMTI3IHwgX0dMSUJDWFhfTk9E
SVNDQVJEIHZvaWQqIG9wZXJhdG9yIG5ld1tdKHN0ZDo6c2l6ZV90KSBfR0xJQkNYWF9USFJPVyAo
c3RkOjpiYWRfYWxsb2MpCj4gKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214
Lm5ldD4KPiArLS0tCj4gKyBjb2RlL0NNYWtlTGlzdHMudHh0IHwgMiAtLQo+ICsgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvY29kZS9DTWFrZUxpc3Rz
LnR4dCBiL2NvZGUvQ01ha2VMaXN0cy50eHQKPiAraW5kZXggZTQ1YmY4YTJhLi5mNzFiNjU4M2Qg
MTAwNjQ0Cj4gKy0tLSBhL2NvZGUvQ01ha2VMaXN0cy50eHQKPiArKysrIGIvY29kZS9DTWFrZUxp
c3RzLnR4dAo+ICtAQCAtMTE2Nyw4ICsxMTY3LDYgQEAgVEFSR0VUX1VTRV9DT01NT05fT1VUUFVU
X0RJUkVDVE9SWShhc3NpbXApCj4gKyAjIGVuYWJsZSB3YXJuaW5ncyBhcyBlcnJvcnMgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsgSUYgKE1TVkMpCj4gKyAgIFRB
UkdFVF9DT01QSUxFX09QVElPTlMoYXNzaW1wIFBSSVZBVEUgL1dYKQo+ICstRUxTRSgpCj4gKy0g
IFRBUkdFVF9DT01QSUxFX09QVElPTlMoYXNzaW1wIFBSSVZBVEUgLVdlcnJvcikKCiAgVGhpcyBs
b29rcyBsaWtlIGEgcGF0Y2ggdGhhdCBpcyBub3QgdXBzdHJlYW1hYmxlLCBzbyBub3Qgc28gbmlj
ZS4KCiAgV29yc2UgdGhvdWdoOiBpdCBzZWVtcyB0aGF0IHRoZSBpc3N1ZSByYWlzZWQgYnkgV2Vy
cm9yIGNvdWxkIGJlIGFuIGFjdHVhbCBidWcuIApBbGxvY3RpbmcgNEdCIGRvZXNuJ3Qgc291bmQg
bGlrZSBhIGdvb2QgaWRlYSwgZG9lcyBpdD8KCiAgU28gcGVyaGFwcyBpdCB3b3VsZCBiZSBiZXR0
ZXIgdG8gY3JlYXRlIGFuIHVwc3RyZWFtIGlzc3VlIGZvciB0aGlzPyBJdCBzaG91bGQgCmJlIHJl
bGF0aXZlbHkgZWFzeSB0byByZXByb2R1Y2UsIGFueSAzMi1iaXQgdGFyZ2V0IHNob3VsZCBiZSBz
dWZmaWNpZW50LCBubz8KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gKyBFTkRJRigpCj4gKwo+ICsg
IyBhZGRzIENfRkxBR1MgcmVxdWlyZWQgdG8gY29tcGlsZSB6aXAuYyBvbiBvbGQgR0NDIDQueCBj
b21waWxlcgo+ICstLQo+ICsyLjM0LjEKPiArCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
