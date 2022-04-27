Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 11:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6643683EB9;
	Wed, 27 Apr 2022 11:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jf_KtY27zcz; Wed, 27 Apr 2022 11:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BEA83EA2;
	Wed, 27 Apr 2022 11:53:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F72F1BF3DE
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 11:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D4C260D52
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 11:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id unjEJkSGGh7B for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 11:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A09560B8F
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:53:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w1so2700861lfa.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=welUCDwA5L6Pd0E4ZCmhqnnmKVl6ifMbeirCAOd4iwg=;
 b=fsFN3lePv3afLY422t5Uad4vs/d/YlxdURswLkZ1ldJ7cgwkzwz5DoIWHJ4MdmC153
 kCZ7SPY0AFQ2NITPxUcWrDJfquzeOnm9R9pWPcfuCWUgVbWZ0I2X1igo3odza2fj1Cth
 K6yhSlb0fJXLfdE07A/A6Xz0Xav/HGFZc1jPo8FrEFKB193iMJ8KhK+wvcfhmKuvrTLA
 87wXpuU8x0aEZfo97bThC3JQiiBhkmu8gLXlyupU+/p5goC76/gYLVfiCsiB520Oionj
 sgRxNpvTwS906OTJcb2EQ+VsibWa5aVP6kqCzMrtw9PQTDnfIF0sNsxn3cr5KNjXJOof
 rP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=welUCDwA5L6Pd0E4ZCmhqnnmKVl6ifMbeirCAOd4iwg=;
 b=MhP5jJebl7cYhD1SwZPBcwiSqYeqaCgi+hLN9EMgY/XkkX+7/mbuxA3Tf46FuQvJvj
 MzR50FHdQMIXACyRymLC4I6hIQWKFOJkcDZ8+7DlMnKM+HYrw/mw1oygp4ghOZ2QUE35
 p3bEGDuRDUKjFhJp/pQwI6Kq+rO+cQnFYGMS0lvyViY8nRTuHS6LRsIINROixVG3gVLL
 F+pOo58yvbisuJykIKl9hHAIGQ9s7oxJ3BUWgT2GwD+irX4i1DuLSLAep5Fa2ypNPuWW
 gT2BiFvOS/Qxzz0T8L9fZDThHWomfmIlnl4impdGucq37l8eio+gMbgugGu2qcADFV52
 zI1Q==
X-Gm-Message-State: AOAM530/YUVr2ehYOBWdL8/605PSQEjGlwx9lHPjvPzgwNmn60kcf/DA
 ieRnzi64EQuVFa4rLpmdSCsaCy3YhecVTA==
X-Google-Smtp-Source: ABdhPJy98WLZQwR5JTlEeZ/EMDVSNQmJTy+UyCtR0GcyXRvAR8Ng8pJnDLne/t1MfH56WAUn1IkcOA==
X-Received: by 2002:a17:906:d20c:b0:6f3:9901:bc08 with SMTP id
 w12-20020a170906d20c00b006f39901bc08mr13790502ejz.351.1651059900603; 
 Wed, 27 Apr 2022 04:45:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hh4-20020a170906a94400b006f37c3f476bsm5344037ejb.139.2022.04.27.04.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 04:45:00 -0700 (PDT)
Message-ID: <b45c2342-81d0-3d18-ca1b-5706e5cc4271@mind.be>
Date: Wed, 27 Apr 2022 13:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Jens-Christoph Brendel <jens-christoph.brendel@computec.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <82d17f75-915d-485f-9353-f091fb3576e8.8d5b84c6-3d2e-4c12-b2dd-1cea205060bd.05b36973-3f8d-47c8-982b-7fde04d5179e@emailsignatures365.codetwo.com>
 <PR3PR08MB5593678BA0C11723E9506505C4FA9@PR3PR08MB5593.eurprd08.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <PR3PR08MB5593678BA0C11723E9506505C4FA9@PR3PR08MB5593.eurprd08.prod.outlook.com>
Subject: Re: [Buildroot] press request
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

