Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19999C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 07:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A14D0404AE;
	Sun,  2 Oct 2022 07:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14D0404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfgGZFpoF35B; Sun,  2 Oct 2022 07:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A49E6400CB;
	Sun,  2 Oct 2022 07:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A49E6400CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 470451BF403
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 07:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20606410B5
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 07:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20606410B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PG3JRsO2BE4 for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 07:40:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2ECF408BA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2ECF408BA
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 07:40:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2F19978032A;
 Sun,  2 Oct 2022 09:40:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Oct 2022 09:40:28 +0200
Date: Sun, 2 Oct 2022 09:40:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@athaariq.my.id
Message-ID: <20221002074028.GB30794@scaer>
References: <20221001020445.1458953-1-buildroot@athaariq.my.id>
 <20221001155615.GA30794@scaer>
 <84f6447a658a7c5c46852dc84fe5cb1a@athaariq.my.id>
 <8c42038a335a0122dee3365ce1940920@athaariq.my.id>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c42038a335a0122dee3365ce1940920@athaariq.my.id>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664696433;
 bh=1/wyUXNWkTkd3KAM77TT9BU8obG5pyII16YLqrqxkLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CeVLMbj9/2KfrTOVV0oITrCn7k/KnRcm4t/OtvFDv6ELbu+BGcZwDOTXEwcVO1LDo
 ywl7wNpwfpypfAVBvo9i2Wh/BrWlN+JyoObO++Dn7Dw0AC/JR/hfMaPvVr1LAPgoWu
 IgxabPaoheTP18wPIX7MYCvCgELzKvaDCo+R0kTd1Id7aHQP1Sg7ETF9cM6DvqbUPS
 Bu4i01tnSBEEOmTQgM+AgnXMETpXzuC45n0rophmz7VqwJzYiZOYDaR/OYGU5mex+X
 7otltvAPyKfKCVkF158No1rhi8J4BRK/uKxrWl6EeoElGnQoNK6ErtSRwvIg9qQUtD
 6wju+XBjVooqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CeVLMbj9
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: fix fsconfig_command
 redeclaration bug
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXRoYWFyaXEsIEFsLAoKT24gMjAyMi0xMC0wMiAwMzozMyArMDAwMCwgYnVpbGRyb290QGF0aGFh
cmlxLm15LmlkIHNwYWtlIHRodXNseToKPiA+VGhpcyBpc3N1ZSBpcyByZWFsbHkgd2VpcmQsIGJl
Y2F1c2UgdGhlIGdsaWJjIGNvbW1pdCB3ZSBhcmUgdXNpbmcgaXMKPiA+c3VwcG9zZWQgdG8gY29u
dGFpbiB0aGUgcmVsYXRlZCBmaXhlcwo+IFBhcmRvbiBtZSBmb3IgYmVpbmcgc28gd2VpcmQuCgpZ
b3UgYXJlIG5vdCBiZWluZyB3ZWlyZCwgbm8gd29ycmllcy4KCj4gV2hhdCBJJ20gdHJ5aW5nIHRv
IGZpeCBpcyB0aGlzIGVycm9yOgo+IGVycm9yOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIOKAmGVu
dW0gZnNjb25maWdfY29tbWFuZOKAmQoKWWVzLCB3ZSBhcmUgYXdhcmUgb2YgdGhhdCBpc3N1ZS4K
Cj4gSSBkaWQgc3BlbnQgZW50aXJlIG1vcm5pbmcgbGFzdCB0d28gZGF5cyBhZ28gYW5kIEkgZmln
dXJlZCBvdXQgdGhhdCBubwo+IG1hdHRlciBob3cgZG8gSSBkZXRlY3QgbGludXgvbW91bnQuaCBw
cmVzZW5jZSBpbiAic3lzL21vdW50LmgiLCAqKmVudW0KPiBmc2NvbmZpZ19jb21tYW5kKiogc3Rp
bGwgaW4gY2xhc2ggYmV0d2VlbiBsaW51eC1oZWFkZXJzIGFuZCBnbGliYy4gSG93ZXZlciwKPiB0
aGUgcHJvYmxlbSBvbmx5IGV4aXN0IGluIGdsaWJjIHYyLjM2IHdoZXJlYXMgbm8gZWZmZWN0IHdo
ZW4gSSBjaGFuZ2VkIGxpbnV4Cj4gdmVyc2lvbi4gVGh1cywgbGludXgtaGVhZGVycyBzZWVtcyB0
byBiZSBkZWNsYXJlZCBhZnRlciBnbGliYy4KCldoZW4geW91IGNoYW5nZSB0aGUgbGludXggaGVh
ZGVycyB2ZXJzaW9uIGluIEJ1aWxkcm9vdCwgeW91IG5lZWQgdG8KcmVzdGFydCBmcm9tIGEgY2xl
YW4gc3RhdGUsIGkuZS4gcnVuICJtYWtlIGNsZWFuIiBiZWZvcmUgcmVzdW1pbmcgdGhlCmJ1aWxk
LCBzZWUgdGhlIGZ1bGwgZXhwbGFuYXRpb25zIGluIHRoZSBtYW51YWw6CiAgICBodHRwczovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNmdWxsLXJlYnVpbGQKCj4g
PkhvdyBpcyB0aGlzIGEgYnVpbGRyb290LXNwZWNpZmljIGJ1Zz8gQ2FuIHlvdSBlbGFib3JhdGUg
b24gdGhhdCBwYXJ0PyBJZgo+ID5pdCBpcyByZWFsbHkgYSBidWlsZHJvb3QtcmVsYXRlZCBidWcs
IHRoZW4gd2Ugd2FudCB0byB1bmRlcnN0YW5kIGl0LCBhbmQKPiA+Zml4IGl0LCBub3Qgd29yayBh
cm91bmQgaXQuCj4gCj4gQmVjYXVzZSBpdCBzdWNjZXNzZnVsbHkgY29tcGlsZWQgaW4gR2VudG9v
IGJ1dCBmYWlsZWQgd2hlbiBjb21waWxlIEJ1aWxkcm9vdAo+IGZvciBSYXNwYmVycnkgUGkgNCBh
bmQgUmFzcGJlcnJ5IFBpIDMsIHdpdGggZGVmYXVsdCBjb25maWd1cmF0aW9uLiBUaGUKPiByZWFz
b24gd2h5IEkgYXNrZWQgIklzIHRoaXMgcG9zc2libGUgb24gQnVpbGRyb290PyIgaXMgdG8gZ2l2
ZSB5b3UgdHdvCj4gb3B0aW9uczoKPiAxLiBJZiBwb3NzaWJsZSwgbGV0J3MgbWFrZSBzdXJlIGxp
bnV4LWhlYWRlcnMgaW5zdGFsbGVkIGJlZm9yZSBnbGliYwo+IDIuIElmIG5vdCwgbGV0J3Mgd29y
a2Fyb3VuZCBmb3IgYSB3aGlsZSB1bnRpbCB0aGVyZSdzIGEgcmV2ZWxhdGlvbiBmcm9tCj4gdXBz
dHJlYW0KPiAKPiA+VGhpcyBpcyBleGFjdGx5IHdoYXQgd2UgYXJlIGRvaW5nIGFscmVhZHksIGFu
ZCBmb3IgYXMgbG9uZyBhcyBCdWlsZHJvb3QKPiA+aGFzIHN1cHBvcnRlZCBidWlsZGluZyBhIGds
aWJjLWFzZWQgdG9vbGNoYWluLCBhcyB0aGUga2VybmVsIGhlYWRlcnMgYXJlCj4gPnJlcXVpcmVk
IHRvIGJ1aWxkIGdsaWJjOyBzZWUgcGFja2FnZS9nbGliYy9nbGliYy5ta0AyODoKPiAKPiBXZWxs
IHRoYXQncyBpbnRlcmVzdGluZy4gV29uZGVyIHdoeSB0aGF0IGVudW0gcmVkZWNsYXJhdGlvbiBl
cnJvciBleGlzdCBhbmQKPiBteSBsYXN0IHBhdGNoIGFjdHVhbGx5IHdvcmtzLgoKWWVzLCB3ZSBy
ZWFsbHkgbmVlZCB0byB1bmRlcnN0YW5kIHdoeSBpdCBpcyBicm9rZW4gaW4gdGhlIGZpcnN0IHBs
YWNlLAp0byBldmFsdWF0ZSB3aGV0aGVyIHlvdXIgcGF0Y2ggaXMgY29ycmVjdCwgb3Igd2hldGhl
ciB3ZSBzaG91bGQgY2hhbmdlCnRoZSB3YXkgd2UgZG8gdGhpbmdzIGluIEJ1aWxkcm9vdC4gSGlu
dDogSSB0aGluayB3ZSBkbyBzb21ldGhpbmcgaW4KQnVpbGRyb290IHRoYXQgaXMgd3JvbmcgKG9y
IGhhcyBiZWNvbWUgd3JvbmcgYXMgdGltZSBwYXNzZWQpLCBidXQgd2UKY291bGQgbm90IHBpbnBv
aW50IGl0IHlldC4uLgoKPiA+VG8gYmUgbm90ZWQsIGFuZCBhcyBUaG9tYXMgbm90aWNlZCwgT3Bl
bkVtYmVkZWQgaXMgYWxzbyB1c2luZyBhIGdsaWJjCj4gPjIuMzYgY29tbWl0LCBhbmQgZXZlbiBv
bmUgb2xkZXIgdGhhbiBvdXJzLCBidXQgdGhleSBkbyBub3Qgc2VlbSB0byBoYXZlCj4gPmlzc3Vl
cy4KPiAKPiBIb25lc3RseSwgSSBvbmx5IHRlc3RlZCBpdCBvbiBteSBSYXNwYmVycnkgUGkgNCBh
bmQgbXkgZnJpZW5kJ3MgUmFzcGJlcnJ5IFBpCj4gMyB3aXRoIGxhdGVzdCBvcmlnaW4vbWFzdGVy
IGFuZCBkZWZhdWx0IGNvbmZpZ3VyYXRpb24uIFllc3RlcmRheSwgSSByZWFsaXplZAo+IHRoYXQg
YWxsIHJhc3BiZXJyeSBib2FyZHMgYXJlIHN5bWxpbmtlZCBpbnRvIG9uZSBkaXJlY3RvcnkgYWZ0
ZXIgY2hlY2tlZAo+IGF1dG9idWlsZC4gUGVyaGFwcywgYm9hcmQgc3BlY2lmaWMgaXNzdWU/IElm
IGNvcnJlY3QsIEknbSBnb2luZyB0byBwYXRjaCB0aGUKPiBjdXN0b20ga2VybmVsIGluc3RlYWQs
IHBsdXMgYnVtcCBpdC4KCkl0IGlzIG5vdCBzcGVjaWZpYyB0byB0aGUgcmFzcGJlcnJ5cGksIHdl
IGhhdmUgdG9ucyBvZiBidWlsZHMgZmFpbGluZyBvbgp2YXJpb3VzIGFyY2hpdGVjdHVyZXM6CiAg
ICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvP3JlYXNvbj1nbGliYy0yLjM2LSUKCj4g
SSBhbHNvIG5vdGljZWQgUmFzcGJlcnJ5IFBpIGJvYXJkcyBhcmUgbWFya2VkIE9SUEggYXQgYXV0
b2J1aWxkLiBJcyB0aGF0Cj4gbWVhbnMgb3JwaGFuPyBJZiB5ZXMsIEkgd291bGQgZ2xhZGx5IGNv
bnRyaWJ1dGUgYXMgYm9hcmQgbWFpbnRhaW5lci4gVGhhbmsKPiB5b3UgZm9yIHlvdXIgY29vcGVy
YXRpb24uCgpXZWlyZCwgYXMgd2UgYWxyZWFkeSBoYXZlIHR3byBwZXJzb25zIHJlZ2lzdGVyZWQg
Zm9yIHRoZSBycGkgc2VyaWVzOgoKICAgICQgLi91dGlscy9nZXQtZGV2ZWxvcGVycyAtZiBjb25m
aWdzL3Jhc3BiZXJyeXBpKiBib2FyZC9yYXNwYmVycnlwaS8KICAgIEp1bGllbiBHcm9zc2hvbHR6
IDxqdWxpZW4uZ3Jvc3Nob2x0ekBvcGVuZXN0LmlvPgogICAgTWFydGluIEJhcmsgPG1hcnRpbkBi
YXJreW5ldC5jb20+CgpCdXQgaWYgeW91IHdhbnQgdG8gYmUgYWRkZWQgdG8gdGhhdCBsaXN0LCBk
byBub3QgaGVzaXRhdGUgdG8gc2VuZCBhCnBhdGNoIGFnYWluc3QgdGhlIERFVkVMT1BFUlMgZmls
ZSB0byBhZGQgeW91cnNlbGYuCgo+IE5COiBNeSBuaWNrbmFtZSBpcyBFcmljCgpFcmljcyBhcmUg
ZXZlcnl3aGVyZSEgOi0pCgpJcyB0aGF0IHdoYXQgeW91IHdhbnQgdG8gYmUgYWRyZXNzZWQgYnks
IG9yIHNob3VsZCB3ZSBnbyB3aXRoIEF0aGFhcmlxPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
