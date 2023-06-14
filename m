Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FADEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3113611BF;
	Wed, 14 Jun 2023 09:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3113611BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKcLiQn0AGTw; Wed, 14 Jun 2023 09:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D246115C;
	Wed, 14 Jun 2023 09:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D246115C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 822FD1BF860
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5955A81767
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5955A81767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3DMb9dtaXwt for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:13:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3AFE8175C
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3AFE8175C
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:13:43 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJn8J-1qOZ6g0fyT-00K89o; Wed, 14 Jun 2023 11:13:39 +0200
Message-ID: <f8d5b3ba-d44a-9e42-60d8-c23840fa8513@vivier.eu>
Date: Wed, 14 Jun 2023 11:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: fr
To: Joel Stanley <joel@jms.id.au>
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-2-laurent@vivier.eu>
 <CACPK8Xejkfdh11afgdBzkX=AA=SnXjVDCJRa3eB3kKcE52gQ5A@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CACPK8Xejkfdh11afgdBzkX=AA=SnXjVDCJRa3eB3kKcE52gQ5A@mail.gmail.com>
X-Provags-ID: V03:K1:Zxop2c/B5jsAQVUgevnN0YYqK9JLGV4Av9KGmll0cZ5jRSUOr/f
 EGZEiw7NlZqFK37MERy5u4J/H1FiGyulAN6tq12pNk4Tsm4U2FNU9wX8uXHoFugsusWqhnM
 ri8HmKKIUmvJo180czAVAOzZA+XHleEe69nLpj15+bVPycwsICt9Iq3vyU4I9XR/7mzsWuV
 gy+eN4riyeQxEeYbRCmIQ==
UI-OutboundReport: notjunk:1;M01:P0:fhn/FOqbsXc=;Qd/1nr+daY7xH1kpS9w/PAZdrmZ
 9nT7NmxXwq0iAmnPOSvkBHbqfjMnfhkYLHsvZRLGRWRhE0q1nLpJU47c6YCn/6iAZPbivwwOc
 fL5VAnMRvRqLZQsH3J8w8WIdVYee6tUwGr+0dmvZ9YCQG20H3SO/kjwF3XRrmvPapNMwDru7E
 UiCQx3V0W7mTET/KFP9Hb9Ob6myBh2AGucOTW+n2Z9UxiHzPdomgLs06BveaclFHnsXA2vwds
 Zee1oo1BSdwso00zlo0QG0qnldV/P6udamUZshcPSs9QLNefbYKQByKjKYyh1SJ7DxJrzK2bl
 9CYUhMTKCMfAOcCh7WO+MnqIg6E9BMHChRo9jzESt2xl2qal0YT7s4/fL6eo5y1rm0THo8xrz
 6a1ljAqmjkFN0kXVVEZijF5dM7VB4USlICcXTHyh6OmBChHXbWWoeRQmShpmqX2jp2n36W+gd
 w3Zq9jNF9bbxOM6odDkklaXEtY0TNDO/2GHUiNK7SoZcgobxwyvtjrrpbvdhXyMOJckiDSVPz
 pcKiJX1AkORYlrg+FDX6i3pOI+aqDQsipUKSTPQm6xvqocOl5C9d3g7nxlmtJzhwe3sUgurBH
 3GlgZgDF5hLrz9EgiXCpCR6kOq49WxuKtfa+ZFChJn0eWaRCalScTQtNL27wBCk1B1NGp+rfS
 8rFqlgvUzndKVMZvkmgS8TPFXM1DbG0ObKP1ZaQ4ww==
