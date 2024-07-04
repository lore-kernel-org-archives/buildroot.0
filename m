Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F03AC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 09:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F8C40339;
	Thu,  4 Jul 2024 09:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JrZIIJduSK1; Thu,  4 Jul 2024 09:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241EC4034D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241EC4034D;
	Thu,  4 Jul 2024 09:43:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291851BF319
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 09:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 239D88482F
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 09:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYt0UcLdc2hQ for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 09:43:42 +0000 (UTC)
X-Greylist: delayed 111140 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 04 Jul 2024 09:43:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F0E281469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0E281469
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.97.181.73;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net
 (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F0E281469
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 09:43:41 +0000 (UTC)
Received: from zhangdongdong$eswincomputing.com ( [10.12.96.115] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 4 Jul 2024 17:43:29 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.115]
Date: Thu, 4 Jul 2024 17:43:29 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: DongdongZhang <zhangdongdong@eswincomputing.com>
To: bonet@grenoble.cnrs.fr
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2024 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
References: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
MIME-Version: 1.0
Message-ID: <34acf5ca.47e5.1907d20a3c1.Coremail.zhangdongdong@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAnOrzBboZm8uUTAA--.15317W
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAgEICmaFH
 Lc-5gABsR
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=eswincomputing.com
Subject: Re: [Buildroot] [PATCH] .github: add github action to automate PR
 handling
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ClNvcnJ5LCBFZGdhciBCb25ldCwgSSBtaWdodCBub3QgaGF2ZSByZWNlaXZlZCB5b3VyIGVtYWls
cyBkdWUgdG8gdGhlCmNvbXBhbnkncyBlbWFpbCBmaWx0ZXJpbmcuIEkgb25seSBmb3VuZCB5b3Vy
IGVtYWlsIHRvZGF5IHdoZW4gSSBjaGVja2VkCnRoZSBidWlsZHJvb3QgdGhyZWFkIGxpc3QsIEkg
YXBvbG9naXplIGZvciB0aGF0LgoKV2hlbiBJIHdhcyBhZGRpbmcgdGhpcyB3b3JrZmxvdywgSSBm
ZWx0IHRoYXQgcmVtaW5kaW5nIGRldmVsb3BlcnMgdHdpY2UKd2FzIGEgYml0IHJlZHVuZGFudC4g
SG93ZXZlciwgeW91ciBzdWdnZXN0aW9uIGlzIGdyZWF0LCBhcyB0aGUgcHVsbApyZXF1ZXN0IHRl
bXBsYXRlIGNhbiByZW1pbmQgZGV2ZWxvcGVycyBpbW1lZGlhdGVseSwgcmF0aGVyIHRoYW4gd2Fp
dGluZwp1bnRpbCBhZnRlciB0aGUgcHVsbCByZXF1ZXN0IGlzIGNyZWF0ZWQuIEkgd2lsbCByZXN0
b3JlIHRoZSBwdWxsIHJlcXVlc3QKdGVtcGxhdGUgaW4gdGhlIG5leHQgdmVyc2lvbiBhbmQga2Vl
cCBpdC4KClRoYW5rIHlvdS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpIZWxsbyEKCkRvbmdkb25nIFpoYW5nIHdyb3RlOgo+IFRoaXMgcGF0
Y2ggWy4uLl0gUmVtb3ZlZCB0aGUgZXhpc3RpbmcgcHVsbCByZXF1ZXN0IHRlbXBsYXRlIHRoYXQK
PiBhZHZpc2VkIGNvbnRyaWJ1dG9ycyB0byB1c2UgdGhlIG1haWxpbmcgbGlzdCBmb3IgcGF0Y2gg
c3VibWlzc2lvbnMuCgpXaGF0IGlzIHRoZSByYXRpb25hbGUgZm9yIGRvaW5nIHNvPyBUaGUgc29v
bmVyIHRoZSBjb250cmlidXRvciBsZWFybnMKYWJvdXQgdGhlIHByb2NlZHVyZSwgdGhlIG1vcmUg
Y29udmVuaWVudCBpdCBpcyBmb3IgdGhlbS4gS2VlcGluZyB0aGlzCnRlbXBsYXRlIHdvdWxkIHRo
ZW4gYmUgZnJpZW5kbGllciB0byB3b3VsZC1iZSBjb250cmlidXRvcnMuCgpPZiBjb3Vyc2UsIHRo
ZXJlIGlzIHN0aWxsIHRoZSBwb3NzaWJpbGl0eSB0aGF0IHRoZXkgZG8gbm90IHJlYWQgdGhlCnRl
bXBsYXRlLCBzbyB0aGVyZSBpcyB2YWx1ZSBpbiBoYXZpbmcgdGhlIHdvcmtmbG93ICppbiBhZGRp
dGlvbiB0byogKG5vdAppbnN0ZWFkIG9mKSB0aGUgcHVsbCByZXF1ZXN0IHRlbXBsYXRlLgoKUmVn
YXJkcywKCkVkZ2FyIEJvbmV0LgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0t5Y+R5Lu25Lq6Onpo
YW5nZG9uZ2RvbmdAZXN3aW5jb21wdXRpbmcuY29t5Y+R6YCB5pe26Ze0OjIwMjQtMDctMDEgMTA6
NDM6MTYgKOaYn+acn+S4gCnmlLbku7bkuro6YnVpbGRyb290QGJ1aWxkcm9vdC5vcmfmioTpgIE6
emhhbmdkb25nZG9uZ0Blc3dpbmNvbXB1dGluZy5jb23kuLvpopg6W1BBVENIXSAuZ2l0aHViOiBh
ZGQgZ2l0aHViIGFjdGlvbiB0byBhdXRvbWF0ZSBQUiBoYW5kbGluZwo+IAo+IEZyb206IERvbmdk
b25nIFpoYW5nIDx6aGFuZ2Rvbmdkb25nQGVzd2luY29tcHV0aW5nLmNvbT4KPiAKPiBUaGlzIHBh
dGNoIHVwZGF0ZXMgdGhlIEJ1aWxkcm9vdCByZXBvc2l0b3J5J3MgR2l0SHViIGNvbmZpZ3VyYXRp
b24gdG8gYmV0dGVyCj4gbWFuYWdlIGluY29taW5nIHB1bGwgcmVxdWVzdHMuCj4gCj4gLSBSZW1v
dmVkIHRoZSBleGlzdGluZyBwdWxsIHJlcXVlc3QgdGVtcGxhdGUgdGhhdCBhZHZpc2VkIGNvbnRy
aWJ1dG9ycyB0byB1c2UKPiAgIHRoZSBtYWlsaW5nIGxpc3QgZm9yIHBhdGNoIHN1Ym1pc3Npb25z
Lgo+IC0gQWRkZWQgYSBuZXcgR2l0SHViIEFjdGlvbnMgd29ya2Zsb3cgKGByZXBvLWxvY2tkb3du
LnltbGApIHRvIGF1dG9tYXRpY2FsbHkKPiAgIGhhbmRsZSBuZXcgcHVsbCByZXF1ZXN0cy4KPiAK
PiBUaGUgbmV3IHdvcmtmbG93Ogo+IC0gVHJpZ2dlcnMgb24gbmV3IHB1bGwgcmVxdWVzdHMuCj4g
LSBVc2VzIHRoZSBgZGVzc2FudC9yZXBvLWxvY2tkb3duYCBhY3Rpb24gdG86Cj4gICAtIENvbW1l
bnQgb24gdGhlIHB1bGwgcmVxdWVzdCwgZ3VpZGluZyBjb250cmlidXRvcnMgdG8gdXNlIHRoZSBt
YWlsaW5nIGxpc3QKPiAgICAgZm9yIHBhdGNoIHN1Ym1pc3Npb24uCj4gICAtIExvY2sgdGhlIHB1
bGwgcmVxdWVzdCB0byBwcmV2ZW50IGZ1cnRoZXIgZGlzY3Vzc2lvbi4KPiAgIC0gQ2xvc2UgdGhl
IHB1bGwgcmVxdWVzdC4KPiAKPiBUaGlzIGNoYW5nZSBlbnN1cmVzIHRoYXQgY29udHJpYnV0b3Jz
IGFyZSBwcm9wZXJseSBkaXJlY3RlZCB0byB0aGUgcHJlZmVycmVkCj4gbWV0aG9kIG9mIHBhdGNo
IHN1Ym1pc3Npb24gdmlhIHRoZSBtYWlsaW5nIGxpc3QsIG1haW50YWluaW5nIGNvbnNpc3RlbmN5
IGFuZAo+IHN0cmVhbWxpbmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuCj4gCj4gU2lnbmVkLW9mZi1i
eTogRG9uZ2RvbmcgWmhhbmcgPHpoYW5nZG9uZ2RvbmdAZXN3aW5jb21wdXRpbmcuY29tPgo+IC0t
LQo+ICAuZ2l0aHViL3B1bGxfcmVxdWVzdF90ZW1wbGF0ZS5tZCAgICB8ICA2IC0tLS0tLQo+ICAu
Z2l0aHViL3dvcmtmbG93cy9yZXBvLWxvY2tkb3duLnltbCB8IDIzICsrKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IC5naXRodWIvcHVsbF9yZXF1ZXN0X3RlbXBsYXRlLm1k
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAuZ2l0aHViL3dvcmtmbG93cy9yZXBvLWxvY2tkb3duLnlt
bAo+IAo+IGRpZmYgLS1naXQgYS8uZ2l0aHViL3B1bGxfcmVxdWVzdF90ZW1wbGF0ZS5tZCBiLy5n
aXRodWIvcHVsbF9yZXF1ZXN0X3RlbXBsYXRlLm1kCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMzE5ZTY3ZDg2MS4uMDAwMDAwMDAwMAo+IC0tLSBhLy5naXRodWIvcHVsbF9yZXF1
ZXN0X3RlbXBsYXRlLm1kCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDYgKzAsMCBAQAo+IC1QbGVh
c2UgZG8gbm90IHN1Ym1pdCBhIFB1bGwgUmVxdWVzdCB2aWEgR2l0SHViLiBCdWlsZHJvb3QgbWFr
ZXMgdXNlIG9mIGEKPiAtW21haWxpbmcgbGlzdF0oaHR0cDovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QpIGZvciBwYXRjaCBzdWJtaXNzaW9uIGFuZCByZXZp
ZXcuCj4gLVNlZSBbc3VibWl0dGluZyB5b3VyIG93biBwYXRjaGVzXShodHRwOi8vYnVpbGRyb290
Lm9yZy9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMpIGZvciBtb3JlIGluZm8uCj4gLQo+
IC1UaGFua3MgZm9yIHlvdXIgaGVscCEKPiAtCj4gZGlmZiAtLWdpdCBhLy5naXRodWIvd29ya2Zs
b3dzL3JlcG8tbG9ja2Rvd24ueW1sIGIvLmdpdGh1Yi93b3JrZmxvd3MvcmVwby1sb2NrZG93bi55
bWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmE1ZjhiZDZhOTMK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvLmdpdGh1Yi93b3JrZmxvd3MvcmVwby1sb2NrZG93bi55
bWwKPiBAQCAtMCwwICsxLDIzIEBACj4gK25hbWU6ICdSZXBvIExvY2tkb3duJwo+ICsKPiArb246
Cj4gKyAgcHVsbF9yZXF1ZXN0X3RhcmdldDoKPiArICAgIHR5cGVzOiBvcGVuZWQKPiArCj4gK3Bl
cm1pc3Npb25zOgo+ICsgIHB1bGwtcmVxdWVzdHM6IHdyaXRlCj4gKwo+ICtqb2JzOgo+ICsgIGFj
dGlvbjoKPiArICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKPiArICAgIHN0ZXBzOgo+ICsgICAg
ICAtIHVzZXM6IGRlc3NhbnQvcmVwby1sb2NrZG93bkB2NAo+ICsgICAgICAgIHdpdGg6Cj4gKyAg
ICAgICAgICBwci1jb21tZW50OiB8Cj4gKyAgICAgICAgICAgIFBsZWFzZSBkbyBub3Qgc3VibWl0
IGEgUHVsbCBSZXF1ZXN0IHZpYSBHaXRIdWIuIEJ1aWxkcm9vdCBtYWtlcyB1c2Ugb2YgYQo+ICsg
ICAgICAgICAgICBbbWFpbGluZyBsaXN0XShodHRwOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdCkgZm9yIHBhdGNoIHN1Ym1pc3Npb24gYW5kIHJldmlldy4K
PiArICAgICAgICAgICAgU2VlIFtzdWJtaXR0aW5nIHlvdXIgb3duIHBhdGNoZXNdKGh0dHA6Ly9i
dWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI3N1Ym1pdHRpbmctcGF0Y2hlcykgZm9yIG1vcmUgaW5m
by4KPiArCj4gKyAgICAgICAgICAgIFRoYW5rcyBmb3IgeW91ciBoZWxwIQo+ICsgICAgICAgICAg
bG9jay1wcjogdHJ1ZQo+ICsgICAgICAgICAgY2xvc2UtcHI6IHRydWUKPiBcIE5vIG5ld2xpbmUg
YXQgZW5kIG9mIGZpbGUKPiAtLSAKPiAyLjE3LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
