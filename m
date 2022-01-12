Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 18:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FED84BF5;
	Wed, 12 Jan 2022 18:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjcVjOvLyiiB; Wed, 12 Jan 2022 18:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77EB84C1F;
	Wed, 12 Jan 2022 18:39:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 365F71BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 18:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 255944293B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 18:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vpRL2VLEPbGv for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 18:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D13E94293A
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 18:39:46 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i5so13545100edf.9
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hPis+4hXGHvDvLqRmknviRUayUZCt50pWCB+kyJmNCY=;
 b=T+vDf4/R9r1eXsmWPiPxwUSMRAvTljwGVmqqqeAuztx9TTfPhhr/PxEYc2RheoPxvt
 rBuEIjuuDim9U4DjYYc51gqFHPoDMnNblDk0oK8ZyIZwSVnOCq+wuZnCwZW2Wwj+bIFL
 iU81b38f4x21l7R4MsEo2pISIrZJdcNHq8y800J1gPh+GY9CTzD81tSglTreAz4gw9xW
 jjmFr7ri5gt9uSJAFidL093u+nwL5xLKxJwn0kn94DRWjPDOemXIV2cNx5ykoQZ3d7YQ
 rTAnqakpMdqhAPcjTUht1v3nsVKnfnakBiB6G7v/AwN9q5CLJ2DxK5zV6hccKBu3aPjv
 V88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hPis+4hXGHvDvLqRmknviRUayUZCt50pWCB+kyJmNCY=;
 b=qHyPIYkALjTkS/r0Jznou7LexFTa6dRYC3+lca7fvnHXWDBZkh1MmxOoZFFLG3XHgh
 1hVKP/bvELmiU0IF2Q7lvqyXeZ80UsxRSKh3TFQ2oGQXUJXscKMPhuMhwZJSHs2iTgXU
 P0pFHPxLx5o7dR04+XTGpAznoLQE7Oz638syJCEtJT/918LowLTNOK2BI3Ck3t/7ukfv
 BHRbDJriKIhrBCSnzCRBaL/gs/BsecfmKuM1RVzLd4+nFkVrRSCmEPYy8MTU+entefIX
 6zJFlog0dV6RJDS0zcnzpoO/ym9A2DMftxT71XnW76uR9A/NXu9x30QbMm3oOXDf/Tsm
 mv4g==
X-Gm-Message-State: AOAM531Hm5Wd00gdvxKjDPE4HKJ3l23V1QfERPGNanTYq9SqwVKSOkgG
 30Z8XxwIfF/D0JDOvCDFDjVNpw==
X-Google-Smtp-Source: ABdhPJwK7wYHYl5bygLq6j3eOI1xut5lo0ceQ/g7vXSrZQJfVBGZjBExIJdRKSxaxEAsNWqWPJsqbQ==
X-Received: by 2002:aa7:d4c5:: with SMTP id t5mr608371edr.300.1642012784921;
 Wed, 12 Jan 2022 10:39:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o1sm235634edv.2.2022.01.12.10.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 10:39:44 -0800 (PST)
