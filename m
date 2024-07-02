Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A0CC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 11:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6997A40010;
	Tue,  2 Jul 2024 11:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7Kyb3wtr1nr; Tue,  2 Jul 2024 11:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CE30400BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CE30400BF;
	Tue,  2 Jul 2024 11:17:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7B9B1BF310
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 11:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0D008207F
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 11:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJjVmqDOsOBv for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 11:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34E028207B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E028207B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34E028207B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 11:17:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.108]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1rvtSZ1kvQ-00jepA; Tue, 02
 Jul 2024 13:17:11 +0200
Message-ID: <1097e54c-e85e-439d-a9d4-461876184294@gmx.de>
Date: Tue, 2 Jul 2024 13:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240629125521.976475-1-fiona.klute@gmx.de>
 <e710e75e-ddca-4d8f-8b62-2cbb2bdb78ed@mind.be>
 <63d7b817-713a-40ad-b6b7-40f5b9830d97@gmx.de>
 <0fda533c-e808-47cc-97ee-5d1b66046f93@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <0fda533c-e808-47cc-97ee-5d1b66046f93@mind.be>
X-Provags-ID: V03:K1:BcTE5zWRcKVri3oCVRtmh3311DtfLZtPsGLLZnIqiyoLXncmidk
 2E7CjqnmnlvARGg5h13NDcZVWjDK2wBor3F3Upgq/ApQwykxwJA6MNOtYdninHMDQ+eTA/S
 3OxIV3Z9cw5Tb/Y0IHp3BBm+h9H1a1bu21ohTIOUMhw2YwnkIThpX7HHO7A99hGZdvwj82Q
 LqSOblmFdzffa54lCjbew==
UI-OutboundReport: notjunk:1;M01:P0:M7jmFQSui1I=;Wtzu81J1efjoC+cXFw4tHUCCLkO
 PbSejpZ7sOZRxjIaljlhXFUYlFz2FdcdJuz0GroE7lxT9SX8j+zpLefGRAM0pflmdne6Rjnyo
 ALesQ4+oTEXOlpnzyezwk3OZvsc2V/K69QiuJivcN1DjcPhs1rXYjVWwkor2FtmHGw05hkJZw
 pP3fASuKJltXjuUt0NGnPMHxYE7eyHeml4JLLroeocDQCiQfSWTZxdXMnIJZmxLh+NfBJWpe3
 0cSEioYSe6miwGwFiBWYdxYyQoaRTiLqmG2uYmYJ7s2rBlcIozX/x6KIA3Oy98LnHwZJvfOee
 7uLOUUzITC0N0fYSZcPws0jWO1DFv6HgAYm2wKUPiPTrb9tsQ/d1rP/os/ZVwq7J0r/2zY0RR
 3x/FtkcMebxLca7UqXjFyze5mnCcH0woMFsUw2jTVBXBwRaq91w5zou50PwJmOps7WOL+TT0o
 /TZFZfFJLcT+DJwVue8u66dhp+I2DgDvIn8nA+4i3Nz+7HZmzrigImek1LOsdUKKqrXb3W8xC
 p3+Fs8W3vc7gOk5WksGD9nGbzbcNtukEAIex1AXfeGLIb19QTOO3iybai9J8rJ4Enyq+gv7P7
 mxLHqz9s1eHqsDo3eggZh6MOLNupxvPtIyZEICP4m0siuLcdh2M5nwfoYhrhMJ326IFTUgNKj
 VRDLjFHDxZr9ZSMOJ6JhRA9LyfubAxN3hHEGE2TqVvwfinbVNE/5fxqm7UnWtZrgc6JbnOLbg
 5ixGZUNwPT7ltddWHQFGKm5vrT3IJjTXy4cE+5lNCWvViDxjidcqmyR1gscpDLutlXVr13ro7
 pxN5bEITp+YkyoAtMrXZVssdc+w6aF84YDu3zXsYT74+c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719919031; x=1720523831; i=fiona.klute@gmx.de;
 bh=qslDi/3KI8PhIiiryjelOUo5B5FwssJg7ZFzFbwr/9s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LVQSCPtZDB5rSKa+nh+vDnwT0lTbssZDOr8RTpGi9fJdJRy4BzQFIzePGqnaiotF
 dVCcPfqxXRY45lzQewoJOWANn/kG5j47XzwKNMkxBsccOpVgvLAbq3QBnRTqKwoZA
 qePt17ntkgKYOOSXtm37UtAMtwzf/0xIpR6hhIKTvm1lWImJ1FLtupxso7mbGWOeT
 5WESizhFR0OXOuO2XZcM5Nukey4zOTbpUAxab1fOchKWKgmNI4kqZ0n+tuZWeIYdz
 p5dS4vdrM41VyKYHgWrN2rCJ59qQXHKOLq/f925oc66uL+aVNhlWdWg/UMNfdk7uo
 2BrvKiwNE16pDxprlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LVQSCPtZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-docker: bump version to
 7.1.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDEuMDcuMjQgdW0gMjM6MzUgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiBPbiAw
