Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7ABC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 06:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E9F60DFD;
	Thu, 13 Jan 2022 06:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjzbKz_iXrlY; Thu, 13 Jan 2022 06:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E85B60BE6;
	Thu, 13 Jan 2022 06:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 428CF1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 06:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E82884C02
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 06:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwopyiGWHhph for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 06:59:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3881384BFD
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 06:59:52 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id r15so9398049uao.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 22:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fZArVt6PavCwN1bIxTwZS6zDY2SbZ57VTP5XSpSilK0=;
 b=LDQANW1dU0U5cMXcNsuBRIfgj84VsiyTtgjxry6KdOu0WgU3lcfwJJjY5OAW1q0GUJ
 THJAdIXFLp11xwlHeoStTKArCeG2laAAG6y/XcYMCIqZBCMCtKEymblcUn60p0rXciRH
 r2p9c/LprDNcGNQmJOXwtHSUhXa67l/T18FENHNU4AIKKBPGs6glG60KaiRzF+xrpAsi
 KpBirXqBKpHT9SVbQ8LbzZwmIrkHv1ZDlWHnaP5AI/wgVNTVCgsCR1iSFFEHXFPvYWLu
 WxXiOTe2AaHDSiuyNRiqLQfwUmERheR3amcJZ7yGeqb6sYkcC3FKBHxJ9go+d5Z2hgVB
 58Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fZArVt6PavCwN1bIxTwZS6zDY2SbZ57VTP5XSpSilK0=;
 b=v03aAEZN5deqtvW7RSRZpOB51J3hf79HNSL0U8+Z3ejxCYz3Rs29+OIccWdg0Zykrz
 5HkB77dNsmgaOhqde9KKRv2t+6tkoCM2wqhDnCQM8CNR60g2iwNwAAVb+0rZXI5CA7TT
 sepJfMxZ6mouj+PbLTOWDg7d3NZ8/sV09+xsp1rWu/dE/fO67d41XNu48f3KANKVKxQv
 dvmPG4Y84NL7IF1xznDX2tr+N2W9Vzztjk7iFqou9ZAzeDMT97KhH96LfYJiliczyLBF
 fwsg3h8DsQEnORqEi8E0Nz7bKT4PTrQt+lqANbi3BEdKIBTta/nc3/5Qdyy3oL/rgk8l
 0cLw==
X-Gm-Message-State: AOAM533M8pIs3DvFF6ebpJUztgaUXIGPLNGEmlnBHsPHQ92SEJdSa+a9
 ZcI+o4eqlDFlzDW0h/IQksQmra8tUZWWZCHMLxg=
X-Google-Smtp-Source: ABdhPJzXaEREGBIU3ufHK9IqLVPPejD+IqHe0MPueeyJh3+LflZLYI8C+6Dat8RKLDt3C42VrRiGRlHYR2V1mnvVw6U=
X-Received: by 2002:a67:fdcc:: with SMTP id l12mr375237vsq.80.1642057191000;
 Wed, 12 Jan 2022 22:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
 <20220107222613.4124764-3-james.hilliard1@gmail.com>
