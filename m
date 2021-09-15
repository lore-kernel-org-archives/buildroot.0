Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92724C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 10:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F09D061251
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 10:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F09D061251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4EDA80D3F;
	Wed, 15 Sep 2021 10:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmIXp6pvFRSw; Wed, 15 Sep 2021 10:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41DD80CED;
	Wed, 15 Sep 2021 10:09:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6D71BF3B5
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 10:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39D6B4021B
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 10:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44_b4oU87cJB for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 10:09:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0D71400EE
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 10:09:06 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 4E508440E45;
 Wed, 15 Sep 2021 13:08:37 +0300 (IDT)
References: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
 <87ee9rgm9e.fsf@tarshish>
 <CAJPV9MoTBjbwuAbtWaeHeSJBOKtYAbpOtJCJTAj3NW8ZF8HRSQ@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>
Date: Wed, 15 Sep 2021 13:05:18 +0300
In-reply-to: <CAJPV9MoTBjbwuAbtWaeHeSJBOKtYAbpOtJCJTAj3NW8ZF8HRSQ@mail.gmail.com>
Message-ID: <87k0jif8w4.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/iptables: add init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@lists.buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGkgSm9zw6ksCgpPbiBXZWQsIFNlcCAxNSAyMDIxLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+
IE9uIFR1ZSwgU2VwIDE0LCAyMDIxIGF0IDc6MjIgUE0gQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtv
cy5jby5pbD4gd3JvdGU6Cj4gIE9uIFR1ZSwgU2VwIDE0IDIwMjEsIEpvc8OpIFBla2thcmluZW4g
d3JvdGU6Cj4gID4gVGhpcyBwYXRjaCB3aWxsIGFkZCBhbiBpbml0IHNjcmlwdCB0aGF0IGFsbG93
cwo+ICA+IHRvIHNldCBhIHJ1bGVzZXQgaW4gL2V0Yy9pcHRhYmxlcy5jb25mIHRvIGJlIGxvYWRl
ZAo+ICA+IG9uIGJvb3QsIG9yIGZsdXNoZWQgb24gc3RvcCwgYXMgd2VsbCBhcyBhIHNhdmluZwo+
ICA+IGNvbW1hbmQgdG8gZ2VuZXJhdGUgYSBuZXcgZmlsZS4KPiAgPgo+ICA+IFNpZ25lZC1vZmYt
Ynk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+ICA+IC0t
LQo+ICA+IFt2MSAtPiB2Ml0gcy90b3VjaCAkKERFU1RESVIpL3RvdWNoICQoVEFSR0VUX0RJUikv
Cj4gID4KPiAgPiAgcGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyB8IDU4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA+ICBwYWNrYWdlL2lwdGFibGVzL2lwdGFibGVz
Lm1rIHwgIDYgKysrKwo+ICA+ICAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKPiAg
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaXB0YWJsZXMvUzQxaXB0YWJsZXMKPiAgPgo+
ICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFibGVzIGIvcGFja2FnZS9p
cHRhYmxlcy9TNDFpcHRhYmxlcwo+ICA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gID4gaW5kZXgg
MDAwMDAwMDAwMC4uOTM5OThiNzhkZQo+ICA+IC0tLSAvZGV2L251bGwKPiAgPiArKysgYi9wYWNr
YWdlL2lwdGFibGVzL1M0MWlwdGFibGVzCj4gID4gQEAgLTAsMCArMSw1OCBAQAo+ICA+ICsjIS9i
aW4vc2gKPiAgPiArCj4gID4gK0RBRU1PTj0iaXB0YWJsZXMiCj4gID4gKwo+ICA+ICtJUFRBQkxF
U19BUkdTPSIiCj4gID4gKwo+ICA+ICtzdGFydCgpIHsKPiAgPiArICAgICBwcmludGYgJ1N0YXJ0
aW5nICVzOiAnICIkREFFTU9OIgo+ICA+ICsgICAgIGlwdGFibGVzLXJlc3RvcmUgPCAvZXRjL2lw
dGFibGVzLmNvbmYKPiAgPiArICAgICBzdGF0dXM9JD8KPiAgPiArICAgICBpZiBbICIkc3RhdHVz
IiAtZXEgMCBdOyB0aGVuCj4gID4gKyAgICAgICAgICAgICBlY2hvICJPSyIKPiAgPiArICAgICBl
bHNlCj4gID4gKyAgICAgICAgICAgICBlY2hvICJGQUlMIgo+ICA+ICsgICAgIGZpCj4gID4gKyAg
ICAgcmV0dXJuICIkc3RhdHVzIgo+ICA+ICt9Cj4gID4gKwo+ICA+ICtzdG9wKCkgewo+ICA+ICsg
ICAgIHByaW50ZiAnU3RvcHBpbmcgJXM6ICcgIiREQUVNT04iCj4gID4gKyAgICAgaXB0YWJsZXMg
LUYKPiAgPiArICAgICBzdGF0dXM9JD8KPiAgPiArICAgICBpZiBbICIkc3RhdHVzIiAtZXEgMCBd
OyB0aGVuCj4gID4gKyAgICAgICAgICAgICBlY2hvICJPSyIKPiAgPiArICAgICBlbHNlCj4gID4g
KyAgICAgICAgICAgICBlY2hvICJGQUlMIgo+ICA+ICsgICAgIGZpCj4gID4gKyAgICAgcmV0dXJu
ICIkc3RhdHVzIgo+ICA+ICt9Cj4gID4gKwo+ICA+ICtyZXN0YXJ0KCkgewo+ICA+ICsgICAgIHN0
b3AKPiAgPiArICAgICBzbGVlcCAxCj4gID4gKyAgICAgc3RhcnQKPiAgPiArfQo+ICA+ICsKPiAg
PiArc2F2ZSgpIHsKPiAgPiArICAgICBwcmludGYgJ1NhdmluZyAlczogJyAiJERBRU1PTiIKPiAg
PiArICAgICBpcHRhYmxlcy1zYXZlID4gL2V0Yy9pcHRhYmxlcy5jb25mCj4KPiAgV2hhdCBhYm91
dCByZWFkLW9ubHkgcm9vdGZzPwo+Cj4gICAgIFZlcnkgZ29vZCBwb2ludCwgd2lsbCBpdCB3b3Jr
IGlmIHdlIGNoZWNrIHRoZSByb290ZnMKPiB3aGV0aGVyIGlzIHJvIG9yIHJ3LCBhbmQgZXhlY3V0
ZSBvbiB0aGF0IGJlaGFsZj8KCkknbSBub3Qgc3VyZSB0aGF0IHRoaXMgc2NyaXB0IGlzIGEgZ29v
ZCBpZGVhIHRvIGJlZ2luIHdpdGggZm9yIHRoZQpkZWZhdWx0IGluc3RhbGxhdGlvbi4gQnV0IGlm
IHRoZSBtYWludGFpbmVycyB0aGluayBpdCBpcywgdGhlIHNjcmlwdApzaG91bGQgc2tpcCB0aGUg
c2F2ZSBvcGVyYXRpb24gZm9yIHJlYWQtb25seSBmaWxlc3lzdGVtcy4gU2VlIGhvdwpwYWNrYWdl
L3VyYW5kb20tc2NyaXB0cy9TMjB1cmFuZG9tIGhhbmRsZXMgdGhhdC4KCmJhcnVjaAoKPgo+ICAg
ICBUaGFua3MgZm9yIHRoZSBjb21tZW50cyEKPgo+ICAgICBKb3PDqS4KPiAgCj4gIGJhcnVjaAo+
Cj4gID4gKyAgICAgc3RhdHVzPSQ/Cj4gID4gKyAgICAgaWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsg
dGhlbgo+ICA+ICsgICAgICAgICAgICAgZWNobyAiT0siCj4gID4gKyAgICAgZWxzZQo+ICA+ICsg
ICAgICAgICAgICAgZWNobyAiRkFJTCIKPiAgPiArICAgICBmaQo+ICA+ICsgICAgIHJldHVybiAi
JHN0YXR1cyIKPiAgPiArfQo+ICA+ICsKPiAgPiArY2FzZSAiJDEiIGluCj4gID4gKyAgICAgc3Rh
cnR8c3RvcHxyZXN0YXJ0fHNhdmUpCj4gID4gKyAgICAgICAgICAgICAiJDEiOzsKPiAgPiArICAg
ICByZWxvYWQpCj4gID4gKyAgICAgICAgICAgICAjIFJlc3RhcnQsIHNpbmNlIHRoZXJlIGlzIG5v
IHRydWUgInJlbG9hZCIgZmVhdHVyZS4KPiAgPiArICAgICAgICAgICAgIHJlc3RhcnQ7Owo+ICA+
ICsgICAgICopCj4gID4gKyAgICAgICAgICAgICBlY2hvICJVc2FnZTogJDAge3N0YXJ0fHN0b3B8
cmVzdGFydHxyZWxvYWR9Igo+ICA+ICsgICAgICAgICAgICAgZXhpdCAxCj4gID4gK2VzYWMKPiAg
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5tayBiL3BhY2thZ2UvaXB0
YWJsZXMvaXB0YWJsZXMubWsKPiAgPiBpbmRleCBkYzAxNDY2NjA3Li4xZDM2MTJkYmY2IDEwMDY0
NAo+ICA+IC0tLSBhL3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsKPiAgPiArKysgYi9wYWNr
YWdlL2lwdGFibGVzL2lwdGFibGVzLm1rCj4gID4gQEAgLTU3LDQgKzU3LDEwIEBAIGRlZmluZSBJ
UFRBQkxFU19MSU5VWF9DT05GSUdfRklYVVBTCj4gID4gICAgICAgJChjYWxsIEtDT05GSUdfRU5B
QkxFX09QVCxDT05GSUdfTkVURklMVEVSX1hUQUJMRVMpCj4gID4gIGVuZGVmCj4gID4gIAo+ICA+
ICtkZWZpbmUgSVBUQUJMRVNfSU5TVEFMTF9JTklUX1NZU1YKPiAgPiArICAgICAkKElOU1RBTEwp
IC1tIDA3NTUgLUQgcGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyBcCj4gID4gKyAgICAgICAg
ICAgICAkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzQxaXB0YWJsZXMKPiAgPiArICAgICB0b3Vj
aCAkKFRBUkdFVF9ESVIpL2V0Yy9pcHRhYmxlcy5jb25mCj4gID4gK2VuZGVmCj4gID4gKwo+ICA+
ICAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCgotLSAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo9
fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9vTy0tVS0t
T29vLS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4z
NjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
bGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
