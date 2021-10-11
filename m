Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E392CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 10:27:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB4A60F35
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 10:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAB4A60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E138400A4;
	Mon, 11 Oct 2021 10:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omeGJWojW7QI; Mon, 11 Oct 2021 10:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B0C3402AC;
	Mon, 11 Oct 2021 10:27:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 491DA1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 10:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C3681B72
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 10:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iFx15vlK0Fy for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 10:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C15CF81B3E
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 10:27:39 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C673EFF807;
 Mon, 11 Oct 2021 10:27:36 +0000 (UTC)
Date: Mon, 11 Oct 2021 12:27:36 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211011122736.3b0df127@kmaincent-XPS-13-7390>
In-Reply-To: <20211007162931.GH2081069@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

SGVsbG8gWWFubiwKCk9uIFRodSwgNyBPY3QgMjAyMSAxODoyOTozMSArMDIwMAoiWWFubiBFLiBN
T1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gS8O2cnksIEFsbCwKPiAK
PiBPbiAyMDIxLTEwLTA3IDE0OjQzICswMjAwLCBLw7ZyeSBNYWluY2VudCBzcGFrZSB0aHVzbHk6
Cj4gPiBPbiBUaHUsIDcgT2N0IDIwMjEgMTE6NTM6MjYgKzAyMDAKPiA+ICJZYW5uIEUuIE1PUklO
IiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOiAgCj4gWy0tU05JUC0tXQoKPiBJbiB0
aGlzIGNhc2UsIHRoaXMgc2hvdWxkIG5vdCBiZSB0b28gY29tcGxleCBlaXRoZXI7IHdlIGp1c3Qg
bmVlZCBhCj4gcG9zdC1pbWFnZSBob29rIHRoYXQgY29waWVzIGFsbCBtb2R1bGVzIGludG8gVEFS
R0VUX0RJUiwgbGlrZToKCklzIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgY29kZSBzZWVt
cyBva2F5IGZvciB5b3UuCkkgdXNlIHRlbXBvcmFyeSBpbnN0YWxsLSQodHVwbGUpIGZvbGRlciBm
b3IgdGhlIGRpZmZlcmVudCBwbGF0Zm9ybXMuCldlIG5lZWQgdG8gZG8gdGhlIENPTkZJR1VSRV9D
TURfUFRGIGFzIGEgUFJFX0NPTkZJR1VSRV9IT09LIGJlY2F1c2UgdGhlCkNPTkZJR1VSRV9DTURT
IGZyb20gYXV0b3Rvb2xzIGlzIGNvbmZpZ3VyaW5nIGluc2lkZSB0aGUgR1JVQjJfU1JDRElSIGZv
bGRlci4KVGhlbiBpZiB0aGUgLi9jb25maWd1cmUgaGFzIGJlZW4gcnVuIGluIHRoZSBHUlVCMl9T
UkNESVIgSSBjYW4gbm90IHJ1biBvdGhlcgpjb25maWd1cmUgY29tbWFuZCB3aXRob3V0IHJlY2Vp
dmUgdGhpcyBlcnJvciBtZXNzYWdlOgogIGNvbmZpZ3VyZTogZXJyb3I6IHNvdXJjZSBkaXJlY3Rv
cnkgYWxyZWFkeSBjb25maWd1cmVkOyBydW4gIm1ha2UgZGlzdGNsZWFuIgogIHRoZXJlIGZpcnN0
CgpUbyBmb2xsb3cgdGhlIGxvZ2ljIEkgbW92ZSBhbGwgdGhlICpfQ01EU19QVEYgYXMgUFJFXypf
SE9PSy4KSSBoYXZlIHRlc3RlZCBpdCBhbmQgaXQgc2VlbXMgZnVuY3Rpb25pbmcuCgoKZGlmZiAt
LWdpdCBhL2Jvb3QvZ3J1YjIvZ3J1YjIubWsgYi9ib290L2dydWIyL2dydWIyLm1rCmluZGV4IGUw
MWViYjJlZGIuLmUzMzllZWQ2ZGUgMTAwNjQ0Ci0tLSBhL2Jvb3QvZ3J1YjIvZ3J1YjIubWsKKysr
IGIvYm9vdC9ncnViMi9ncnViMi5tawpAQCAtMTM5LDYgKzEzOSwyMiBAQCBHUlVCMl9DT05GX0VO
ViA9IFwKICAgICAgICBUQVJHRVRfT0JKQ09QWT0iJChUQVJHRVRfT0JKQ09QWSkiIFwKICAgICAg
ICBUQVJHRVRfU1RSSVA9IiQoVEFSR0VUX0NST1NTKXN0cmlwIgogCitHUlVCMl9DT05GX0NPTU1P
Tl9PUFRTID0gXAorICAgICAgIC0taG9zdD0kKEdOVV9UQVJHRVRfTkFNRSkgXAorICAgICAgIC0t
YnVpbGQ9JChHTlVfSE9TVF9OQU1FKSBcCisgICAgICAgLS1wcmVmaXg9LyBcCisgICAgICAgLS1l
eGVjLXByZWZpeD0vIFwKKyAgICAgICAtLWRpc2FibGUtZ3J1Yi1ta2ZvbnQgXAorICAgICAgIC0t
ZW5hYmxlLWVmaWVtdT1ubyBcCisgICAgICAgYWNfY3ZfbGliX2x6bWFfbHptYV9jb2RlPW5vIFwK
KyAgICAgICAtLWVuYWJsZS1kZXZpY2UtbWFwcGVyPW5vIFwKKyAgICAgICAtLWVuYWJsZS1saWJ6
ZnM9bm8gXAorICAgICAgIC0tZGlzYWJsZS13ZXJyb3IKKworR1JVQjJfQ09ORl9PUFRTID0gXAor
ICAgICAgICQoR1JVQjJfQ09ORl9DT01NT05fT1BUUykgXAorICAgICAgIC0td2l0aC1wbGF0Zm9y
bT1ub25lCisKIEhPU1RfR1JVQjJfQ09ORl9PUFRTID0gXAogICAgICAgIC0tZGlzYWJsZS1ncnVi
LW1rZm9udCBcCiAgICAgICAgLS1lbmFibGUtZWZpZW11PW5vIFwKQEAgLTE0Nyw3ICsxNjMsNyBA
QCBIT1NUX0dSVUIyX0NPTkZfT1BUUyA9IFwKICAgICAgICAtLWVuYWJsZS1saWJ6ZnM9bm8gXAog
ICAgICAgIC0tZGlzYWJsZS13ZXJyb3IKCi1kZWZpbmUgR1JVQjJfQ09ORklHVVJFX0NNRFMKK2Rl
ZmluZSBHUlVCMl9DT05GSUdVUkVfQ01EU19QVEYKICAgICAgICAkKGZvcmVhY2ggdHVwbGUsICQo
R1JVQjJfVFVQTEVTLXkpLCBcCiAgICAgICAgICAgICAgICBta2RpciAtcCAkKEBEKS9idWlsZC0k
KHR1cGxlKSA7IFwKICAgICAgICAgICAgICAgIGNkICQoQEQpL2J1aWxkLSQodHVwbGUpIDsgXApA
QCAtMTU3LDI2ICsxNzMsMTkgQEAgZGVmaW5lIEdSVUIyX0NPTkZJR1VSRV9DTURTCiAgICAgICAg
ICAgICAgICAuLi9jb25maWd1cmUgXAogICAgICAgICAgICAgICAgICAgICAgICAtLXRhcmdldD0k
KEdSVUIyX1RBUkdFVF8kKHR1cGxlKSkgXAogICAgICAgICAgICAgICAgICAgICAgICAtLXdpdGgt
cGxhdGZvcm09JChHUlVCMl9QTEFURk9STV8kKHR1cGxlKSkgXAotICAgICAgICAgICAgICAgICAg
ICAgICAtLWhvc3Q9JChHTlVfVEFSR0VUX05BTUUpIFwKLSAgICAgICAgICAgICAgICAgICAgICAg
LS1idWlsZD0kKEdOVV9IT1NUX05BTUUpIFwKLSAgICAgICAgICAgICAgICAgICAgICAgLS1wcmVm
aXg9LyBcCi0gICAgICAgICAgICAgICAgICAgICAgIC0tZXhlYy1wcmVmaXg9LyBcCi0gICAgICAg
ICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1ncnViLW1rZm9udCBcCi0gICAgICAgICAgICAgICAg
ICAgICAgIC0tZW5hYmxlLWVmaWVtdT1ubyBcCi0gICAgICAgICAgICAgICAgICAgICAgIGFjX2N2
X2xpYl9sem1hX2x6bWFfY29kZT1ubyBcCi0gICAgICAgICAgICAgICAgICAgICAgIC0tZW5hYmxl
LWRldmljZS1tYXBwZXI9bm8gXAotICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1saWJ6
ZnM9bm8gXAotICAgICAgICAgICAgICAgICAgICAgICAtLWRpc2FibGUtd2Vycm9yCisgICAgICAg
ICAgICAgICAgICAgICAgICQoR1JVQjJfQ09ORl9DT01NT05fT1BUUykKICAgICAgICApCiBlbmRl
ZgorR1JVQjJfUFJFX0NPTkZJR1VSRV9IT09LUyArPSBHUlVCMl9DT05GSUdVUkVfQ01EU19QVEYK
IAotZGVmaW5lIEdSVUIyX0JVSUxEX0NNRFMKK2RlZmluZSBHUlVCMl9CVUlMRF9DTURTX1BURgog
ICAgICAgICQoZm9yZWFjaCB0dXBsZSwgJChHUlVCMl9UVVBMRVMteSksIFwKICAgICAgICAgICAg
ICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpL2J1aWxkLSQodHVwbGUpCiAg
ICAgICAgKQogZW5kZWYKK0dSVUIyX1BSRV9CVUlMRF9IT09LUyArPSBHUlVCMl9CVUlMRF9DTURT
X1BURgogCi1kZWZpbmUgR1JVQjJfSU5TVEFMTF9JTUFHRVNfQ01EUworZGVmaW5lIEdSVUIyX0lO
U1RBTExfSU1BR0VTX0NNRFNfUFRGCiAgICAgICAgJChmb3JlYWNoIHR1cGxlLCAkKEdSVUIyX1RV
UExFUy15KSwgXAogICAgICAgICAgICAgICAgbWtkaXIgLXAgJChkaXIgJChHUlVCMl9JTUFHRV8k
KHR1cGxlKSkpIDsgXAogICAgICAgICAgICAgICAgJChIT1NUX0RJUikvdXNyL2Jpbi9ncnViLW1r
aW1hZ2UgXApAQCAtMTk0LDYgKzIwMywyMCBAQCBkZWZpbmUgR1JVQjJfSU5TVEFMTF9JTUFHRVNf
Q01EUwogICAgICAgICAgICAgICAgKSBcCiAgICAgICAgKQogZW5kZWYKK0dSVUIyX1BSRV9JTlNU
QUxMX0lNQUdFU19IT09LUyArPSBHUlVCMl9JTlNUQUxMX0NNRFNfUFRGCisKK2lmZXEgKCQoQlIy
X1RBUkdFVF9HUlVCMl9JTlNUQUxMX1RPT0xTKSx5KQorR1JVQjJfSU5TVEFMTF9UQVJHRVQgPSBZ
RVMKK2RlZmluZSBHUlVCMl9JTlNUQUxMX01PRFNfSU5fVEFSR0VUCisgICAgICAgJChmb3JlYWNo
IHR1cGxlLCAkKEdSVUIyX1RVUExFUy15KSwgXAorICAgICAgICAgICAgICAgJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgREVTVERJUj0kKEBEKS8kKGluc3RhbGwtJCh0dXBsZSkpCmluc3RhbGwg
LUMgJChARCkvYnVpbGQtJCh0dXBsZSkgOyBcCisgICAgICAgICAgICAgICBjcCAtYSAkKEBEKS8k
KGluc3RhbGwtJCh0dXBsZSkpL2xpYi8qICQoVEFSR0VUX0RJUikvbGliLyA7CisgICAgICAgKQor
ZW5kZWYKK0dSVUIyX1BPU1RfSU5TVEFMTF9JTUFHRVNfSE9PS1MgKz0gR1JVQjJfSU5TVEFMTF9N
T0RTX0lOX1RBUkdFVAorZWxzZQorR1JVQjJfSU5TVEFMTF9UQVJHRVQgPSBOTworZW5kaWYKIAot
JChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKKyQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkK
ICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQoKUmVnYXJkcywKS8O2cnkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