ICBIaSBKZW5zLUNocmlzdG9waCwKCk9uIDI3LzA0LzIwMjIgMDk6MTUsIEplbnMtQ2hyaXN0b3Bo
IEJyZW5kZWwgd3JvdGU6Cj4gSGVsbG8gZXZlcnlib2R5LAo+IAo+IFdlLCB0aGUgR2VybWFuIExp
bnV4IG1hZ2F6aW5lLCBhcmUgcGxhbm5pbmcgYSBmb2N1cyBvbiBMaW51eCBkaXN0cmlidXRpb25z
IGZvciAKPiB0aGUgSW9UIGluIHRoZSAwNy8yMiBpc3N1ZS4gT25lIG9mIHRoZW0gd2UgaGF2ZSBp
biBtaW5kIGlzIEJ1aWxkcm9vdC4gV2UgYXJlIAo+IHRoZXJlZm9yZSBsb29raW5nIGZvciBhbiBh
dXRob3Igd2hvIGNhbiBpbnRyb2R1Y2UgQnVpbGRyb290IHRvIG91ciByZWFkZXJzIGluIGFuIAo+
IGFydGljbGUuCgogIFNvdW5kcyByZWFsbHkgaW50ZXJlc3RpbmchIEkgdGhpbmsgQnVpbGRyb290
IGNhbiB1c2UgdGhlIHB1YmxpY2l0eS4KCiAgSSdkIGJlIHdpbGxpbmcgdG8gd3JpdGUgc3VjaCBh
biBhcnRpY2xlLgoKPiBTdWNoIGFuIGFydGljbGUgc2hvdWxkIGJlIGZvdXIgdG8gc2l4IHBhZ2Vz
IChhYm91dCA0MDAwIGNoYXJhY3RlcnMgCj4gZWFjaCkgYW5kIGNvdmVyIHF1ZXN0aW9ucyBzdWNo
IGFzOgo+IAo+IC0gV2hhdCBpcyBCdWlsZHJvb3Q/IChtYWluIHB1cnBvc2UsIHRhcmdldCBhdWRp
ZW5jZSwgY29tcGF0aWJpbGl0eSkKPiAKPiAtIFNjb3BlIG9mIHNlcnZpY2VzCj4gCj4gLSBEaWZm
ZXJlbmNlcyBhbmQgc2ltaWxhcml0aWVzIGNvbXBhcmVkIHRvIHNpbWlsYXIgb3BlcmF0aW5nIHN5
c3RlbXMKCiAgRm9yIHRoaXMgcGFydCwgaXQgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgd2hpY2gg
b3RoZXIgZGlzdHJvcyBldGMuIHlvdSdyZSAKZ29pbmcgdG8gaW5jbHVkZSBpbiB0aGF0IGlzc3Vl
LgoKCj4gLSBBZHZhbnRhZ2VzIGFuZCBkaXNhZHZhbnRhZ2VzCj4gCj4gLSBFeGFtcGxlcyBvZiB1
c2UKPiAKPiBXZSBuZWVkIHRoZSB0ZXh0IG5vIGxhdGVyIHRoYW4gSnVuZSAxLiBJdCB3b3VsZCBi
ZSBiZXR0ZXIgaWYgeW91IGNhbiBtYW5hZ2UgdG8gCj4gZGVsaXZlciBhIGZldyBkYXlzIGVhcmxp
ZXIsIGJlY2F1c2UgdGhlbiB3ZSB3aWxsIGhhdmUgbW9yZSB0aW1lIHRvIGRpc2N1c3MgCj4gZGV0
YWlscywgaWYgbmVjZXNzYXJ5LkEgcGxhaW4gdGV4dCBmaWxlIChJU084ODU5LTEsIGFrYSBMYXRp
bjEpIGlzIHBlcmZlY3QuIAo+IElsbHVzdHJhdGlvbnMgKGF0IGxlYXN0IG9uZSBwZXIgcGFnZSkg
c2hvdWxkIGJlIGRlbGl2ZXJlZCBhcyBzZXBhcmF0ZSBpbWFnZSBmaWxlcy4KCiAgRmluZGluZyB1
c2VmdWwvc3VpdGFibGUgaWxsdXN0cmF0aW9ucyBpcyBhbHdheXMgZGlmZmljdWx0Li4uCgo+IFRo
ZSB0YXJnZXQgYXVkaWVuY2UgY29uc2lzdHMgb2YgSVQgcHJvZmVzc2lvbmFscywgZGV2ZWxvcGVy
cywgYWRtaW5pc3RyYXRvcnMgYW5kIAo+IElUIG1hbmFnZXJzLiBTbyB3ZSBkb24ndCBleHBsYWlu
IHRoZSBiYXNpY3MuIE9uIHRoZSBvdGhlciBoYW5kLCB5b3VyIHJlYWRlciBtYXkgCj4gbm90IGtu
b3cgbXVjaCBhYm91dCBCdWlsZHJvb3QuIEltYWdpbmUgYSBwZXJzb24gbG9va2luZyBmb3IgYW4g
b3BlcmF0aW5nIHN5c3RlbSAKPiBmb3IgYW4gSW9UIHByb2plY3QuIFRoZSBhdXRob3Igd2lsbCBn
aXZlIGhlciBhbGwgdGhlIGRldGFpbHMgc2hlIG5lZWRzIHRvIG1ha2UgCj4gYW4gaW5mb3JtZWQg
ZGVjaXNpb24uCj4gCj4gSXMgdGhlcmUgYW55b25lIG91dCB0aGVyZSB3aG8gd291bGQgbGlrZSBh
bmQgaGF2ZSB0aGUgdGltZSB0byB3cml0ZSBzdWNoIGFuIAo+IGFydGljbGUgZm9yIHVzPyBXZSB3
b3VsZCBwYXkgODAgRXVybyBwZXIgcHJpbnRlZCBwYWdlLiBQbGVhc2UgY29udGFjdCBtZSBhdCAK
PiBqZW5zLWNocmlzdG9waC5icmVuZGVsQGNvbXB1dGVjLmRlLgoKICBJJ20gYW5zd2VyaW5nIHB1
YmxpY2x5IGJlY2F1c2UgSSB0aGluayBpdCdzIGJlc3QgaWYgdGhlIEJ1aWxkcm9vdCBjb21tdW5p
dHkgCmFsaWducyBvbiB3aG8gd2lsbCB3cml0ZSB0aGlzIGFydGljbGUuIElmIHRoZXJlIGFyZSBv
dGhlciBjYW5kaWRhdGVzLCB3ZSBjYW4gCmRlY2lkZSB3aG8gaXMgbW9zdCBzdWl0ZWQsIG9yIGNv
bGxhYm9yYXRlIG9uIGl0LgoKICBXb3VsZCBpdCBiZSBhbGxvd2VkIHRvIHB1Ymxpc2ggdGhlIHRl
eHQgb24gdGhlIG1haWxpbmcgbGlzdCBiZWZvcmUgaGFuZCBpbiAKb3JkZXIgdG8gaGF2ZSBzb21l
IHJldmlldyBmZWVkYmFjayBvbiBpdCBmcm9tIHRoZSBjb21tdW5pdHk/IEkgZ3Vlc3MgYW55Ym9k
eSAKd2hvJ3Mgc3Vic2NyaWJlZCB0byB0aGUgbWFpbGluZyBsaXN0IG9yIGNhbiBmaW5kIHRoZSBh
cmNoaXZlcyBpcyBwcm9iYWJseSBub3QgaW4gCnRoZSB0YXJnZXQgYXVkaWVuY2UgYW55d2F5LgoK
ICBJbiBhIHNpbWlsYXIgdmVpbiwgd291bGQgaXQgYmUgYWxsb3dlZCB0byByZXB1Ymxpc2ggdGhl
IHRleHQgKG5vIGVhcmxpZXIgdGhhbiAKQXVndXN0LCBJIGFzc3VtZSkgaW4gYW5vdGhlciB2ZW51
ZSwgZS5nLiBMV04ubmV0PwoKICBBbmQgb24gYSBwZXJzb25hbCBsZXZlbCwgd291bGQgaXQgYmUg
T0sgdG8gaW5jbHVkZSBhIGJveCB0ZXh0IGludHJvZHVjaW5nIApteXNlbGYgYW5kIG15IGVtcGxv
eWVyPwoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gTWFueSB0aGFua3MgaW4gYWR2YW5jZQo+
IAo+IEplbnMtQ2hyaXN0b3BoCj4gCj4gLiAuIC4gLgo+IERpc2NsYWltZXI6IFRoZSByZWNpcGll
bnQgYWNrbm93bGVkZ2VzIHRoYXQgQ29tcHV0ZWMgTWVkaWEgR21iSCBpcyB1bmFibGUgdG8gCj4g
ZXhlcmNpc2UgY29udHJvbCBvdmVyIHRoZSBjb250ZW50IG9mIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0cmFuc21pc3Npb25zIG1hZGUgCj4gdmlhIHRoZSBJbnRlcm5ldC4gQ29tcHV0ZWMgTWVk
aWEgR21iSCBoZXJlYnkgZXhjbHVkZXMgYW55IHdhcnJhbnR5LCB3cml0dGVuIG9yIAo+IGltcGxp
ZWQsIGFzIHRvIHRoZSBxdWFsaXR5IG9yIGFjY3VyYWN5IG9mIGFueSBpbmZvcm1hdGlvbiBjb250
YWluZWQgaW4gdGhpcyAKPiBtZXNzYWdlIGFuZCBhbnkgbGlhYmlsaXR5IG9mIGFueSBraW5kIGZv
ciB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkLCB0aGVyZWluLCBvciAKPiBmb3IgaXRzIHRyYW5z
bWlzc2lvbiwgcmVjZXB0aW9uLCBzdG9yYWdlIG9yIHVzYWdlIGluIGFueSB3YXksIHdoYXRzb2V2
ZXIuCj4gU2l0eiBkZXIgR2VzZWxsc2NoYWZ0IHVuZCBSZWdpc3RlcmdlcmljaHQ6IEbDvHJ0aCAo
SFJCIDE0MzY0KSBHZXNjaMOkZnRzZsO8aHJlcjogCj4gQ2hyaXN0aWFuIE3DvGxsZXIsIFJhaW5l
ciBSb3NlbmJ1c2NoIFVtc2F0enN0ZXVlci1JZGVudGlmaWthdGlvbnNudW1tZXI6IERFODEyNTc1
Mjc2Cj4gSW5mb3JtYXRpb25lbiB6dXIgRGF0ZW52ZXJhcmJlaXR1bmcgdW5kIERhdGVuc2NodXR6
OiAKPiBodHRwczovL3d3dy5jb21wdXRlYy5kZS9kYXRlbnNjaHV0eiA8aHR0cHM6Ly93d3cuY29t
cHV0ZWMuZGUvZGF0ZW5zY2h1dHovPgo+IC4gLiAuIC4KPiAKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
