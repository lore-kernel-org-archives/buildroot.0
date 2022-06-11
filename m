Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EE3C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2448441B6F;
	Sat, 11 Jun 2022 09:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36VDVky01TR0; Sat, 11 Jun 2022 09:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD2A341958;
	Sat, 11 Jun 2022 09:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA951BF3B8
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 09:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B24B40535
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 09:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dawncrow.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqZI4BRI5CMI for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 09:20:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33B1540148
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654938856;
 s=strato-dkim-0002; d=dawncrow.de;
 h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
 Subject:Sender;
 bh=iljazwTyp37gj4xeLEhH6cyR2a1OoTASUMcdebiPuJo=;
 b=j0/njODMHZOJ8jeMWlbrOXCUye5bZeR8JkQMgs3m5lO7MqjrOFa0iauJPPD8ZEgHsd
 otiXSlF5Slpcn8PNmi9PMCdQjjiSYhJiJGc+tNKcdfcdKbikwrIlU9w/TEKUeusz3DuD
 rrS+Z+Rdkd7kW8iB33cI36ceIhDjTJbs3vrXfNFpp+OjuP5701IvDh33UdTlhfpQ0nOT
 6uMtKfCPA4bNt+rnA6Jy4KFD7JDoAG0Ettma+sjq3o11FepOm3Rg2qxUupydCNcYhySD
 zcMXoUcno9po9TMwAYAlr9OBDofT/9+MY8qnnsTrCOf16Y+0R5bOpI05LuoVDjk9CIcn
 jWvA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZ6bi4rK0b8tGDimOj4xRdCQCQ3Xwp6fALc="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.40] by smtp.strato.de (RZmta 47.45.0 DYNA|AUTH)
 with ESMTPSA id Q06403y5B9EGRWg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Sat, 11 Jun 2022 11:14:16 +0200 (CEST)
Message-ID: <c0656b1d-9cd5-5eee-461d-612c34c08e6d@dawncrow.de>
Date: Sat, 11 Jun 2022 11:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: de-LU
To: buildroot@buildroot.org
References: <54-6295dc80-3-54e5e980@111886211>
 <20220601103905.GB863200@momiji> <20220601171828.GB870187@momiji>
 <20220611020616.GB110359@momiji>
From: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>
In-Reply-To: <20220611020616.GB110359@momiji>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMTEuMDYuMjIgdW0gMDI6MDYgc2NocmllYiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvOgo+IEhp
IE1pY2hhZWwsCj4gCj4gT24gV2VkLCAwMSBKdW4gMjAyMiAxNzoxODoyOCArMDMwMCBBZHJpYW4g
UGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4+IEhpIGFnYWluLAo+
Pgo+PiBPbiBXZWQsIDAxIEp1biAyMDIyIDEwOjM5OjA1ICswMzAwIEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPj4gICAKPj4+IE9uIFR1ZSwgMzEgTWF5
IDIwMjIgMTE6MTQ6NTcgKzAyMDAgTWljaGFlbCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBbLi4uXQo+Pj4+Cj4+Pj4gSSB0
cmllZCB3aXRoIHRoZSBsYXRlc3QgbWFzdGVyIGJyYW5jaCAod2l0aCAyLjM2LjMpIGFuZCBleHRl
bmRlZCB0aGUgcmFzcGJlcnJ5cGk0X2RlZmNvbmZpZyB3aXRoIGdyYXBoaWNzIGRyaXZlci4KPj4+
Pgo+Pj4+IFRoaXMgaXMgdGhlIGRlZmNvbmZpZzoKPj4+Pgo+Pj4+IFsuLi5dCj4+Pgo+Pj4gVGhh
bmtzIGEgbG90IGZvciBzaGFyaW5nIHlvdXIgY29uZmlnLCB0aGF0IHdhcyBtb3N0IGhlbHBmdWwh
IEkgaGF2ZSBiZWVuCj4+PiBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgYnVpbGQgaXNzdWUgYW5kIEkg
YW0gYWxyZWFkeSB3b3JraW5nIG9uIGEgZml4LAo+Pj4gd2hpY2ggd2lsbCBtYWtlIGl0IGludG8g
dGhlIDIuMzYuNCByZWxlYXNlIGluIHNvbWUgd2Vla3MuIEluIHRoZQo+Pj4gbWVhbnRpbWUgSSB3
aWxsIHN1Ym1pdCBhIGZpeCB0byBoYXZlIHRoZSBwYXRjaCBpbiBCdWlsZHJvb3QuCj4+Cj4+IEkg
YW0gc3RpbGwgd29ya2luZyB0aHJvdWdoIGZpbmlzaGluZyBhbmQgdGVzdGluZyBhIGZpeCwgYnV0
IEkgaGF2ZQo+PiBhbHJlYWR5IGZpbGVkIGFuIGlzc3VlIGluIEJ1Z3ppbGxhIHRvIHRyYWNrIHRo
aXMuIEZlZWwgZnJlZSB0byBzdWJzY3JpYmUKPj4gdG8gdGhlIGlzc3VlIFsxXSB0byBmb2xsb3cg
YWxvbmcgOikKPiAKPiBUaGUgcGF0Y2ggSSBhbSB3b3JraW5nIG9uIHN0aWxsIG5lZWRzIGEgYml0
IG9mIHdvcmsgWzFdLCBidXQgaW4gaXRzCj4gY3VycmVudCBzdGF0dXMgaXQgY2FuIGFscmVhZHkg
YmUgdXNlZC4gSSBhbSBhdHRhY2hpbmcgYSB2ZXJzaW9uIG9mIGl0Cj4gdGhhdCB3aWxsIGFwcGx5
IGNsZWFubHkgb24gdG9wIG9mIHRoZSAyLjM2LjMgcmVsZWFzZSwgd2hpY2ggeW91IGNhbgo+IGRy
b3AgaW50byB0aGUgcGFja2FnZS93cGV3ZWJraXQvIHN1YmRpcmVjdG9yeSBvZiB0aGUgQnVpbGRy
b290IHRyZWUuCj4gCj4gSSBob3BlIHRoaXMgaGVscHMsCj4gCj4+IC0tLQo+PiBbMV0gaHR0cHM6
Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTI0MTE4Mgo+IAo+IOKAlEFkcmnDoW4K
PiAKPiAtLS0KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQvcHVsbC8xMjMz
CgpIaSwKCmp1c3Qgd2FudGVkIHRvIGFkZCB0aGF0IEkgZmFjZWQgdGhlIHNhbWUgaXNzdWUgYW5k
IGFtIG5vdyB0cnlpbmcgeW91ciBwYXRjaC4KVG9vayBtZSBhIHdoaWxlIHRvIGZpbmQgaXQgKGFs
c28gZHVlIHRvIHRoZSBvZGQgd3Bld2Via2l0IGdpdCBzZXR1cCksIGJ1dCB0aGFua3MgYSBsb3Qh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
