Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC2CC3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 02:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F933810AC;
	Mon,  8 Jul 2024 02:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofGkkFFYbkJ9; Mon,  8 Jul 2024 02:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E03A381099
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03A381099;
	Mon,  8 Jul 2024 02:27:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6601BF5DF
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 02:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 667D0402E5
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 02:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjsSk5OwJN3E for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 02:27:12 +0000 (UTC)
X-Greylist: delayed 2956 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Jul 2024 02:27:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77A91400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77A91400C5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=20.231.56.155;
 helo=azure-sdnproxy.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [20.231.56.155])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A91400C5
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 02:27:10 +0000 (UTC)
Received: from zhangdongdong$eswincomputing.com ( [10.12.96.115] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 8 Jul 2024 10:25:05 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.115]
Date: Mon, 8 Jul 2024 10:25:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: DongdongZhang <zhangdongdong@eswincomputing.com>
To: "James Hilliard" <james.hilliard1@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2024 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <CADvTj4r-1xVwmr+W=Lyj2Ff4KZMR8znZyuAgguCt24Y46oYhkg@mail.gmail.com>
References: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
 <20240708013718.19051-2-zhangdongdong@eswincomputing.com>
 <CADvTj4r-1xVwmr+W=Lyj2Ff4KZMR8znZyuAgguCt24Y46oYhkg@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <1a197586.4af8.1909028b645.Coremail.zhangdongdong@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgBHWbsBTotmhnYUAA--.15472W
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQEMCmaKY
 PEWwAACsv
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=eswincomputing.com
Subject: Re: [Buildroot] [PATCH v2 1/1] .github: add github action to
 automate PR handling
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
Cc: bonet@grenoble.cnrs.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0t5Y+R5Lu25Lq6OiJKYW1lcyBIaWxsaWFyZCIgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+5Y+R6YCB5pe26Ze0OjIwMjQtMDctMDggMTA6MTM6MzAg
KOaYn+acn+S4gCnmlLbku7bkuro6emhhbmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb23mioTp
gIE6YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcsIGJvbmV0QGdyZW5vYmxlLmNucnMuZnLkuLvpopg6
UmU6IFtCdWlsZHJvb3RdIFtQQVRDSCB2MiAxLzFdIC5naXRodWI6IGFkZCBnaXRodWIgYWN0aW9u
IHRvIGF1dG9tYXRlIFBSIGhhbmRsaW5nCj4gCj4gT24gU3VuLCBKdWwgNywgMjAyNCBhdCA3OjM4
4oCvUE0gPHpoYW5nZG9uZ2RvbmdAZXN3aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPiA+Cj4gPiBG
cm9tOiBEb25nZG9uZyBaaGFuZyA8emhhbmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb20+Cj4g
Pgo+ID4gVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBCdWlsZHJvb3QgcmVwb3NpdG9yeSdzIEdpdEh1
YiBjb25maWd1cmF0aW9uIHRvIGJldHRlcgo+ID4gbWFuYWdlIGluY29taW5nIHB1bGwgcmVxdWVz
dHMuCj4gPgo+ID4gLSBBZGRlZCBhIG5ldyBHaXRIdWIgQWN0aW9ucyB3b3JrZmxvdyAoYHJlcG8t
bG9ja2Rvd24ueW1sYCkgdG8gYXV0b21hdGljYWxseQo+ID4gICBoYW5kbGUgbmV3IHB1bGwgcmVx
dWVzdHMuCj4gPgo+ID4gVGhlIG5ldyB3b3JrZmxvdzoKPiA+IC0gVHJpZ2dlcnMgb24gbmV3IHB1
bGwgcmVxdWVzdHMuCj4gPiAtIFVzZXMgdGhlIGBkZXNzYW50L3JlcG8tbG9ja2Rvd25gIGFjdGlv
biB0bzoKPiA+ICAgLSBDb21tZW50IG9uIHRoZSBwdWxsIHJlcXVlc3QsIGd1aWRpbmcgY29udHJp
YnV0b3JzIHRvIHVzZSB0aGUgbWFpbGluZyBsaXN0Cj4gPiAgICAgZm9yIHBhdGNoIHN1Ym1pc3Np
b24uCj4gPiAgIC0gTG9jayB0aGUgcHVsbCByZXF1ZXN0IHRvIHByZXZlbnQgZnVydGhlciBkaXNj
dXNzaW9uLgo+ID4gICAtIENsb3NlIHRoZSBwdWxsIHJlcXVlc3QuCj4gPgo+ID4gVGhpcyBjaGFu
Z2UgZW5zdXJlcyB0aGF0IGNvbnRyaWJ1dG9ycyBhcmUgcHJvcGVybHkgZGlyZWN0ZWQgdG8gdGhl
IHByZWZlcnJlZAo+ID4gbWV0aG9kIG9mIHBhdGNoIHN1Ym1pc3Npb24gdmlhIHRoZSBtYWlsaW5n
IGxpc3QsIG1haW50YWluaW5nIGNvbnNpc3RlbmN5IGFuZAo+ID4gc3RyZWFtbGluaW5nIHRoZSBy
ZXZpZXcgcHJvY2Vzcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nZG9uZyBaaGFuZyA8emhh
bmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb20+Cj4gPiAtLS0KPiA+ICAuZ2l0aHViL3dvcmtm
bG93cy9yZXBvLWxvY2tkb3duLnltbCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
LmdpdGh1Yi93b3JrZmxvd3MvcmVwby1sb2NrZG93bi55bWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
LmdpdGh1Yi93b3JrZmxvd3MvcmVwby1sb2NrZG93bi55bWwgYi8uZ2l0aHViL3dvcmtmbG93cy9y
ZXBvLWxvY2tkb3duLnltbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAw
MDAwMDAuLmE1ZjhiZDZhOTMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiLy5naXRodWIvd29y
a2Zsb3dzL3JlcG8tbG9ja2Rvd24ueW1sCj4gPiBAQCAtMCwwICsxLDIzIEBACj4gPiArbmFtZTog
J1JlcG8gTG9ja2Rvd24nCj4gPiArCj4gPiArb246Cj4gPiArICBwdWxsX3JlcXVlc3RfdGFyZ2V0
Ogo+ID4gKyAgICB0eXBlczogb3BlbmVkCj4gPiArCj4gPiArcGVybWlzc2lvbnM6Cj4gPiArICBw
dWxsLXJlcXVlc3RzOiB3cml0ZQo+ID4gKwo+ID4gK2pvYnM6Cj4gPiArICBhY3Rpb246Cj4gPiAr
ICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKPiA+ICsgICAgc3RlcHM6Cj4gPiArICAgICAgLSB1
c2VzOiBkZXNzYW50L3JlcG8tbG9ja2Rvd25AdjQKPiAKPiBDYW4gcHJvYmFibHkganVzdCB1c2Ug
YSBnaXRodWIgc2NyaXB0IGFsb25nIHRoZXNlIGxpbmVzIG9yIHNvbWV0aGluZzoKPiBodHRwczov
L2dpdGh1Yi5jb20vc2JhYmljL3N3dXBkYXRlL2Jsb2IvMjAyNC4wNS4yLy5naXRodWIvd29ya2Zs
b3dzL2NvbnRyaWJ1dGluZy55bWwKPiAKPiBwcm9iYWJseSBhbHNvIG5lZWRzIGEgY29uZGl0aW9u
YWwgc28gaXQgb25seSBydW5zIG9uIHRoZSBvbmUgZ2l0aHViIHJlcG86Cj4gaWY6IGdpdGh1Yi5y
ZXBvc2l0b3J5ID09IOKAmGJ1aWxkcm9vdC9idWlsZHJvb3TigJkKPiAKCkhpLCBKYW1lcywKSW4g
dGhpcyBzY2VuYXJpbywgSSBiZWxpZXZlIHRoYXQgdXNpbmcgYGRlc3NhbnQvcmVwby1sb2NrZG93
bkB2NGAgaXMgbW9yZSBzdWl0YWJsZSAKdGhhbiBgYWN0aW9ucy9naXRodWItc2NyaXB0QHY1YC4g
YGRlc3NhbnQvcmVwby1sb2NrZG93bkB2NGAgaXMgc3BlY2lmaWNhbGx5IGZvY3VzZWQgCm9uIHJl
cG9zaXRvcnkgbG9ja2Rvd24gZnVuY3Rpb25hbGl0eSBhbmQgaGFzIGJlZW4gd2lkZWx5IHVzZWQg
YW5kIHZhbGlkYXRlZC4gCkluIGNvbnRyYXN0LCB3aGlsZSBgYWN0aW9ucy9naXRodWItc2NyaXB0
QHY1YCBpcyBmbGV4aWJsZSwgaXQgcmVxdWlyZXMgbW9yZSAKY3VzdG9taXphdGlvbiBhbmQgbWFp
bnRlbmFuY2Ugd29yayBhbmQgYSBzdHJvbmcgZmFtaWxpYXJpdHkgd2l0aCBKYXZhU2NyaXB0LiAK
VG8ga2VlcCB0aGUgcHJvY2VzcyBzaW1wbGUgYW5kIHN0YWJsZSwgSSBoYXZlIGRlY2lkZWQgdG8g
Y29udGludWUgCnVzaW5nIGBkZXNzYW50L3JlcG8tbG9ja2Rvd25AdjRgLgoKVGhhbmsgeW91IGFn
YWluIGZvciB5b3VyIHN1Z2dlc3Rpb24uCgo+ID4gKyAgICAgICAgd2l0aDoKPiA+ICsgICAgICAg
ICAgcHItY29tbWVudDogfAo+ID4gKyAgICAgICAgICAgIFBsZWFzZSBkbyBub3Qgc3VibWl0IGEg
UHVsbCBSZXF1ZXN0IHZpYSBHaXRIdWIuIEJ1aWxkcm9vdCBtYWtlcyB1c2Ugb2YgYQo+ID4gKyAg
ICAgICAgICAgIFttYWlsaW5nIGxpc3RdKGh0dHA6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290KSBmb3IgcGF0Y2ggc3VibWlzc2lvbiBhbmQgcmV2aWV3Lgo+
ID4gKyAgICAgICAgICAgIFNlZSBbc3VibWl0dGluZyB5b3VyIG93biBwYXRjaGVzXShodHRwOi8v
YnVpbGRyb290Lm9yZy9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMpIGZvciBtb3JlIGlu
Zm8uCj4gPiArCj4gPiArICAgICAgICAgICAgVGhhbmtzIGZvciB5b3VyIGhlbHAhCj4gPiArICAg
ICAgICAgIGxvY2stcHI6IHRydWUKPiA+ICsgICAgICAgICAgY2xvc2UtcHI6IHRydWUKPiA+IFwg
Tm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
