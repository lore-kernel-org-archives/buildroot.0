Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF897C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530FD611F4;
	Fri, 27 Jan 2023 14:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530FD611F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvBZrk23bTv4; Fri, 27 Jan 2023 14:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D4B60E5C;
	Fri, 27 Jan 2023 14:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D4B60E5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED161BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 689DB60AE7
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 689DB60AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaMUCYya7iOR for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:25:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A04360AE4
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A04360AE4
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:25:13 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MzQwa-1oPzan1AuW-00vOEy; Fri, 27 Jan 2023 15:25:09 +0100
Message-ID: <5af8c479-7730-69e2-df16-b08770f492cd@vivier.eu>
Date: Fri, 27 Jan 2023 15:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: buildroot@buildroot.org
References: <20230108165438.1250779-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230108165438.1250779-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:27Ppu729606vTqFbmPrbH1iJFSFfh+k0V+gqpwVMtpWY1eXI9hv
 hf0y02UY5KoQizeZaHhsUDvhjPBvAHOfnbVMM7dx1SBe1T2IpJT4I4Ld1dYimczuxXdXkPy
 WT1agOa6mEbNwCsyxPLGf6ji1C0UK0JWK7gUdniOGTxlVo4v1fG83Fos4yPYQvK4e9sh3Ns
 SWdDkSVN5OBl/MFqs3fTQ==
UI-OutboundReport: notjunk:1;M01:P0:0/Cu7ZI9E38=;nb1Us+oIfvncrAiUSomdYb55BOm
 Bb1oAYhWsEBsTZUGkahi+P+TxHrqzFwxA0t8oMDgzb1wbT37JdOnq6sz6B9ooewaoOcXC6Y0o
 UTpbCYGn/FlkjVzCIK7R+mWCk6OxnYmgRFMQhEynpx5HQSK410kY7Uu6mV58ynxc3aO27IGSK
 lQT9WCa40wVOJpy7U6kVVLVBhd2pvzMjQgmzHbU+0Qg4wvNFdVk+jm2uhkwpPvl4RLnyZUo6C
 e+jzdsYK8dc1LK5WzPXv3LKG6kl0vZtnNCvIDn4l5YoI4VQ0jOswxabwDF27NpTj+LxRD40wl
 hTVUeYAlbSdbtqWhcC3N1qf+dXymMoBGGII4xQqnsRzABYCXX5LW81UJE7NnJOwAZC2yX1Wqu
 OeZ+Yej4p2Orjhu3GdZAXuHo5FQrfcjyR6ok0QiLYFb2dDsRUzXjhfezekco+aotCOro+uW01
 iZCDPB+mFGwwYQzhPNB62a7HaoqfMVtbwKoTksAYXkh9O+YJycVp9c/4QaO7dGx9QwlUeQh9z
 3f1XKr3LuDFyjavx/dlBYrI1ofJC08sqIBQRPGDtpuL2+irbuNuFjosJibrEmtA3hYku1drgu
 QfF5ylQ2kq48z1O+JvCy8pbbnG5viJdXVsbBwMoRLcHoLPXtRls3qyQTKAemKIl78KYTX5H31
 XAXDs8KaKcojZwCCL2xeQrrSsXtel9r1JcfeqOwjWQ==
