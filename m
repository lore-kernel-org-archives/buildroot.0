Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55D9C02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74187410CB;
	Mon,  3 Feb 2025 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgbYU7SYzTJc; Mon,  3 Feb 2025 17:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BA541167
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BA541167;
	Mon,  3 Feb 2025 17:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5320185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C414F605BB
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dc97Z9QNLyoL for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A2BB605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A2BB605AD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A2BB605AD
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:56:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.178]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95iH-1tKe5q2Gmd-00wPtb; Mon, 03
 Feb 2025 18:56:29 +0100
Message-ID: <f2a5d443-ecd7-43dc-a0bf-493294749e7e@gmx.de>
Date: Mon, 3 Feb 2025 18:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>
References: <20250131212420.5956C8678A@busybox.osuosl.org>
 <536f4074-7be7-4c4a-aadf-4d9bf0a028f6@gmx.de>
 <38f38c04-5983-4f05-9045-31d5e86eccc2@mind.be>
 <782533c1-7da0-4d66-9a9c-0dbfa1d009db@gmx.de>
 <CA+h8R2rrLXajnCW0WoOxB-=5dw_3VpsLHWjvLFYvnVEdyFqziw@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CA+h8R2rrLXajnCW0WoOxB-=5dw_3VpsLHWjvLFYvnVEdyFqziw@mail.gmail.com>
X-Provags-ID: V03:K1:FDgZAWoGZTbIr8P+Upf9WrX0RwtCObCYQOCEnWwcSnXLi+pWnyy
 gnTS4Ec4ZbEeQMLQ/9aFCVBLfZFrxzDNj40F1LxqzXkDcii93VNGhwuD/DcdfwsZmnv36kw
 o6OV0jF+IshW1xSwDbcY69hzxoBPcbbqGuoHpmGGwMY+buC6Okc+EOzYdJuUPX0r/OrAela
 rucnIky8A8IGAGs91K3Uw==
UI-OutboundReport: notjunk:1;M01:P0:Q4krOBYkpwQ=;qnE+f2NjX7qakgS3myrE1RYTYIL
 JFDjwfBgjCa6ROw61XcfwQ/ORaMXxlgd68q0P22if25VtibdOwRl9ALqEEPlvoRVoE17jgNSu
 GykjngFFFqJFO/jONV4tjpETMnFPPwjHzB/yn2n2IgwyFUWx9ekWaemfERKfUGocy3jZWEdJu
 9/iA331Andu2uk82li//p3Brw/xkR02mOAAMGV/SUGaL45brvCYEc97jpP9fekt1ZNQ6EUoY4
 DFGG3Z+rJ2dK5p5zVlV2d//TF0IxSHgGuqD7Oe88XuGWTVCo7S6hNo10vMQ9MclUehBDmVqY+
 y+O9FcEX6c5OI9pJVNutRI6eWHWYOBBkDEJLJ+GetKCU2k+YNJ9yc+aKbJDXb0rwpQNZhUMUl
 1oNYhH18jMqBK83ztSeJGhi7DvrAv3a0UqzGy82t+11f0NaRwmlymnLw8o+ZrVhCcRCQIO9AC
 B8FoMphUzU4ICFbth1YRrA374FqxWw7mHblIMwPfdZ+kyqGFO4uxI2bVd0CRVWDAkIh/RI9rd
 P1BpQYsIrh73AOSizz5H9ATCGyzSbdn/mpPhRBBLCMwvQLoDKlS7TbZp7yRvTY37lpVP7MK0b
 Ysv38rZfDn0F/bRL00Lkt9mjlLTJPZc2U09L+Co+sOVsUKsAunotpVAZu3f6ccHyXtyx6AhbF
 yz84J2ZqTVl1Km96jRp0c51rUbhWWh3/hokWnE6KQFHzQMDFv/BWG1nRuir/Vpuy3IzY3P82n
 RtMuU42MdT8ZhImJOR0bzvZnkyuQ9KGdon1CHwIlT78dsozdShWtMWyqnHMuwKtwBASWeJ8BC
 o0JHrM7mTbdp1Dt/FkaC6Jr0EDveIe+7sOeanjaiw+ByCbFLnQu5Q0z5ipcoeIIt2M1ZTTHZ/
 W5wD+rQDjfAv6Z60PUFSox/JI0Z59mo6G5tCj0/gSrUh2eaZINIwj829MRBweSFz4v9QTx1Xo
 h+CVP8Ko3y/T82j6piLDCAq5nBKCwTOojMu9Lfi/rPAouNDARk1o9QVxrcwfeFN5BhqUe55ru
 iYEtLZFdKahMElKu0+BFnnDmSn0vIc9j+yEgq5mTE5oZ87Yfp0gQXWwvWCkKOtOhTSOBhrRrO
 Epk39m3b7FytakMrCt8YFnrLcVyy/hmyc+nwn19U5ZVMDvWRKtdjXLZUOpmkjQpGaKAX6UWd2
 5AuAr1f25BAcWhsGjvbUyKIMF442C7MN0Lc7IA5Gu1O70+eDtbTNZdAmVoom8vHs/hrAqx7C1
 zgqjDx1Fnou1l5k0rXcJSHOedkYv8XwLhw/hcEj8IJiUHDdKSVMZljZy5eMfHL8c7zmGWWuxr
 cJkHMiwWorEoonYb0o+ViAmz+Umr+38BTkh2TsHikKrwnQQDyJfzI9biU18GzR0DNJUqEZU/e
 TZzjEno8170eGXkY3HScmnjU5pzVnWmFgnGDc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738605389; x=1739210189; i=fiona.klute@gmx.de;
 bh=g8IuNNSvhBZHt4U3Uimx8Arra4dXSoOydgdjMmFS3g0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ekQrKG41dRDbmfA5qkkPmApha05nlq1OYrk9WTUAyrpU5r60n/wkH4CLANuBvNgA
 Cqc7nAEhPpUp5nLISXFv9mP6e9jqx0tLEyLvoht/VivrnFDjwhnCJUmMeQtk4OGcm
 kEhYDX+lsqWjRhnBABlUiMHf/9buRtf3RGJhpPiA8tKTYDCQPAT/jx8PoLsYxwgnH
 C8nw+o55s0e100HP7+sRBDUBsDgw7/BKvaOxbsnLsIWa27xjhbKRUXWrI61uJAEoh
 m3pdIMGfwapTVbUUolA6a9xOGK1wgn93/ZiEBEcZcuBDol7pVlPyicp0XSeLRekIj
 H2cDZPmevxcSlcg0ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ekQrKG41
