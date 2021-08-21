Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CE2C432BE
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:42:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0B36120E
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C0B36120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D7B40431;
	Sat, 21 Aug 2021 13:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttpWn5bGiwaT; Sat, 21 Aug 2021 13:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B0740422;
	Sat, 21 Aug 2021 13:42:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2E21BF35E
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBBCE4041C
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwNSTSlbKVct for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 13:42:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id BECE540188
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 13:42:41 +0000 (UTC)
Received: from smtpclient.apple ([151.19.22.248])
 by Aruba Outgoing Smtp  with ESMTPA
 id HRGdmLy9ep6qUHRGfmp7J8; Sat, 21 Aug 2021 15:42:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629553359; bh=jL8Tn7dVwsmRlk5rMsBMqQ7doKbDwp3ZOqWiP4rxq64=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=dNcigRLVzt/MjejYKRBLcXhaCLSwbbN+okh4JhxsKLrbbsDKOtLHSGiX6+w0gD8V8
 +99kipKJZHoU+Cm4Q+jgtRa1pK2128rIIeW15decpHYnI3kGPGwmw3OmUv0hhtEUjy
 gP4hiboGaUz/ExzvhbXUYDuxVyVAA70AFTitxenUTN6tq7jh1BMW0V8yKYzpSKa0v9
 cMpgpXuplLqU6kdDaZ/9wPXqaEdeQllKgjdKPoK3dmzLKmM2imG9NDBZeWylsS8bzl
 OCY5cRam69CEV5IxGUgQsaQ0A6p8r7A4H0D94BRitpXBdc3m6HfuZmIwEp76k2Pd+g
 iDUGsJkbunoZw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 21 Aug 2021 15:42:34 +0200
Message-Id: <57D84EF2-265E-49CD-AC86-3599771F772E@benettiengineering.com>
References: <f73ebaf4-dff8-c3c7-fc5b-ff43dee0accb@gmail.com>
In-Reply-To: <f73ebaf4-dff8-c3c7-fc5b-ff43dee0accb@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfOFkhzTHNpY2FYL/E+AifhFm7q/gaFhKnLpkAPC6DmidS+/jaSPpljtiVEaYL+M0o7y6fIF98LMfWt0WWFD+wSn9I4+xRffjemjQgJvtdvX0lKA6/wQY
 Qx2s+yVjfojUBO9tRYUaQIVWT7+6QWhwpMCDa+Ut+cgWLNIBAPu1OwajaNoYxG8wjTb1ZoQwimbl62cFvWVpXr1z+mNLICcyeTlywUbBwdu9X/qL0bdeOT8J
 AqvNQpe+LwS2t4ozx0hZxf/sfkG+/ufWY3VW+Yf1h1o=
