Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F95DCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 140C9613FC;
	Fri, 15 Sep 2023 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 140C9613FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-GaooTlUqBo; Fri, 15 Sep 2023 22:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DD9613F0;
	Fri, 15 Sep 2023 22:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34DD9613F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6985F1BF3EA
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41A6E4213F
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41A6E4213F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vy_-d_ziMEY2 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:17:38 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB6E840110
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB6E840110
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D2B9D2003C8;
 Sat, 16 Sep 2023 00:17:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 00:17:28 +0200
Date: Sat, 16 Sep 2023 00:17:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230915221728.GP2571@scaer>
References: <20230914191726.28670-1-giulio.benetti@benettiengineering.com>
 <20230914214942.41dd792a@windsurf>
 <8b5fbe25-dc3d-5117-d955-b2f63ed2bf85@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b5fbe25-dc3d-5117-d955-b2f63ed2bf85@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694816256;
 bh=ofkXwhBrliGAUeHW6edkxJ8TwKlc8iWaM+lXri8jlYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCLIB/QRIDN6rKvSQnPBbrJMhH0ZiIWT8j7Bk1eiRoAOxJIXUuROmjwgdEExf3bfv
 IHxDVeHygb8rAEpBOs4RdiAdRfYZTc7W04nPkVZKoGhFAew8exK69Ok8C+L/PWQVPe
 fmCJdWZEs6rZ2rRsH02tsv7twWooTjRhOlostY5vqhS1JPKBychwmDnhhupfyCsaHI
 UhOrCKU2HNIIFIiD3+1eu8Ys91dZfUX99nmcdHqv8UBdksnBbOJwQooeRm79WbLGde
 M2ZZRs/TEyEVz/m++TjIEh4FJVMuqse7llpjbbbvIUASx4naKPPNukLxzauc0Dgozh
 tFdmTmwMVeFtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lCLIB/QR
