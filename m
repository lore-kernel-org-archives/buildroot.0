Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9387C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 13:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F6F4023B;
	Wed, 12 Jan 2022 13:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SPpZrMZBN7Z; Wed, 12 Jan 2022 13:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450AE40A1F;
	Wed, 12 Jan 2022 13:02:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 215721BF20B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C36E83E7D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lakfEltJpiUA for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 13:02:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFC8883E7B
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:02:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o6so9732270edc.4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 05:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b3C7SFnNxfnePiBaRJxX41h0TEjuxQJ9RR7WGhODemM=;
 b=gohH2KsnLBGtcDbnhFVrkT9Ug5q/+NA8zTN21iz4leTRPHB1grcJXizYSkDpIw2Y6g
 ccnjioOAjqsOdD67uvv7JYRN82Ekm5kIqPSAtGBsq8PdIG0gB7Dja8E8jMoQFuDA5e6i
 IZgUwxdOCkSvp1Bv0MAWWEhkKZ9FRAqFKuowKXxx7SSbw1T/celDr4M3UWUdWeOwRc1H
 0e57c4B/6CCwcITkInlgnbPEweuY1h35qn+S2mRf1PSVSKBpVHNU3EHWJqyTiIaLFRvp
 K/PowRmGuDUKUfvHKEhrssG029uPJGroKYSoI34BcR6hw8Cn0FIWQvg+Rf8UNgMA0ChU
 ZcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=b3C7SFnNxfnePiBaRJxX41h0TEjuxQJ9RR7WGhODemM=;
 b=gEzMcVue8o4ekUGs0Oc9wqqgEq1G8Az6Jw60/+CkUG5qInIVh2y1GNlDykMLPib9Qy
 IBjgvIj0ch5ZOCtEtbh678E40hjpZ7ux31E3bQtmZat0XiSiygEKLf9j22lDID6B4zfx
 ydkayD0yNGKIX4jSYAV9+R1f8AQXlOwptIHZAJk+JH7RMepJDAp+GA8vdIOprgeL9AbJ
 02uKNavalzKBzAr8xN+V68WMJSkP0xXSaC4/tzX7Qxz3mvWPzTABYpkx3T2i118GcZ06
 UQyDVxoXezDtMpKsjT1VPDQPgi2H+h++a89f0qF2W3AVQ3iXeb+YSp/Z4M0y8uwrZi+5
 Q5yg==
X-Gm-Message-State: AOAM532coCMDpS2Qrddz4vVfkvsUVRo+HP1O2P9wFBr2YXbWwWlJ7WCh
 KAhd8ViugKcJUMpNy0Kd3P84Dw==
X-Google-Smtp-Source: ABdhPJwsp0oktxoa8mpEEGWo2Ie2zNfMVI3ILeie0MYSpnq6Qo5sfrfjlPJH7sjp47NNV+jCPEO1/g==
X-Received: by 2002:a17:906:5208:: with SMTP id
 g8mr7426335ejm.634.1641992546779; 
 Wed, 12 Jan 2022 05:02:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qk10sm2682419ejc.116.2022.01.12.05.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:02:26 -0800 (PST)
