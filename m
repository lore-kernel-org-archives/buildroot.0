Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A6BECAA25
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11DF60F25;
	Thu, 25 Aug 2022 18:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11DF60F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FbsQmrjpiMo; Thu, 25 Aug 2022 18:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD6460DA0;
	Thu, 25 Aug 2022 18:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD6460DA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD961BF427
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61355408E3
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 18:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61355408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqwLExkBnSmH for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 18:01:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FED40101
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21FED40101
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 18:01:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:85d1:e2d5:4fa1:5f52])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A125BB00711;
 Thu, 25 Aug 2022 20:01:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 25 Aug 2022 20:01:42 +0200
Date: Thu, 25 Aug 2022 20:01:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry GUIBERT <thierry.guibert@free.fr>
Message-ID: <20220825180142.GA37358@scaer>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer>
 <f882f86c-31f2-55b4-e3f4-9a64e93bd0e9@theobroma-systems.com>
 <CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com>
 <c9a96eae-198c-7901-515e-74458c3fd8c9@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9a96eae-198c-7901-515e-74458c3fd8c9@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661450507;
 bh=Vb/yHj9COmmx5btjS5wduk4CIiIWFXs7tTL7vZcggDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQ4S7DhOjmI4Z5Tk4n3MWUvM86MuuRp/5avz6WXmfZ4BeuruE1Qf8whF4OlpedpyL
 8OpTBSLBXMOv9QQqQerre1uuxCzEhpF/Ysu5kok3vJjbbci3AkpezcTgB3zOMtyWQX
 aQ2OGJu5oYa8ydMoQzNx97hmbeaq/gxODkAVwAQE4tvnbtRIMJlOor1XlAFWq1hmTU
 xAHrBUi+9G+ZAxvvqOr/cSpIiweqvWV88X122Hq8sE7fAGT5yPiGj/WA4nXkLwfXJj
 UczSw5yS4QR+dYG5RdThOlEB3oDIxBwdV/GBWkOVMcQRPasTXNTIZyJLvEyDfILsVJ
 LqDk5q6wwfvOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tQ4S7DhO
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpZXJyeSwgQWxsLAoKT24gMjAyMi0wOC0yNSAxOToyMyArMDIwMCwgVGhpZXJyeSBHVUlCRVJU
IHNwYWtlIHRodXNseToKPiBJIHRoaW5rIHRoZSBhY3R1YWwgc2l0dWF0aW9uIGlzIHRoZSBnb29k
IG9uZSwgZXhjZXB0IHRoYXQgZXh0ZXJuYWwKPiB1c2VycyBjYW4ndCBwdWxsIGltYWdlcyBmcm9t
IHRoZSBnaXRsYWIgcmVnaXN0cnkKCldlbGwsIGl0IGlzIGNlcnRhaW5seSBwb3NzaWJsZSB0byBw
dWxsIGltYWdlcyBmcm9tIHRoZSBnaXRsYWIuQ29tCnJlZ2lzdHJ5OgoKICAgICQgZG9ja2VyIGlt
YWdlIHB1bGwgcmVnaXN0cnkuZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9iYXNl
OjIwMjIwMjA2LjE3NTYKICAgIDIwMjIwMjA2LjE3NTY6IFB1bGxpbmcgZnJvbSBidWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC9iYXNlCiAgICA5NTU2MTVhNjY4Y2U6IFB1bGwgY29tcGxldGUKICAgIDdk
NzM4Njc2NjgxZjogUHVsbCBjb21wbGV0ZQogICAgNDQ3YTMxMmUwMmQzOiBQdWxsIGNvbXBsZXRl
CiAgICA3ODM3ZTNhZDA5YTI6IFB1bGwgY29tcGxldGUKICAgIGVmZTlkNDkwODhlODogUHVsbCBj
b21wbGV0ZQogICAgNWQyMDk4YjFiNTdlOiBQdWxsIGNvbXBsZXRlCiAgICBEaWdlc3Q6IHNoYTI1
Njo3ZDQ5YmE3MzRmYmYxNWUxNTNhOGE2NmM5NWFlNGFlYWZjN2EzOTgzNTNhMjU2ZjU1MTNlOWM2
ZGI1ZTk3NTU0CiAgICBTdGF0dXM6IERvd25sb2FkZWQgbmV3ZXIgaW1hZ2UgZm9yIHJlZ2lzdHJ5
LmdpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvYmFzZToyMDIyMDIwNi4xNzU2CiAg
ICByZWdpc3RyeS5naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L2Jhc2U6MjAyMjAy
MDYuMTc1NgoKQW5kIGFzIGZhciBhcyBJIGNhbiBzZWUsIHRoZXJlIGlzIGV2ZW4gbm8gbmVlZCB0
byBiZSBsb2dnZWQgaW4uLi4KCj4gQnV0IGtub3dpbmcgdGhhdCB0aG9zZSBjb250YWluZXJzIGFy
ZSBmb3IgZGV2ZWxvcG1lbnQgb25seSwgSSBoYXZlCj4gYnVpbHQgbXkgb3duIGZvciBwcm9kdWN0
aW9uIGZpcm13YXJlIGNvbnN0cnVjdGlvbi4KClRoZSBpbWFnZSB1c2VkIGZvciB0aGUgQnVpbGRy
b290IENJIGlzIEkgYmVsaXZlIGEgdmVyeSBnb29kIGJhc2lzIGZvcgpidWlsZGluZyBvbmUncyBv
d24gaW1hZ2U7IHRoYXQncyB3aGF0IEkgZG8gYXQgJHdvcmssIHdoZXJlIG15IHJlZmVyZW5jZQpi
dWlsZCBlbnZpcm9ubWVudCBhcmUgZG9ja2VyIGlhbWdlcyB3aGljaCBEb2NrZXJmaWxlcyBhbGwg
YmVnaW4gd2l0aDoKICAgIEZST00gcmVnaXN0cnkuZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC9iYXNlOjIwMjIwMjA2LjE3NTYKCj4gVGhlIHF1ZXN0aW9uIGNvdWxkIGJlICJ3aGF0
IGRvIHdlIGRvIHdpdGggYWxyZWFkeSBwdWJsaXNoZWQgaW1hZ2VzIgo+IChlc3BlY2lhbGx5IHRo
ZSBvbmUgdGFnZ2VkIGFzICJsYXRlc3QiKQoKU2ljbmUgdGhlIGdpdGxhYiBkb2NrZXIgcmVnaXN0
cnkgaXMgcHVibGljbHkgYXZhaWxhYmxlLCBpdCB3b3VsZCBiZSBteQpvcGluaW9uIHRoYXQgd2Ug
ZHJvcCB0aGUgaWFtZ2VzIG9uIHRoZSBkb2NrZXIgaHViLiBJbmRlZWQsIGRvY2tlciBodWIgaXMK
cmF0ZS1saW1pdGVkIG9uIHRoZSBmcmVlIHRpZXIsIHNvIHVubGVzcyBvbmUgaGFzIGEgcGFpZCB0
aWVyLCBvbmUgY2FuJ3QKcmVseSBvbiBpbWFnZXMgaG9zdGVkIGluIHRoZSBkb2NrZXIgaHViLgoK
PiBJdCBtYXkgYmUgZGVzY3JpYmVkIGluIHRoZSBkb2N1bWVudGF0aW9uLCBhbmQgbWF5YmUgaXQg
YWxyZWFkeSBpcy4KCkkgZG9uJ3QgdGhpbmsgaXQgaXMgaW4gb3VyIG1hbnVhbCwgZXhjZXB0IHRo
ZSB1c2Ugb2YgdGhlCnV0aWxzL2RvY2tlci1ydW4gc2NyaXB0IGNlcnRhaW5seSBpcyBoaW50ZWQg
YWJvdXQgKGNoYXB0ZXIgMTcsIEFkZGluZwpzdXBwb3J0IGZvciBhIHBhcnRpY3VsYXIgYm9hcmQp
LgoKRXh0ZW5kZWQgZG9jdW1lbnRhdGlvbiBpcyBtb3N0IHdlbGNvbWUsIHRob3VnaCEgOi0pCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBSZWdhcmRzCj4gCj4gT24gMjUvMDgvMjAyMiAxODoy
NSwgQ2hyaXN0aWFuIFN0ZXdhcnQgd3JvdGU6Cj4gCj4gICBJIHJlY29tbWVuZCB1c2luZyBbMV1x
dWF5LmlvIGluc3RlYWQgdG8gYXZvaWQgdGhlIHJhdGUgbGltaXQuwqAKPiAgIEJlc3QsCj4gICBD
aHJpc3RpYW4gU3Rld2FydMKgCj4gICBPbiBXZWQsIEF1ZyAyNCwgMjAyMiwgOToyMCBBTSBRdWVu
dGluIFNjaHVseiA8IFsyXXF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNvbT4gd3Jv
dGU6Cj4gCj4gICAgIEhpIFlhbm4sCj4gCj4gICAgIE9uIDgvMjMvMjIgMTg6NDAsIFlhbm4gRS4g
TU9SSU4gd3JvdGU6Cj4gICAgID4gVGhpZXJyeSwgQWxsLAo+ICAgICA+Cj4gICAgID4gT24gMjAy
Mi0wOC0yMyAxNToxMyArMDIwMCwgVGhpZXJyeSBHVUlCRVJUIHNwYWtlIHRodXNseToKPiAgICAg
Pj4gSSdtIHVzaW5nIGJ1aWxkcm9vdCB0byBidWlsZCByYXNwYmVycnkgcGkgcm9vdGZzIGZvciB0
aGUgZnJlbmNoIHJlZCBjcm9zcy4KPiAgICAgPgo+ICAgICA+IEEgbm9ibGUgZW5kZWF2b3VyLCB0
aGFuayB5b3UhCj4gICAgID4KPiAgICAgPj4gSXMgdGhlcmUgYW55IHJlYXNvbiBmb3IgYnVpbGRy
b290L2Jhc2U6MjAyMjAyMDYuMTc1NiBub3QgdG8gYmUgcHVibGlzaGVkIGluCj4gICAgID4+IHRo
ZSBkb2NrZXIgaHViID8KPiAgICAgPgo+ICAgICA+IFRoZSByYXRpb25hbGUgYmVoaW5kIG91ciBk
b2NrZXIgaW1hZ2UsIGlzIHRvIGJlIGFibGUgdG8gcnVuIG91ciBvd24gQ0kKPiAgICAgPiBqb2Jz
LCB0aGF0IHJ1bnMgaW4gZ2l0bGFiLUNJLiBTaW5jZSBEb2NrZXIgaHViIG5vdyBsaW1pdHMgdGhl
IG51bWJlciBvZgo+ICAgICA+IGRvd25sb2FkcyBwZXJtb250aCBwZXIgaW1hZ2UgKG9uIGZyZSBl
dGllciksIHRoZSBDSSB3YXMgdmVyeSBvZnRlbgo+IAo+ICAgICBDb3VsZCBCdWlsZHJvb3QgZml0
IHRoZSBEb2NrZXIgT3BlbiBTb3VyY2UgUHJvZ3JhbSBjcml0ZXJpYSBieSBhbnkKPiAgICAgY2hh
bmNlPyBbM11odHRwczovL3d3dy5kb2NrZXIuY29tL2NvbW11bml0eS9vcGVuLXNvdXJjZS9hcHBs
aWNhdGlvbi8KPiAKPiAgICAgVGhhdCB3b3VsZCByZW1vdmUgdGhvc2UgbGltaXRhdGlvbnMuCj4g
Cj4gICAgIElmIHRoYXQgaXMgbm90IHBvc3NpYmxlIG9yIG5vdCB3YW50ZWQgYnkgdGhlIHByb2pl
Y3QsIEkgZ3Vlc3MgdGhhdAo+ICAgICBwdXNoaW5nIHRvIFs0XWh1Yi5kb2NrZXIuY29tIGJ1dCBo
YXZlIHRoZSBPdmVydmlldyBwYWdlIHN0YXRlIHRoYXQgdGhpcyBpcwo+ICAgICBwdWxsLWxpbWl0
ZWQgYW5kIHJlY29tbWVuZCB1c2luZyB0aGUgZ2l0bGFiIHJlZ2lzdHJ5IGluc3RlYWQ/Cj4gICAg
IFs1XWh0dHBzOi8vaHViLmRvY2tlci5jb20vci9idWlsZHJvb3QvYmFzZQo+IAo+ICAgICBDaGVl
cnMsCj4gICAgIFF1ZW50aW4KPiAgICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiAgICAgYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICAgICBbNl1idWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+ICAgICBbN11odHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiBMaW5rczoKPiAxLiBodHRwOi8vcXVheS5p
by8KPiAyLiBtYWlsdG86cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tLwo+IDMu
IGh0dHBzOi8vd3d3LmRvY2tlci5jb20vY29tbXVuaXR5L29wZW4tc291cmNlL2FwcGxpY2F0aW9u
Lwo+IDQuIGh0dHA6Ly9odWIuZG9ja2VyLmNvbS8KPiA1LiBodHRwczovL2h1Yi5kb2NrZXIuY29t
L3IvYnVpbGRyb290L2Jhc2UKPiA2LiBtYWlsdG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcvCj4g
Ny4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
