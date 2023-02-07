Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4FEC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47EA340B33;
	Tue,  7 Feb 2023 21:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47EA340B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBVH1Ts4d3UL; Tue,  7 Feb 2023 21:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B62A40B24;
	Tue,  7 Feb 2023 21:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B62A40B24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07F3D1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5423818C9
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5423818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtAEpaUGLsgC for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5781F81759
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5781F81759
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:55:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A0AEEB00535;
 Tue,  7 Feb 2023 22:55:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 22:55:20 +0100
Date: Tue, 7 Feb 2023 22:55:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230207215520.GB2817@scaer>
References: <cover.1675805584.git.yann.morin.1998@free.fr>
 <3c87e90584519c73eeb1ae2dd5c52fe60d1572a2.1675805584.git.yann.morin.1998@free.fr>
 <5160d115-3650-23a2-bad5-2887ba763957@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5160d115-3650-23a2-bad5-2887ba763957@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675806926;
 bh=XRt/576HWQdfMR+7W6lYniIK/Oztzfa6TVIzqc6YHT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lgEvYxalGKxEYQ1GbkVsBlQ/e3GKriYSIVDCe8hfuctsccphSkPKtdMnCAVuhGO8d
 0f/Y7EkzdMiQ54q1IkdPlNAth3QzysdrxNK2mGBjMdE2GNGvy4Vv+OfpnW2cxkEnQm
 PWASB+yz7px/NncXBXpIY46UZNAY5UtZ8qmZzdY3KQK3q6L6qSzYOy227VZXBmRu67
 Ef/Raki1VtgCLa/zUk20GL5F9PzT5ZIBDPYJaHiRYZdQAsDFWVLaiUzQ1adHXjozQs
 428CwoGt1vxWx3GYPqAgtC17ySl3bMJWdjyEgokMdpKufUDrrnSm3hx70Vrob3ZlBy
 n+mh42Ma25BLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lgEvYxal
Subject: Re: [Buildroot] [PATCH 1/2] gitlab-ci: don't use before_script in
 job templates
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