Subject: Re: [Buildroot] [git commit] package/containerd: bump to version
 v2.0.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDMuMDIuMjUgdW0gMTg6Mzggc2NocmllYiBDaHJpc3RpYW4gU3Rld2FydDoKPiBIaSBhbGws
Cj4KPgo+IE9uIE1vbiwgRmViIDMsIDIwMjUgYXQgMzo0NOKAr0FNIEZpb25hIEtsdXRlIDxmaW9u
YS5rbHV0ZUBnbXguZGU+IHdyb3RlOgo+Pgo+PiBIaSBBcm5vdXQhCj4+Cj4+IEFtIDAzLjAyLjI1
IHVtIDExOjU3IHNjaHJpZWIgQXJub3V0IFZhbmRlY2FwcGVsbGU6Cj4+PiBPbiAwMy8wMi8yMDI1
IDExOjM4LCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+
Pj4gY29udGFpbmVyZCBmYWlscyB0byBidWlsZCBmb3IgbWUgYWZ0ZXIgdGhpcyB1cGRhdGUsIHdp
dGggdGhlIGVycm9yCj4+Pj4gbWVzc2FnZSBzYXlpbmcgImxkIiBjYW5ub3QgYmUgZm91bmQsIGxv
ZyBiZWxvdy4gSSBub3RpY2UgdGhhdAo+Pj4+IGhvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgt
bXVzbC9iaW4vIGlzIGFic2VudCBmcm9tIHRoZSBjb25maWd1cmVkCj4+Pj4gcGF0aCwgYW5kIEND
IGFuZCBDWFggYXJlIHNldCBpbiBlbnZpcm9ubWVudCwgYnV0IG5vdCBMRC4KPj4+IFtzbmlwXQo+
Pgo+PiBJdCBsb29rcyBsaWtlIEdvIGFjdHVhbGx5IGZvcmNlcyB0aGF0IGZsYWcsIGJlY2F1c2Ug
Km9sZCogQmludXRpbHMKPj4gdmVyc2lvbnMgaGFkIGEgYnVnIGluIHRoZSBCRkQgbGlua2VyOgo+
PiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMjA0MAo+Pgo+PiBUaGVyZSBp
cyBhIHBlbmRpbmcgdXBzdHJlYW0gcGF0Y2ggdG8gZHJvcCB0aGF0Ogo+PiBodHRwczovL2dvLXJl
dmlldy5nb29nbGVzb3VyY2UuY29tL2MvZ28vKy8zOTExMTUKPj4KPj4gSSdtIHRlc3RpbmcgYSBi
dWlsZCB3aXRoIHRoYXQgcGF0Y2ggcmlnaHQgbm93LCBJJ2xsIHNlbmQgYSBwYXRjaCBmb3IKPj4g
cGFja2FnZS9nby9nby1zcmMgaWYgaXQgZml4ZXMgdGhlIHByb2JsZW0uCj4KPgo+IFRoYW5rcyBm
b3IgbG9va2luZyBpbnRvIHRoaXMuIEkgZGlkIG5vdCBzZWUgdGhpcyBidWlsZCBpc3N1ZSBvbiBt
eSBlbmQuCj4KPiBJIGhhdmUgZ29sZCBpbnN0YWxsZWQgb24gbXkgc3lzdGVtLCB3aGljaCBpcyBw
cm9iYWJseSB3aHkgaXQgd29ya3MgZm9yIG1lLgo+Cj4gV2hlbiBJIGFwcGxpZWQgdGhlIHBhdGNo
IHRoYXQgeW91IHNlbnQgbWUgSSBnZXQgdGhpczoKPgo+IEVSUk9SOiBZb3VyIHN5c3RlbSB1c2Vz
IGJmZC5MRCAyLjQwIG9yIG9sZGVyIHdoaWNoIGhhcyBpc3N1ZXMgd2l0aAo+IGR5bmFtaWMgbGlu
a2luZyBvbiBhYXJjaDY0Cj4gQ29uc2lkZXIgdXBncmFkaW5nIG9yIHN3aXRjaGluZyB0byBiaW51
dGlscy1nb2xkLgpUaGF0IGlzIGV4cGVjdGVkIGlmIHlvdSB1c2UgYSB0b29sY2hhaW4gd2l0aCBv
bGQgQmludXRpbHMsIHdoZXJlIHRoZSBidWcKdGhhdCB3YXMgdGhlIHJlYXNvbiBmb3IgR28gZm9y
Y2luZyB0aGUgR29sZCBsaW5rZXIgaXNuJ3QgZml4ZWQgeWV0LiBBbGwKdGhlIHZlcnNpb25zIGlu
IHBhY2thZ2UvYmludXRpbHMgYXJlIG5ldyBlbm91Z2ggKD49IDIuNDEpLgoKSSdtIG5vdCBzdXJl
IGlmIHRoZXJlJ3MgYSB3YXkgdG8gbWFrZSBhbGwgZXh0ZXJuYWwgdG9vbGNoYWlucyB3b3JrOiBT
b21lCihsaWtlIHRoZSBvbmUgQXJub3V0IHJlcHJvZHVjZWQgdGhlIGJ1ZyB3aXRoKSBkb24ndCBo
YXZlIEdvbGQsIG90aGVycwoobGlrZSB5b3Vycykgc3RpbGwgdXNlIG9sZCBCaW51dGlscy4gSSBn
dWVzcyB3ZSdkIHJlYWNoIHRoZSBiZXN0CnBvc3NpYmxlIGNvbXBhdGliaWxpdHkgaWYgd2UgY2hl
Y2sKCiogaWYgQmludXRpbHMgdmVyc2lvbiA+PSAyLjQxOiBhcHBseSBwYXRjaAoqIGVsaWYgR29s
ZCBpcyBhdmFpbGFibGU6IGRpc2FibGUgcGF0Y2gKKiBlbHNlOiBleGl0IHdpdGggZXJyb3IuCgpU
aGF0J2QgYWRkIHNvbWUgY29tcGxleGl0eSB0aG91Z2gsIG9yIGFyZSB0aGVyZSBhbHJlYWR5IG1l
Y2hhbmlzbXMgdG8Kc2V0L2NoZWNrIHJlcXVpcmVtZW50cyBmb3IgZXh0ZXJuYWwgdG9vbGNoYWlu
cz8KCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