Message-ID: <077dd60c-f482-da24-1718-7d75688a5f8a@mind.be>
Date: Wed, 12 Jan 2022 19:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20201004224137.193808-1-nolange79@gmail.com>
 <20220112091422.1cd29c1f@windsurf>
 <CADYdroO91V3OkkyZfsKTW9jPfi0rxw6+f+ei=SUUSW7V5+ZkRQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroO91V3OkkyZfsKTW9jPfi0rxw6+f+ei=SUUSW7V5+ZkRQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] skeleton + init: prepare /run/lock and
 adjust compat symlinks
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wMS8yMDIyIDA5OjUzLCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+IAo+IAo+IAo+IFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20gCj4gPG1haWx0bzp0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPj4gc2NocmllYiBhbSBNaS4sIDEyLiBKYW4uIDIw
MjIsIDA5OjE0Ogo+IAo+ICAgICBIZWxsbyBOb3JiZXJ0LAo+IAo+ICAgICBPbiBNb24swqAgNSBP
Y3QgMjAyMCAwMDo0MTozNiArMDIwMAo+ICAgICBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21h
aWwuY29tIDxtYWlsdG86bm9sYW5nZTc5QGdtYWlsLmNvbT4+IHdyb3RlOgo+IAo+ICAgICAgPiBM
aW51eCBkaXN0cm9zIGNoYW5nZWQgL3Zhci9ydW4gYW5kIC92YXIvbG9jayB0byByZXNpZGUgb24g
YW4gdG1wZnMgaW4KPiAgICAgID4gL3J1biBhIGxvbmcgdGltZSBhZ28sIGFuZCBidWlsZHJvb3Qg
c2VlbXMgdG8gYWdyZWUgYnkgcHJvdmlkaW5nIHRoaXMKPiAgICAgID4gdG1wZnMgb24gYWxsIHN1
cHBvcnRlZCBpbml0IHN5c3RlbXMuCj4gCj4gICAgIEkgYW0gbm90IDEwMCUgc3VyZSBidXQgaXQg
c2VlbXMgbGlrZSB0aGlzIHBhdGNoIGhhcyBwb3RlbnRpYWxseSBicm9rZW4KPiAgICAgdGhlIGJ1
aWxkIG9mIHZ0dW4sIHdoaWNoIG5vdyBmYWlscyB3aXRoOgo+IAo+ICAgICAgwqAgL3Vzci9iaW4v
aW5zdGFsbDogY2Fubm90IGNyZWF0ZSBkaXJlY3RvcnkKPiAgICAgJy9ob21lL2dpdWxpb2JlbmV0
dGkvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0wL291dHB1dC0xL3RhcmdldC92YXIvbG9jayc6Cj4g
ICAgIEZpbGUgZXhpc3RzCj4gCj4gICAgIElmIHlvdSBsb29rIGF0IGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC8/cmVhc29uPXZ0dW4lCj4gICAgIDxodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5uZXQvP3JlYXNvbj12dHVuJT4sIHZ0dW4KPiAgICAgdmVyc2lvbiAzLjAuNCByZXN0YXJ0
ZWQgZmFpbGluZyB0byBidWlsZCBvbiBKYW51YXJ5IDEwLCB3aXRoIHRoaXMgZXJyb3IuCj4gCj4g
ICAgIENvdWxkIHlvdSBoYXZlIGEgbG9vayA/Cj4gCj4gICAgIEJlc3QgcmVnYXJkcywKPiAKPiAg
ICAgVGhvbWFzCj4gICAgIC0tIAo+ICAgICBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
PiAgICAgRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+ICAgICBodHRwczov
L2Jvb3RsaW4uY29tIDxodHRwczovL2Jvb3RsaW4uY29tPgo+IAo+IAo+IFNlZW1zIGxpa2UgdGhl
IGlzc3VlIGlzLCB0aGF0IHJ1bi9sb2NrIGlzIG5vdCBleGlzdGluZyB3aGVuIGluc3RhbGxpbmcu
Cj4gQW55dGhpbmcgaW5zdGFsbGVkIHRoZXJlIHdpbGwgYmUgZ29uZSAoYWxyZWFkeSBiZWZvcmUg
dGhpcyBjb21taXQpLCBzbyBpdCdzIAo+IGtpbmRhIHBvaW50bGVzcyB0byBkbyBzby4KCiAgQWgs
IHllcywgdGhlcmUgYXJlIG1hbnkgcGFja2FnZXMgdGhhdCByZXF1aXJlIGEgZGlyZWN0b3J5IGlu
IGEgdG1wZnMgYW5kIHRoYXQgCmNyZWF0ZSBpdCBhdCBidWlsZCB0aW1lIChiZWNhdXNlIHRoZXkg
ZG9udCAia25vdyIgdGhhdCBpdCdzIGdvaW5nIHRvIGJlIGEgdG1wZnMpIAphbmQgYXQgcnVudGlt
ZSAoaW4gdGhlIGluaXQgc2NyaXB0LCB0aHJvdWdoIHRtcGZpbGVzLCBvciBieSB0aGUgYXBwbGlj
YXRpb24gaXRzZWxmKS4KCj4gSSBkb24ndCBrbm93IGhvdyBtYW55IHBhY2thZ2VzIGhhdmUgdGhp
cyBpc3N1ZSwgaW1obyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZml4IAo+IHRoZW0gaW5zdGVhZCBv
ZiBtYWtpbmcgYSBydW4vbG9jayBkaXJlY3RvcnkgZm9yIGJyb2tlbiBwYWNrYWdlcyAodGhhdCB3
aWxsIGdldCAKPiByZW1vdmVkIGxhdGVyKQoKICBXZSdyZSBub3QgZ29pbmcgdG8gcGF0Y2ggcGFj
a2FnZXMganVzdCBmb3IgdGhhdCwgYmVjYXVzZSB1bmF2b2lkYWJseSBzb21lIAp1cHN0cmVhbXMg
YXJlIG5vdCBnb2luZyB0byBiZSByZWNlcHRpdmUuIENyZWF0aW5nIHRoZSBkaXJlY3RvcnkgaXMg
YSBtdWNoIApzaW1wbGVyIHNvbHV0aW9uLgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
