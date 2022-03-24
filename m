Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3563C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597874109B;
	Thu, 24 Mar 2022 22:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sINVJd0vNbO4; Thu, 24 Mar 2022 22:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC03F41092;
	Thu, 24 Mar 2022 22:47:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFB31BF36A
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28FF18443B
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2vbY-PaXBc8 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:47:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4674E84429
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:47:33 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t21so1536717oie.11
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 15:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2BbEYwFfkExSsywRELVYvrSHsnKAsChLutXxBeFpsEI=;
 b=QlFhpGL8JNXNL3FFNCsQU3KflZmQRVhccM7SD7PE7DPzHwUFYa4+ULxf3/5LIiZtW7
 mKS7ox/0XaEuwDSKkggXx/o/gsxTnu5xnBUbmeIXqoxc+5ord+vBotNtWzxBNiBiOp3h
 4ZkqqM3fmk+db/yUI8cTGltXV58QIIsm6CqdTr8AHRx+IUeg0SlcwALAFiVXQEcbAlcy
 fqVyjDqcAmeXq43HTal3AV2sHiJOJiAz3g6nLLsuzpIJetX8rqkd1IP6OAsRr7uTb/8Q
 w7Q2lJ8AcwWQ/VYQbrUPgg84WJ5KaEWWKBsVmOG2rHXy0nl5TCFu4t4zQ3sENP9ytoHG
 97zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2BbEYwFfkExSsywRELVYvrSHsnKAsChLutXxBeFpsEI=;
 b=CZV1VMBgf8gpvE92p6+ciOzATU2rurhDGtH8CBNx/k4F4RrAl/a57gg+yWh7oIj9+H
 iEMVj9ZEJu1SP3mlFEsGdj6HTyOu65l2/6vC2EWXoliZbbeYxxGkpWD7DjbX2NGNK2mM
 dvTjrErq5oAz5jvbCAn/9HtJOwp9HBcNb3T8eWf58aLv1aXnJBVqZPwPRfC+NKC4qxeX
 5lj6mlKrIoDxCjiXdH0RMmo3qhc90+/EhamNuNzyMbcxz9NF8mlAo0kCRHbXl/jx3d4J
 yGaq/ctMY/ixvRFF4olciHcfdqvFxMJznx1mVr8akLcPGsu1IBFV5tZ9bVo5CXOGeoY9
 2Eyg==
X-Gm-Message-State: AOAM530w5zoffY7UKQujvRYomChfgcQPzByGoSVi9LoEIRKjmIaaxleB
 Xz3zhhqsFdI21TtQTNRh/cbrpnBNGRKyCtE7i9Ql+escZFCOGQ==
X-Google-Smtp-Source: ABdhPJx3jsUf6PQXacqNutX20XqWaVgojo61USoVzUYywFhmaixQJ/xYRDk4Y5RGnCrNNsPGTJSgOAE+dZW+D11dq70=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr8077425oic.200.1648162052142; Thu, 24
 Mar 2022 15:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220313175615.406390-1-james.hilliard1@gmail.com>
 <5313758f-f64d-f9f8-cdf2-3ca2ab426c7e@mind.be>
 <87bd50d3-72e9-2211-b53f-4046381e7419@corrigendum.ru>
