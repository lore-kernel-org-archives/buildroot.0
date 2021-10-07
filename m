Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89747C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 16:29:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D7161074
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 16:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2D7161074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61C45400AF;
	Thu,  7 Oct 2021 16:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i79Lzp12pabM; Thu,  7 Oct 2021 16:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DE340196;
	Thu,  7 Oct 2021 16:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEA01BF354
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 16:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687FF40196
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 16:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2h7JNtPshuY for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 16:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E11C4400AF
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 16:29:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c8b:5ac2:202d:fb3d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 57DBD19F4B5;
 Thu,  7 Oct 2021 18:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633624180;
 bh=WeSrbzAEDKkg2qIlxJIfWvcTY8MAyeLHqCunFFq6sKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JiZOIzJOLmOwrOTR95I8DMs9TRpM7tLooW+m87sym2FdCQk4BGcG4x4P0pdbfkQz7
 aq1evPvVckRN6oQixPnCGFSRpGM5KjF9O3FhvGPLFARb+l6WC8pQ7GNt/CSqkI6ohZ
 srWZgGJiyA52a2+9q4jkKtKQSZcqNWDJWguTX9awcSSCYknP4gmNFRVHpUUTtA70xw
 J+k3SCfGWsePFUETDjFjwuhq0HIc+gMEOFtg3iGhUJKJxNay7aIs3NG23JBfcRh+x1
 Dp5jgTsmMVH4gmVWpIcRFkH94SeJuvDm9zAJTv/koUzGjdj0uSExD0GmdibmB80KjJ
 6J/Snstj6soWA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 18:29:32 +0200
