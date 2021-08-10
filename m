Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F76AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:01:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712DC60C51
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 712DC60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315E260675;
	Tue, 10 Aug 2021 14:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le7Q50OyuOLe; Tue, 10 Aug 2021 14:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9343606CE;
	Tue, 10 Aug 2021 14:01:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2721BF5A8
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B3CE83777
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNOdsx5eJL7k for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 14:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11FBD827AA
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 14:01:32 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id A9F1C44029B;
 Tue, 10 Aug 2021 17:01:24 +0300 (IDT)
References: <20210810131236.18022-1-zajec5@gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
In-reply-to: <20210810131236.18022-1-zajec5@gmail.com>
Date: Tue, 10 Aug 2021 17:01:27 +0300
Message-ID: <87y299flfs.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/broadcom: add support for Northstar
 platform devices
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgUmFmYcWCLAoKb24gVHVlLCBBdWcgMTAgMjAyMSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+
IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPgo+IEJyb2FkY29tIE5v
cnRoc3RhciBmYW1pbHkgb2YgU29DcyBpcyBtb3N0IGNvbW1vbmx5IHVzZWQgZm9yIGhvbWUKPiBy
b3V0ZXJzLiBJdCdzIGFuIEFSTSBwbGF0Zm9ybSB3aXRoIENvcnRleC1BOSBDUFUocykuCj4KPiBB
bGwga25vd24gTm9ydGhzdGFyIGRldmljZXMgY29tZSB3aXRoIENGRSBib290bG9hZGVyIHdoaWNo
IGFsbW9zdCBhbHdheXMKPiBleHBlY3RzIGEgVFJYIGZpcm13YXJlIGZvcm1hdCAod2l0aCBleGNl
cHRpb24gZm9yIHRoZSBELUxpbmspLiBTb21lCj4gdmVuZG9ycyAobGlrZSBMdXh1bCBhbmQgTmV0
Z2Vhcikgd3JhcCBUUlggaW4gdGhlaXIgb3duIGNvbnRhaW5lcnMuCj4KPiBGb3IgYWJvdmUgcmVh
c29uIGEgcGxhaW4ga2VybmVsIGFuZCByb290ZnMgYXJlIHVzZWxlc3MgZm9yIGZsYXNoaW5nCj4g
cHVycG9zZXMuIENGRSByZXF1aXJlcyBUUlgoLWxpa2UpIGZvcm1hdCBhbmQgdGhlcmUgaXNuJ3Qg
YW55IENGRQo+IHJlcGxhY2VtZW50LiBBbm90aGVyIGlzc3VlIGlzIGxhY2sgZm9yIERUUyBzdXBw
b3J0IGluIENGRS4KPiBUaGF0J3Mgd2h5IGZvciB0aGlzIGJvYXJkIHRoZXJlIGlzIHBvc3QtaW1h
Z2Ugc2NyaXB0IGJ1aWxkaW5nIGRldmljZQo+IHNwZWNpZmljIGltYWdlcy4gSXQgdGFrZXMgY2Fy
ZSBvZiBhcHBlbmRpbmcgRFRCIHRvIHRoZSBrZXJuZWwgYW5kCj4gcHV0dGluZyBldmVyeXRoaW5n
IGluIGEgVFJYIGltYWdlLgo+Cj4gS2VybmVsIGNvbmZpZyB3YXMgYWRqdXN0ZWQgdG8gcHJvdmlk
ZSBtaW5pbWFsIHN1cHBvcnQgYWxsIG9uLVNvQyBibG9ja3MKPiAobGlrZSBFdGhlcm5ldCwgc3dp
dGNoLCBVU0IsIFBDSWUpLiBGb3Igcm9vdGZzIHRoaXMgYm9hcmRzIGFkZHMgbmV0d29yawo+IGNv
bmZpZyB0aGF0IHNldHVwcyBpbnRlcmZhY2VzIG1ha2luZyBkZXZpY2UgYWNjZXNzaWJsZSBvdmVy
IHRoZSBuZXR3b3JrLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+IC0tLQoKW21ldGEtcGF0Y2ggdGV4dCBnb2VzIGhlcmVdCgo+ICsrKyBiL2Jv
YXJkL2Jyb2FkY29tL25zL3Bvc3QtaW1hZ2Uuc2gKPiBAQCAtMCwwICsxLDQzIEBACj4gKyMhL2Jp
bi9zaAo+ICsKPiArIyAkMTogaW1hZ2VzIGRpcmVjdG9yeSBwYXRoCj4gKyMgJDI6IGRldmljZSBk
dHMgZmlsZW5hbWUKPiArIyAkMzogYm9hcmQgaWQKPiArYnVpbGRfbHhsKCkgewo+ICsJbG9jYWwg
aW1hZ2VzPSIkMSIKPiArCWxvY2FsIGRldmljZT0iJDIiCj4gKwlsb2NhbCBib2FyZD0iJDMiCj4g
Kwo+ICsJbHptYS1hbG9uZSBlICRpbWFnZXMvekltYWdlLiRkZXZpY2UgJGltYWdlcy96SW1hZ2Uu
JGRldmljZS5sem1hIC1kMTYKPiArCXJtIC1mICRpbWFnZXMvekltYWdlLiRkZXZpY2UKPiArCSRI
T1NUX0RJUi9iaW4vb3RyeCBjcmVhdGUgJGltYWdlcy8kZGV2aWNlLnRyeCAtZiAkaW1hZ2VzL3pJ
bWFnZS4kZGV2aWNlLmx6bWEKPiArCXJtIC1mICRpbWFnZXMvekltYWdlLiRkZXZpY2UubHptYQo+
ICsJJEhPU1RfRElSL2Jpbi9seGxmdyBjcmVhdGUgJGltYWdlcy8kZGV2aWNlLmx4bCAtaSAkaW1h
Z2VzLyRkZXZpY2UudHJ4IC1iICIkYm9hcmQiCj4gK30KPiArCj4gKyMgJDE6IGltYWdlcyBkaXJl
Y3RvcnkgcGF0aAo+ICsjICQyOiBkZXZpY2UgZHRzIGZpbGVuYW1lCj4gK2J1aWxkX3RyeCgpIHsK
PiArCWxvY2FsIGltYWdlcz0iJDEiCj4gKwlsb2NhbCBkZXZpY2U9IiQyIgo+ICsKPiArCWx6bWEt
YWxvbmUgZSAkaW1hZ2VzL3pJbWFnZS4kZGV2aWNlICRpbWFnZXMvekltYWdlLiRkZXZpY2UubHpt
YSAtZDE2Cj4gKwlybSAtZiAkaW1hZ2VzL3pJbWFnZS4kZGV2aWNlCj4gKwkkSE9TVF9ESVIvYmlu
L290cnggY3JlYXRlICRpbWFnZXMvJGRldmljZS50cnggLWYgJGltYWdlcy96SW1hZ2UuJGRldmlj
ZS5sem1hCgpJcyB0aGlzIHV0aWxpdHkgcGFydCBvZiB0aGUgZmlybXdhcmUtdXRpbHMgaG9zdCBw
YWNrYWdlPyBJIHNlZSB0aGF0CmRlZmNvbmZpZyBzZWxlY3RzIEJSMl9QQUNLQUdFX0hPU1RfRklS
TVdBUkVfVVRJTFMgd2hpY2ggaXMgbm90IGluCmN1cnJlbnQgQnVpbGRyb290IG1hc3Rlci4gU28g
dGhpcyBwYXRjaCBkZXBlbmRzIG9uIHRoZSBwYXRjaAoicGFja2FnZS9maXJtd2FyZS11dGlsczog
YWRkIHBhY2thZ2UiOgoKICBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMTA4MDkxNDQxNDQuMzAxMDUtMS16YWplYzVAZ21haWwuY29tLwoKWW91
IHNob3VsZCBtZW50aW9ucyB0aGF0IGluIHRoZSBtZXRhLXBhdGNoIHBhcnQgb2YgdGhlIGVtYWls
IChzZWUKYWJvdmUpLgoKYmFydWNoCgo+ICsJcm0gLWYgJGltYWdlcy96SW1hZ2UuJGRldmljZS5s
em1hCj4gK30KPiArCj4gK2RldmljZXM9IiQoc2VkIC1uICdzL15CUjJfTElOVVhfS0VSTkVMX0lO
VFJFRV9EVFNfTkFNRT0iXChbYS16MC05IFwtXSpcKSIkL1wxL3AnICR7QlIyX0NPTkZJR30pIgo+
ICtmb3IgZGV2aWNlIGluICRkZXZpY2VzOyBkbwo+ICsJY2FzZSAiJGRldmljZSIgaW4KPiArCQki
YmNtNDcwOC1zbWFydHJnLXNyNDAwYWMiKQo+ICsJCQlidWlsZF90cnggIiQxIiAiJGRldmljZSIK
PiArCQkJOzsKPiArCQkiYmNtNDcwOTQtbHV4dWwteGFwLTE2MTAiKQo+ICsJCQlidWlsZF9seGwg
IiQxIiAiJGRldmljZSIgIlhBUC0xNjEwIgo+ICsJCQk7Owo+ICsJCSJiY200NzA5NC1sdXh1bC14
d3ItMzE1MC12MSIpCj4gKwkJCWJ1aWxkX2x4bCAiJDEiICIkZGV2aWNlIiAiWFdSLTMxNTAiCj4g
KwkJCTs7Cj4gKwllc2FjCj4gK2RvbmUKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0t
LS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2
LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94
Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
