Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BDDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B472F80C5E;
	Thu, 30 Dec 2021 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nWIGIwfAADGa; Thu, 30 Dec 2021 16:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAFA98137E;
	Thu, 30 Dec 2021 16:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 394A91BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27CC18137E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZyUbtyI7bTs for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:45:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AA0580C5E
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:45:53 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2yYonKbKgLDgd2yYonqTgk; Thu, 30 Dec 2021 17:45:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640882752; bh=LsNBh4Q4RtTGhzAl1GHKm7/IZGUFrDAgimoH7aIQNLE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ikys93LReSWjmSg0pezOF2HVs7GV1YkTAVQUE5Ik6It1lgTLlEOh3Bfda9DgzFdEs
 4ioTbALGD/2DLN7fnlhPdb4mSkn8EvbRkl0io0VD6GSpDo8seA3hWZCjOdqyEuDWY8
 hEDeYv6WDbKU64tZT9eStP97Rmk/ve263XNseTfOeidHXLmPzr57+n9f+oGE1G6tox
 ePzMitsY5vYi+0nSxy3WbJ6eSPT3iP48AlnGcJIYBZa7k5Gu9a+vndPfGthL8tkY7z
 4xND+LAZJDMljfhZ5XGH7bWpmVItWPEesw9Y/wB/+S0b1p5yawnrmwyCglE1D2lWXa
 4BuZWdSLDEXKA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
 <20200306071440.30433-5-miquel.raynal@bootlin.com>
 <20211230151428.1a49b1bf@windsurf>
 <a9bed606-385d-137d-134f-71bdf9d20222@benettiengineering.com>
 <20211230170825.48b43015@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <03b2365a-f4ee-93f7-a2ae-e4f8c0b6e91c@benettiengineering.com>
Date: Thu, 30 Dec 2021 17:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230170825.48b43015@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF7Qt8YspWOGxIdYwk9PPgbvArGttNmxB2fzC96mG8AE0lntSpJ3pVe89oF0D+0TiUR2rtWd3VuAGe3PZNOro8AUgUoy/eHB5fIObZUjTADKITsHseYH
 zFHF7+e/3hudhWvuunomDN59is7tOgYXWTwCZmImoxdeYENPstC9Ahij/FVM+d5zHWtfZD09ZvH/zlPe8vGVrZxH3+DTL0zhSirHYm7tGy2qlbGc+Z0K96RX
 7pPqLuWoPTQ4YjgXrd0Q1VroTOObFa5/NFhF/3Sx9I31gasEeB1bXG7PHIMqPfLEg2qwBhwHVsrFxKxACLBCUvsLT0Rg+EuiBne/RHm191aXyIDgwHr/Dbat
 Jqw+yagDiKk1mB0zomJD2izle4pxmenw+B1fKBbgosFKfmT3NISBSm904t+DEJjIzHUzhkYjQ//Zm7+UBoz2NhgU5RiW7AJYV7ufKhNDjM1CVwpbzBewIFFe
 vjYmOpS/Vgeu7oArC0mTDsAIZQ3R7C6tpwbNCDoJ1HEDijZH2m949IhwKnA=
