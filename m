Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9926FCA0EFA
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 07:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5550E42CC7;
	Tue, 26 Aug 2025 07:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qAg50q_B8sg; Tue, 26 Aug 2025 07:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EECF42CBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EECF42CBE;
	Tue, 26 Aug 2025 07:29:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94035CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79F4142CBE
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD1YTtT39KBK for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 07:29:30 +0000 (UTC)
X-Greylist: delayed 325 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 26 Aug 2025 07:29:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 190F942CB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190F942CB9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.10;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 190F942CB9
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:29:29 +0000 (UTC)
Received: from [192.168.0.239] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MlNgx-1u5LmV2HQj-00dd1a; Tue, 26 Aug 2025 09:23:18 +0200
Message-ID: <bd7ba362-3566-4940-bb28-94e5778d8f62@green-communications.fr>
Date: Tue, 26 Aug 2025 09:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Ziegler <br015@umbiko.net>,
 Horst Noecker <horst.noecker@cellomation.de>
Cc: buildroot <buildroot@buildroot.org>
References: <mailman.73751.1756165330.2108631.buildroot@buildroot.org>
 <3a19733885c4da8194cfe95b063323b3@umbiko.net>
Content-Language: en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <3a19733885c4da8194cfe95b063323b3@umbiko.net>
X-Provags-ID: V03:K1:dlWLECXQdbHIJRgTtF2bnrY/K0Zw3Zm8fAymyPKB4dekDCOaMjk
 l/ewZxFicD4/2uFFirX5l2zA8R2gtR+14uJ0NFGPUEkPRSqHN5UX+kn4zrUUdLchmulUDnL
 VHUq511FUwDoSLJHV+eYjqSsZQ3TC+nYT4kWlJYaKvD1c07zTVAPSC5buf2jo4dtvWa/AX6
 4WCF2GIGb1mO2CGQkB6dw==
