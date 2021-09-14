Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42595C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE825610F9
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 16:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE825610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87436403B3;
	Tue, 14 Sep 2021 16:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TL0x5EDZUMuj; Tue, 14 Sep 2021 16:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A243D4017E;
	Tue, 14 Sep 2021 16:22:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1201BF42E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1901A6067E
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 16:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzOMSy02Ci5j for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 16:22:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC7906061A
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 16:22:42 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id CA09244073B;
 Tue, 14 Sep 2021 19:22:14 +0300 (IDT)
References: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>
Date: Tue, 14 Sep 2021 19:20:19 +0300
In-reply-to: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
Message-ID: <87ee9rgm9e.fsf@tarshish>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGkgSm9zw6ksCgpPbiBUdWUsIFNlcCAxNCAyMDIxLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+
IFRoaXMgcGF0Y2ggd2lsbCBhZGQgYW4gaW5pdCBzY3JpcHQgdGhhdCBhbGxvd3MKPiB0byBzZXQg
YSBydWxlc2V0IGluIC9ldGMvaXB0YWJsZXMuY29uZiB0byBiZSBsb2FkZWQKPiBvbiBib290LCBv
ciBmbHVzaGVkIG9uIHN0b3AsIGFzIHdlbGwgYXMgYSBzYXZpbmcKPiBjb21tYW5kIHRvIGdlbmVy
YXRlIGEgbmV3IGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3Nl
LnBla2thcmluZW5AdW5pa2llLmNvbT4KPiAtLS0KPiBbdjEgLT4gdjJdIHMvdG91Y2ggJChERVNU
RElSKS90b3VjaCAkKFRBUkdFVF9ESVIpLwo+Cj4gIHBhY2thZ2UvaXB0YWJsZXMvUzQxaXB0YWJs
ZXMgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9p
cHRhYmxlcy9pcHRhYmxlcy5tayB8ICA2ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFi
bGVzCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyBiL3BhY2th
Z2UvaXB0YWJsZXMvUzQxaXB0YWJsZXMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjkzOTk4Yjc4ZGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9pcHRh
Ymxlcy9TNDFpcHRhYmxlcwo+IEBAIC0wLDAgKzEsNTggQEAKPiArIyEvYmluL3NoCj4gKwo+ICtE
QUVNT049ImlwdGFibGVzIgo+ICsKPiArSVBUQUJMRVNfQVJHUz0iIgo+ICsKPiArc3RhcnQoKSB7
Cj4gKwlwcmludGYgJ1N0YXJ0aW5nICVzOiAnICIkREFFTU9OIgo+ICsJaXB0YWJsZXMtcmVzdG9y
ZSA8IC9ldGMvaXB0YWJsZXMuY29uZgo+ICsJc3RhdHVzPSQ/Cj4gKwlpZiBbICIkc3RhdHVzIiAt
ZXEgMCBdOyB0aGVuCj4gKwkJZWNobyAiT0siCj4gKwllbHNlCj4gKwkJZWNobyAiRkFJTCIKPiAr
CWZpCj4gKwlyZXR1cm4gIiRzdGF0dXMiCj4gK30KPiArCj4gK3N0b3AoKSB7Cj4gKwlwcmludGYg
J1N0b3BwaW5nICVzOiAnICIkREFFTU9OIgo+ICsJaXB0YWJsZXMgLUYKPiArCXN0YXR1cz0kPwo+
ICsJaWYgWyAiJHN0YXR1cyIgLWVxIDAgXTsgdGhlbgo+ICsJCWVjaG8gIk9LIgo+ICsJZWxzZQo+
ICsJCWVjaG8gIkZBSUwiCj4gKwlmaQo+ICsJcmV0dXJuICIkc3RhdHVzIgo+ICt9Cj4gKwo+ICty
ZXN0YXJ0KCkgewo+ICsJc3RvcAo+ICsJc2xlZXAgMQo+ICsJc3RhcnQKPiArfQo+ICsKPiArc2F2
ZSgpIHsKPiArCXByaW50ZiAnU2F2aW5nICVzOiAnICIkREFFTU9OIgo+ICsJaXB0YWJsZXMtc2F2
ZSA+IC9ldGMvaXB0YWJsZXMuY29uZgoKV2hhdCBhYm91dCByZWFkLW9ubHkgcm9vdGZzPwoKYmFy
dWNoCgo+ICsJc3RhdHVzPSQ/Cj4gKwlpZiBbICIkc3RhdHVzIiAtZXEgMCBdOyB0aGVuCj4gKwkJ
ZWNobyAiT0siCj4gKwllbHNlCj4gKwkJZWNobyAiRkFJTCIKPiArCWZpCj4gKwlyZXR1cm4gIiRz
dGF0dXMiCj4gK30KPiArCj4gK2Nhc2UgIiQxIiBpbgo+ICsJc3RhcnR8c3RvcHxyZXN0YXJ0fHNh
dmUpCj4gKwkJIiQxIjs7Cj4gKwlyZWxvYWQpCj4gKwkJIyBSZXN0YXJ0LCBzaW5jZSB0aGVyZSBp
cyBubyB0cnVlICJyZWxvYWQiIGZlYXR1cmUuCj4gKwkJcmVzdGFydDs7Cj4gKwkqKQo+ICsJCWVj
aG8gIlVzYWdlOiAkMCB7c3RhcnR8c3RvcHxyZXN0YXJ0fHJlbG9hZH0iCj4gKwkJZXhpdCAxCj4g
K2VzYWMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5tayBiL3BhY2th
Z2UvaXB0YWJsZXMvaXB0YWJsZXMubWsKPiBpbmRleCBkYzAxNDY2NjA3Li4xZDM2MTJkYmY2IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsKPiArKysgYi9wYWNrYWdl
L2lwdGFibGVzL2lwdGFibGVzLm1rCj4gQEAgLTU3LDQgKzU3LDEwIEBAIGRlZmluZSBJUFRBQkxF
U19MSU5VWF9DT05GSUdfRklYVVBTCj4gIAkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJ
R19ORVRGSUxURVJfWFRBQkxFUykKPiAgZW5kZWYKPiAgCj4gK2RlZmluZSBJUFRBQkxFU19JTlNU
QUxMX0lOSVRfU1lTVgo+ICsJJChJTlNUQUxMKSAtbSAwNzU1IC1EIHBhY2thZ2UvaXB0YWJsZXMv
UzQxaXB0YWJsZXMgXAo+ICsJCSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TNDFpcHRhYmxlcwo+
ICsJdG91Y2ggJChUQVJHRVRfRElSKS9ldGMvaXB0YWJsZXMuY29uZgo+ICtlbmRlZgo+ICsKPiAg
JChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQoKCi0tIAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1P
b28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2
OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBs
aXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