Subject: Re: [Buildroot] [PATCH v8 0/3] package: add petitboot to use with
 qemu-system-m68k
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpBbnkgY29tbWVudHM/CgpUaGFua3MsCkxhdXJlbnQKCkxlIDA4LzAxLzIwMjMgw6AgMTc6
NTQsIExhdXJlbnQgVml2aWVyIGEgw6ljcml0wqA6Cj4gcWVtdS1zeXN0ZW0tbTY4ayBoYXMgaW50
cm9kdWNlZCBpbiB2Ni4wIGEgbmV3IHB1cmUgdmlydHVhbCBtYWNoaW5lCj4gdGhhdCBpcyBub3cg
c3VwcG9ydGVkIGJ5IGxpbnV4IHY1LjE5Lgo+IAo+IFRoZSBnb2FsIG9mIHRoaXMgc2VyaWVzIGlz
IHRvIHByb3ZpZGUgcGV0aXRib290IGFzIGFuIGVtYmVkZGVkIGJvb3Rsb2FkZXIKPiBmb3IgaXQg
KGxpa2UgaXQgaXMgZm9yIHRoZSBJQk0gUE9XRVIgbWFjaGluZSkuCj4gCj4gVGhlIGZpcnN0IHBh
dGNoIGludHJvZHVjZXMgcGV0aXRib290IHBhY2thZ2UsIHRoZSBzZWNvbmQgcGF0Y2ggdGhlCj4g
Y29uZmlndXJhdGlvbiB0byBidWlsZCBidWlsZHJvb3Qgd2l0aCBwZXRpdGJvb3QgZm9yIHRoZSBR
RU1VIG1hY2hpbmUuCj4gCj4gWW91IGNhbiB0ZXN0IGl0IHdpdGg6Cj4gCj4gICAgcWVtdS1zeXN0
ZW0tbTY4ayAtTSB2aXJ0IC1rZXJuZWwgaW1hZ2VzL3ZtbGludXggXAo+ICAgICAgICAgICAgICAg
ICAgICAgLWluaXRyZCBpbWFnZXMvcm9vdGZzLmNwaW8ueHogXAo+ICAgICAgICAgICAgICAgICAg
ICAgLWFwcGVuZCAiY29uc29sZT10dHlHRjAiIC0tbm9ncmFwaGljCj4gCj4gU2lnbmVkLW9mZi1i
eTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1Pgo+IAo+IHY4Ogo+ICAgIC0gdXNl
IGxpbnV4LmZyYWdtZW50IHJhdGhlciB0aGFuIGxpbnV4LmNvbmZpZwo+ICAgIC0gcmViYXNlCj4g
Cj4gdjc6Cj4gICAgLSBzZXQgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81
XzE5PXkKPiAgICAtIGZpeCBlcnJvcnMgcmVwb3J0ZWQgYnkgY2hlY2stcGFja2FnZQo+ICAgIC0g
YWRkIGdpdGxhYiB0ZXN0aW5nIChDw6lkcmljKQo+ICAgIC0gdXBkYXRlIGJvb3QtcWVtdS1pbWFn
ZS5weSB0byBzdXBwb3J0IHBldGl0Ym9vdAo+IAo+IHY2Ogo+ICAgIC0gcmViYXNlCj4gCj4gdjU6
Cj4gICAgLSByZW1vdmUgQlIyX0NDQUNIRV9ESVIsIEJSMl9QQUNLQUdFX0RUQyBhbmQgQlIyX1BB
Q0tBR0VfRFRDX1BST0dSQU1TCj4gCj4gdjQ6Cj4gICAgLSBhZGRyZXNzIFRob21hcycgY29tbWVu
dHMKPiAgICAtIHJlbW92ZSBwZXRpdGJvb3QtbXRkIGNvbmZpZyBhcyBsaWJmbGFzaCBpcyBub3Qg
YXZhaWxhYmxlCj4gCj4gdjM6IHYyOiB2MToKPiAgICAtIGZpcnN0IHZlcnNpb24sIEkgbWVzc2Vk
IHVwIHdpdGggbGlzdCBzdWJzY3JpcHRpb24gYW5kIGdpdC1wdWJsaXNoLi4uCj4gCj4gTGF1cmVu
dCBWaXZpZXIgKDMpOgo+ICAgIHBhY2thZ2U6IGFkZCBwZXRpdGJvb3QKPiAgICBib2FyZC9xZW11
L202OGstdmlydDogQWRkIHZpcnQtbTY4ayBsaW51eCBjb25maWcKPiAgICBzdXBwb3J0L3Njcmlw
dHMvYm9vdC1xZW11LWltYWdlLnB5OiBtYW5hZ2UgcGV0aXRib290IGludGVyZmFjZQo+IAo+ICAg
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKwo+ICAg
Ym9hcmQvcWVtdS9tNjhrLXZpcnQvbGludXguZnJhZ21lbnQgICAgICAgICAgfCAyMSArKysrKysK
PiAgIGJvYXJkL3FlbXUvbTY4ay12aXJ0L3JlYWRtZS50eHQgICAgICAgICAgICAgIHwgIDUgKysK
PiAgIGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZyAgIHwgMzEgKysr
KysrKysKPiAgIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+ICAgcGFja2FnZS9rZXhlYy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICAgcGFja2FnZS9wZXRpdGJvb3QvNjMtbWQtcmFpZC1hcnJheXMucnVsZXMgICAgfCA0
MSArKysrKysrKysrKwo+ICAgcGFja2FnZS9wZXRpdGJvb3QvNjUtbWQtaW5jcmVtZW50YWwucnVs
ZXMgICAgfCA2OSArKysrKysrKysrKysrKysrKysKPiAgIHBhY2thZ2UvcGV0aXRib290LzY2LWFk
ZC1zZy1tb2R1bGUucnVsZXMgICAgIHwgIDIgKwo+ICAgcGFja2FnZS9wZXRpdGJvb3QvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgfCAyMyArKysrKysKPiAgIHBhY2thZ2UvcGV0aXRib290L1Mx
NHNpbGVuY2UtY29uc29sZSAgICAgICAgIHwgIDkgKysrCj4gICBwYWNrYWdlL3BldGl0Ym9vdC9T
MTVwYi1kaXNjb3ZlciAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysKPiAgIHBhY2thZ2UvcGV0
aXRib290L2ZzLW92ZXJsYXkvZXRjL2luaXR0YWIgICAgIHwgMzQgKysrKysrKysrCj4gICBwYWNr
YWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2V0Yy9sb2NhbGUgICAgICB8ICAxICsKPiAgIHBhY2th
Z2UvcGV0aXRib290L2ZzLW92ZXJsYXkvaW5pdCAgICAgICAgICAgIHwgIDggKysKPiAgIHBhY2th
Z2UvcGV0aXRib290L2tleGVjLXJlc3RhcnQgICAgICAgICAgICAgIHwgIDggKysKPiAgIHBhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC1jb25zb2xlLXVpLnJ1bGVzIHwgIDYgKysKPiAgIHBhY2th
Z2UvcGV0aXRib290L3BldGl0Ym9vdC5oYXNoICAgICAgICAgICAgIHwgIDIgKwo+ICAgcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rICAgICAgICAgICAgICAgfCA3NyArKysrKysrKysrKysr
KysrKysrKwo+ICAgcGFja2FnZS9wZXRpdGJvb3QvcmVtb3ZhYmxlLWV2ZW50LXBvbGwucnVsZXMg
fCAgNCArCj4gICBwYWNrYWdlL3BldGl0Ym9vdC9zaGVsbF9jb25maWcgICAgICAgICAgICAgICB8
IDE5ICsrKysrCj4gICBwYWNrYWdlL3BldGl0Ym9vdC9zaGVsbF9wcm9maWxlICAgICAgICAgICAg
ICB8ICAyICsKPiAgIHN1cHBvcnQvc2NyaXB0cy9ib290LXFlbXUtaW1hZ2UucHkgICAgICAgICAg
IHwgMTMgKysrLQo+ICAgMjMgZmlsZXMgY2hhbmdlZCwgNDE3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLXZpcnQvbGlu
dXguZnJhZ21lbnQKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L202OGstdmlydC9y
ZWFkbWUudHh0Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9xZW11X202OGtfdmlydF9w
ZXRpdGJvb3RfZGVmY29uZmlnCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJv
b3QvNjMtbWQtcmFpZC1hcnJheXMucnVsZXMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3BldGl0Ym9vdC82NS1tZC1pbmNyZW1lbnRhbC5ydWxlcwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcGV0aXRib290LzY2LWFkZC1zZy1tb2R1bGUucnVsZXMKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9Db25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEwMDc1
NSBwYWNrYWdlL3BldGl0Ym9vdC9TMTRzaWxlbmNlLWNvbnNvbGUKPiAgIGNyZWF0ZSBtb2RlIDEw
MDc1NSBwYWNrYWdlL3BldGl0Ym9vdC9TMTVwYi1kaXNjb3Zlcgo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcGV0aXRib290L2ZzLW92ZXJsYXkvZXRjL2luaXR0YWIKPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2V0Yy9sb2NhbGUKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3BldGl0Ym9vdC9mcy1vdmVybGF5L2luaXQKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBwYWNrYWdlL3BldGl0Ym9vdC9rZXhlYy1yZXN0YXJ0Cj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVs
ZXMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QuaGFz
aAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcGV0aXRib290L3JlbW92YWJsZS1ldmVudC1w
b2xsLnJ1bGVzCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3Qvc2hlbGxf
Y29uZmlnCj4gICBjcmVhdGUgbW9kZSAxMDA3NTUgcGFja2FnZS9wZXRpdGJvb3Qvc2hlbGxfcHJv
ZmlsZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
