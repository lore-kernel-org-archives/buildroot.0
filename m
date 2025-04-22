Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F255DC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6275F81CE1;
	Tue, 22 Apr 2025 10:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-MAv1yh_xLy; Tue, 22 Apr 2025 10:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81EC581DE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81EC581DE7;
	Tue, 22 Apr 2025 10:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA33E1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB41B81D16
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C34QDAzvMcT9 for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66DB381CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DB381CD0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66DB381CD0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:30:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.168]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1uGkbG1Anl-005wzT; Tue, 22
 Apr 2025 12:30:11 +0200
Message-ID: <ca62699d-5cde-4072-922b-b83346d42eff@gmx.de>
Date: Tue, 22 Apr 2025 12:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250422074738.821755-1-elmehdi.younes@smile.fr>
X-Provags-ID: V03:K1:QqHi3+mrR/xX1W/vrfEcjZ55wOx1nzpfVr04e9QFzxO8Be50bKW
 cAgNK9LcktVD8Fu+DoVHwMKgyuQlIYvLfWcCJaVAOmoRs+WMLEPrTEzijHWZwvvz8z6M+xw
 TTFGziz0iBdFc3CowFcq6Vl6FK3rg/uV21Pkxz8yQf6990gB73Lq3DM3qgu3tQA3nKa7bOz
 LPnA/XJSIffLIRlshsyQA==
UI-OutboundReport: notjunk:1;M01:P0:8lObYIQwhxM=;pPXf6yFluIE8Jkm12682h+1yiCw
 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
 w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1745317811; x=1745922611; i=fiona.klute@gmx.de;
 bh=2wFLL8NIO6MrSqqmX5zl+So9Wi7CHcvFAO6pQLeuuUg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ocl6+dvWC6TNUu0ze620fTKi0GjH3zEoLcYIoOZ/1vJctloCRu2CxHWRkrzQn+UV
 sXzfVca4ZymBd1YykGdGMR1JngHKAe4bytA9+5U/ehXAh5tKT004Tx7Onp4qVYKWC
 Jat3SpJfdp3t4HVBWJItbnr2XLz6wNAsH+zzVtR3+PrdZbmjg820jzt1bcPP87rCq
 T4kh6nM1su7XgBz4sizXiDVHMBwV+IblP2T9n9UbxCg35SZDNrqz9//UzHM4Cxvfj
 7LAx6Xs2BlUTWVbEBIdHNaonGH0ILByZuFTna1+tf/AIAXnBDOEjVFhAHp2pMt76B
 1BWQ+IyaMBYykJMLsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ocl6+dvW
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