Date: Thu, 7 Oct 2021 18:29:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211007162931.GH2081069@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007144351.629d2de0@kmaincent-XPS-13-7390>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: Adam Duskett <aduskett@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMTAtMDcgMTQ6NDMgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNw
YWtlIHRodXNseToKPiBPbiBUaHUsIDcgT2N0IDIwMjEgMTE6NTM6MjYgKzAyMDAKPiAiWWFubiBF
LiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKWy0tU05JUC0tXQo+ID4g
QnkgdXNpbmcgLS13aXRoLXBsYXRmb3JtPW5vbmUgaW4gdGhlIG1haW4gQ09ORl9PUFRTLCB3ZSBz
aG91bGQgYmUgYWJsZQo+ID4gdG8gZGlzYWJsZSBidWlsZGluZyBhbnkgb2YgdGhlICJpbWFnZXMi
LCBhbmQganVzdCBidWlsZCB0aGUgdG9vbHMuCj4gPiAKPiA+IFRvdGFsbHkgdW50ZXN0ZWQsIG9m
IGNvdXJzZS4uLgo+IEFzIEkgc2FpZCBpZiB3ZSBkbyB0aGF0IHdlIHdvbid0IGhhdmUgYWxsIHRo
ZSBHcnViIG1vZHVsZXMgaW4gdGhlIHRhcmdldAo+IGRpcmVjdG9yeS4gSSB0aGluayB0aGVzZSBt
b2R1bGVzIGFyZSBxdWlldCBpbXBvcnRhbnQsIGFuIHVzZXIgdGhhdCB3YW50cyB0byB1c2UKPiBn
cnViLW1raW1hZ2Ugd2lsbCBzdXJlbHkgdXNlIHRoZW0gZm9yIGV4YW1wbGUuIAoKT0ssIEkgaGFk
IGEgaGFyZCB0aW1lIHVuZGVyc3RhbmRpbmcgd2hhdCB5b3UgbWVhbnQuLi4gQnV0IGluZGVlZCwK
QlIyX1RBUkdFVF9HUlVCMl9JTlNUQUxMX1RPT0xTICphbHNvKiB3YW50cyB0byBpbnN0YWxsIHRo
ZSBtb2R1bGVzIGluCnRhcmdldC8KCkluIHRoaXMgY2FzZSwgdGhpcyBzaG91bGQgbm90IGJlIHRv
byBjb21wbGV4IGVpdGhlcjsgd2UganVzdCBuZWVkIGEKcG9zdC1pbWFnZSBob29rIHRoYXQgY29w
aWVzIGFsbCBtb2R1bGVzIGludG8gVEFSR0VUX0RJUiwgbGlrZToKCiAgICBkaWZmIC0tZ2l0IGEv
Ym9vdC9ncnViMi9ncnViMi5tayBiL2Jvb3QvZ3J1YjIvZ3J1YjIubWsKICAgIGluZGV4IGUwMWVi
YjJlZGIuLjBiYjEwZDc2NWQgMTAwNjQ0CiAgICAtLS0gYS9ib290L2dydWIyL2dydWIyLm1rCiAg
ICArKysgYi9ib290L2dydWIyL2dydWIyLm1rCiAgICBAQCAtNTAsMTEgKzUwLDYgQEAgR1JVQjJf
SUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMTktMTQ4NjUKICAgICAjIHZlcnNpb24gYXZhaWxhYmxlIGlu
IEJ1aWxkcm9vdC4KICAgICBHUlVCMl9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyMC0xNTcwNQogICAg
IAogICAgLWlmZXEgKCQoQlIyX1RBUkdFVF9HUlVCMl9JTlNUQUxMX1RPT0xTKSx5KQogICAgLUdS
VUIyX0lOU1RBTExfVEFSR0VUID0gWUVTCiAgICAtZWxzZQogICAgLUdSVUIyX0lOU1RBTExfVEFS
R0VUID0gTk8KICAgIC1lbmRpZgogICAgIEdSVUIyX0NQRV9JRF9WRU5ET1IgPSBnbnUKICAgICAK
ICAgICBHUlVCMl9CVUlMVElOX01PRFVMRVNfUEMgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdF
VF9HUlVCMl9CVUlMVElOX01PRFVMRVNfUEMpKQogICAgQEAgLTEyNyw2ICsxMjIsOSBAQCBHUlVC
Ml9UVVBMRVMtJChCUjJfVEFSR0VUX0dSVUIyX0FSTTY0X0VGSSkgKz0gYXJtNjQtZWZpCiAgICAg
SE9TVF9HUlVCMl9DT05GX0VOViA9IFwKICAgICAgICAgQ1BQPSIkKEhPU1RDQykgLUUiCiAgICAg
CiAgICArIyBNYWluIGJ1aWxkOiBvbmx5IGJ1aWxkIHRvb2xzCiAgICArR1JVQjJfQ09ORl9PUFRT
ID0gLS13aXRoLXBsYXRmb3JtPW5vbmUgLS1ibGFibGEuLi4KICAgICsKICAgICBHUlVCMl9DT05G
X0VOViA9IFwKICAgICAgICAgQ1BQPSIkKFRBUkdFVF9DQykgLUUiIFwKICAgICAgICAgVEFSR0VU
X0NDPSIkKFRBUkdFVF9DQykiIFwKICAgIEBAIC0xNDcsNyArMTQ1LDcgQEAgSE9TVF9HUlVCMl9D
T05GX09QVFMgPSBcCiAgICAgICAgIC0tZW5hYmxlLWxpYnpmcz1ubyBcCiAgICAgICAgIC0tZGlz
YWJsZS13ZXJyb3IKICAgICAKICAgIC1kZWZpbmUgR1JVQjJfQ09ORklHVVJFX0NNRFMKICAgICtk
ZWZpbmUgR1JVQjJfQ09ORklHVVJFX0NNRFNfUFRGCiAgICAgICAgICQoZm9yZWFjaCB0dXBsZSwg
JChHUlVCMl9UVVBMRVMteSksIFwKICAgICAgICAgICAgIG1rZGlyIC1wICQoQEQpL2J1aWxkLSQo
dHVwbGUpIDsgXAogICAgICAgICAgICAgY2QgJChARCkvYnVpbGQtJCh0dXBsZSkgOyBcCiAgICBA
QCAtMTY5LDE0ICsxNjcsMTYgQEAgZGVmaW5lIEdSVUIyX0NPTkZJR1VSRV9DTURTCiAgICAgICAg
ICAgICAgICAgLS1kaXNhYmxlLXdlcnJvcgogICAgICAgICApCiAgICAgZW5kZWYKICAgICtHUlVC
Ml9QT1NUX0NPTkZJR1VSRV9IT09LUyArPSBHUlVCMl9DT05GSUdVUkVfQ01EU19QVEYKICAgICAK
ICAgIC1kZWZpbmUgR1JVQjJfQlVJTERfQ01EUwogICAgK2RlZmluZSBHUlVCMl9CVUlMRF9DTURT
X1BURgogICAgICAgICAkKGZvcmVhY2ggdHVwbGUsICQoR1JVQjJfVFVQTEVTLXkpLCBcCiAgICAg
ICAgICAgICAkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKS9idWlsZC0kKHR1cGxl
KQogICAgICAgICApCiAgICAgZW5kZWYKICAgICtHUlVCMl9QT1NUX0JVSUxEX0hPT0tTICs9IEdS
VUIyX0JVSUxEX0NNRFNfUFRGCiAgICAgCiAgICAtZGVmaW5lIEdSVUIyX0lOU1RBTExfSU1BR0VT
X0NNRFMKICAgICtkZWZpbmUgR1JVQjJfSU5TVEFMTF9JTUFHRVNfQ01EU19QVEYKICAgICAgICAg
JChmb3JlYWNoIHR1cGxlLCAkKEdSVUIyX1RVUExFUy15KSwgXAogICAgICAgICAgICAgbWtkaXIg
LXAgJChkaXIgJChHUlVCMl9JTUFHRV8kKHR1cGxlKSkpIDsgXAogICAgICAgICAgICAgJChIT1NU
X0RJUikvdXNyL2Jpbi9ncnViLW1raW1hZ2UgXAogICAgQEAgLTE5NCw2ICsxOTQsMjMgQEAgZGVm
aW5lIEdSVUIyX0lOU1RBTExfSU1BR0VTX0NNRFMKICAgICAgICAgICAgICkgXAogICAgICAgICAp
CiAgICAgZW5kZWYKICAgICtHUlVCMl9QT1NUX0lOU1RBTExfSU1BR0VTX0hPT0tTICs9IEdSVUIy
X0lOU1RBTExfSU1BR0VTX0NNRFNfUFRGCiAgICAgCiAgICAtJChldmFsICQoZ2VuZXJpYy1wYWNr
YWdlKSkKICAgICtpZmVxICgkKEJSMl9UQVJHRVRfR1JVQjJfSU5TVEFMTF9UT09MUykseSkKICAg
ICtHUlVCMl9JTlNUQUxMX1RBUkdFVCA9IFlFUwogICAgK2RlZmluZSBHUlVCMl9JTlNUQUxMX01P
RFNfSU5fVEFSR0VUCiAgICArICAgIG1rZGlyIC1wICQoVEFSR0VUX0RJUikvYm9vdAogICAgKyAg
ICAkKGZvcmVhY2ggdHVwbGUsICQoR1JVQjJfVFVQTEVTLXkpLCBcCiAgICArICAgICAgICBjcCAt
YSAkKEdSVUIyX0lNQUdFXyQodHVwbGUpKSAkKFRBUkdFVF9ESVIpL2Jvb3QvCiAgICArICAgICkK
ICAgICtlbmRlZgogICAgKyMgKipZRVMqKiB0aGlzIGlzIGEgcG9zdC1pbnN0YWxsLWltYWdlIGhv
b2sgdGhhdCBpbnN0YWxscyBpbiB0YXJnZXQvCiAgICArIyAqKkFORCoqIHdlIG5lZWQgaXQgdG8g
YmUgcmVnaXN0ZXJlZCAqKkxBU1QqKiwgYWZ0ZXIgYWxsIHRoZSBwZXItdHVwbGUKICAgICsjIGlt
YWdlLWluc3RhbGwgaG9va3MKICAgICtHUlVCMl9QT1NUX0lOU1RBTExfSU1BR0VTX0hPT0tTICs9
IEdSVUIyX0lOU1RBTExfTU9EU19JTl9UQVJHRVQKICAgICtlbHNlCiAgICArR1JVQjJfSU5TVEFM
TF9UQVJHRVQgPSBOTwogICAgK2VuZGlmCiAgICArCiAgICArJChldmFsICQoYXV0b3Rvb2xzLXBh
Y2thZ2UpKQogICAgICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQoKCk5PVEU6IHll
cywgSSBrbm93IHRoYXQgJChHUlVCMl9JTUFHRV8kKHR1cGxlKSkgaXMgbm90IGV4YWN0bHkgd2hh
dCB3ZQpuZWVkIHRvIGNvcHksIGFuZCB0aGF0IGl0IHdpbGwgbmVlZCBzb21lIGFkZGl0aW9uYWwg
dHdlYWtpbmcuCgpCdXQgdGhlbiwgbWF5YmUgaW5zdGFsbGluZyBhbGwgdGhlIHBlci10dXBsZSB0
byB0YXJnZXQvIG1pZ2h0IGp1c3QKd29yayBpbiB0aGUgZW5kLiBUaGF0IHdvdWxkIG5vdCBiZSBu
aWNlLCBidXQgYXMgVGhvbWFzIGFscmVhZHkgc2FpZCwKZ3J1YjIgaXMgYWxyZWFkeSBub3Qgbmlj
ZSBhbnl3YXkuLi4KCkFsc28sIEkganVzdCBub3RpY2VkIHRoYXQgd2UgY29weSB0aGUgY2Rib290
LmltZyBmcm9tIHRoZSBob3N0IGRpciEgQXJlCnRoZSBtb2R1bGVzIGFsbCB0aGVyZT8KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