Subject: Re: [Buildroot] [PATCH] Config.in: disable Fortify Source for
 microblaze
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Cj4gSWwgZ2lvcm5vIDIxIGFnbyAyMDIxLCBhbGxlIG9yZSAxNDo0NywgUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hlbGxvIEdpdWxpbywK
PiAKPj4gTGUgMjEvMDgvMjAyMSDDoCAwMTowOSwgR2l1bGlvIEJlbmV0dGkgYSDDqWNyaXQgOgo+
Pj4gT24gOC8yMS8yMSAxMjo1OSBBTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+PiBIaSBSb21h
aW4sIEFsbCwKPj4+IAo+Pj4gT24gOC8yMS8yMSAxMjo1MyBBTSwgUm9tYWluIE5hb3VyIHdyb3Rl
Ogo+Pj4+IEFzIHJlcG9ydGVkIGJ5IFRvb2xjaGFpbi1idWlsZGVyIHByb2plY3QgWzFdLCB0aGUg
c3lzdGVtIGRvZXNuJ3QKPj4+PiBib290IHdoZW4gRm9ydGlmeSBTb3VyY2UgaXMgZW5hYmxlZCBm
b3IgZ2xpYmMgYmFzZWQgdG9vbGNoYWluCj4+Pj4gKHRoZSBpbml0IHByb2Nlc3MgaGFuZykuCj4+
Pj4gCj4+Pj4gQWxzbywgaGFyZGVuaW5nIGZlYXR1cmVzIG1heSBub3QgYmUgd2FudGVkIG9yIHBv
c3NpYmxlIGZvciBzdWNoCj4+Pj4gc2xvdyBzb2Z0LWNvcmUgY3B1cyBbMl0uCj4+Pj4gCj4+Pj4g
WzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMv
MTQ2NzYyNDUwMAo+Pj4+IFsyXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1
aWxkcm9vdC8yMDIxLUp1bmUvMzEyNDE2Lmh0bWwKPj4+PiAKPj4+PiBTaWduZWQtb2ZmLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+Pj4gQ2M6IFRob21hcyBQZXRh
enpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4+Pj4gQ2M6IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4+IC0tLQo+Pj4+
IFdpdGggQlIyX1JFTFJPX1BBUlRJQUwgZW5hYmxlZCwgdGhlIHN5c3RlbSBib290Lgo+Pj4+IC0t
LQo+Pj4+ICAgIENvbmZpZy5pbiB8IDcgKysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluIGIvQ29uZmln
LmluCj4+Pj4gaW5kZXggMmVmNWQ0MDdlNC4uODRmN2ZhNmU4ZCAxMDA2NDQKPj4+PiAtLS0gYS9D
b25maWcuaW4KPj4+PiArKysgYi9Db25maWcuaW4KPj4+PiBAQCAtODUzLDkgKzg1MywxNiBAQCBl
bmRjaG9pY2UKPj4+PiAgICBjb21tZW50ICJSRUxvY2F0aW9uIFJlYWQgT25seSAoUkVMUk8pIG5l
ZWRzIHNoYXJlZCBsaWJyYXJpZXMiCj4+Pj4gICAgICAgIGRlcGVuZHMgb24gIUJSMl9TSEFSRURf
TElCUwo+Pj4+ICAgICtjb25maWcgQlIyX0ZPUlRJRllfU09VUkNFX0FSQ0hfU1VQUE9SVFMKPj4+
PiArICAgIGJvb2wKPj4+PiArICAgIGRlZmF1bHQgeQo+Pj4+ICsgICAgIyBNaWNyb2JsYXplIGds
aWJjIHRvb2xjaGFpbnMgZG9uJ3Qgd29yayB3aXRoIEZvcnRpZnkgU291cmNlIGVuYWJsZWQgPgo+
Pj4+ICsgICAgZGVwZW5kcyBvbiAhQlIyX21pY3JvYmxhemUKPj4+IAo+Pj4gaGVyZSB5b3Ugc2F5
IGl0IGRvZXNuJ3Qgd29yayB3aXRoIGdsaWJjIHRvb2xjaGFpbnMsIHNvIHlvdSBjb3VsZCBhZGQK
Pj4+ICcmJiAhQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDJy4gSSB0aGluayBpdCdzIHdvcnRoIGlm
IGl0IHdvcmtzIHdpdGgKPj4+IHVjbGliYyBhbmQgbXVzbC4KPj4gCj4+IE9mIGNvdXJzZSBiZXR3
ZWVuIHBhcmVudGhlc2lzIGxpa2U6Cj4+IGBgYAo+PiBkZXBlbmRzIG9uICghQlIyX21pY3JvYmxh
emUgJiYgIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQykKPj4gYGBgCj4+IG90aGVyd2lzZSBldmVy
eSB0b29sY2hhaW4gd2hpY2ggdXNlcyBnbGliYyBkb2Vzbid0IHVzZSBGb3J0aWZ5IGFueW1vcmUu
Cj4+IAo+Pj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgaXQ/Cj4gCj4gRm9ydGlmeSBTb3VyY2Ug
aXMgZGlzYWJsZWQgZm9yIHRoZSBzYW1lIHJlYXNvbiBhcyBmb3IgUElDL1BJRSBldmVuIGZvciB1
Q2xpYmMtbmcKPiBvciBtdXNsOgo+IAo+IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRy
b290L2NvbW1pdC8/aWQ9ZDEyMGY4NDQ2MDRkYTIyOTViYjdiZDhmYzZjMWY0ZWZiZThiNTc5Mgo+
IAo+IEkgd2FudCB0byBhdm9pZCB0aGUgbWFpbnRlbmFuY2UgYnVyZGVuIG9uIHN1Y2ggcGxhdGZv
cm0uCgpBaCBvaywgSeKAmXZlIHVuZGVyc3Rvb2Qgd3JvbmdseSBieSB0aGUgY29tbWVudCBtZW50
aW9uaW5nIGdsaWJjIG9ubHkuCgpObyBwcm9ibGVtIHRoZW4uCgpCZXN0IHJlZ2FyZHMKR2l1bGlv
IEJlbmV0dGkKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+Pj4gCj4+PiBCZXN0IHJl
Z2FyZHMKPj4+IAo+PiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