In-Reply-To: <20220107222613.4124764-3-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 13 Jan 2022 07:57:41 +0100
Message-ID: <CAKcgs2xDH1CZMM2t=RH4uV+c+1AtnJNMPD_UYDvrjkAwRK7a8w@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/5] package/lv2: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbAoKTGUgdmVuLiA3IGphbnYuIDIwMjIgw6AgMjM6MjYsIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAg
REVWRUxPUEVSUyAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgfCAg
MSArCj4gIHBhY2thZ2UvbHYyL0NvbmZpZy5pbiB8ICA4ICsrKysrKysrCj4gIHBhY2thZ2UvbHYy
L2x2Mi5oYXNoICB8ICA0ICsrKysKPiAgcGFja2FnZS9sdjIvbHYyLm1rICAgIHwgMzIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x2Mi9Db25maWcuaW4KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHYyL2x2Mi5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2x2Mi9sdjIubWsKPgo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxP
UEVSUwo+IGluZGV4IGJjNTRhYjU5MGMuLjZjNmU5M2YwODkgMTAwNjQ0Cj4gLS0tIGEvREVWRUxP
UEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTI1NCw2ICsxMjU0LDcgQEAgRjogICAgICAg
IHBhY2thZ2UvZXhmYXRwcm9ncy8KPiAgRjogICAgIHBhY2thZ2UvZ2Vuc2lvLwo+ICBGOiAgICAg
cGFja2FnZS9sdWEtc3RkLWRlYnVnLwo+ICBGOiAgICAgcGFja2FnZS9sdWEtc3RkLW5vcm1hbGl6
ZS8KPiArRjogICAgIHBhY2thZ2UvbHYyLwo+ICBGOiAgICAgcGFja2FnZS9waXBld2lyZS8KPiAg
RjogICAgIHBhY2thZ2UvcHl0aG9uLWFpb2NvbnNvbGUvCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhv
bi1haW9kbnMvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25m
aWcuaW4KPiBpbmRleCA2MTMzZDZjZTMyLi5hNDM5YTQ1NmE0IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTM1OCw2ICsxMzU4
LDcgQEAgbWVudSAiQXVkaW8vU291bmQiCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvbGlic291
bmR0b3VjaC9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvbGlic294ci9Db25m
aWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvbGlidm9yYmlzL0NvbmZpZy5pbiIKPiAr
ICAgICAgIHNvdXJjZSAicGFja2FnZS9sdjIvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJw
YWNrYWdlL21wNHYyL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9vcGVuYWwv
Q29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL29wZW5jb3JlLWFtci9Db25maWcu
aW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHYyL0NvbmZpZy5pbiBiL3BhY2thZ2UvbHYyL0Nv
bmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYWVlYjZk
MDQ1MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2x2Mi9Db25maWcuaW4KPiBAQCAt
MCwwICsxLDggQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xWMgo+ICsgICAgICAgYm9vbCAibHYy
Igo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBMVjIgaXMgYSBwbHVnaW4gc3RhbmRhcmQgZm9y
IGF1ZGlvIHN5c3RlbXMuIEl0IGRlZmluZXMKPiArICAgICAgICAgYSBtaW5pbWFsIHlldCBleHRl
bnNpYmxlIEMgQVBJIGZvciBwbHVnaW4gY29kZSBhbmQgYQo+ICsgICAgICAgICBmb3JtYXQgZm9y
IHBsdWdpbiAiYnVuZGxlcyIuCj4gKwo+ICsgICAgICAgICBodHRwczovL2x2MnBsdWcuaW4vCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHYyL2x2Mi5oYXNoIGIvcGFja2FnZS9sdjIvbHYyLmhhc2gK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmVkMjE2MjBiZWUKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9sdjIvbHYyLmhhc2gKPiBAQCAtMCwwICsxLDQg
QEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgc2lnbmF0dXJlCj4gKyMg
aHR0cHM6Ly9sdjJwbHVnLmluL3NwZWMvbHYyLTEuMTguMi50YXIuYnoyLmFzYwo+ICtzaGEyNTYg
IDRlODkxZmJjNzQ0YzA1ODU1YmViNWRmYTgyZTgyMmIxNDkxN2RkNjZlOThmODJiODIzMGRiZDFj
N2FiMmUwNWUgIGx2Mi0xLjE4LjIudGFyLmJ6Mgo+ICtzaGEyNTYgIDBiMGIwN2Q4NTJlM2NlN2Zh
MDQ5ODZlMTQxZjczMDAxYmQ3ZjI2MDY4Mzk2OGYwYTE5ZTAyZGJjYzQxMzFhYTYgIENPUFlJTkcK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdjIvbHYyLm1rIGIvcGFja2FnZS9sdjIvbHYyLm1rCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41ODliNTE4NTQ1Cj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbHYyL2x2Mi5tawo+IEBAIC0wLDAgKzEsMzIgQEAK
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIGx2Mgo+ICsjCj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtMVjJfVkVSU0lPTiA9IDEuMTguMgo+ICtMVjJfU0lURSA9
IGh0dHBzOi8vbHYycGx1Zy5pbi9zcGVjCj4gK0xWMl9TT1VSQ0UgPSBsdjItJChMVjJfVkVSU0lP
TikudGFyLmJ6Mgo+ICtMVjJfTElDRU5TRSA9IElTQwo+ICtMVjJfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcKPiArTFYyX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZgo+ICtMVjJfSU5TVEFMTF9T
VEFHSU5HID0gWUVTCj4gKwo+ICtMVjJfQ09ORl9PUFRTICs9IFwKPiArICAgICAgIC0tbm8tY292
ZXJhZ2UgXAo+ICsgICAgICAgLS1uby1jaGVjay1saW5rcyBcCj4gKyAgICAgICAtLWNvcHktaGVh
ZGVycwo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9DQUlSTykseSkKPiArTFYyX0RFUEVOREVO
Q0lFUyArPSBjYWlybwo+ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJTTkRG
SUxFKSx5KQo+ICtMVjJfREVQRU5ERU5DSUVTICs9IGxpYnNuZGZpbGUKPiArZW5kaWYKPiArCj4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCR1RLMikseSkKPiArTFYyX0RFUEVOREVOQ0lFUyArPSBs
aWJndGsyCj4gK2VuZGlmCj4gKwo+ICskKGV2YWwgJCh3YWYtcGFja2FnZSkpCj4gLS0KPiAyLjI1
LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpJJ20gT0sg
d2l0aCB5b3VyIHBhdGNoLiBMb29rcyBnb29kIHRvIG1lLgp0ZXN0LXBrZyB1dGlsaXR5IHJlcG9y
dGVkIHR3byBmYWlsdXJlcyB0aG91Z2g6CiAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY1
LXVjbGliYyBbMS82XTogT0sKICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3LWdsaWJj
IFsyLzZdOiBPSwogICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06
IEZBSUxFRAogICAgICAgICAgICAgICAgICAgIGJvb3RsaW4teDg2LTY0LW11c2wgWzQvNl06IE9L
CiAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0YXRpYyBbNS82XTogRkFJTEVECiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNvdXJjZXJ5LWFybSBbNi82XTogT0sKCkkgd2lsbCBs
ZXQgeW91IGFuZCB0aGUgbWFpbnRhaW5lcnMgZGVjaWRlIGlmIHRoZSBwYXRjaCBjYW4gYmUgY29t
bWl0dGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