Message-ID: <38cad31f-a5ed-6054-9fb3-f2abd5edae92@mind.be>
Date: Wed, 12 Jan 2022 14:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>
References: <20220110131624.3639727-1-arnout@mind.be>
 <CADYdroM8rSZHbG-Ot9OJf1JQ54_HXFDUEDcTR6nj+RPOB3BWbQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroM8rSZHbG-Ot9OJf1JQ54_HXFDUEDcTR6nj+RPOB3BWbQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/systemd: add checklist of upgrade
 caveats
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wMS8yMDIyIDE4OjI1LCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IEFtIE1vLiwgMTAuIEphbi4gMjAyMiB1bSAxNDoxNiBVaHIgc2NocmllYiBBcm5vdXQgVmFuZGVj
YXBwZWxsZQo+IChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5kLmJlPjoKPj4KPj4gQnVtcGlu
ZyB0aGUgdmVyc2lvbiBvZiBzeXN0ZW1kIGlzIGEgbGl0dGxlIG1vcmUgY29tcGxpY2F0ZWQgdGhh
biB0aGUKPj4gdXN1YWwgcGFja2FnZSwgYW5kIGl0J3MgZWFzeSB0byBmb3JnZXQgc29tZSBvZiB0
aGUgdGhpbmdzIHRoYXQgbmVlZCB0bwo+PiBiZSBkb25lIC0gYW5kIHRoaXMgaGFzIGhhcHBlbmVk
IHNldmVyYWwgdGltZXMgaW4gdGhlIHBhc3QuCj4+Cj4+IEFkZCBhIGNoZWNrbGlzdCBvZiB0aGlu
Z3MgdG8gd29ycnkgYWJvdXQgd2hlbiB1cGRhdGluZyBzeXN0ZW1kLgo+Pgo+PiBOb3RlIHRoYXQg
dGhlcmUgYXJlIG1hbnkgb3RoZXIgY29tcGxpY2F0ZWQgcGFja2FnZXMgdGhhdCBhbHNvIG5lZWQg
YSBsb3QKPj4gb2YgYXR0ZW50aW9uIHdoZW4gdXBncmFkaW5nLiBIb3dldmVyLCBzeXN0ZW1kIGlz
IGEgcmVhbGx5IGNyaXRpY2FsCj4+IHBhY2thZ2Ugc28gaXQncyBtb3JlIGltcG9ydGFudCB0aGF0
IHdlIGdldCB0aGF0IG9uZSByaWdodCB0aGFuLCBzYXksCj4+IHZhbGdyaW5kLgo+Pgo+PiBDYzog
Tm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KPj4gQ2M6IErDqXLDqW15IFJPU0VO
IDxqZXJlbXkucm9zZW5Ac21pbGUuZnI+Cj4+IENjOiBBZGFtIER1c2tldHQgPGFkdXNrZXR0QGdt
YWlsLmNvbT4KPj4gQ2M6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQp
IDxhcm5vdXRAbWluZC5iZT4KPj4gLS0tCj4+ICAgcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsg
fCAxMiArKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgYi9wYWNrYWdlL3N5
c3RlbWQvc3lzdGVtZC5tawo+PiBpbmRleCAzODExZGJhZTQyLi40ZDgyZDJhYjgxIDEwMDY0NAo+
PiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+PiArKysgYi9wYWNrYWdlL3N5c3Rl
bWQvc3lzdGVtZC5tawo+PiBAQCAtNCw2ICs0LDE4IEBACj4+ICAgIwo+PiAgICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4+Cj4+ICsjIFdoZW4gdXBkYXRpbmcgc3lzdGVtZCwgdGFrZSBjYXJlIG9m
IHRoZSBmb2xsb3dpbmc6Cj4+ICsjIC0gQ2hlY2sgaWYgdGhlIHJlcXVpcmVtZW50cyBoYXZlIGNo
YW5nZWQgKHNlZSBSRUFETUUpLCBpbiBwYXJ0aWN1bGFyCj4+ICsjICAgYXJjaCBhbmQgaGVhZGVy
cwo+PiArIyAtIElmIHllcywgcHJvcGFnYXRlIHRoZSBkZXBlbmRlbmNpZXMgdG8gQlIyX0lOSVRf
U1lTVEVNRAo+PiArIyAtIElmIHRoZSByZXF1aXJlZCBrZXJuZWwgb3B0aW9ucyBoYXZlIGNoYW5n
ZWQsIHVwZGF0ZSB0aGUgQ29uZmlnLmluCj4+ICsjICAgaGVscCB0ZXh0IGFuZCB0aGUgbGlzdCBv
ZiBLQ09ORklHX0VOQUJMRV9PUFQuCj4+ICsjIC0gQ2hlY2sgaWYgdGhlcmUgYXJlIG5ldyBtZXNv
bl9vcHRpb25zLiBNYWtlIHN1cmUgYWxsIG9wdGlvbnMgYXJlIHNldAo+PiArIyAgIGV4cGxpY2l0
bHkgKHVzdWFsbHkgdG8gZGVmYXVsdCB2YWx1ZSkuCj4+ICsjIC0gSWYgdGhlcmUgYXJlIG5ldyBz
ZXJ2aWNlczoKPj4gKyMgICAtIGNyZWF0ZSBuZXcgb3B0aW9ucyBmb3IgdGhlbSAoaWYgdGhleSBy
ZWFsbHkgYXJlIG9wdGlvbmFsKTsKPj4gKyMgICAtIGNyZWF0ZSBhIG5ldyBfVVNFUiBpZiBuZWNl
c3Nhcnk7Cj4+ICsjICAgLSBjcmVhdGUgbmV3IGRpcmVjdGlvbnJ5ICh3aXRoIF9QRVJNSVNTSU9O
UykgaWYgbmVjZXNzYXJ5Lgo+PiAgIFNZU1RFTURfVkVSU0lPTiA9IDI1MC4xCj4+ICAgU1lTVEVN
RF9TSVRFID0gJChjYWxsIGdpdGh1YixzeXN0ZW1kLHN5c3RlbWQtc3RhYmxlLHYkKFNZU1RFTURf
VkVSU0lPTikpCj4+ICAgU1lTVEVNRF9MSUNFTlNFID0gXAo+PiAtLQo+PiAyLjMxLjEKPj4KPiAK
PiBJIHdvdWxkZCBhZGQgdGhlc2U6Cj4gCj4gIyAgIC0gIGRpZmYgc3lzdXNlcnMuZCB3aXRoIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uCj4gIyAgIC0gIGRpZmYgZmFjdG9yeS9ldGMvbnNzd2l0Y2guY29u
ZiB3aXRoIHRoZSBwcmV2aW91cyB2ZXJzaW9uCj4gIyAgICAgIChkZXRhaWxzIGFyZSBvZnRlbiBz
cHJpbmtsZWQgYXJvdW5kIGluIFJFQURNRSBhbmQgbWFucGFnZXMpCgogIElmIHlvdSB0aGluayBh
IHBhdGNoIGlzIGdvb2QgdG8gZ28gd2l0aCBzb21lIGNoYW5nZXMgYXBwbGllZCwgcGxlYXNlIGFk
ZCAKc29tZXRoaW5nIGxpa2U6CgpXaXRoIHRob3NlIGNoYW5nZXMgYXBwbGllZCwgeW91IGNhbiBh
ZGQgbXkKICBSZXZpZXdlZC1ieTogLi4uCgoKICBJZiB5b3UgcmVwbHkgd2l0aCBqdXN0IGEgZmV3
IGNvbW1lbnRzIChvciB3b3JzZSwgaWYgeW91IGRvbid0IHJlcGx5IGF0IGFsbCksIAppdCdzIGhh
cmQgdG8ga25vdyBmb3IgdXMgYXMgbWFpbnRhaW5lcnMgaWYgd2Ugc2hvdWxkIGNvbnNpZGVyIHRo
ZSBwYXRjaCBhcHByb3ZlZCAKb3Igbm90LgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gYW5k
LCBzb21ld2hhdCBtb3JlIGN5bmljYWw6Cj4gCj4gIyAgIC0gIGRvbnQgYm90aGVyIHdpdGggeC4w
IHZlcnNpb25zCj4gCj4gTm9yYmVydAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