MS8wNy8yMDI0IDIwOjA3LCBGaW9uYSBLbHV0ZSB3cm90ZToKPj4gQW0gMzAuMDYuMjQgdW0gMTY6
NTIgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPj4+Cj4+Pgo+Pj4gT24gMjkvMDYvMjAy
NCAxNDo1NSwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+PiBJbXBvcnRhbnQg
dXBzdHJlYW0gY2hhbmdlczoKPj4+Pgo+Pj4+ICogU3VwcG9ydCBmb3IgUHl0aG9uIDMuMTIgaGFz
IGJlZW4gYWRkZWQgKGluIDcuMC4wKS4KPj4+Pgo+Pj4+ICogV2Vic29ja2V0IHN1cHBvcnQgaXMg
bm8gbG9uZ2VyIGluY2x1ZGVkIGJ5IGRlZmF1bHQsIGFuZCB0aHVzIHRoZQo+Pj4+IMKgwqAgZGVw
ZW5kZW5jeSBvbiAid2Vic29ja2V0LWNsaWVudCIgKHNpbmNlIDcuMC4wKS4KPj4+Pgo+Pj4+ICog
QnVpbGQgaGFzIGJlZW4gc3dpdGNoZWQgdG8gaGF0Y2hsaW5nIGFuZCBoYXRjaC12Y3MgKGluIDcu
MS4wKSwgc28KPj4+PiDCoMKgIEJ1aWxkcm9vdCBuZWVkcyB0byB1c2UgcGVwNTE3IGJ1aWxkLgo+
Pj4+Cj4+Pj4gKiBEZXBlbmRlbmN5IG9uICJwYWNrYWdpbmciIGhhcyBiZWVuIHJlbW92ZWQgKGlu
IDcuMS4wKS4KPj4+Pgo+Pj4+IFVwc3RyZWFtIGNoYW5nZWxvZ3M6Cj4+Pj4gaHR0cHM6Ly9naXRo
dWIuY29tL2RvY2tlci9kb2NrZXItcHkvcmVsZWFzZXMvdGFnLzcuMC4wCj4+Pj4gaHR0cHM6Ly9n
aXRodWIuY29tL2RvY2tlci9kb2NrZXItcHkvcmVsZWFzZXMvdGFnLzcuMS4wCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGUrd2l3YUBnbXguZGU+Cj4+Pgo+
Pj4gwqDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuIFNvbWV3aGVyZSBhbG9uZyB0aGUgbWFp
bCBwYXRoLCB0aGUgK3dpd2EKPj4+IHBhcnQgZ290IHN0cmlwcGVkIGZyb20gdGhlIEF1dGhvciB0
YWcsIHNvIEkgZml4ZWQgdGhhdC4KPj4KPj4gVGhhbmtzIGZvciBtZXJnaW5nISBUaGUgZGlmZmVy
ZW5jZSB3YXMgYWN0dWFsbHkgaW50ZW50aW9uYWw6IE15IG1haWwKPj4gcHJvdmlkZXIgdW5mb3J0
dW5hdGVseSBkb2Vzbid0IGRlbGl2ZXIgbWFpbHMgd2l0aCBzdWJhZGRyZXNzaW5nLCBzbyBJCj4+
IHVzZWQgYW4gYXV0aG9yIGFkZHJlc3Mgd2hlcmUgcGVvcGxlIGNhbiBhY3R1YWxseSByZWFjaCBt
ZSwgYW5kIGFkZGVkIHRoZQo+PiBzdWJhZGRyZXNzIHNwb25zb3IgYWNrbm93bGVkZ21lbnQgKGFz
IHN1Z2dlc3RlZCBpbiB0aGUgbWFudWFsKSBvbmx5IHRvCj4+IHRoZSBzLW8tYiBsaW5lLgo+Cj4g
IMKgT2gsIGRhcm4sIHNvIHRoYXQgbWVhbnMgdGhhdCB0aGUgYXV0aG9yIGluZm9ybWF0aW9uIHRo
YXQgZ290IGNvbW1pdHRlZAo+IGlzIHdyb25nIG5vdy4uLiBTb3JyeSEgSSdsbCB0cnkgdG8gZG8g
YmV0dGVyIGluIHRoZSBmdXR1cmUgd2hlbiBtZXJnaW5nCj4geW91ciBwYXRjaGVzLgo+Cj4gIMKg
SWYgdGhlIGdvYWwgd2FzIHNwb25zb3IgYWNrbm93bGVkZ2VtZW50LCB5b3UgY291bGQgaGF2ZSBk
b25lIGl0IGxpa2UKPiB0aGlzOgo+Cj4gIMKgwqAgRmlvbmEgS2x1dGUgKFdpd2EpIDxmaW9uYS5r
bHV0ZUBnbXguZGU+CgpUaGFua3MgZm9yIHRoZSBoaW50ISBXb3VsZCBpdCBtYWtlIHNlbnNlIHRv
IGFkZCB0aGF0IHRvIHRoZSBtYW51YWwKKGRvY3MvbWFudWFsL2NvbnRyaWJ1dGUuYWRvYyk/IFRo
ZSAiU3VibWl0dGluZyBwYXRjaGVzIiBzZWN0aW9uCmN1cnJlbnRseSBtZW50aW9ucyBvbmx5IHN1
YmFkZHJlc3NpbmcgZm9yIHNwb25zb3IgYWNrbm93bGVkZ2VtZW50LgoKQmVzdCByZWdhcmRzLApG
aW9uYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