UI-OutboundReport: notjunk:1;M01:P0:X5kjpQ3KG5w=;4fIcTrdZb4RX3WUp0DPmJTq/qDb
 ozvgBvrc7X1sTc72sk7RhJOs9fXtxSkaUVXUb7dHaBeii4VYTHc1Isms2JXjzK1thUwcvdyAj
 vhO4C4mO70J9TFKiw+c3xns9xTh3AiM028knBQ8sZdtdKO6USIwZ3VWL78nnJGAegES+Z99ky
 GiCc1RRsc3uSWZgAQKnZWJZVwTJnufztGxSDAnnhOf3bfn8PcnGCtUYwEkNxf0OaF9vM79SEa
 mF5VW2pkGVG7q7SpOLWiIr0uK4w/wXMfE4y5pBYiL9TWgygaEPSYjutlggGVUT58JWaQsMjmU
 TBI59O03gMej1bDFs35Njdnib2x9GkRXfu7SBOKHr0xCc+AKMRG3h0zgXP9PTTMTqxH8NBw6K
 pcS6Io6VVoozsTtqoWf/5JcQYRwhfdwlk1is+rw0oYV4G5wVsSa8zBvgSTV/zo4uHGsteteRq
 EfGNHIRuDO524rjKxpufwzE7jq+L1AmLq1c0mWK/zoXx/VlDgrLqco4k2VweC4YqEs6Qv8Tou
 gcjyW0Sy88Ec5BOKC+FB3y1OafaSaeWqNWLQYy2MUWdVpzM3pNp/FAPNe8DyPrBnZKN9W1x9j
 KUIUuvCyyW5b3WdJRKivQeqvbg5jwMa4YQ/NirK8EfRlLXrUCvmERA2+X2jvQPKzWLFjFa3Nz
 7/4u+7fZ1fUkevc46CesZxWKteDvt2E9t2muGLSEG1NMpeTq625rhqCT1mR/W3hzamUnAq1M6
 ba/LrcP4WBF0iytMT+1g/YSITx3LDvDLia7XDWSJqPVhwPAi4kbrrSq3BfjNs5SNVVmIyOa4b
 95m8I5LEO/sUlPAG70sElh9uMiPfGhp2ciOg8kn3RwrTlQLKkj2hy82BtsExssViw1pjgbjQr
 R2QV2cwWEieoz3Xb5ndeZklFkA+unRmylZZ1BpbUJABOZCj3tjpwQIsyRwCgolPkI4FqP73ju
 zl+co48QZx2F+rXh2MFybI/PzUhXUBsNGnPjPOE+ftqglm+1tMRVwRA5LV411TQWLuVyln8TE
 SSkugxSYVyb+iSkbuo3tPj55rCmo521FKaLcTPaSyQWnRQKxWasWbNybUmUSzb4fH96UMAPTW
 0q476+rZZQhbgIMQrdHVY3E4YK068qNto9le0ogC+JRHwb1Ll/7hND2pu1n1vBz3IGASlLGxk
 qMEh2rRWnwystvQ0NHUhcrYLAXFJ1fSztLeAvexj7aevpRyq5NEBaQM8JKWuNh6HKIuee1eDX
 p5SJBd8/sVRqeZA9jlCG3wgqIGSg4lZ0YZYVXOxodiFFNRa3IRiYGjMOcg+lu8wiImmEXJwEf
 2LGZ+kRq40glq67Feq9jWsFQr0FtYkAVEVnBRU+04ASfjxfmEAnjk+f+I944vhSvXoNJROU2c
 9sKc/dVEdX7Y2pO/3ggQlDKKzOsAPGwZM2XGI1AR/Po9Jhu7Bpbg2BbAg08vRYzgHDTymOm+h
 PC8u+QGu8mF64CL/JUFtXuBqRy/I/1VQ4/mZhjSz0enz1Aww0gqiMKsqIVqhatJIjZejU9Uwf
 q+mUxwjjBUQhVOrpC4DUeaIch5rLiT3EtecZjCJpl8ekxRNWixmgEaiGINYRvsp3vFxm7eBUa
 HhfH8UjIBqVO5vl9p6gZBNtdXTvSOnl
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] MariaDB 11 for buildroot
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMDgvMjAyNSAwODo1OSwgQW5kcmVhcyBaaWVnbGVyIHdyb3RlOgo+IEhpIEhvcnN0LAo+
IAo+IE9uIDIwMjUtMDgtMjUgMTc6MzIsIEhvcnN0IE5vZWNrZXIgd3JvdGU6Cj4+Cj4+IERlYXIg
QnVpbGRyb290IGNvbW11bml0eSwKPj4KPj4KPj4gSSdtIHRyeWluZyB0byBidWlsZCBNYXJpYURC
IDExLjQuOCB3aXRoIEJ1aWxkcm9vdCBmb3IgQWFyY2g2NCBmb3IgYQo+PiBSYXNQaTQgLyBDb21w
dXRlIE1vZHVsZSA0Lgo+Pgo+PiBJJ3ZlIGJlZW4gZG9pbmcgdGhpcyBhbGwgdGhlIHRpbWUgYnkg
ZG93bmxvYWRpbmcgdGhlIHNvdXJjZXMsCj4+IGNvbmZpZ3VyaW5nIGl0IHdpdGggY21ha2UtZ3Vp
LCB1c2luZyB0aGUgdG9vbGNoYWluIGJ1aWx0IGJ5IGJ1aWxkcm9vdCwKPj4gYnVpbGQgaXQgYW5k
IHB1dCB0aGUgYmluYXJpZXMsIGxpYnMsIGV0Yy4gaW50byBhbiBvdmVybGF5IGJlaW5nIHRoZW4K
Pj4gcGFja2FnZWQgaW50byB0aGUgaW1hZ2UgYnkgYnVpbGRyb290Lgo+Pgo+PiBUaGF0IHdvcmtl
ZCBmaW5lIGZvciB5ZWFycyAtIGFsc28gd2l0aCBNYXJpYURCIDExLjQueC4gLSBidXQgb25seSBm
b3IKPj4gQXJtMzIgKEFSTXY3YSwgZ251ZWFiaWhmLCBldGMuIGV0Yy4pLiBGb3IgQWFyY2g2NCB0
aGUgb25seSB2ZXJzaW9uIHRoYXQKPj4gd29ya3MgaXMgdGhlIGxhdGVzdCAxMC4xMS4xMS4KPj4K
Pj4gSSd2ZSBhbHNvIHRyaWVkIHRvIGFkYXB0IHRoZSBtYXJpYWRiLXBhY2thZ2UgZnJvbSBidWls
ZHJvb3QgdG8gaGF2ZSBpdAo+PiBidWlsZCBpbnNpZGUgYnkgYnVpbHRyb290IGl0c2VsZi4KPj4K
Pj4gVGhlIGJ1aWxkIGl0c2VsZiB3b3JrcyBmb3IgQXJtMzIgYW5kIEFBcmNoNjQuCj4+Cj4+IEJV
VDogbm8gbWF0dGVyIHdoYXQgSSBkbywgd2hlbiB0cnlpbmcgdG8gc3RhcnQgbWFyaWFkYmQgKGku
ZS4gdGhlCj4+IHNlcnZlcikgaXQgZ2l2ZXMgYSBzZWdtZW50YXRpb24gZmF1bHQgd2l0aG91dCBh
bnkgZnVydGhlciBoaW50IChpbiB0aGUKPj4gbG9nIGZpbGUgaXQgb25seSBzdGF0ZXMgdGhhdCBp
dCBzdGFydGVkIGFuZCBpbW1lZGlhdGVseSBzdG9wcGVkKS4KPj4KPj4KPj4gSWYgYW55Ym9keSBo
YXMgYW55IGNsdWUgdGhhdCB3b3VsZCBiZSBhd2Vzb21lIQo+Pgo+IAo+IFdoaWNoIHN0YW5kYXJk
IGxpYnJhcnkgZG8geW91IHVzZT8gTWFyaWFEQiBpcyBhIEMrKyBwcm9qZWN0IGFuZCB1Q2xpYmMg
Cj4gZG9lcyBub3QgZnVsbHkgaW1wbGVtZW50IHRocmVhZCBsb2NhbCBzdG9yYWdlIG9uIEFhcmNo
NjQsIHdoaWNoIGlzIHVzZWQgCj4gYnkgQysrIGV4Y2VwdGlvbiBoYW5kbGluZy4gQyBjb2RlIHdv
cmtzLCBDKysgY29kZSBkaWVzIHdpdGggU0lHU0VHViBvbiAKPiB0aGUgZmlyc3QgdHJ5L2NhdGNo
IGJsb2NrLiBtdXNsIGZ1bmN0aW9ucyBjb3JyZWN0bHkgYW5kIGdsaWJjIHNob3VsZCB3b3JrLgoK
SXQgaXMgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoYXQgSUlSQzogdWNsaWJjLW5nIGltcGxlbWVu
dHMgdGhyZWFkIGxvY2FsIApzdG9yYWdlLCBidXQgR0NDIGhhcyBvcHRpbWl6YXRpb25zIHRoYXQg
YXNzdW1lcyB0aGF0IHRoZSB0aHJlYWQgbG9jYWwgCnN0b3JhZ2UgaW1wbGVtZW50YXRpb24gd29y
a3MgbGlrZSBnbGliYy4gIEFuZCB1bmxpa2UgZm9yIG90aGVyIAphcmNoaXRlY3R1cmVzIHdoZXJl
IHRoZSByZXF1aXJlbWVudHMgYXJlIHNwZWxsZWQgb3V0wrksIHdoYXQgR0NDIGV4cGVjdHMgCmZy
b20gdGhlIGFybS9hYXJjaDY0IFRMUyBpbXBsZW1lbnRhdGlvbiBpcyBub3QgZG9jdW1lbnRlZC4K
CkFsc28sIGVycm5vIGluIEMgdXNlcyB0aHJlYWQgbG9jYWwgc3RvcmFnZSBhbmQgQzExIHByb2dy
YW1zIGNhbiBhbHNvIHVzZSAKdGhyZWFkIGxvY2FsIHN0b3JhZ2UsIHNvIEMgcHJvZ3JhbXMgYXJl
IG5vdCBpbW11bmUuCgpbMV06IGh0dHBzOi8vdWNsaWJjLm9yZy9kb2NzL3Rscy5wZGYKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
