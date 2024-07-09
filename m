Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A71C3271E
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 01:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 699A540237;
	Tue,  9 Jul 2024 01:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TffgEGKz4So; Tue,  9 Jul 2024 01:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F124340DD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F124340DD9;
	Tue,  9 Jul 2024 01:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54F6F1BF3A8
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 01:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E55D811DC
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 01:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9hfI1geW7Hr for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 01:40:48 +0000 (UTC)
X-Greylist: delayed 86588 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 09 Jul 2024 01:40:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C67B810D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C67B810D7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=206.189.79.184;
 helo=zg8tmja2lje4os43os4xodqa.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net
 (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C67B810D7
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 01:40:46 +0000 (UTC)
Received: from zhangdongdong$eswincomputing.com ( [10.12.96.115] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 9 Jul 2024 09:40:41 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.115]
Date: Tue, 9 Jul 2024 09:40:41 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: DongdongZhang <zhangdongdong@eswincomputing.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2024 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20240708222933.5a0fd505@windsurf>
References: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
 <20240708013718.19051-2-zhangdongdong@eswincomputing.com>
 <CADvTj4r-1xVwmr+W=Lyj2Ff4KZMR8znZyuAgguCt24Y46oYhkg@mail.gmail.com>
 <1a197586.4af8.1909028b645.Coremail.zhangdongdong@eswincomputing.com>
 <20240708222933.5a0fd505@windsurf>
MIME-Version: 1.0
Message-ID: <36db6d01.4d17.19095266b2d.Coremail.zhangdongdong@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgBHWbsZlYxmqKYUAA--.15621W
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQENCmaLs
 nIToAABsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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
Cc: James Hilliard <james.hilliard1@gmail.com>, bonet@grenoble.cnrs.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0t5Y+R5Lu25Lq6OiJUaG9tYXMgUGV0YXp6b25pIiA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT7lj5HpgIHml7bpl7Q6MjAyNC0wNy0wOSAwNDoy
OTozMyAo5pif5pyf5LqMKeaUtuS7tuS6ujpEb25nZG9uZ1poYW5nIDx6aGFuZ2Rvbmdkb25nQGVz
d2luY29tcHV0aW5nLmNvbT7mioTpgIE6IkphbWVzIEhpbGxpYXJkIiA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4sIGJvbmV0QGdyZW5vYmxlLmNucnMuZnIsIGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3Jn5Li76aKYOlJlOiBbQnVpbGRyb290XSBbUEFUQ0ggdjIgMS8xXSAuZ2l0aHViOiBhZGQgZ2l0
aHViIGFjdGlvbiB0byBhdXRvbWF0ZSBQUiBoYW5kbGluZwo+IAo+IEhlbGxvLAo+IAo+IE9uIE1v
biwgOCBKdWwgMjAyNCAxMDoyNTowNSArMDgwMCAoR01UKzA4OjAwKQo+IERvbmdkb25nWmhhbmcg
PHpoYW5nZG9uZ2RvbmdAZXN3aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPiAKPiA+ID4gQ2FuIHBy
b2JhYmx5IGp1c3QgdXNlIGEgZ2l0aHViIHNjcmlwdCBhbG9uZyB0aGVzZSBsaW5lcyBvciBzb21l
dGhpbmc6Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9zYmFiaWMvc3d1cGRhdGUvYmxvYi8yMDI0
LjA1LjIvLmdpdGh1Yi93b3JrZmxvd3MvY29udHJpYnV0aW5nLnltbAo+ID4gPiAKPiA+ID4gcHJv
YmFibHkgYWxzbyBuZWVkcyBhIGNvbmRpdGlvbmFsIHNvIGl0IG9ubHkgcnVucyBvbiB0aGUgb25l
IGdpdGh1YiByZXBvOgo+ID4gPiBpZjogZ2l0aHViLnJlcG9zaXRvcnkgPT0g4oCYYnVpbGRyb290
L2J1aWxkcm9vdOKAmQo+ID4gPiAgIAo+ID4gCj4gPiBIaSwgSmFtZXMsCj4gPiBJbiB0aGlzIHNj
ZW5hcmlvLCBJIGJlbGlldmUgdGhhdCB1c2luZyBgZGVzc2FudC9yZXBvLWxvY2tkb3duQHY0YCBp
cyBtb3JlIHN1aXRhYmxlIAo+ID4gdGhhbiBgYWN0aW9ucy9naXRodWItc2NyaXB0QHY1YC4gYGRl
c3NhbnQvcmVwby1sb2NrZG93bkB2NGAgaXMgc3BlY2lmaWNhbGx5IGZvY3VzZWQgCj4gPiBvbiBy
ZXBvc2l0b3J5IGxvY2tkb3duIGZ1bmN0aW9uYWxpdHkgYW5kIGhhcyBiZWVuIHdpZGVseSB1c2Vk
IGFuZCB2YWxpZGF0ZWQuIAo+ID4gSW4gY29udHJhc3QsIHdoaWxlIGBhY3Rpb25zL2dpdGh1Yi1z
Y3JpcHRAdjVgIGlzIGZsZXhpYmxlLCBpdCByZXF1aXJlcyBtb3JlIAo+ID4gY3VzdG9taXphdGlv
biBhbmQgbWFpbnRlbmFuY2Ugd29yayBhbmQgYSBzdHJvbmcgZmFtaWxpYXJpdHkgd2l0aCBKYXZh
U2NyaXB0LiAKPiA+IFRvIGtlZXAgdGhlIHByb2Nlc3Mgc2ltcGxlIGFuZCBzdGFibGUsIEkgaGF2
ZSBkZWNpZGVkIHRvIGNvbnRpbnVlIAo+ID4gdXNpbmcgYGRlc3NhbnQvcmVwby1sb2NrZG93bkB2
NGAuCj4gCj4gSSBkbyBhZ3JlZSB3aXRoIHlvdSBvbiB0aGlzLiBIb3dldmVyLCB5b3UgZGlkbid0
IHJlcGx5IHRvIHRoZSBzZWNvbmQKPiBjb21tZW50IGZyb20gSmFtZXMsIG9uIGNoZWNraW5nIHRo
YXQgdGhlIGFjdGlvbiBvbmx5IHJ1bnMgb24gdGhlIG1haW4KPiBidWlsZHJvb3QgcmVwbywgYW5k
IG5vdCBvdGhlcnMuIEluZGVlZCwgd2UgZG9uJ3Qgd2FudCBwZW9wbGUvY29tcGFuaWVzCj4gZm9y
a2luZyBvdXIgcmVwbyB0byBoYXZlIHRoaXMgUFIgbG9ja2Rvd24gYWN0aW9uIHRyaWdnZXJlZC4K
PiAKPiBDb3VsZCB5b3UgY2hlY2sgdGhpcywgYW5kIHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9m
IHlvdXIgcGF0Y2g/Cj4gCj4gVGhhbmtzIGEgbG90IQo+IAo+IFRob21hcwo+IC0tIAo+IFRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20K
CkhlbGxvLCBUaG9tYXMuCgpJIHByZXZpb3VzbHkgbWlzdW5kZXJzdG9vZCBKYW1lcydzIHJlc3Bv
bnNlLiBUaGFua3MgdG8gYm90aCBKYW1lcyBhbmQgeW91ciBzdWdnZXN0aW9ucy4gCkkgd2lsbCB1
cGRhdGUgYSBwYXRjaCB2ZXJzaW9uIHNob3J0bHkgdG8gcmVzdHJpY3QgdGhlIHRyaWdnZXIgY29u
ZGl0aW9uIHRvIHRoZSAKcmVwbyBgYnVpbGRyb290L2J1aWxkcm9vdGAuCgpUaGFuayB5b3UuCgpE
b25nZG9uZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