QW0gMjIuMDQuMjUgdW0gMDk6NDcgc2NocmllYiBFbCBNZWhkaSBZT1VORVMgdmlhIGJ1aWxkcm9v
dDoKPiBUaGlzIHBhdGNoZXMgc2VyaWVzIGJ1bXBzIHJ1c3QgdG8gdmVyc2lvbiAxLjg2LjAgYW5k
IHVwZGF0ZXMgYWxsCj4gY2FyZ28tcmVsYXRlZCBwYWNrYWdlcyB0byB1c2UgdGhlIGNhcmZvMyBu
YW1pbmcgc2NoZW1lLgo+IFBhdGNoZXMgMiwgMyBhbmQgNCBzaG91bGQgYmUgc3F1YXNoZWQgaW50
byBhIHNpbmdsZSBjb21taXQsCj4gYXMgdGhleSBsb2dpY2FsbHkgYmVsb25nIHRvZ2V0aGVyLgo+
IEkgdXNlZCBtdWx0aXBsZSBjb21taXRzIG9ubHkgZm9yIGJldHRlciBjbGFyaXR5Lgo+IAo+IEVs
IE1laGRpIFlPVU5FUyAoNCk6Cj4gICAgcGFja2FnZS9ydXN0OiBmaXggYm9vdHN0cmFwIHdpdGgg
UnVzdOKJpTEuODMKPiAgICBwYWNrYWdlL3J1c3Q6IGJ1bXAgdG8gdmVyc2lvbiAxLjg2LjAKPiAg
ICBwYWNrYWdlL3BrZy1kb3dubG9hZDogc3dpdGNoIGZyb20gY2FyZ28yIHRvIGNhcmdvMwo+ICAg
IHBhY2thZ2U6IHVwZGF0ZSBhbGwgaGFzaGVzIGFmdGVyIGNhcmdvMyBzd2l0Y2gKClRlc3RlZC1i
eTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KClRoYW5rcyBmb3Ig
eW91ciB3b3JrIG9uIHRoaXMhCgpJJ3ZlIGp1c3Qgc2VudCBhbm90aGVyIHBhdGNoIHRoYXQgSSB0
aGluayBzaG91bGQgYmUgaW50ZWdyYXRlZCBpbnRvIHRoaXMgCnNlcmllcywgdG8gcmVwbGFjZSBk
ZXByZWNhdGVkIC5jYXJnby9jb25maWcgd2l0aCAuY2FyZ28vY29uZmlnLnRvbWwgaW4gCnRoZSBn
ZW5lcmF0ZWQgYXJjaGl2ZXMgWzFdLiBCeSBtYWtpbmcgdGhhdCBjaGFuZ2UgdG9nZXRoZXIgd2l0
aCB0aGlzIApSdXN0IHVwZGF0ZSB3ZSBjYW4gZ2V0IHJpZCBvZiB0aGUgZGVwcmVjYXRpb24gd2Fy
bmluZyB3aXRoIG9ubHkgb25lIAphcmNoaXZlIHZlcnNpb24gKGFuZCBwYWNrYWdlIGhhc2hlcykg
YnVtcC4KCkJlc3QgcmVnYXJkcywKRmlvbmEKClsxXSAKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDQyMjEwMjQ1MS4zOTg3NTE1LTEtZmlv
bmEua2x1dGVAZ214LmRlLwoKPiAgIHBhY2thZ2UvYWFyZHZhcmstZG5zL2FhcmR2YXJrLWRucy5o
YXNoICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS9iYXQvYmF0Lmhhc2ggICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL2R1c3QvZHVzdC5oYXNoICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIHBhY2thZ2UvZXNwZmxhc2gvZXNwZmxhc2guaGFz
aCAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS9lemEvZXphLmhhc2ggICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL2ZkL2ZkLmhhc2ggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIHBhY2thZ2UvaHlwZXJmaW5lL2h5cGVy
ZmluZS5oYXNoICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS9rbW9uL2ttb24uaGFz
aCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL2xpYnplbm9oLWMv
bGliemVub2gtYy5oYXNoICAgICAgICAgICAgfCAgIDIgKy0KPiAgIHBhY2thZ2UvbmV0YXZhcmsv
bmV0YXZhcmsuaGFzaCAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS9udXNoZWxs
L251c2hlbGwuaGFzaCAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL3BhcnNl
Yy10b29sL3BhcnNlYy10b29sLmhhc2ggICAgICAgICAgfCAgIDIgKy0KPiAgIHBhY2thZ2UvcGFy
c2VjL3BhcnNlYy5oYXNoICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS9w
a2ctZG93bmxvYWQubWsgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdl
L3Byb2NzL3Byb2NzLmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIHBhY2th
Z2UvcHl0aG9uLWJjcnlwdC9weXRob24tYmNyeXB0Lmhhc2ggICAgICB8ICAgMiArLQo+ICAgLi4u
L3B5dGhvbi1jcnlwdG9ncmFwaHkuaGFzaCAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBw
YWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhvbi1tYXR1cmluLmhhc2ggICAgfCAgIDIgKy0KPiAg
IHBhY2thZ2UvcHl0aG9uLW9yanNvbi9weXRob24tb3Jqc29uLmhhc2ggICAgICB8ICAgMiArLQo+
ICAgLi4uL3B5dGhvbi1weWRhbnRpYy1jb3JlLmhhc2ggICAgICAgICAgICAgICAgIHwgICAyICst
Cj4gICBwYWNrYWdlL3B5dGhvbi1ycGRzLXB5L3B5dGhvbi1ycGRzLXB5Lmhhc2ggICAgfCAgIDIg
Ky0KPiAgIHBhY2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5oYXNoICAgICAgICB8ICAg
MiArLQo+ICAgcGFja2FnZS9weXRob24tc2VsZW5pdW0vcHl0aG9uLXNlbGVuaXVtLmhhc2ggIHwg
ICAyICstCj4gICBwYWNrYWdlL3JpcGdyZXAvcmlwZ3JlcC5oYXNoICAgICAgICAgICAgICAgICAg
fCAgIDIgKy0KPiAgIHBhY2thZ2UvcnVzdC1iaW4vcnVzdC1iaW4uaGFzaCAgICAgICAgICAgICAg
ICB8IDEyOCArKysrKysrKystLS0tLS0tLS0KPiAgIHBhY2thZ2UvcnVzdC1iaW4vcnVzdC1iaW4u
bWsgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS9ydXN0LWJpbmRnZW4vcnVz
dC1iaW5kZ2VuLmhhc2ggICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL3J1c3QvcnVzdC5oYXNo
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgIHBhY2thZ2UvcnVzdC9ydXN0Lm1r
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICAgcGFja2FnZS9zZW50cnktY2xp
L3NlbnRyeS1jbGkuaGFzaCAgICAgICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL3RidG9vbHMv
dGJ0b29scy5oYXNoICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIHBhY2thZ2UvdGVhbGRl
ZXIvdGVhbGRlZXIuaGFzaCAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgcGFja2FnZS91ZWZp
c2V0dGluZ3MvdWVmaXNldHRpbmdzLmhhc2ggICAgICAgIHwgICAyICstCj4gICBwYWNrYWdlL3pv
eGlkZS96b3hpZGUuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIDM0IGZpbGVz
IGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
