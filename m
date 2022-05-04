Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 11:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0816B61094;
	Wed,  4 May 2022 11:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYxOCXUe-AMn; Wed,  4 May 2022 11:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A648B60B00;
	Wed,  4 May 2022 11:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8F0B1BF422
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 11:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5CD360B00
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 11:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmNzHcWZgBYk for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 11:51:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF5AB60AAC
 for <buildroot@buildroot.org>; Wed,  4 May 2022 11:51:03 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 5C99644051C;
 Wed,  4 May 2022 14:50:06 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651665006;
 bh=BS7QVpCBpTkM6hrw8c7neDnPubhEIkuVPDlyq0kQ8k8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=fkD/iG/C1jTWw/Oh2+Tg9TfyNB/v0707OajYNoqMoNmhpzXVTHHf4NFTA/GcGvVia
 qesfyyMu2RRpEG9l2IWAWrfx3lMCGLvlajdAaP0JpG+4vjEeL+s+hzBrLR9YaWWIDv
 hla5L1CXtahzMAGz3OA38leA51RJ7FA5rx+mQAGlrpvO41yyycfU+FhtEnAR98lMLn
 D2S1yzMy4MnSQt1eRhxXuQJryVX9T3r0WdQy1LQqIel/cWUJKeBGYKtKsp3zLQ/D05
 BQYYP8mwcsGc4ZcIMPNIkJtYQOHuH5BeECOUidDM32JD7wLqxUjR9f8FbaEzDHuK+G
 830d6T28CFZ7Q==
References: <20220504094006.1541643-1-c.leger@borea-dental.com>
 <875ymly6js.fsf@tarshish>
 <b6b1cd4e-29d9-7a70-3c5c-cba4f272420f@borea-dental.com>
 <871qx9y5gg.fsf@tarshish>
 <dedeb51e-0998-1728-f4b4-40b1c3878b85@borea-dental.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Charlie Leger <c.leger@borea-dental.com>
Date: Wed, 04 May 2022 14:42:12 +0300
In-reply-to: <dedeb51e-0998-1728-f4b4-40b1c3878b85@borea-dental.com>
Message-ID: <87wnf1wm71.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hhcmxpZSwKCk9uIFdlZCwgTWF5IDA0IDIwMjIsIENoYXJsaWUgTGVnZXIgd3JvdGU6Cj4g
TGUgMDQvMDUvMjAyMiDDoCAxMjowNiwgQmFydWNoIFNpYWNoIGEgw6ljcml0IDoKPiBPbiBXZWQs
IE1heSAwNCAyMDIyLCBDaGFybGllIExlZ2VyIHdyb3RlOgo+Cj4gIFRoYW5rIHlvdSBmb3IgeW91
ciByZXZpZXcKPgo+IExlIDA0LzA1LzIwMjIgw6AgMTE6NDMsIEJhcnVjaCBTaWFjaCBhIMOpY3Jp
dCA6Cj4gT24gV2VkLCBNYXkgMDQgMjAyMiwgTGVnZXIgQ2hhcmxpZSB3cm90ZToKPgo+ICBTaW5j
ZSBTRE1BIGZpcm13YXJlcyBmb3IgaW14WzYsNyw4XSBhcmUgbm93IHByb3ZpZGVkIG9ubHkgYnkg
ZmlybXdhcmUtaW14IHBhY2thZ2UgYW5kIG5vdCBsaW51eC1maXJtd2FyZQo+ICBwYWNrYWdlIFsx
XS4KPiBMaW51eCBidWlsZCBjYW4gZmFpbGVkIGlmIGRlcGVuZGluZyBvbiBmaXJtd2FyZSBpbXgs
IHNvIGFkZCBmaXJtd2FyZS1pbXggZGVwZW5kZW5jeSBvbiBsaW51eCBpZiBwYWNrYWdlIGlzIGNo
ZWNrZWQuCj4KPgo+IFdoYXQgYnVpbGQgZmFpbHVyZSBkbyB5b3Ugc2VlIHdoZW4gZmlybXdhcmUt
aW14IGRvZXMgbm90IGluc3RhbGwgYmVmb3JlCj4ga2VybmVsIGJ1aWxkPyBBcyBmYXIgYXMgSSBj
YW4gc2VlIGZpcm13YXJlIGZpbGVzIGFyZSBvbmx5IHVzZWQgYXQKPiBydW4tdGltZS4KPgo+IEZh
aWx1cmUgd2lsbCBoYXBwZW5zIG9ubHkgZm9yIHNwZWNpZmljIGtlcm5lbCBjb25maWd1cmF0aW9u
IHdoaWNoIHVzZWQgIkNPTkZJR19FWFRSQV9GSVJNV0FSRSIgb3B0aW9uIFsxXSwgd2hpY2ggYWxs
b3cgdG8gYnVpbHQtaW4gZmlybXdhcmUuCj4gSWYgZmlybXdhcmUgbmVlZGVkIGJlbG9uZ3MgdG8g
ImZpcm13YXJlLWlteCIgcGFja2FnZSwgbGludXggYnVpbGQgd2lsbCBmYWlsZWQuCj4KPiBUaGFu
a3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBUaGUgY29tbWl0IGxvZyBzaG91bGQgbWVudGlvbiB0
aGF0Cj4gZmlybXdhcmUtaW14IGlzIG5lZWRlZCBhdCBidWlsZCB0aW1lIGZvciBDT05GSUdfRVhU
UkFfRklSTVdBUkUuCj4KPiBJJ20gc29ycnkgZm9yIHRoZSBkdW1teSBxdWVzdGlvbi4uLiBkbyBJ
IG5lZWQgdG8gcHJvdmlkZSBhIHYyIHBhdGNoIGZvciBpdCA/CgpJIHRoaW5rIHRoYXQgYSB2MiBw
YXRjaCB3b3VsZCBiZSBuaWNlIGluIHRoaXMgY2FzZS4gWW91IG1pZ2h0IHdhbnQgdG8Kd2FpdCBh
IGRheSBvciB0d28gYmVmb3JlIHNlbmRpbmcgdjIgdG8gbGV0IG90aGVycyBhZGQgdGhlaXIgY29t
bWVudCBvbgp2MS4KCldoZW4gc2VuZGluZyB2MiBtYWtlIHN1cmUgdGhhdCBjb21taXQgbG9nIGxp
bmVzIGxlbmd0aCBpcyA3MiBjaGFyYWN0ZXJzCm9yIGxlc3MuCgpUaGFua3MsCmJhcnVjaAoKLS0g
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfi4g
Ln4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3Mu
Y28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
