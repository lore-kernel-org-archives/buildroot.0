Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDDEC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 06:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEB54090B;
	Mon,  5 Dec 2022 06:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EEB54090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22nLgL9a1XKw; Mon,  5 Dec 2022 06:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017AC4090C;
	Mon,  5 Dec 2022 06:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017AC4090C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52D371BF2A0
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 06:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D0D2819BC
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D0D2819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNTS802DKKuU for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 06:37:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B3E7817A8
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B3E7817A8
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 06:37:38 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
 by gateway (Coremail) with SMTP id _____8DxdPCqkY1jsTYDAA--.7616S3;
 Mon, 05 Dec 2022 14:37:31 +0800 (CST)
Received: from duanzhiwei$loongson.cn ( [113.200.148.30] ) by
 ajax-webmail-localhost.localdomain (Coremail) ; Mon, 5 Dec 2022 14:37:29
 +0800 (GMT+08:00)
X-Originating-IP: [113.200.148.30]
Date: Mon, 5 Dec 2022 14:37:29 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5q615b+X5Lyf?= <duanzhiwei@loongson.cn>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220411(feba7c69)
 Copyright (c) 2002-2022 www.mailtech.cn .loongson.cn
In-Reply-To: <914d20f0-6668-50ae-fc9c-22103ff65e57@gmail.com>
References: <e7c091e6-afdf-4f1b-0d38-dfabc267bde0@loongson.cn>
 <914d20f0-6668-50ae-fc9c-22103ff65e57@gmail.com>
X-CM-CTRLDATA: BYnU3GZvb3Rlcl90eHQ9Nzc3OjYxMg==
MIME-Version: 1.0
Message-ID: <499fc771.104a2.184e100fe86.Coremail.duanzhiwei@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf8Dxf+KpkY1j58wlAA--.9438W
X-CM-SenderInfo: hgxd065klzvxo6or00hjvr0hdfq/1tbiAQALB2OMjecj8wAFsd
X-Coremail-Antispam: 1Uk129KBjvdXoW7Xw43ZF4rZFWxAFyDCry3Jwb_yoWfAwcE9a
 4xAr1kJ3y8tryaqFnrtrn3Xry3JFn8Ka1jgrZ7Ww17Xrn5Xr15XFnFvrWSqF1jqrW8Gw1x
 GFWFqr1j9ryUXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 Z7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4xvF2IEb7IF0Fy264kE64k0F2
 4lFcxC0VAYjxAxZF0Ex2IqxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
 JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
 AFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
 A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr1l6VACY4xI67k04243
 AbIYCTnIWIevJa73UjIFyTuYvjxU75rcDUUUU
Subject: Re: [Buildroot] [PATCH] buildroot: Add support for LoongArch
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

QWRkIGJhc2ljIHN1cHBvcnQgZm9yIExvb25nQXJjaCBhcmNoaXRlY3R1cmUuCkJvdGggZXh0ZXJu
YWwgdG9vbCBjaGFpbnMgYW5kIGludGVybmFsIHRvb2wgY2hhaW5zIGNhbiBjb21waWxlIHJvb3Rm
cy4KCj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIkJhZ2FzIFNhbmpheWEi
IDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4KPiDlj5HpgIHml7bpl7Q6MjAyMi0xMi0wNSAxMjoxNDox
MyAo5pif5pyf5LiAKQo+IOaUtuS7tuS6ujogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiDmioTp
gIE6IAo+IOS4u+mimDogUmU6IFtCdWlsZHJvb3RdIFtQQVRDSF0gYnVpbGRyb290OiBBZGQgc3Vw
cG9ydCBmb3IgTG9vbmdBcmNoCj4gCj4gT24gMTIvNS8yMiAxMDoxMiwgZHVhbiB3cm90ZToKPiA+
IEZyb206IFpoaXdlaSBEdWFuIDxkdWFuemhpd2VpQGxvb25nc29uLmNuPgo+ID4gCj4gPiBXaXRo
IHRoaXMgcGF0Y2gsIGJ1aWxkcm9vdCB3b3JrcyB3ZWxsIG9uIExvb25nQXJjaC4KPiA+IAo+IAo+
IFdoYXQgYWJvdXQgIkFkZCBiYXNpYyBzdXBwb3J0IGZvciBMb29uZ0FyY2ggYXJjaGl0ZWN0dXJl
ICh0b29sY2hhaW4KPiBvbmx5KS4iPwo+IAo+IC0tIAo+IEFuIG9sZCBtYW4gZG9sbC4uLiBqdXN0
IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJhCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKDQoNCuacrOmCruS7tuWPiuWFtumZhOS7tuWQq+aciem+meiK
r+S4reenkeeahOWVhuS4muenmOWvhuS/oeaBr++8jOS7hemZkOS6juWPkemAgee7meS4iumdouWc
sOWdgOS4reWIl+WHuueahOS4quS6uuaIlue+pOe7hOOAguemgeatouS7u+S9leWFtuS7luS6uuS7
peS7u+S9leW9ouW8j+S9v+eUqO+8iOWMheaLrOS9huS4jemZkOS6juWFqOmDqOaIlumDqOWIhuWc
sOazhOmcsuOAgeWkjeWItuaIluaVo+WPke+8ieacrOmCruS7tuWPiuWFtumZhOS7tuS4reeahOS/
oeaBr+OAguWmguaenOaCqOmUmeaUtuacrOmCruS7tu+8jOivt+aCqOeri+WNs+eUteivneaIlumC
ruS7tumAmuefpeWPkeS7tuS6uuW5tuWIoOmZpOacrOmCruS7tuOAgiANClRoaXMgZW1haWwgYW5k
IGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBmcm9tIExv
b25nc29uIFRlY2hub2xvZ3kgLCB3aGljaCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29u
IG9yIGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92ZS4gQW55IHVzZSBvZiB0aGUg
aW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5IChpbmNsdWRpbmcsIGJ1dCBu
b3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbCBkaXNjbG9zdXJlLCByZXByb2R1Y3Rpb24g
b3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNp
cGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5
IGFuZCBkZWxldGUgaXQuIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