In-Reply-To: <87bd50d3-72e9-2211-b53f-4046381e7419@corrigendum.ru>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Mar 2022 16:47:20 -0600
Message-ID: <CADvTj4oFOfRM7cY9oxQhv4BNgMso9T7mQ7YR4go+64-Kai9rRg@mail.gmail.com>
To: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python: migrate flit to
 new bootstrapping sequence
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBNYXIgMjQsIDIwMjIgYXQgNDoyOCBQTSDQoNC+0LzQsNC9INCU0L7QvdGH0LXQvdC6
0L4gPGRwYkBjb3JyaWdlbmR1bS5ydT4gd3JvdGU6Cj4KPiBIaSwKPgo+IDI0LjAzLjIwMjIgMjM6
MzcsIEFybm91dCBWYW5kZWNhcHBlbGxlINC/0LjRiNC10YI6Cj4KPiA+PiAgIGVsc2UKPiA+PiAg
ICQoMilfQkFTRV9FTlYgPSAkJChIT1NUX1BLR19QWVRIT05fUEVQNTE3X0VOVikKPiA+PiAtJCgy
KV9CQVNFX0JVSUxEX0NNRCA9IC1tIGJ1aWxkIC1uIC13Cj4gPj4gLSQoMilfQkFTRV9JTlNUQUxM
X0NNRCA9ICQoVE9QRElSKS9zdXBwb3J0L3NjcmlwdHMvcHlpbnN0YWxsZXIucHkKPiA+PiBkaXN0
LyogJCQoSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19JTlNUQUxMX09QVFMpCj4gPj4gKyMgVXNlIGZs
aXQgYnVpbHQgaW4gd2hlZWwgYnVpbGRlciBmb3IgcGFja2FnZXMgdGhhdCBhcmUKPiA+PiBob3N0
LXB5dGhvbi1weXBhLWJ1aWxkIGRlcGVuZGVuY2llcy4KPiA+PiArIyBUaGlzIGlzIG5lZWRlZCB0
byBhdm9pZCBhIGNpcmN1bGFyIHdpdGggaG9zdC1weXRob24tcHlwYS1idWlsZCBhbmQKPiA+PiB0
aG9zZSBkZXBlbmRlbmNpZXMuCj4gPj4gKyMKPiA+PiArJCgyKV9CQVNFX0JVSUxEX0NNRCA9ICQk
KGlmIFwKPiA+PiArICAgICAgICAkJChmaWx0ZXIgXAo+ID4+ICsgICAgICAgICAgICBob3N0LXB5
dGhvbi1mbGl0LWNvcmUgaG9zdC1weXRob24taW5zdGFsbGVyCj4gPj4gaG9zdC1weXRob24tcGVw
NTE3IGhvc3QtcHl0aG9uLXRvbWxpLCBcCj4gPj4gKyAgICAgICAgICAgICQoMSkpIFwKPiA+PiAr
ICAgICAgICAsIFwKPiA+PiArICAgICAgICAtbSBmbGl0X2NvcmUud2hlZWwsIFwKPiA+PiArICAg
ICAgICAtbSBidWlsZCAtbiAtdyBcCj4gPgo+ID4gICBUaGlzIGlzIGFkZGluZyB3YXkgdG9vIG11
Y2ggY29tcGxleGl0eSB0byB0aGUgaW5mcmEganVzdCB0byBzdXBwb3J0Cj4gPiB0aGVzZSBmb3Vy
IHBhY2thZ2VzLiBJIHRoaW5rIHRoZXJlIGEgYSBjb3VwbGUgb2YgYmV0dGVyIG9wdGlvbnM6Cj4g
Pgo+ID4gLSBkb24ndCB1c2UgcHl0aG9uIGluZnJhIGF0IGFsbCBmb3IgdGhlc2UgcGFja2FnZXM7
IG9yCj4gPiAtIHNldCBIT1NUX1BZVEhPTl9GTElUX0NPUkVfQlVJTERfQ01EUyBldGMuIGluIHB5
dGhvbi1mbGl0LWNvcmUubWs7IG9yCj4gPiAtIGFkZCBhIGZpZnRoIFNFVFVQX1RZUEUgImdlbmVy
aWMiIG9yICJjdXN0b20iIG9yIHNvbWV0aGluZywgd2hpY2gKPiA+IHJlcXVpcmVzICQoMilfQkFT
RV8qIHRvIGJlIHNldCBieSB0aGUgcHl0aG9uLWZsaXQtY29yZS5tazsKPiA+IC0gaW4gdGhlIGlu
ZnJhIGNoYW5nZSBpdCB0byAkKDIpX0JBU0VfQlVJTERfQ01EID89LCBzZXQKPiA+IEhPU1RfUFlU
SE9OX0ZMSVRfQ09SRV9CQVNFX0JVSUxEX0NNRCBpbiBweXRob24tZmxpdC1jb3JlLm1rOyBvcgo+
ID4gLSBhZGQgYSBmaWZ0aCBTRVRVUF9UWVBFICJmbGl0LWJvb3RzdHJhcCIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdCB3aGljaAo+ID4gb25seSBnZXRzIHVzZWQgYnkgdGhlIHByb2JsZW1hdGljIHBh
Y2thZ2VzLgoKSSBhZGRlZCBhIGZsaXQtYm9vdHN0cmFwIFNFVFVQX1RZUEUgYW5kIGlzb2xhdGVk
IHRoZSBzcGVjaWFsIGNhc2luZwpsb2dpYyB0byB0aGF0OgpodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwMzI0MjIzNzE1LjE5NjE0NjEtMS1q
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPiA+Cj4gPgo+ID4gICBUaGUgbGF0dGVyIHR3byBv
cHRpb25zIGhhdmUgbXkgcHJlZmVyZW5jZSBiZWNhdXNlIEkgdGhpbmsgdGhleSBhcmUgdGhlCj4g
PiBjbGVhbmVzdCwgYnV0IGFueSBvZiB0aGVtIGlzIE9LIGZvciBtZS4gVGhlICJnZW5lcmljIiBz
ZXR1cCB0eXBlIGFuZCB0aGUKPiA+IG92ZXJyaWRhYmxlIF9CQVNFX0JVSUxEX0NNRCB3b3VsZCBh
bHNvIHJlcXVpcmUgYW4gdXBkYXRlIGluIHRoZSBtYW51YWwuCj4KPiBJTU8sIHRoZSBzaW1wbGVz
dCBpbXBsZW1lbnRhdGlvbiB3b3VsZCBiZToKPgo+IDEuIEZvciBob3N0LXB5dGhvbi1mbGl0LWNv
cmUgYW5kIGhvc3QtcHl0aG9uLWluc3RhbGxlciwgdXNlCj4gaG9zdC1nZW5lcmljLXBhY2thZ2Ug
YW5kIGRlZmluZSB0aGUgYnVpbGQgYW5kIGluc3RhbGwgY29tbWFuZHMgbWFudWFsbHkuCgpUaGlz
IGlzIG1vcmUgY29tcGxleCBzaW5jZSB3ZSBvbmx5IG5lZWQgdG8gc3BlY2lhbCBjYXNlIGEgZmV3
IHRoaW5ncy4KCj4KPiAyLiBGb3IgZXZlcnkgb3RoZXIgcGFja2FnZSB3aG9zZSBTRVRVUF9UWVBF
IGlzICJmbGl0IiwgaGF2ZSBpdCBkZXBlbmQgb24KPiBqdXN0IGhvc3QtcHl0aG9uLWZsaXQtY29y
ZSBhbmQgaG9zdC1weXRob24taW5zdGFsbGVyLCBhbmQgYnVpbGQgd2l0aAo+ICJweXRob24gLW0g
ZmxpdF9jb3JlLndoZWVsIi4gSW4gb3RoZXIgd29yZHMsIGRvbid0IHVzZQo+IGhvc3QtcHl0aG9u
LXB5cGEtYnVpbGQuCgpUaGlzIGlzIG5vdCByZWNvbW1lbmRlZCBieSB1cHN0cmVhbSBBRkFJVSwg
InB5dGhvbiAtbSBmbGl0X2NvcmUud2hlZWwiIGlzCm9ubHkgc3VwcG9zZWQgdG8gYmUgdXNlZCBm
b3IgaW5pdGlhbCB0b29sY2hhaW4gYm9vdHN0cmFwcGluZyBhcyBpdCdzCm5vdCBhIGdlbmVyaWMK
cGVwNTE3IGJ1aWxkIGZyb250ZW5kLgoKPgo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGFueSBh
ZHZhbnRhZ2VzIGluIHVzaW5nIHB5cGEtYnVpbGQgb3ZlciBqdXN0Cj4gcnVubmluZyBmbGl0X2Nv
cmUud2hlZWwgZGlyZWN0bHksIGFuZCBkcm9wcGluZyBpdCB3b3VsZCByZWR1Y2UgdGhlCj4gbnVt
YmVyIG9mIHBhY2thZ2VzIHRoYXQgbmVlZCBzcGVjaWFsIGhhbmRsaW5nIGFuZCBzaW1wbGlmeSB0
aGUKPiBkZXBlbmRlbmN5IHRyZWUuCgpXZSB3aWxsIG5lZWQgYSBmdWxsIHBlcDUxNyBidWlsZCBm
cm9udGVuZCBhbnl3YXlzIHNvIHRoaXMgd291bGRuJ3Qgc2ltcGxpZnkKYW55dGhpbmcgSU1PLgoK
Pgo+Cj4gPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRob24tZmxp
dC1jb3JlLm1rCj4gPj4gYi9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29y
ZS5tawo+ID4+IGluZGV4IDBlMDU4YTFmMTcuLmQyMDZhNzJmODIgMTAwNjQ0Cj4gPj4gLS0tIGEv
cGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUubWsKPiA+PiArKysgYi9w
YWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5tawo+ID4+IEBAIC04LDYg
KzgsNiBAQCBQWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04gPSAzLjcuMQo+ID4+ICAgUFlUSE9OX0ZM
SVRfQ09SRV9TT1VSQ0UgPSBmbGl0X2NvcmUtJChQWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04pLnRh
ci5nego+ID4+ICAgUFlUSE9OX0ZMSVRfQ09SRV9TSVRFID0KPiA+PiBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMTUvZDEvZDg3OThiODNlOTUzZmQ2Zjg2Y2E5YjUwZjkz
ZWVjNDY0YTkzMDViMDY2MTQ2OWM4MjM0ZTYxMDk1NDgxCj4gPj4KPiA+PiAgIFBZVEhPTl9GTElU
X0NPUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4+IC1QWVRIT05fRkxJVF9DT1JFX1NFVFVQ
X1RZUEUgPSBwZXA1MTcKPiA+PiArUFlUSE9OX0ZMSVRfQ09SRV9TRVRVUF9UWVBFID0gZmxpdAo+
ID4KPiA+ICAgVGhpcyBtZWFucyB0aGVyZSdzIG5vIHBhY2thZ2UgYW55IG1vcmUgdGhhdCB1c2Vz
IHBlcDUxNyBzZXR1cCB0eXBlLiBEbwo+ID4geW91IHRoaW5rIGl0J3MgZXZlciBnb2luZyB0byBi
ZSB1c2VkIGFnYWluPyBPciBjYW4gd2UgcmVtb3ZlIGl0IGFsdG9nZXRoZXI/Cj4KPiBJIHRoaW5r
IHB5dGhvbi1zZXR1cHRvb2xzIGNvdWxkIGJlIGEgcG90ZW50aWFsIHVzZXIgb2YgdGhpcywgaWYK
PiBweXRob24tcHlwYS1idWlsZCBldmVyIGJlY29tZXMgYnVpbGRhYmxlIHdpdGhvdXQgc2V0dXB0
b29scyAod2hpY2ggaXQKPiB2ZXJ5IHdlbGwgbWlnaHQpLgoKRnJvbSBteSB1bmRlcnN0YW5kaW5n
IHVwc3RyZWFtIGludGVuZHMgdG8gbWlncmF0ZSBweXRob24tcHlwYS1idWlsZCB0byBhIGZsaXQK
YmFzZWQgYnVpbGQgaW4gdGhlIGZ1dHVyZS4gQXQgdGhhdCBwb2ludCBzZXR1cHRvb2xzIGNvdWxk
IGl0c2VsZiB1c2UKdGhlIGdlbmVyaWMgcGVwNTE3ClNFVFVQX1RZUEUgc2luY2UgaXQgdXNlcyBh
IGxvY2FsIHBlcDUxNyBidWlsZCBiYWNrZW5kLgoKPgo+IC1Sb21hbi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