Subject: Re: [Buildroot] [PATCH v14 1/4] petitboot: add pb-discover daemon
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTQvMDYvMjAyMyDDoCAwMzo1NywgSm9lbCBTdGFubGV5IGEgw6ljcml0wqA6Cj4gT24gVHVl
LCAxMyBKdW4gMjAyMyBhdCAxMDo1MSwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1
PiB3cm90ZToKPj4KPj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1Pgo+PiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4K
Pj4gLS0tCj4+ICAgcGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIgfCA1NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9v
dC5tayAgIHwgIDQgKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCj4+
Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BldGl0Ym9vdC9TMTVwYi1kaXNjb3ZlciBiL3BhY2th
Z2UvcGV0aXRib290L1MxNXBiLWRpc2NvdmVyCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uODMzMDVlZDllYThhCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
cGFja2FnZS9wZXRpdGJvb3QvUzE1cGItZGlzY292ZXIKPj4gQEAgLTAsMCArMSw1NCBAQAo+PiAr
IyEvYmluL3NoCj4gCj4gRG9lcyB0aGlzIG5lZWQgYSBsaWNlbmNlIHN0YXRlbWVudD8KCk5vbmUg
b2YgdGhlIGRhZW1vbiBzY3JpcHRzIEkgaGF2ZSBjaGVja2VkIGluIHRoZSBwYWNrYWdlIGRpcmVj
dG9yeSBoYXMgYSBsaWNlbmNlIHN0YXRlLCBzbyBJIGd1ZXNzIG5vLgoKPiAKPiBSZXZpZXdlZC1i
eTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KClRoYW5rcywKTGF1cmVudAoKPiAKPj4g
Kwo+PiArREFFTU9OPSJwYi1kaXNjb3ZlciIKPj4gK1BJREZJTEU9Ii92YXIvcnVuLyREQUVNT04u
cGlkIgo+PiArTE9HRklMRT0iL3Zhci9sb2cvJERBRU1PTi5sb2ciCj4+ICsKPj4gK1BCX0RJU0NP
VkVSX0FSR1M9Ii1sICRMT0dGSUxFIgo+PiArCj4+ICtpZiBbICIkKHBiLWNvbmZpZyBkZWJ1Zyki
ID0gImVuYWJsZWQiIF0gOyB0aGVuCj4+ICsgICAgICAgUEJfRElTQ09WRVJfQVJHUz0iJFBCX0RJ
U0NPVkVSX0FSR1MgLS12ZXJib3NlIgo+PiArZmkKPj4gKwo+PiArc3RhcnQoKSB7Cj4+ICsgICAg
ICAgcHJpbnRmICdTdGFydGluZyAlczogJyAiJERBRU1PTiIKPj4gKyAgICAgICAjIHNoZWxsY2hl
Y2sgZGlzYWJsZT1TQzIwODYgIyB3ZSBuZWVkIHRoZSB3b3JkIHNwbGl0dGluZwo+PiArICAgICAg
IHN0YXJ0LXN0b3AtZGFlbW9uIC1TIC1xIC1iIC1wICIkUElERklMRSIgLXggIi91c3Ivc2Jpbi8k
REFFTU9OIiBcCj4+ICsgICAgICAgICAgICAgICAtLSAkUEJfRElTQ09WRVJfQVJHUwo+PiArICAg
ICAgIHN0YXR1cz0kPwo+PiArICAgICAgIGlmIFsgIiRzdGF0dXMiIC1lcSAwIF07IHRoZW4KPj4g
KyAgICAgICAgICAgICAgIGVjaG8gIk9LIgo+PiArICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAg
ICAgIGVjaG8gIkZBSUwiCj4+ICsgICAgICAgZmkKPj4gKyAgICAgICByZXR1cm4gIiRzdGF0dXMi
Cj4+ICt9Cj4+ICsKPj4gK3N0b3AoKSB7Cj4+ICsgICAgICAgcHJpbnRmICdTdG9wcGluZyAlczog
JyAiJERBRU1PTiIKPj4gKyAgICAgICBzdGFydC1zdG9wLWRhZW1vbiAtSyAtcSAtcCAiJFBJREZJ
TEUiCj4+ICsgICAgICAgc3RhdHVzPSQ/Cj4+ICsgICAgICAgaWYgWyAiJHN0YXR1cyIgLWVxIDAg
XTsgdGhlbgo+PiArICAgICAgICAgICAgICAgZWNobyAiT0siCj4+ICsgICAgICAgZWxzZQo+PiAr
ICAgICAgICAgICAgICAgZWNobyAiRkFJTCIKPj4gKyAgICAgICBmaQo+PiArICAgICAgIHJldHVy
biAiJHN0YXR1cyIKPj4gK30KPj4gKwo+PiArcmVzdGFydCgpIHsKPj4gKyAgICAgICBzdG9wCj4+
ICsgICAgICAgc2xlZXAgMQo+PiArICAgICAgIHN0YXJ0Cj4+ICt9Cj4+ICsKPj4gK2Nhc2UgIiQx
IiBpbgo+PiArICAgICAgIHN0YXJ0fHN0b3B8cmVzdGFydCkKPj4gKyAgICAgICAgICAgICAgICIk
MSI7Owo+PiArICAgICAgIHJlbG9hZCkKPj4gKyAgICAgICAgICAgICAgIHJlc3RhcnQ7Owo+PiAr
ICAgICAgICopCj4+ICsgICAgICAgICAgICAgICBlY2hvICJVc2FnZTogJDAge3N0YXJ0fHN0b3B8
cmVzdGFydHxyZWxvYWR9Igo+PiArICAgICAgICAgICAgICAgZXhpdCAxCj4+ICsgICAgICAgICAg
ICAgICA7Owo+PiArZXNhYwo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRi
b290Lm1rIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4+IGluZGV4IGE3OThlN2Nh
NjE0Zi4uNGQ1NmI3MzkzOGU3IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3BldGl0Ym9vdC9wZXRp
dGJvb3QubWsKPj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4+IEBAIC01
Myw2ICs1MywxMCBAQCBkZWZpbmUgUEVUSVRCT09UX1BPU1RfSU5TVEFMTAo+PiAgICAgICAgICAg
ICAgICAgICQoVEFSR0VUX0RJUikvZXRjL3BldGl0Ym9vdC9ib290LmQvMDEtY3JlYXRlLWRlZmF1
bHQtZHRiCj4+ICAgICAgICAgICQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKEBEKS91dGlscy9ob29r
cy85MC1zb3J0LWR0YiBcCj4+ICAgICAgICAgICAgICAgICAgJChUQVJHRVRfRElSKS9ldGMvcGV0
aXRib290L2Jvb3QuZC85MC1zb3J0LWR0Ygo+PiArICAgICAgICQoSU5TVEFMTCkgLW0gMDc1NSAt
RCAkKFBFVElUQk9PVF9QS0dESVIpL1MxNXBiLWRpc2NvdmVyIFwKPj4gKyAgICAgICAgICAgICAg
ICQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMTVwYi1kaXNjb3Zlcgo+PiArICAgICAgIGxuIC1z
ZiAvdXNyL3NiaW4vcGItdWRoY3BjIFwKPj4gKyAgICAgICAgICAgICAgICQoVEFSR0VUX0RJUikv
dXNyL3NoYXJlL3VkaGNwYy9kZWZhdWx0LnNjcmlwdC5kLwo+PiAgIGVuZGVmCj4+Cj4+ICAgUEVU
SVRCT09UX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gUEVUSVRCT09UX1BPU1RfSU5TVEFM
TAo+PiAtLQo+PiAyLjQwLjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
