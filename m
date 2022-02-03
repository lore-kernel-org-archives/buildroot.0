Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381C5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 18:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67EA81521;
	Thu,  3 Feb 2022 18:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qry41t1M1Smo; Thu,  3 Feb 2022 18:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 129B3814B8;
	Thu,  3 Feb 2022 18:49:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 427561BF3AA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D8D7814B7
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BW5ganWYdyBP for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 18:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD2F881491
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 18:49:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id me13so11569588ejb.12
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 10:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=/WWnDtWQQ6OREgNIoQJjPYbbAWP1BPuNdZnVQju5mLc=;
 b=d31kAx+lj42eOHw9aBtY/7CXBfBSrdCbnOLWUkrl89GnbekYlDsdu5js+60Cvdetgt
 P+bVy6SFwbYUqgSuJdQkF+CQlJwz00h7rAuQvqA2HcMnTNIZmAeYbz1aN7Kg9O6XG5EB
 jsdFxAwkZhFfphqXgo8Dk7nxcK54ij+47o9WnmdrcthSZKAtYFysjGfdhOlVsLvRIUS1
 gXuk6UWFcq4JXpBunUJ2s08ixxejjTWbDGhw5sh+OwuCtaNN7edoiEBUoSx6TH0we5cv
 PICP8oglBzmH2xIeiQH0/xA29huVNHehpkVH3p2myeykmKPV0G/dg4VsJMy1Afq4FlN2
 Tnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=/WWnDtWQQ6OREgNIoQJjPYbbAWP1BPuNdZnVQju5mLc=;
 b=dvLkQm+utBN7gfE2lej6gCk0ru5iqCoToXhoyCDokvQpJOqpGMDXDgi/fY2Lc7GodW
 +9BkGafBPcLbJ3D6w7qdpFQMYgzc+ufdIZrC5zj5QJGs7kFkCRC3hIXOehP2g++d3xy0
 VCEiqbBdjOcuPpI4ZEcVDkSqal5rbQPCP5RdAFy89jAqWI55US93luzGRIHzZtegh+yj
 6TQQ3bWqd1rmmhRw+uIqp6klX3Ai8Fa99LIR+ISMO/JL8dR6/g7sdEMUH2c8MckVQE6I
 zzixdsFobfJBLxtIWpoghHTALWMreBV1cpnXemEvKdYdCNsAeNSQSiEecLkpVijrn7jk
 UHtQ==
X-Gm-Message-State: AOAM5329ko54Wt48SI3jvcGGs3oeGXr72gHMrNAPHVgUBbtuUziqFjqk
 PCPNRSH3YXB/h7NzjkFoU26eoQ==
X-Google-Smtp-Source: ABdhPJzdFVSd0cbtwfR4ZvoEMWz84GHPn+/oCnbPrzk2pykSKbodVxZoQHuZoMVYZvhUveHkzDZQuA==
X-Received: by 2002:a17:906:58d0:: with SMTP id
 e16mr30370942ejs.454.1643914159802; 
 Thu, 03 Feb 2022 10:49:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l2sm22306706eds.28.2022.02.03.10.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 10:49:19 -0800 (PST)
Message-ID: <6c85206c-139f-474d-7ca5-5f21fd606d96@mind.be>
Date: Thu, 3 Feb 2022 19:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: ca0 <ca0@protonmail.ch>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
References: <5_xofMlQqIrdAjpopLNCIYCGiqsc2UoXvUQG4GIV5Bd0dY31bw-gZ_0eoD0ix_iW-BI3-5O_RbQESkV3ybUN1zFSLY2r3PAr3ZOfxYOFmrU=@protonmail.ch>
 <ff363cc2-4eab-1b91-1933-d0fbe65aaf48@mind.be>
Organization: Essensium/Mind
In-Reply-To: <ff363cc2-4eab-1b91-1933-d0fbe65aaf48@mind.be>
Subject: Re: [Buildroot] package libldns
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

