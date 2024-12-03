Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F4AD49797
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 09:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3B560A59;
	Tue,  3 Dec 2024 09:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AK4KdhYgijwH; Tue,  3 Dec 2024 09:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BFFD60A66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BFFD60A66;
	Tue,  3 Dec 2024 09:19:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE6461DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 09:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8E8760A59
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 09:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYeeBix8dar8 for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 09:19:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C444A60A57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C444A60A57
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp3.osuosl.org (Postfix) with ESMTP id C444A60A57
 for <buildroot@uclibc.org>; Tue,  3 Dec 2024 09:19:01 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Tue, 3 Dec 2024 17:18:21 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 3 Dec 2024 17:18:21 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: "Bernd Kuhls" <bernd@kuhls.net>, buildroot@uclibc.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <874j3mdkt6.fsf@draig.linaro.org>
References: <20240922193751.862053-1-bernd@kuhls.net>
 <20240922193751.862053-5-bernd@kuhls.net>
 <c80de03.7818.1921db53aa2.Coremail.andyshrk@163.com>
 <c655577.1b64.192853c1be6.Coremail.andyshrk@163.com>
 <87frn6dptr.fsf__47548.8251003966$1733156129$gmane$org@draig.linaro.org>
 <pan$30ab5$cc5a9166$89866316$e1ba867c@ID-313208.user.individual.net>
 <874j3mdkt6.fsf@draig.linaro.org>
X-NTES-SC: AL_Qu2YAf6auE0r5yadYulS8zNM9K56MKvt5LljqcQFePgqqTHL3g4cZnlBM0vW6uKr//YJrSrsOGQhQuHAskj2
MIME-Version: 1.0
Message-ID: <1884cc7c.9bbe.1938bd041dd.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgDXHw3dzE5nDvo1AA--.41783W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxaqXmdOxtDEBQACst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=AS88Uf/+UWNqdIbnh0768FwwdxAHdYKtREMhR/6U894=; b=H
 pZK9v2xA8Vb3/l4ddvjPjGekwWxMRnQLYcdrmPtcUueP+TwtSPJe5rj8ShxLm4Aa
 MaeJXqY3u72zLarLbaufbkWcc/SrnBcW8CpZQEJtxm+Gbe0XiPKdnN+LP8kRcQVo
 kbb3qijU6hJBemWmpNO7ngzS/el0tVEsjzO6iGIu74=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=HpZK9v2x
Subject: Re: [Buildroot] [PATCH v2 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkhpIEFsbCwKCuWcqCAyMDI0LTEyLTAzIDAyOjAzOjE377yMIkFsZXggQmVubsOpZSIgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+IOWGmemBk++8mgo+QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5l
dD4gd3JpdGVzOgo+Cj4+IEFtIE1vbiwgMDIgRGVjIDIwMjQgMTY6MTQ6NTYgKzAwMDAgc2Nocmll
YiBBbGV4IEJlbm7DqWU6Cj4+Cj4+PiAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMuY29tPiB3cml0
ZXM6Cj4+PiAKPj4+PiBIZWxsb++8jAo+Pj4+ICAgIENhbiB3ZSBnZXQgdGhpcyBzZXJpZXMgbWVy
Z2Vk77yfCj4+PiAKPj4+IEkndmUgZ290IGEgYnJhbmNoIHdpdGggQmVybmQncyBwYXRjaGVzICsg
dGhlIGVuYWJsaW5nIG9mIFZpcnRJTyBWZW51cwo+Pj4gYW5kIGFkZGluZyB2a21hcmsgdG8gdGhl
IGJ1aWxkLiBJZiBCZXJuZCdzIG9rIHdpdGggaXQgSSBjYW4gcG9zdCBpdCB0bwo+Pj4gdGhlIGxp
c3QgdG9kYXkuCj4+Cj4+IEhpIEFuZHksCj4+Cj4+IEkgc2VudCBhIG5ldyBwYXRjaCBzZXJpZXMg
YnVtcGluZyBtZXNhM2QgdG8gMjQuMy4wIGEgY291cGxlIG9mIG1pbnV0ZXMgCj4+IGFnbzogaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9
NDM0OTM0Cj4+Cj4+IFJ1bi10aW1lIHRlc3Qgd2l0aCBteSBJbnRlbC1iYXNlZCBzeXN0ZW0gYW5k
IGdibS9lZ2wgd29ya3MsIGRpZCBub3QgYnVpbGQtCj4+IHRlc3QgaXQgd2l0aCB4MTEvd2F5bGFu
ZCBob3dldmVyLiBQbGVhc2UgYWRkIHlvdXIgcGF0Y2hlcyB0byB0aGlzIG1vc3QgdXAtCj4+IHRv
LWRhdGUgcGF0Y2ggc2VyaWVzLCB0aGFua3MuCgpJIGd1ZXNzIHRoaXMgcmVmZXJzIHRvIEFsZXgn
cyBwYXRjaOOAgkFjdHVhbGx5LCBJIGRvbid0IGhhdmUgdGhlIHJlbGV2YW50IHBhdGNoIGhlcmUs
IApidXQgSSBhbSBpbmRlZWQgbG9va2luZyBmb3J3YXJkIHRvIHRoaXMgc2VyaWVzIG9mIHBhdGNo
ZXMgYmVpbmcgbWVyZ2VkIHNvb25lci4KQmVjYXVzZSBtZXNhIDI0LjEuMCBpcyB0aGUgZmlyc3Qg
dmVyc2lvbiB3aGljaCBjYW4gc3VwcG9ydCBBcm0gTWFsaSAxMHRoIGdlbmVyYXRpb24KR1BVIHZh
bGhhbOOAggoKPgo+SSBoYXZlIHVwZGF0ZXMgdG8gdGhlIFZpcnRJTyBwYXRjaGVzIGFuZCBlbmFi
bGluZyB2a21hcmsuIFNob3VsZCBJIHBvc3QKPnRob3NlIHNlcGFyYXRlbHkgb3IgY29tYmluZSBh
bmQgcmUtcG9zdCB3aXRoIHlvdXIgbGF0ZXN0IHNlcmllcz8KPgo+Pgo+PiBSZWdhcmRzLCBCZXJu
ZAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4t
LSAKPkFsZXggQmVubsOpZQo+VmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCj5fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+YnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
