Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5544C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C79640523;
	Sun,  7 May 2023 12:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C79640523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhT1FmrqOU9t; Sun,  7 May 2023 12:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B115A404F8;
	Sun,  7 May 2023 12:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B115A404F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 002F11BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF7A404F8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF7A404F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1USV_mTJD3c for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:48:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1FF940192
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1FF940192
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:48:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1AD7519F58A;
 Sun,  7 May 2023 14:48:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:48:29 +0200
Date: Sun, 7 May 2023 14:48:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230507124829.GR252090@scaer>
References: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
 <CABGWkvqpAsu8NjkfW7RVQTbBrrsA_koVffPSVh8K5dUYhmHX6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvqpAsu8NjkfW7RVQTbBrrsA_koVffPSVh8K5dUYhmHX6Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683463714;
 bh=i1XyQq7za3p8jV1DhZe+VsYfIeo88uxec9jIlAw8GMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=otbtiI3XtBnPDEQrFFeHSfwzVhxjD2HzHgRJr9YGceaYnWbc2eokrWPyCxei1cpOl
 qgMssmHqWyrqbUfRDqklp0frG+QeUFFzKJSQ2DWmabsgAiDyttHBFylXHyl+01yyBb
 YhLp3osSfPdXwIgf5XHQZZngbruLeQ2NjN3wmVJTuDb4m9x5s1HpAlXZmz1xeFV4BD
 +IyH5fSz9C+ws8Mi8FlR6sWGSs32T201zq0K5lXxcf5O1O8rDpaDLal15JLjyBhM4N
 yNxUDvwh3WPqe4YlU2lLeglxgv1iWow0ri/sWRzJwKc+9hRn9wZQlabr0H7sQcYI43
 tgwriS280eZjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=otbtiI3X
