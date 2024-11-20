Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34549D6E2AF
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 04:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A33403FC;
	Wed, 20 Nov 2024 04:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgGCbF_c8ZKE; Wed, 20 Nov 2024 04:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B305E403C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B305E403C3;
	Wed, 20 Nov 2024 04:36:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 657BB27EB
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 04:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 515254038D
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 04:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQXkALHrr0eZ for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 04:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4D5740355
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D5740355
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4D5740355
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 04:36:48 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 64D6F44102F;
 Wed, 20 Nov 2024 06:33:06 +0200 (IST)
To: Vincent Jardin <vjardin@free.fr>
Cc: <buildroot@buildroot.org>
In-Reply-To: <19345aec570.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
 (Vincent Jardin's message of "Tue, 19 Nov 2024 19:32:02 +0100")
References: <20241119014432.46926-1-vjardin@free.fr>
 <20241119015957.47737-1-vjardin@free.fr> <874j43g4o8.fsf@tarshish>
 <ndlcpty56hqzkhkhh2ohfdh2424cujwzd7xrm46uf6yweiejwi@72xjgnfara2r>
 <87mshvdudr.fsf@tarshish>
 <19345aec570.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 06:36:43 +0200
Message-ID: <87h682ed2c.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1732077186;
 bh=2qGGmixc5DvlLePVPNgFkWcQWbNBvQCBD+vOhqyyNzk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f4fAGk3Hq5+TJu4/ZfCl1StguoNMH+ymCjWweGGzA9McM59P7mm1rCzIq1ja7U0sb
 2mwk2d3J47oL7tieTY3vAoVCtjWj0cipiko24vhR3y3bh7jpQ5l5YTBxhJhsHY3uCZ
 HhMD+2fwIQacCyQ1lKgauqOKtPUzNaYAs7zrE81Y86NCctnzrspspoQZLqcLdcmHwa
 mO/xgPKGsvLG92/xclbD/8WmAnt2D9DYfF0NHopiHYLnU79jjN2m0IWJ59nZYH2dtT
 Gmf0DjMrcWcYAsFzmJE4WSKQzKx0V9w4FroRJmwgEbc00nlQONuYxoWsJnK11sP0N+
 zQp1PM2f1+bsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=f4fAGk3H
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKCk9uIFR1ZSwgTm92IDE5IDIwMjQsIFZpbmNlbnQgSmFyZGluIHdyb3RlOgo+
IExlIDE5IG5vdmVtYnJlIDIwMjQgMTg6MDg6MDMgQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5j
by5pbD4gYSDDqWNyaXQgOgo+Cj4gIEhpIFZpbmNlbnQsCj4KPiAgT24gVHVlLCBOb3YgMTkgMjAy
NCwgVmluY2VudCBKYXJkaW4gd3JvdGU6Cj4KPiAgT24gVHVlLCBOb3YgMTksIDIwMjQgYXQgMDc6
NDI6NDdBTSBVVEMsIEJhcnVjaCBTaWFjaCB3cm90ZToKPgo+ICBJIHRoaW5rIHRoaXMgc2hvdWxk
IGRlcGVuZCBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMuIE90aGVyIEMKPiAgbGlicmFyaWVz
IGRvIG5vdCBwcm92aWRlIE5TUyBmdW5jdGlvbmFsaXR5LiBJdCBsb29rcyBsaWtlIHRoaXMgd29u
J3QKPiAgZXZlbiBidWlsZCB3aXRob3V0IGdsaWJjIGhlYWRlcnMuCj4KPiAgVGhhbmtzLCBkb25l
IHdpdGhpbiB0aGUgbmV3IHVwZGF0ZS4KPiAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MTExOTE2MzAyNS41NDg5OC0xLXZqYXJkaW5AZnJl
ZS5mci8KPgo+ICBUaGFua3MgZm9yIHRoZSBuZXcgaXRlcmF0aW9uLgo+Cj4gIEkgZ3Vlc3MgeW91
IG1pc3NlZCBteSBzZWNvbmQgY29tbWVudCBvbiB5b3VyIG9yaWdpbmFsIHBhdGNoLCByZWdhcmRp
bmcKPiAgTWFrZWZpbGUuCj4KPiBTb3JyeS4gCj4KPiBUb28gbWFueSBwYXRjaGVzIHdlcmUgbmVl
ZGVkIHRvIGZpeCBpdC4gU28gc2luY2Ugd2UganVzdCBuZWVkIHRvCj4gY29tcGlsZSBhIGMgZmls
ZSwgSSBkaWQgcHJlZmVyIG5vdCB0byB1c2UgaXQuIEkgZG8gbm90IHVuZGVyc3RhbmQgdGhlCj4g
YmVuZWZpdCBvZiBwYXRjaGluZyBpZiBpdCBpcyBub3QgbmVlZGVkLgoKVGhlIC5tayBmaWxlIGNv
bW1lbnQgY3VycmVudGx5IHNheXMgIm5vIGNvbmZpZ3VyZS9NYWtlZmlsZSIuIEl0IHNob3VsZApz
YXlzIHNvbWV0aGluZyBsaWtlICJXZSBkb24ndCB1c2UgTWFrZWZpbGUgYmVjYXVzZSAuLi4iLgoK
YmFydWNoCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9vTy0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAgLSBi
YXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50a29z
LmNvLmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
