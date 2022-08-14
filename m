Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2445C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8271D83EB6;
	Sun, 14 Aug 2022 15:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8271D83EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TP1gSv3JZHbQ; Sun, 14 Aug 2022 15:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9538683E9B;
	Sun, 14 Aug 2022 15:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9538683E9B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270341BF41C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF49383E9B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF49383E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZKZc3dfZQNj for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:04:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B7C83E84
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9B7C83E84
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 15:04:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 38AD660131;
 Sun, 14 Aug 2022 17:04:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 17:04:44 +0200
Date: Sun, 14 Aug 2022 17:04:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814150444.GH2775145@scaer>
References: <20220814125656.1227977-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125656.1227977-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660489489;
 bh=Wo97ViAayBg9780l/bnYHGRM5Mml5GOzMCVwzhfU8Bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYuxgGIri9yM7t09Fjhv/PEeupYAGMUQ2yFEKh5HK+lkdvyCNhkBYkQKT39x6THfQ
 IqSFJb7Tqc6f6Nefd6GC7052zROVY7sBPbs1sMiko1VgrHPxLa7utBFN83oMToB2lq
 zO3J5O88WE+SrOUo2mHcHFOeWUz7O6i1aXLlFlxa4NAxr6LmWTbJZfP0SyknxJs+Pq
 3RlammeyQw80F6nwCjVCbokho5jEZvF5V+479LmvWdzjFSso39Ky/5vwqVC4o17Qo8
 /K27BO7v5e3MTSgobUmg9URQKKXiRHTe2pIGGCtPgALFwFlOr+Cv/nweghn3W9Qjok
 uec8nLAPHz92g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iYuxgGIr