Subject: Re: [Buildroot] [PATCH] package/apache-utils: new package
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Jim Reinhart <jimr@tekvox.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2l1bGlvLCBUaG9tYXMsIEFsbCwKCk9uIDIwMjMtMDktMTQgMjI6MTEgKzAyMDAsIEdpdWxpbyBC
ZW5ldHRpIHNwYWtlIHRodXNseToKPiBPbiAxNC8wOS8yMyAyMTo0OSwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPiA+T24gVGh1LCAxNCBTZXAgMjAyMyAyMToxNzoyNiArMDIwMAo+ID5HaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4g
Pj5Gcm9tOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGkrdGVrdm94QGJlbmV0dGllbmdp
bmVlcmluZy5jb20+Cj4gPj5CdWlsZCBodGRpZ2VzdCBhbmQgaHRwYXNzd2QgdXRpbGl0aWVzIG9u
bHkgd2l0aG91dCBidWlsZGluZyBlbnRpcmUgQXBhY2hlCj4gPj5wYWNrYWdlLgpbLS1TTklQLS1d
Cj4gPlRoYW5rcyBmb3IgdGhlIHByb3Bvc2FsLiBJJ20gYWx3YXlzIGEgYml0ICJtZWgiIHdoZW4g
aXQgY29tZXMgdG8gYWRkaW5nCj4gPmEgbmV3IHBhY2thZ2UgdGhhdCB1c2VzIHRoZSBzYW1lIHNv
dXJjZSBjb2RlIGFzIGFub3RoZXIgcGFja2FnZS4gSXQKPiA+Y2F1c2VzIGV4dHJhIG1haW50ZW5h
bmNlIHdvcmsgKHlvdSBuZWVkIHRvIHVwZGF0ZSBib3RoIHBhY2thZ2VzLCBhcHBseQo+ID5wYXRj
aGVzIHRvIGJvdGgsIGtlZXAgdHJhY2tpbmcgb2YgQ1ZFcyBmb3IgYm90aCwgZXRjLikuCj4gSSB3
YXMgdW5zdXJlIGlmIGRlYWwgd2l0aCBpdCB0aGlzIHdheSBhbmQgYWZ0ZXIgc2VhcmNoaW5nIEkn
dmUgZm91bmQKPiBwYWNrYWdlcyB1Ym9vdCBhbmQgdWJvb3QtdG9vbHMuCgpXZSBjYW4gc2xpZ2h0
bHkgbG9vc2VuIHRoZSByZXN0cmljdGlvbnMgZm9yIHRob3NlIHNwZWNpYWwgcGFja2FnZXMsIGxp
a2UKdGhlIGtlcm5lbCBvciB0aGUgYm9vdGxvYWRlcnMuIFUtQm9vdCBpcyBhIGJvb3Rsb2FkZXIs
IHNvIGRldmlhdGlvbiBpcwpraW5kYSBhY2NlcHRhYmxlIChhbmQgdW5hdm9pZGFibGUpLgoKPiA+
V2hhdCBpcyB0aGUgdXNlIGNhc2UgZm9yIG5lZWRpbmcgdGhpcyB3aXRob3V0IHRoZSBBcGFjaGUg
c2VydmVyPwo+IEkgbmVlZCBodGRpZ2VzdCB0byBtYW5pcHVsYXRlIC5odGRpZ2VzdCBmaWxlIG9u
IHRhcmdldCB1c2VkIGJ5IFNXVXBkYXRlCj4gdG8gZGVhbCB3aXRoIGNyZWRlbnRpYWxzLgoKQUNL
LCB2YWxpZCBuZWVkIOKImiA7LSkKCj4gPkNhbiB3ZQo+ID5jaGFuZ2UgdGhlIEFwYWNoZSBwYWNr
YWdlIHRvIGluc3RlYWQgYWxsb3cgaW5zdGFsbGluZyBvbmx5IHRob3NlIHRvb2xzPwo+IAo+IFll
cywgSSBjYW4gbW9kaWZ5IGJ5IGFkZGluZyBhbiBvcHRpb24gdG8gcGFja2FnZSBhcGFjaGUgbGlr
ZQo+IEJSMl9QQUNLQUdFX0FQQUNIRV9CVUlMRF9UT09MU19PTkxZIGFuZCB0aGVuIGluIGFwYWNo
ZS5tayBJIGRvIGxpa2U6Cj4gaWZlcSAoJChCUjJfUEFDS0FHRV9BUEFDSEVfQlVJTERfVVRJTFNf
T05MWSkseSkKPiAJd2hhdCBJIGRvIGluIGFwYWNoZS11dGlscyBwYWNrYWdlCj4gZWxzZQo+IAl3
aGF0IGl0J3MgYWN0dWFsbHkgZG9uZSBpbiBhcGFjaGUgcGFja2FnZQo+IGVuZGlmCgpJIGFtIG5v
dCB0b28gZm9uZCBvZiB0aGF0LCBhbmQgaXQgaXMgZ29pbmcgdG8gYmUgYSBiaXQgbW9yZSBjb21w
bGV4IHRoYXQKdGhhdC4gSW5kZWVkLCBpZiBidWlsZGluZyBvbmx5IHRoZSB0b29scywgd2UgZG9u
J3Qgd2FudCB0byBkZXBlbmQgb24gYWxsCnRoZSBvcHRpb25hbCBkZXBlbmRlbmNpZXMgKHpsaWIs
IGx1YSwgYnJvdHRsaS4uLikuCgpBbmQgaW50cm9kdWNpbmcgYSB3aG9sZS1maWxlIGlmZXEtZWxz
ZS1lbmRpZiBibG9jayBpcyBub3QgbXVjaCBiZXR0ZXIKdGhhbiBhIGR1cGxpY2F0ZSBwYWNrYWdl
OyBJIGV2ZW4gZmluZCBpdCB3b3JzZSwgYmVjYXVzZSBpdCBvYmZ1c2NhdGUgdGhlCnBhY2thZ2Un
cyAubWsuLi4KCj4gVGhpcyBpcyBiZWNhdXNlIEkgY2FuJ3QgYnVpbGQgb25seSBodGRpZ2VzdCBh
bmQgaHRwYXNzd2QgYnkgdXNpbmcKPiBzdGFuZGFyZCBhdXRvdG9vbHMtcGFja2FnZSBpbmZyYXN0
cnVjdHVyZSBhbmQgSSBuZWVkIHRvIG1ha2Ugc3BlY2lmaWMKPiB0YXJnZXRzIHVuZGVyICQoQEQp
L3N1cHBvcnQuIE90aGVyd2lzZSBpdCB3aWxsIHRyeSB0byBidWlsZChhbmQgZmFpbCkKPiB0byBi
dWlsZCBhIHBhcnQgb2YgaHR0cGQuCgpJIHRoaW5rIGl0IHdvdWxkIGJlIHJlbGF0aXZlbHkgdHJp
dmlhbCB0byBwcm92aWRlIHlvdXIgb3duIGh0ZGlnZXN0IHdpdGgKYSBzaW1wbGUgc2hlbGwgc2Ny
aXB0OgoKICAgICMhL2Jpbi9zaAoKICAgIGNyZWF0ZT1mYWxzZQogICAgaWYgWyAiJHsxfSIgPSAi
LWMiIF07IHRoZW4KICAgICAgICBjcmVhdGU9dHJ1ZQogICAgICAgIHNoaWZ0CiAgICBmaQogICAg
cGFzc3dkX2ZpbGU9IiR7MX0iCiAgICByZWFsbT0iJHsyfSIKICAgIHVzZXI9IiR7M30iCgogICAg
aWYgY3JlYXRlOyB0aGVuCiAgICAgICAgPiAiJHtwYXNzd2RfZmlsZX0iCiAgICBmaQogICAgaWYg
ISBbIC1mICIke3Bhc3N3ZF9maWxlfSI7IHRoZW4KICAgICAgICBwcmludGYgJ0NvdWxkIG5vdCBv
cGVuIHBhc3N3ZCBmaWxlICVzIGZvciByZWFkaW5nLlxuJyAiJHtwYXNzd2RfZmlsZX0iCiAgICAg
ICAgcHJpbnRmICdVc2UgLWMgb3B0aW9uIHRvIGNyZWF0ZSBuZXcgb25lLlxuJwogICAgICAgIGV4
aXQgMQogICAgZmkgPiYyCgogICAgaWYgZ3JlcCAtcSAiXiR7dXNlcn06JHtyZWFsbX06IiAiJHtw
YXNzd2RfZmlsZX0iOyB0aGVuCiAgICAgICAgcHJpbnRmICdDaGFuZ2luZyBwYXNzd29yZCBmb3Ig
dXNlciAlcyBpbiByZWFsbSAlc1xuJyAiJHt1c2VyfSIgIiR7cmVhbG19IgogICAgICAgIHNlZCAt
ciAtaSAtZSAiL14ke3VzZXJ9OiR7cmVhbG19Oi9kIiAiJHtwYXNzd2RfZmlsZX0iCiAgICBlbHNl
CiAgICAgICAgcHJpbnRmICdBZGRpbmcgdXNlciAlcyBpbiByZWFsbSAlc1xuJyAiJHt1c2VyfSIg
IiR7cmVhbG19IgogICAgZmkKICAgIGV4ZWMgMz4mMQogICAgZXhlYyA+L2Rldi9udWxsCiAgICBw
cmludGYgJ05ldyBwYXNzd29yZDogJyA+JjMKICAgIHJlYWQgLXIgcGFzc3dkCiAgICBwcmludGYg
J1JlLXR5cGUgbmV3IHBhc3N3b3JkOiAnID4mMwogICAgcmVhZCAtciBwYXNzd2QyCiAgICBleGVj
ID4mMwogICAgZXhlYyAzPiYtCiAgICBpZiBbICIke3Bhc3N3ZH0iICE9ICIke3Bhc3N3ZDJ9IiBd
OyB0aGVuCiAgICAgICAgcHJpbnRmICJUaGV5IGRvbid0IG1hdGNoLCBzb3JyeS5cbiIKICAgICAg
ICBleGl0IDEKICAgIGZpID4mMgoKICAgIGhhc2g9IiQoIHByaW50ZiAnJXM6JXM6JXMnICIke3Vz
ZXJ9IiAiJHtyZWFsbX0iICIke3Bhc3N3ZH0iIHxtZDVzdW0gKSIKICAgIHByaW50ZiAiJHt1c2Vy
fToke3JlYWxtfToke2hhc2glICAtfSIgPj4iJHtwYXNzd2RfZmlsZX0iCgpUb3RhbGx5IHVudGVz
dGVkLCBVc2UgYXQgeW91ciBvd24gcmlzay4uLgoKaHRwYXNzd2QgaXMgcXVpdGUgYSBiaXQgbW9y
ZSBjb21wbGV4LCB0aG91Z2guLCBzbyBpZiB5b3UgcmVhbGx5IG5lZWQgaXQsCmltcGVyc29uYXRp
bmcgaXQgaXMgbm90IGdvaW5nIHRvIGJlIGVhc3kuLi4KCkJvdHRvbSBsaW5lOiBpZiBvbmx5IGh0
ZGlnZXN0IG5lZWRlZCwgdGhlbiBhIHNjcmlwdCB3aWxsIGhlbHAgKG5vdCBzdXJlCndlJ2QgbmVl
ZCBzdWNoIGEgcGFja2FnZSBpbiBCdWlsZHJvb3QsIHRob3VnaCkuIE90aGVyd2lzZSwgSSBkb247
dCBoYXZlCmEgZ29vZCBpZGVhIHlldC4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gVGhp
cyBpcyB3aGF0IEkndmUgZm91bmQgc28gZmFyLCBidXQgbWF5YmUgSSBjYW4gZGlnIGRlZXBlciBh
bmQgbWF5YmUKPiBmaW5kIGEgbG9uZyBzZXF1ZW5jZSBvZjoKPiAtLWRpc2FibGUtYQo+IC0tZGlz
YWJsZS1iCj4gZXRjLgo+IHRvIHVzZSBhdXRvdG9vbHMgaW5mcmFzdHJ1Y3R1cmUuCj4gCj4gQmVz
dCByZWdhcmRzCj4gLS0gCj4gR2l1bGlvIEJlbmV0dGkKPiBDRU8mQ1RPQEJlbmV0dGkgRW5naW5l
ZXJpbmcgc2FzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