Um9tYWluLCBBbGwsCgpPbiAyMDIzLTAyLTA3IDIyOjQ3ICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDA3LzAyLzIwMjMgw6AgMjI6MzMsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiA+IFdoZW4gZ2l0bGFiIHByZXBhcmVzIGEgam9iIHRvIHJ1biwgaXQgY2hlY2tzIG91
dCB0aGUgcmVwb3NpdG9yeSB3aXRoIGEKPiA+IG5vbi1yb290IHVzZXIsIGFuZCBzcGF3bnMgYSBj
b250YWluZXIgdGhhdCBydW5zIGFzIHJvb3QsIHdpdGggc29tZSBVSUQKPiA+IG1hcHBpbmcgdGhh
dCBtYWtlcyB0aGUgZmlsZXMgYmUgb3duZWQgYnkgcm9vdCBpbiB0aGUgY29udGFpbmVyLiBIb3dl
dmVyLAo+ID4gb3VyIHBpcGVsaW5lcyBydW4gYXMgYSBub250LXJvb3QgdXNlci4KPiA+IAo+ID4g
Q29tbWl0IGJkZTE2NWY3YWQgKC5naXRsYWItY2kueW1sOiB1cGRhdGUgRG9ja2VyIGltYWdlIHRv
IHVzZSkgdXBkYXRlZAo+ID4gdGhlIGRvY2tlciBpbWFnZSB0aGF0IGlzIHVzZWQgdG8gcnVuIGlu
IG91ciBwaXBlbGluZXMuCj4gPiAKPiA+IFRoYXQgbmV3IGltYWdlIGluY2x1ZGVzIGEgZ2l0IHZl
cnNpb24gdGhhdCBpcyBzdHJpY3RlciBhYm91dCB0aGUKPiA+IG93bmVyc2hpcCBvZiB0aGUgZ2l0
IHRyZWUgaXQgaXMgYWN0aW5nIGluOiBnaXQgYWJvcnRzIGluIGVycm9yIHdoZW4gdGhlCj4gPiB1
c2VyIHJ1bm5pbmcgaXQgZG9lcyBub3Qgb3duIHRoZSByZXBvc2l0b3J5Lgo+ID4gCj4gPiBXZSB1
c2UgYGdpdCBscy10cmVlYCBxdWl0ZSBhIGxvdCBpbiBvdXIgY2hlY2ste2ZsYWtlOCxwYWNrYWdl
LHN5bWJvbHN9Cj4gPiBydWxlcywgc28gdGhleSBhbGwgZmFpbCAoaW4gdmFyaW91cyB3YXlzKS4K
PiAKPiBpcyBmbGFrZTggaGFzIGJlZW4gdXBkYXRlZCB0b28/IGZsYWtlOCBtYXkgdHJpZ2dlciBu
ZXcgY2hlY2stcGFja2FnZSB3YXJuaW5nIG5vdy4KClllcywgdGhlcmUgaXMgYSBuZXdlciBmbGFr
ZTggdG9vLCBidXQgdGhlcmUgaXMgbm8gbmV3IGVycm9yIGRldGVjdGVkOgoKICAgIGh0dHBzOi8v
Z2l0bGFiLmNvbS95bW9yaW4vYnVpbGRyb290Ly0vcGlwZWxpbmVzLzc3MDQwNjQ1NwoKPiA+IAo+
ID4gVG8gZml4IHRoaXMsIHdlIGVpdGhlciBuZWVkIHRvIGZpeCB0aGUgb3duZXJzaGlwIG9yIHRl
bGwgZ2l0IHRvIGlnbm9yZQo+ID4gdGhlIHNpdHVhdGlvbi4gSW4gZWl0aGVyIGNhc2UsIHdlJ2xs
IG5lZWQgdG8gcnVuIGEgc2NyaXB0bGV0IGJlZm9yZSBhbGwKPiA+IG91ciBqb2JzLgo+ID4gCj4g
PiBHaXRsYWItY2kgYWxsb3dzIHRvIHByb3ZpZGUgYSBnbG9iYWwgYmVmb3JlX3NjcmlwdCwgdGhh
dCBpcyBpbmhlcml0ZWQgYnkKPiA+IGFsbCBqb2JzLiBIb3dldmVyLCBzb21lIG9mIG91ciBqb2Jz
IGFscmVhZHkgZGVjbGFyZSBhIGJlZm9yZV9zY3JpcHQsIGFuZAo+ID4gdGhhdCB3b3VsZCBzaGFk
b3cgdGhlIGdsb2JhbCBiZWZvcmVfU2NyaWtwdC4KPiBiZWZvcmVfU2NyaWtwdC9iZWZvcmVfc2Ny
aXB0cwoKVGhhbmtzIFRob21hcyBzYWlkIGhlJ2QgZml4IHRoYXQgd2hlbiBhcHBseWluZy4gOy1d
Cgo+ID4gVGhlcmUgaXMgbm8gdGVjaG5pY2FsIHJlYXNvbiB0byBkbyBvdXIgYmVmb3JlX3Njcmlw
dCBzZXBhcmF0ZWx5IGZyb20KPiA+IHRoZSBhY3R1YWwgc2NyaXB0LCBzbyB3ZSBtb3ZlIHRoZSBj
b2RlIGZyb20gdGhlIGJlZm9yZV9zY3JpcHRzIHRvIHRoZQo+ID4gY29ycmVzcG9uZGluZyBzY3Jp
cHRzLgo+IFJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4K
ClRoYW5rcyEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IEJlc3QgcmVnYXJkcywKPiBSb21h
aW4KPiAKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyPgo+ID4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkg
PGFybm91dEBtaW5kLmJlPgo+ID4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWls
LmNvbT4KPiA+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPgo+ID4gLS0tCj4gPiAgc3VwcG9ydC9taXNjL2dpdGxhYi1jaS55bWwuaW4gfCAxMiArKysr
LS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9taXNjL2dpdGxhYi1jaS55bWwuaW4g
Yi9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbgo+ID4gaW5kZXggMGNjZjM2NjY1ZS4uOWMx
ZmFmMGQ1ZiAxMDA2NDQKPiA+IC0tLSBhL3N1cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4g
PiArKysgYi9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbgo+ID4gQEAgLTIzLDkgKzIzLDgg
QEAKPiA+ICAgICAgICAgIC0gdXRpbHMvY2hlY2stc3ltYm9scwo+ID4gIAo+ID4gIC5kZWZjb25m
aWdfY2hlY2s6Cj4gPiAtICAgIGJlZm9yZV9zY3JpcHQ6Cj4gPiArICAgIHNjcmlwdDoKPiA+ICAg
ICAgICAgIC0gREVGQ09ORklHX05BTUU9JChlY2hvICR7Q0lfSk9CX05BTUV9IHwgc2VkIC1lICdz
LF9jaGVjayQsLGcnKQo+ID4gLSAgICBzY3JpcHQ6Cj4gPiAgICAgICAgICAtIGVjaG8gIkNvbmZp
Z3VyZSBCdWlsZHJvb3QgZm9yICR7REVGQ09ORklHX05BTUV9Igo+ID4gICAgICAgICAgLSBtYWtl
ICR7REVGQ09ORklHX05BTUV9Cj4gPiAgICAgICAgICAtIHN1cHBvcnQvc2NyaXB0cy9jaGVjay1k
b3Rjb25maWcucHkgLmNvbmZpZyBjb25maWdzLyR7REVGQ09ORklHX05BTUV9Cj4gPiBAQCAtNDQs
MTAgKzQzLDkgQEAKPiA+ICAgICAgICB9Cj4gPiAgCj4gPiAgLmRlZmNvbmZpZ19iYXNlOgo+ID4g
LSAgICBiZWZvcmVfc2NyaXB0Ogo+ID4gKyAgICBzY3JpcHQ6Cj4gPiAgICAgICAgICAtIERFRkNP
TkZJR19OQU1FPSR7Q0lfSk9CX05BTUV9Cj4gPiAgICAgICAgICAtIE9VVFBVVF9ESVI9b3V0cHV0
Cj4gPiAtICAgIHNjcmlwdDoKPiA+ICAgICAgICAgIC0gZWNobyAiQ29uZmlndXJlIEJ1aWxkcm9v
dCBmb3IgJHtERUZDT05GSUdfTkFNRX0iCj4gPiAgICAgICAgICAtIG1ha2UgJHtERUZDT05GSUdf
TkFNRX0KPiA+ICAgICAgICAgIC0gLi9zdXBwb3J0L3NjcmlwdHMvY2hlY2stZG90Y29uZmlnLnB5
IC5jb25maWcgLi9jb25maWdzLyR7REVGQ09ORklHX05BTUV9Cj4gPiBAQCAtNzIsMTMgKzcwLDEy
IEBACj4gPiAgICAgICAgICAgICAgLSBydW50aW1lLXRlc3QubG9nCj4gPiAgCj4gPiAgLnJ1bnRp
bWVfdGVzdF9iYXNlOgo+ID4gLSAgICBiZWZvcmVfc2NyaXB0Ogo+ID4gLSAgICAgICAgLSBURVNU
X0NBU0VfTkFNRT0ke0NJX0pPQl9OQU1FfQo+ID4gICAgICAjIEtlZXAgYnVpbGQgZGlyZWN0b3Jp
ZXMgc28gdGhlIHJvb3RmcyBjYW4gYmUgYW4gYXJ0aWZhY3Qgb2YgdGhlIGpvYi4gVGhlCj4gPiAg
ICAgICMgcnVubmVyIHdpbGwgY2xlYW4gdXAgdGhvc2UgZmlsZXMgZm9yIHVzLgo+ID4gICAgICAj
IE11bHRpcGx5IGV2ZXJ5IGVtdWxhdG9yIHRpbWVvdXQgYnkgMTAgdG8gYXZvaWQgc3BvcmFkaWMg
ZmFpbHVyZXMgaW4KPiA+ICAgICAgIyBlbGFzdGljIHJ1bm5lcnMuCj4gPiAgICAgIHNjcmlwdDoK
PiA+ICsgICAgICAgIC0gVEVTVF9DQVNFX05BTUU9JHtDSV9KT0JfTkFNRX0KPiA+ICAgICAgICAg
IC0gZWNobyAiU3RhcnRpbmcgcnVudGltZSB0ZXN0ICR7VEVTVF9DQVNFX05BTUV9Igo+ID4gICAg
ICAgICAgLSAuL3N1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgLW8gdGVzdC1vdXRwdXQvIC1kIHRl
c3QtZGwvIC1rIC0tdGltZW91dC1tdWx0aXBsaWVyIDEwICR7VEVTVF9DQVNFX05BTUV9Cj4gPiAg
ICAgIGFydGlmYWN0czoKPiA+IEBAIC05MSw5ICs4OCw4IEBACj4gPiAgCj4gPiAgLnRlc3RfcGtn
Ogo+ID4gICAgICBzdGFnZTogYnVpbGQKPiA+IC0gICAgYmVmb3JlX3NjcmlwdDoKPiA+ICsgICAg
c2NyaXB0Ogo+ID4gICAgICAgICAgLSBPVVRQVVRfRElSPSR7Q0lfSk9CX05BTUV9Cj4gPiAtICAg
IHNjcmlwdDoKPiA+ICAgICAgICAgIC0gZWNobyAiQ29uZmlndXJlIEJ1aWxkcm9vdCBmb3IgJHtP
VVRQVVRfRElSfSIKPiA+ICAgICAgICAgIC0gbWFrZSBPPSR7T1VUUFVUX0RJUn0gc3luY2NvbmZp
Zwo+ID4gICAgICAgICAgLSBtYWtlIE89JHtPVVRQVVRfRElSfSBzYXZlZGVmY29uZmlnCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