Subject: Re: [Buildroot] [PATCH] package/qoriq-cadence-dp-firmware: refactor
 with FREESCALE_IMX_EXTRACT_HELPER
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgorQXJub3V0IHdvdWxkIGFwcGxpZWQgcW9yaXEtY2FkZW5jZS1kcC1m
aXJtd2FyZS4KCk9uIDIwMjItMDgtMTQgMTQ6NTYgKzAyMDAsIEZyYW5jb2lzIFBlcnJhZCBzcGFr
ZSB0aHVzbHk6Cj4gYXZvaWQgY29kZSBkdXBsaWNhdGlvbgoKSSB1bmRlcnN0YW5kIHRoZSB1ZG5l
cmx5aW5nIHJlYXNvbiwgYnV0IEkgYW0gbm90IHRvbyBmb25kIG9mIGl0LgoKVGhlIEZSRUVTQ0FM
RV9JTVhfRVhUUkFDVF9IRUxQRVIgcmVhbGx5IGJlYXJzIHRoZSBuYW1lICJGcmVlc2NhbGUiIGlu
Cml0LCBhbmQgaWYgd2UgbmVlZCB0byBjaGFuZ2UgaXQgZm9yIEZyZWVzY2FsZS1yZWxhdGVkIHBh
Y2thZ2VzLCBpdCB3aWxsCm5vdCBiZSBvYnZpb3VzIHRoYXQgaXQgY2FuIGFsc28gYmUgdXNlZCBi
eSBvdGhlciwgbm9uLUZyZWVzY2FsZQpwYWNrYWdlcy4KCkFsc28sIHdoZW4gd2UgaGF2ZSBwYWNr
YWdlcyB0aGF0IHNoYXJlIHNvbWUgaW5mcmFzdHJ1Y3R1cmUsIHdlIGxpa2UgdGhlbQp0byBiZSBp
biBhIHN1Yi1kaXJlY3Rvcnkgb2YgYSBjb21tb24gZGlyIChsaWtlIHF0NSBhbmQgYWxsIHRoZSBR
dCA1LngKcGFja2FnZXMsIG9yIGxpa2UgaW5kZWVkIGZyZWVzY2FsZS1pbXggYW5kIGFsbCByZWxh
dGVkcGFja2FnZXMpLiBCdXQKdGhpcyBxb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlIGlzIG5vdCBw
YXJ0IG9mIHRoYXQgZnJlZXNjYWxlLWlteApjb2xsZWN0aW9uLgoKU28sIGluIHRoaXMgY2FzZSwg
SSBwcmVmZXIgd2Uga2VlcCB0aGUgZHVwbGljYXRpb24uCgpZZWFoLCBGcmVlc2NhbGUgaXMgbm93
IHBhcnQgb2YgTlhQLCBidXQgdGhpcyBpcyBub3QgYSByZWFzb24geWV0LgoKQWxzbywgbm90ZSB0
aGF0IHRoZSBleHRyYWN0IGhlbHBlciBkb2VzIGV4dHJhY3QgYSBmaWUgbmFtZWQgRVVMQSwgYnV0
IGl0Cml0IG5vdCBwcmVzZW50IGluIExJQ0VOU0VfRklMRVMsIGV2ZW4gdGhvdWdoIHRoZSBjb21t
ZW50IHN0YXRlcyBpdApzaG91bGQgYmUuCgpBZGRpdGlvbmFsbHksIG9uZSBleHRyYWN0ZWQsIHRo
ZXJlIGlzIGFsc28gYW4gRVVMQS50eHQgZmlsZSB0aGF0IGlzIG5vdAppbiBMSUNFTlNFX0ZJTEVT
IHdpdGhlciwgd2hpY2ggSSB0aGluayBpdCBzaG91bGQgYmUuCgpDYW4geW91IGFkZHJlc3MgdGhv
c2UgbGFzdCB0d28gYml0cyBpbiBhIHNlcGFyYXRlIHBhdGNoLCBwbGVhc2U/CgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lz
LnBlcnJhZEBnYWR6Lm9yZz4KPiAtLS0KPiAgLi4uL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUu
bWsgICAgICAgICAgICAgIHwgMjcgKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDI2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS5t
ayBiL3BhY2thZ2UvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9xb3JpcS1jYWRlbmNlLWRwLWZp
cm13YXJlLm1rCj4gaW5kZXggMjM2NDNkMjRlLi4xYTk3YzU4MDMgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUu
bWsKPiArKysgYi9wYWNrYWdlL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5j
ZS1kcC1maXJtd2FyZS5tawo+IEBAIC0xMywzMyArMTMsOCBAQCBRT1JJUV9DQURFTkNFX0RQX0ZJ
Uk1XQVJFX1JFRElTVFJJQlVURSA9IE5PCj4gIFFPUklRX0NBREVOQ0VfRFBfRklSTVdBUkVfSU5T
VEFMTF9JTUFHRVMgPSBZRVMKPiAgUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9JTlNUQUxMX1RB
UkdFVCA9IE5PCj4gIAo+IC0jIEhlbHBlciBmb3Igc2VsZi1leHRyYWN0aW5nIGJpbmFyaWVzIGRp
c3RyaWJ1dGVkIGJ5IE5YUC4KPiAtIwo+IC0jIFRoZSAtLWZvcmNlIG9wdGlvbiBtYWtlcyBzdXJl
IGl0IGRvZXNuJ3QgZmFpbCBpZiB0aGUgc291cmNlCj4gLSMgZGlyZWN0b3J5IGFscmVhZHkgZXhp
c3RzLiBUaGUgLS1hdXRvLWFjY2VwdCBza2lwcyB0aGUgbGljZW5zZSBjaGVjaywKPiAtIyBhcyBp
dCBpcyBub3QgbmVlZGVkIGluIEJ1aWxkcm9vdCBiZWNhdXNlIHdlIGhhdmUgbGVnYWwtaW5mby4g
U2luY2UKPiAtIyB0aGVyZSdzIGEgRVVMQSBpbiB0aGUgYmluYXJ5IGZpbGUsIHdlIGV4dHJhY3Qg
aXQgaW4gdGhpcyBtYWNybywgYW5kCj4gLSMgaXQgc2hvdWxkIHRoZXJlZm9yZSBiZSBhZGRlZCB0
byB0aGUgTElDRU5TRV9GSUxFUyB2YXJpYWJsZSBvZgo+IC0jIHBhY2thZ2VzIHVzaW5nIHRoaXMg
bWFjcm8uIEFsc28sIHJlbWVtYmVyIHRvIHNldCBSRURJU1RSSUJVVEUgdG8KPiAtIyAiTk8iLiBJ
bmRlZWQsIHRoaXMgaXMgYSBsZWdhbCBtaW5lZmllbGQ6IHRoZSBFVUxBIHNwZWNpZmllcyB0aGF0
IHRoZQo+IC0jIEJvYXJkIFN1cHBvcnQgUGFja2FnZSBpbmNsdWRlcyBzb2Z0d2FyZSBhbmQgaGFy
ZHdhcmUgKHNpYyEpIGZvcgo+IC0jIHdoaWNoIGEgc2VwYXJhdGUgbGljZW5zZSBpcyBuZWVkZWQu
Li4KPiAtIwo+IC0jICQoMSk6IGZ1bGwgcGF0aCB0byB0aGUgYXJjaGl2ZSBmaWxlCj4gLSMKPiAt
ZGVmaW5lIFFPUklRX0NBREVOQ0VfRFBfRklSTVdBUkVfRVhUUkFDVF9IRUxQRVIKPiAtCWF3ayAn
QkVHSU4gICAgICB7IHN0YXJ0ID0gMDsgfSBcCj4gLQkgICAgIC9eRU9FVUxBLyAgeyBzdGFydCA9
IDA7IH0gXAo+IC0JICAgICAgICAgICAgICAgIHsgaWYgKHN0YXJ0KSBwcmludDsgfSBcCj4gLQkg
ICAgIC88PEVPRVVMQS8geyBzdGFydCA9IDE7IH0nIFwKPiAtCSAgICAkKDEpID4gJChARCkvRVVM
QQo+IC0JY2QgJChARCkgJiYgc2ggJCgxKSAtLWZvcmNlIC0tYXV0by1hY2NlcHQKPiAtCWZpbmQg
JChARCkvJChiYXNlbmFtZSAkKG5vdGRpciAkKDEpKSkgLW1pbmRlcHRoIDEgLW1heGRlcHRoIDEg
LWV4ZWMgbXYge30gJChARCkgXDsKPiAtCXJtZGlyICQoQEQpLyQoYmFzZW5hbWUgJChub3RkaXIg
JCgxKSkpCj4gLWVuZGVmCj4gLQo+ICBkZWZpbmUgUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9F
WFRSQUNUX0NNRFMKPiAtCSQoY2FsbCBRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX0VYVFJBQ1Rf
SEVMUEVSLCQoUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9ETF9ESVIpLyQoUU9SSVFfQ0FERU5D
RV9EUF9GSVJNV0FSRV9TT1VSQ0UpKQo+ICsJJChjYWxsIEZSRUVTQ0FMRV9JTVhfRVhUUkFDVF9I
RUxQRVIsJChRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX0RMX0RJUikvJChRT1JJUV9DQURFTkNF
X0RQX0ZJUk1XQVJFX1NPVVJDRSkpCj4gIGVuZGVmCj4gIAo+ICBkZWZpbmUgUU9SSVFfQ0FERU5D
RV9EUF9GSVJNV0FSRV9JTlNUQUxMX0lNQUdFU19DTURTCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8g
fCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