Subject: Re: [Buildroot] [PATCH] configs/stm32f429_disco_xip_defconfig: fix
 runtime error due to low ram space and bump to linux version 6.1.27
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjMtMDUtMDYgMTY6MjEgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIE1heSAxLCAyMDIzIGF0IDY6MjbigK9QTSBHaXVsaW8gQmVu
ZXR0aQo+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiA+
IEFmdGVyIGJvb3RpbmcgTGludXggdGhlIHVzZXJzcGFjZSBpcyB1bnVzYWJsZSBzaW5jZSBldmVy
eSBjb21tYW5kIGlzc3VlZCwKPiA+IHRoYXQgaXMgYSBzeW1saW5rIHRvIGJ1c3lib3gsIGZhaWxz
IGJlY2F1c2Ugb2Ygbm8gZnJlZSByYW0uIFNvIGxldCdzCj4gPiBkaXNhYmxlIElJTyBpbiBsaW51
eC5jb25maWcgdG8gZ2l2ZSBzb21lIG1vcmUgcmFtIHRvIHVzZXJzcGFjZS4KPiBJIGhhdmUgYWxz
byBleHBlcmllbmNlZCB0aGlzIHR5cGUgb2YgYmVoYXZpb3Igd2hlbiB1c2luZyBTVCBib2FyZHMg
aW4KPiBnZW5lcmFsIChzdG0zMmY0MjktZGlzY28sIHN0bTMyZjQ2OS1kaXNjbywKPiBhbmQgc3Rt
MzJmNzY5LWRpc2NvKSwgYW5kIGV2ZXJ5IHRpbWUgSSB3b25kZXIgd2hldGhlciBpdCBpcyBiZXR0
ZXIgdG8KPiB1cGRhdGUgdGhlIGtlcm5lbCAod2hpY2ggYWx3YXlzIG9jY3VwaWVzIG1vcmUKPiBt
ZW1vcnkgd2l0aCBlYWNoIG5ldyB2ZXJzaW9uKSBvciBub3QuIFRoZSBpZGVhIEkgaGF2ZSBpcyB0
byBwcmVmZXIgdGhlCj4ga2VybmVsIHRvIHVzZXIgc3BhY2UsIGFuZCB0aGVyZWZvcmUgZGlzYWJs
ZQo+IHN0YXJ0aW5nIGZyb20gdGhlIHVzZXIgc3BhY2UgZmlyc3Qgb2YgYWxsLCBidXQgbXkgb3Bp
bmlvbiBpcyBkZWJhdGFibGUuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KClRoZSB0aGluZyBp
czogaG93IHVzZWZ1bCBpcyBJbmR1c3RyaWFsIElPIChJSU8pIG9uIGEgZGV2aWNlIHN1Y2ggYXMg
dGhlCnN0bTMyIGRpc2NvIGZhbWlseT8gSSBzdXNwZWN0IHRoZSBpbnRlcmVzdCBpbiBJSU8gZm9y
IHRob3NlIGRldmljZXMgdG8KYmUgdmlydHVhbGx5IG5pbGwsIHNvIEdpdWxpbydzIGNoYW5nZSBk
b2VzIG1ha2Ugc2Vuc2UuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBUaGFua3MgYW5kIHJl
Z2FyZHMsCj4gRGFyaW8KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ID4gLS0tCj4gPiAgYm9hcmQvc3Rt
aWNyb2VsZWN0cm9uaWNzL3N0bTMyZjQyOS1kaXNjby9saW51eC5jb25maWcgfCA0IC0tLS0KPiA+
ICBjb25maWdzL3N0bTMyZjQyOV9kaXNjb194aXBfZGVmY29uZmlnICAgICAgICAgICAgICAgICB8
IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9ib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJmNDI5
LWRpc2NvL2xpbnV4LmNvbmZpZyBiL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0Mjkt
ZGlzY28vbGludXguY29uZmlnCj4gPiBpbmRleCA3YjVjNjBmMTgwLi4wMmQ5YzJkMWUwIDEwMDY0
NAo+ID4gLS0tIGEvYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMyZjQyOS1kaXNjby9saW51
eC5jb25maWcKPiA+ICsrKyBiL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0MjktZGlz
Y28vbGludXguY29uZmlnCj4gPiBAQCAtOTUsMTAgKzk1LDYgQEAgQ09ORklHX1NUTTMyX01ETUE9
eQo+ID4gIENPTkZJR19TWU5DX0ZJTEU9eQo+ID4gICMgQ09ORklHX1ZJUlRJT19NRU5VIGlzIG5v
dCBzZXQKPiA+ICAjIENPTkZJR19WSE9TVF9NRU5VIGlzIG5vdCBzZXQKPiA+IC1DT05GSUdfSUlP
PXkKPiA+IC1DT05GSUdfSUlPX0JVRkZFUj15Cj4gPiAtQ09ORklHX0lJT19UUklHR0VSRURfQlVG
RkVSPXkKPiA+IC1DT05GSUdfSUlPX1NUTTMyX1RJTUVSX1RSSUdHRVI9eQo+ID4gICMgQ09ORklH
X0ZJTEVfTE9DS0lORyBpcyBub3Qgc2V0Cj4gPiAgIyBDT05GSUdfRE5PVElGWSBpcyBub3Qgc2V0
Cj4gPiAgIyBDT05GSUdfSU5PVElGWV9VU0VSIGlzIG5vdCBzZXQKPiA+IGRpZmYgLS1naXQgYS9j
b25maWdzL3N0bTMyZjQyOV9kaXNjb194aXBfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMmY0Mjlf
ZGlzY29feGlwX2RlZmNvbmZpZwo+ID4gaW5kZXggODcyZTRiNmEzMC4uMWFlYTc0MWY3ZSAxMDA2
NDQKPiA+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZjb25maWcKPiA+ICsr
KyBiL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZjb25maWcKPiA+IEBAIC02LDcgKzYs
NyBAQCBCUjJfRU5BQkxFX0xUTz15Cj4gPiAgQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0i
Ym9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL2NvbW1vbi9zdG0zMmY0eHgvc3RtMzItcG9zdC1idWls
ZC5zaCIKPiA+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiA+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OPXkKPiA+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2
LjEuMTAiCj4gPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjI3
Igo+ID4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ID4gIEJSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3Rt
MzJmNDI5LWRpc2NvL2xpbnV4LmNvbmZpZyIKPiA+ICBCUjJfTElOVVhfS0VSTkVMX0lNQUdFX1RB
UkdFVF9DVVNUT009eQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiAKPiAKPiAtLSAKPiAKPiBEYXJp
byBCaW5hY2NoaQo+IAo+IFNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKPiAKPiBkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiAKPiAKPiBBbWFydWxhIFNvbHV0aW9ucyBTUkwKPiAKPiBWaWEgTGUg
Q2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKPiAKPiBULiArMzkgMDQyIDI0
MyA1MzEwCj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IAo+IHd3dy5hbWFydWxhc29sdXRp
b25zLmNvbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