Subject: Re: [Buildroot] [PATCH 4/7] package/mali-bifrost-driver: new package
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMzAvMTIvMjEgMTc6MDgsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
T24gVGh1LCAzMCBEZWMgMjAyMSAxNjoyODo1NyArMDEwMAo+IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiAKPj4gSSBoYWQgbm8g
Y2hhbmNlIHRvIHRlc3QgaXQgb24gcmVhbCBoYXJkd2FyZSBmb3IgbGFjayBvZiB0aW1lIDotLyBz
byBJCj4+IGRvbid0IGtub3cgaWYgaXQgd29ya3MsIGFuZCBpdCBzaG91bGQgbm90IGJlIGV4cGVj
dGVkIHRvIHdvcmsuIEkndmUKPj4gY29tcGFyZWQgcjggdmVyc2lvbiBvZiBtaWRnYXJkIGFnYWlu
c3QgYmlmcm9zdCBhbmQgdGhleSBhcmUgcHJldHR5Cj4+IGRpZmZlcmVudC4KPiAKPiBJJ20gcHJl
dHR5IHN1cmUgaXQgd29ya3MsIHNpbmNlIEkndmUgc2VlbiBteXNlbGYgdGhlIHBhdGNoZXMgZnJv
bQo+IE1pcXXDqGwgYWxsb3dpbmcgdG8gcnVuIFF0NS9PcGVuR0wgb24gYSBSb2NrY2hpcCBQWDMw
IHBsYXRmb3JtLiBJJ20KPiBxdWVzdGlvbmluZyB0aGUgdGVybWlub2xvZ3kvY2hvaWNlIG9mIG5h
bWluZy4KCk9rLiBQcm9iYWJseSBNaWRnYXJkIGFuZCBCaWZyb3N0IGhhdmUgbG90IGluIGNvbW1v
biBvbiBkcml2ZXIgc2lkZSBhbmQgCnRoYXQncyB3aHkgaXQgd29ya3MuIFBYMzAgaGFzIGEgRzMx
LTJFRSB3aGljaCBpcyBhIEJpZnJvc3Q6Cmh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vaXAtcHJv
ZHVjdHMvZ3JhcGhpY3MtYW5kLW11bHRpbWVkaWEvbWFsaS1ncHVzL21hbGktZzMxLWdwdQoKU28g
b2ssIGl0IHdvcmtzIGJ1dCBpdCBzaG91bGQgYmUgY2hhbmdlZC4gV2hhdCBJIGNhbiBkbyBpcyBw
cm92aWRpbmcgdGhlIApiaWZyb3N0IGRyaXZlciB3aXRoIHRoZSBwYXRjaGVzIGZvciBNaWRnYXJk
IHBvcnRlZCBhZ2FpbnN0IEJpZnJvc3QgYW5kIAphc2sgdGhlIFBSLiBCdXQgSSBkb24ndCBoYXZl
IHRpbWUgdG8gdGVzdCBhbmQgSSBkb24ndCBoYXZlIGEgd29ya2luZyAKUFgzMCBCUiBkZWZjb25m
aWcgZm9yIFBYMzAtTWluaS1FdmIgb3IgRW5naWNhbSBQWDMwIGJvYXJkIHRoYXQgSSB3YW50ZWQg
CnRvIHByb3ZpZGUuCgo+PiBJJ20gd29ya2luZyBvbiB0aGlzIHBhdGNoc2V0IGluIHNwYXJlIHRp
bWVbMV0gd2l0aCB0aGUgZ29hbCB0byBjcmVhdGUgYQo+PiBzaW5nbGUgbWFsaS1kcml2ZXIgcGFj
a2FnZSB0byBkZWFsIHdpdGggVXRnYXJkLCBNaWRnYXJkIGFuZCBCaWZyb3N0Lgo+PiBJJ3ZlIGFs
cmVhZHkgcmVxdWVzdGVkIHRvIGNoYW5nZSByZXBvc2l0b3J5IG5hbWUgZnJvbQo+PiBtYWxpLWJp
ZnJvc3QtZHJpdmVyIHRvIG1hbGktZHJpdmVyIGFuZCBpdCdzIGJlZW4gZG9uZSBwbHVzIG1lcmdp
bmcKPj4gcGF0Y2hlcyB0byBhbGxvdyBidWlsZGluZyB3aXRoIHVwIHRvIExpbnV4IDUuMTVbMl0u
Cj4gCj4gQWgsIHdlIGRpZCB0aGlzIHJlbmFtZT8KClllczoKaHR0cHM6Ly9naXRodWIuY29tL2Jv
b3RsaW4vbWFsaS1kcml2ZXIKCj4gCj4+IFRob21hcywgZG8geW91IHdhbnQgbWUgdG8gc2VuZCB0
aGUgdjIgcGF0Y2hzZXQgaW5bMV0gdG8gQnVpbGRyb290Cj4+IG1haWxpbmcgbGlzdD8gSXQncyBu
b3QgY29tcGxldGUgYXQgYWxsLCBidXQgaXQncyBzb21lIHN0ZXAgZm9yd2FyZC4KPiAKPiBJJ20g
YSBiaXQgbG9zdCB3aXRoIGFsbCB0aGVzZSByZW5hbWVzLiBXZSBhbHJlYWR5IGhhdmUKPiBzdW54
aS1tYWxpLW1haW5saW5lLWRyaXZlciBpbiB0aGUgdHJlZSwgd2hpY2ggcG9pbnRzIHRvCj4gaHR0
cHM6Ly9naXRodWIuY29tL21yaXBhcmQvc3VueGktbWFsaS4gSSdtIG5vdCBzdXJlIHdoaWNoIGtl
cm5lbCBkcml2ZXIKPiBoYW5kbGVzIHdoaWNoIEdQVSB2YXJpYW50LgoKbXJpcGFyZC9zdW54aS1t
YWxpWzFdIG9ubHkgZGVhbHMgd2l0aCBNYWxpIFV0Z2FyZCBmb3IgU3VueGkuClRoZSBwcm9ibGVt
IGlzIHRoYXQgdGhlIG1yaXBhcmQvc3VueGktbWFsaSBoYXMgYSBzcGVjaWZpYyBwbGF0Zm9ybSAK
aW1wbGVtZW50YXRpb24gZm9yIHN1bnhpOgpodHRwczovL2dpdGh1Yi5jb20vbXJpcGFyZC9zdW54
aS1tYWxpL2Jsb2IvbWFzdGVyL3BhdGNoZXMvMDAwNS1tYWxpLUFkZC1zdW54aS1wbGF0Zm9ybS5w
YXRjaAoKV2hpbGUgYm9vdGxpbi9tYWxpLWRyaXZlclsyXSBkb2Vzbid0IGhhdmUgYW55IHBsYXRm
b3JtLXNwZWNpZmljIAppbXBsZW1lbnRhdGlvbi4gQXMgeW91J3ZlIHBvaW50ZWQgeW91J3ZlIHRl
c3RlZCBQWDMwKEJpZnJvc3QgRzMxKSBhbmQgaXQgCndvcmtzLCBzbyB0aGF0IG1lYW5zIHRoYXQg
RzMxIGRvZXNuJ3QgbmVlZCBhbnkgc3BlY2lmaWMgCnBsYXRmb3JtLXNwZWNpZmljIGltcGxlbWVu
dGF0aW9ucy4gQlVUIHRoZXJlIGlzIApDT05GSUdfTUFMSV9QTEFURk9STV9OQU1FIHRoYXQgY2Fu
IGJlIHVzZWQgdG8gcG9pbnQgdG8gcGxhdGZvcm0tc3BlY2lmaWMgCmltcGxlbWVudGF0aW9uKGku
ZS4gc3VueGkpOgpodHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi9tYWxpLWRyaXZlci9ibG9iL21h
c3Rlci9yOHAwL2RyaXZlcnMvZ3B1L2FybS9taWRnYXJkL0tjb25maWcjTDcyLUw3OQoKU28gd2hh
dCB3ZSBjYW4gZG8gaXMgdG8gYWRkIHRoYXQgU3VueGkgaW1wbGVtZW50YXRpb24gdG8gcjZwMiBh
bmQgcjhwMSAKd2hpbGUgYWRkaW5nIHRoZW0gdG8gYm9vdGxpbi9tYWxpLWRyaXZlclsyXSBhbmQg
cmVtb3ZlIHRoZSBhY3R1YWwgCnN1bnhpLW1hbGktbWFpbmxpbmUtZHJpdmVyIEJSIHBhY2thZ2Uu
CgpUaGF0IHdheSB3ZSB3aWxsIGVuZCB1cChmb3IgdGhlIG1vbWVudCkgd2l0aCB0aGVzZSBwYWNr
YWdlczoKQTEpIG1hbGktZHJpdmVyID0+IHdpdGggYWxsIFV0Z2FyZChTdW54aSBwbGF0Zm9ybSBp
bmNsdWRlZCksIE1pZGdhcmQsIApCaWZyb3N0IHZlcnNpb25zLgpBMikgc3VueGktbWFsaS1tYWlu
bGluZSA9PiB0aGF0IHNob3VsZCBjaGFuZ2UgaW50byBzdW54aS1tYWxpLXV0Z2FyZCwgCmNoZWNr
IHBlbmRpbmcgcGF0Y2hlc1szXSBmb3IgdGhpcy4gQW5kIGFzIGEgc2Vjb25kIHN0ZXAgSSB3b3Vs
ZCBjYWxsIGl0IAptYWxpLWJsb2JzLXN1bnhpIGFuZCB0cnkgdG8gaGF2ZSBhY2Nlc3MgZnJvbSBB
bGx3aW5uZXIgdG8gb3RoZXIgQmxvYnMgCndpdGggbGljZW5zZShiZWNhdXNlIEkgaGF2ZSBhY2Nl
c3MgdG8gRzMxIFN1bnhpIGJsb2JzIGJ1dCBJIGNhbid0IApwdWJsaXNoIHRoZW0pIGNvbGxlY3Rp
bmcgdGhlcmUgYWxsIFN1bnhpIG1hbGkgYmxvYnMoVXRnYXJkLCBNaWRnYXJkLCAKQmlmcm9zdCkK
QTMpIG1hbGktYmxvYnMtcm9ja2NoaXAgPT4gd2l0aCBhbGwgUm9ja2NoaXAgYmxvYnMoVXRnYXJk
LCBNaWRnYXJkLCAKQmlmcm9zdCkgdGhhdCB3ZSBjYW4gZWFzaWx5IHRha2UgZnJvbSByb2NrY2hp
cC1saW51eC9saWJtYWxpCgpUaGlzIHdheSBpdCBiZWNvbWVzIGVhc3kgdG8gYWRkIG90aGVyIFNv
Q3MgZHJpdmVycyBhbmQgYmxvYnMuIFN0ZXBzIAp3b3VsZCBiZToKQjEpIGFkZCBwbGF0Zm9ybSBz
cGVjaWZpYyBpbXBsZW1lbnRhdGlvbiB0byBib290bGluL21hbGktZHJpdmVyKGlmIGFueSkKQjIp
IHdhaXRpbmcgZm9yIFBSIHRvIGJlIG1lcmdlZApCMykgYWRkIEJ1aWxkcm9vdCBwYWNrYWdlIGZv
ciB0aGUgYmxvYnMgd2l0aCBkZXBlbmRlbmNpZXMgb24gbWFsaS1kcml2ZXIgCmxpa2UgbWFsaS1i
bG9icy1uZXdTb2MKClNhaWQgdGhpcywgdGhlIHByb2JsZW0gaXMgdGltZSBmb3IgbWUuCgpIb3Bl
IGV2ZXJ5dGhpbmcgaXMgY2xlYXIuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9tcmlwYXJkL3N1
bnhpLW1hbGkKWzJdOiBodHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi9tYWxpLWRyaXZlcgpbM106
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2Vy
aWVzPTI3MDY1NgoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2lu
ZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