Ck9uIDAzLzAyLzIwMjIgMTk6NDUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
Y2EwLAo+Cj4gT24gMDMvMDIvMjAyMiAwMzowMSwgY2EwIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+
IEJ1aWxkaW5nIHRoaXMgcGFja2FnZSB3aXRoIG9yYW5nZXBpX3plcm9fZGVmY29uZmlnIHJlc3Vs
dHMgaW4gYW4gdXNlbGVzcyB1c2VyIAo+PiBzeXN0ZW0gYmVjYXVzZSBib3RoIHRoZWUgZmlsZXMg
YXJlIGJsb3duIGF3YXkKPgo+IMKgV2hhdCBpcyAidGhpcyBwYWNrYWdlIj8gVGhlIHN1YmplY3Qg
bWVudGlvbnMgbGliaWRucywgYnV0IHRoZXJlJ3Mgbm8gbGliaWRucyAKPiBwYWNrYWdlIGluIGJ1
aWxkcm9vdC4KCiDCoEFwcGFyZW50bHkgSSBtaXNyZWFkLCBpdCdzIGxpYmxkbnMgd2hpY2ggZG9l
cyBpbmRlZWQgZXhpc3QuCgogwqBJIGRpZCBhIGJ1aWxkIG9mIGl0IGFuZCBpdCBsb29rcyBPSy4u
LgoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCj4KPiDCoFdoYXQgZG8geW91IG1lYW4gd2l0aCAi
Ymxvd24gYXdheSI/Cj4KPj4gLi9vdXRwdXQvdGFyZ2V0L3Vzci9saWIvbGQtbXVzbC1hcm1oZi5z
by4xCj4KPiDCoFRoaXMgZmlsZSBiZWxvbmdzIHRvIHRoZSBtdXNsIHN0YW5kYXJkIEMgbGlicmFy
eSwgYnV0IG9yYW5nZXBpX3plcm9fZGVmY29uZmlnIAo+IGJ1aWxkcyBhIHVDbGliYyBzdGFuZGFy
ZCBDIGxpYnJhcnksIHNvIGl0IHNob3VsZG4ndCBldmVuIGJlIHRoZXJlLgo+Cj4gwqBZb3UgY2Fu
IGNoZWNrIHdoaWNoIGxpYnJhcmllcyBhcmUgbmVlZGVkIGZvciBhbiBleGVjdXRhYmxlIG9yIHNo
YXJlZCBsaWJyYXJ5IAo+IHdpdGggInJlYWRlbGYgLWQgb3V0cHV0L3RhcmdldC8uLi4iLiBBbGwg
dGhlIGxpYnJhcmllcyBtZW50aW9uZWQgdGhlcmUgc2hvdWxkIAo+IGV4aXN0IGluIG91dHB1dC90
YXJnZXQvbGliIG9yIG91dHB1dC90YXJnZXQvdXNyL2xpYi4gSWYgbm90LCBpdCBpcyBpbmRlZWQg
YnJva2VuLgo+Cj4KPiDCoElmIHlvdSB3YW50IG1vcmUgaGVscCwgeW91IHdpbGwgbmVlZCB0byBw
cm92aWRlIGEgd2hvbGUgbG90IG1vcmUgZGV0YWlscy4KPgo+IMKgUmVnYXJkcywKPiDCoEFybm91
dAo+Cj4KPj4gLi9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LW11c2xlYWJpaGYvc3lz
cm9vdC91c3IvbGliL2xkLW11c2wtYXJtaGYuc28uMSAKPj4gPgo+PiBJcyB0aGUgbGRjb25maWcg
aGFja2VyeSBuZWVkZWQgZm9yIGVtYmVkZGVkIHN5c3RlbXMgYW5kIGlzIGl0IHN1cHBvcnRlZCB3
aGVuIAo+PiBjcm9zcyBjb21waWxpbmc/Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
