Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB7C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 13:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C894041786;
	Fri, 16 May 2025 13:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCvs4Gu39adb; Fri, 16 May 2025 13:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A0B4173A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A0B4173A;
	Fri, 16 May 2025 13:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5648D13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4760261047
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTSNXyKxmd11 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 13:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3B3660B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B3660B49
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3B3660B49
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:40:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.126.244]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1uoABE28pQ-00lQJV; Fri, 16
 May 2025 15:40:04 +0200
Message-ID: <4f3b7a04-418b-4563-b556-60c5d6f2c34b@gmx.de>
Date: Fri, 16 May 2025 15:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
 <20250516133236.16e5aa23@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250516133236.16e5aa23@windsurf>
X-Provags-ID: V03:K1:7F7d/ygewi7goVduTbs6YtWYUNxBPeOain5f78C46snQPB8ONDT
 DU6OblnizUAJE6l514Ul3Mer/6YAhmN4ZWb1EowEnUtod7Ci7jKr+34ZG9+MZTrxx5pP/rj
 nCk9ym7gKetZv63aTRqqnWRnXs+mZxtcZ/OFJArLwaJrl2JA5RBsLNVMQUJTzg2LUH8lnGY
 SJhkH4UhNtw921aE8caQg==
UI-OutboundReport: notjunk:1;M01:P0:s76DWiEGKa4=;hcKgfxDmqHB0AFY61DjvKqI4eFp
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747402804; x=1748007604; i=fiona.klute@gmx.de;
 bh=+VjxWAS80q3mg8drtWKfpymQB7lgD9+VgJhS4EWkE3I=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=C5GzBot8V02xE4dyabr6e4suAdzxBTCS/0eHo65qGk6whngaBsvOBbHWgVVkUvUa
 IWK+tB+8gG/52Z9ytLTe18kVMBkhgFA454WV2Ja7t87fM60YQWE+rWDtkVM6aELFB
 NjEoSEi6U9TCNK7fJHQ7h+nZB6w5Y77Q6rfnQKBtUO6MFRLK5QsEdTX10FMWMJ4+B
 QjSTQeCAlLBXljosQToo/B7ELaOQAfIjNuDoGYZw9bJzqdXHZ/9jxRWw3O0JdD3h4
 8z2Jqd2+p+OpfhkKkTrTU5ssAzw8+J4ihpm2eYnadJmrwDwL8Zga4K8BV9RgOGuMO
 Y18g3bnSPAjlmwd3kQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=C5GzBot8
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKQW0gMTYuMDUuMjUgdW0gMTM6MzIgc2NocmllYiBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3Q6Cj4gSGVsbG8hCj4gCj4gT24gVHVlLCAyMiBBcHIgMjAyNSAwOTo0Nzoz
NCArMDIwMAo+IEVsIE1laGRpIFlPVU5FUyB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4gd3JvdGU6Cj4gCj4+IEVsIE1laGRpIFlPVU5FUyAoNCk6Cj4+ICAgIHBhY2thZ2Uv
cnVzdDogZml4IGJvb3RzdHJhcCB3aXRoIFJ1c3TiiaUxLjgzCj4+ICAgIHBhY2thZ2UvcnVzdDog
YnVtcCB0byB2ZXJzaW9uIDEuODYuMAo+PiAgICBwYWNrYWdlL3BrZy1kb3dubG9hZDogc3dpdGNo
IGZyb20gY2FyZ28yIHRvIGNhcmdvMwo+PiAgICBwYWNrYWdlOiB1cGRhdGUgYWxsIGhhc2hlcyBh
ZnRlciBjYXJnbzMgc3dpdGNoCj4gCj4gVGhhbmtzIGEgbG90IGZvciB5b3VyIHBhdGNoZXMsIHdo
aWNoIEkgaGF2ZSBhcHBsaWVkLiBUaGUgbGFzdCBwYXRjaAo+IG5lZWRlZCBhIGZldyBmaXhlcyBh
cyBwYWNrYWdlcyBnb3QgdXBkYXRlZCBpbiB0aGUgbWVhbiB0aW1lLgoKaXQgc2VlbXMgbXkgcGF0
Y2ggdG8gcmVwbGFjZSBkZXByZWNhdGVkIHRoZSAuY2FyZ28vY29uZmlnIFsxXSB0aGF0IHdhcyAK
ZGlzY3Vzc2VkIGluIHRoYXQgdGhyZWFkIFsyXSBoYXMgYmVlbiBtaXNzZWQuIElzIHRoZXJlIGFu
eSBjaGFuY2UgdG8gCnN0aWxsIHNxdWVlemUgaXQgaW4/IFRoZSBwcm9ibGVtIGlzIHRoYXQgaWYg
YXBwbGllZCBzZXBhcmF0ZWx5IGl0J2xsIApuZWVkIGEgc2VwYXJhdGUgdmVyc2lvbiBidW1wIGZv
ciB0aGUgZ2VuZXJhdGVkIGNhcmdvIGFyY2hpdmVzLCBidXQgSSdtIApub3Qgc3VyZSBpZiB0aGF0
J3MgYXZvaWRhYmxlIG5vdyAoYXMgdGhlIGNoYW5nZXMgaGF2ZSBiZWVuIHB1c2hlZCAKYWxyZWFk
eSkuIDotKAoKQmVzdCByZWdhcmRzLApGaW9uYQoKClsxXSAKaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDQyMjEwMjQ1MS4zOTg3NTE1LTEt
ZmlvbmEua2x1dGVAZ214LmRlLwpbMl0gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9v
dC9hODdkNjRmNy1kYzk2LTRmNmYtODI5MS0xNmI5MTZmYTc1YjdAc21pbGUuZnIvVC8jbTNiMGU5
MzM4NGRjN2U4NWYxNjEwZWYwMjJlYzg0YmVlM2RmYWI2MjMKCj4gQWZ0ZXIgY2hlY2tpbmcgd2l0
aCBvdGhlciBCdWlsZHJvb3QgbWFpbnRhaW5lcnMsIHdlIGRlY2lkZWQgdG8gbWVyZ2UKPiB0aGUg
cGF0Y2hlcyBhcyBzdWJtaXR0ZWQsIHdpdGhvdXQgc3F1YXNoaW5nIHRoZW0sIGV2ZW4gaWYgdGVj
aG5pY2FsbHkKPiAiY29ycmVjdCBiaXNzZWN0YWJpbGl0eSIgd291bGQgaGF2ZSByZXF1aXJlZCBz
cXVhc2hpbmcgdGhlbSB0b2dldGhlcgo+IChwYXRjaGVzIDIsIDMsIDQpLgo+IAo+IFRoYW5rcyBm
b3IgeW91ciB3b3JrIQo+IAo+IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
