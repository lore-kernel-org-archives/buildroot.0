Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ABAC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D766FBC4;
	Wed,  5 Jan 2022 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tfrOMCN3Uqi; Wed,  5 Jan 2022 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1186FBC1;
	Wed,  5 Jan 2022 20:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151171BF215
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0EA2428CD
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8njGn84mTVgY for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 20:59:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD58E428CC
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 20:59:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B317BE0008;
 Wed,  5 Jan 2022 20:59:09 +0000 (UTC)
Date: Wed, 5 Jan 2022 21:59:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220105215908.1d8677b3@windsurf>
In-Reply-To: <20211213061551.4110-1-jose.pekkarinen@unikie.com>
References: <20211213061551.4110-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/opensc: new package
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

SGVsbG8gSm9zw6ksCgpPbiBNb24sIDEzIERlYyAyMDIxIDA4OjE1OjUxICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhlIHBhdGNo
IHdpbGwgYWRkIG9wZW5zYyBwYWNrYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2th
cmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgoKSSdtIGFmcmFpZCB0aGF0IHdoZW4g
SSByZWFkIHRoZSBmZWVkYmFjayBmcm9tIHVwc3RyZWFtIGluIHlvdXIgcGF0Y2hlcywKc2F5aW5n
IHRoYXQgdGhleSBpbnRyb2R1Y2UgbWVtb3J5IGxlYWtzIChhbmQgaW5kZWVkIHRoZXkgZG8pLCBJ
J20gbm90CnJlYWxseSBrZWVuIG9uIG1lcmdpbmcgdGhpcy4KCkhvd2V2ZXIsIEkgc2F3IHlvdSB0
b2xkIHVwc3RyZWFtOgoKICBJdCBpcyBhIGJpdCBvZiBhIGNoaWtlbiBhbmQgZWdnIHByb2JsZW0u
IEJ1aWxkcm9vdCB3YW50cyBtZSB0bwogIHVwc3RyZWFtIHRoZSBwYXRjaGVzIGJlZm9yZSB0aGUg
cGFja2FnZSB3b3VsZCBiZSBhY2Nlc2libGUgdG8geW91LAogIHlvdSB3YW50IG1lIHRvIGdpdmUg
YSB0ZXN0aW5nIGNhc2UgdGhhdCBkb2Vzbid0IGNvbWUgZWFzeSB3aXRob3V0CiAgdXBzdHJlYW1p
bmcgdGhlIHBhY2thZ2UuCgpUaGlzIGlzIG5vdCB0b3RhbGx5IGNvcnJlY3QgZm9yIHR3byByZWFz
b246CgogKiB3ZSBkb24ndCByZXF1aXJlIHBhdGNoZXMgdG8gYmUgYWNjZXB0ZWQgdXBzdHJlYW0s
IGV4Y2VwdCBpZiB3ZSBoYXZlCiAgIHNlcmlvdXMgZG91YnRzIGFib3V0IHRoZSBwYXRjaGVzLgoK
ICogdGhlIHBhY2thZ2UgZG9lc24ndCBoYXZlIHRvIGJlIGFjY2VwdGVkIGluIEJ1aWxkcm9vdCB1
cHN0cmVhbSB0bwogICBwcm92aWRlIGFuIGVhc3kgd2F5IGZvciB0aGUgb3BlbnNjIGRldmVsb3Bl
cnMgdG8gcmVwcm9kdWNlIHRoZQogICBpc3N1ZS4gWW91IGNhbiBwcm92aWRlIGEgQnVpbGRyb290
IGJyYW5jaCBvbiBhIHB1YmxpYyBHaXQKICAgcmVwb3NpdG9yeSwgd2l0aCB0aGUgb3BlbnNjIHBh
Y2thZ2UsIGFuZCBhIHZlcnkgc2ltcGxlCiAgIG9wZW5zY19kZW1vX2RlZmNvbmZpZyBpbiBjb25m
aWdzLyB0aGF0IHVzZXMgc29tZSBleHRlcm5hbCB0b29sY2hhaW4KICAgYW5kIGJ1aWxkcyBqdXN0
IG9wZW5zYyB0byBkZW1vbnN0cmF0ZSB0aGUgYnVpbGQgZmFpbHVyZS4gVGhlbiBmb3IKICAgdGhl
IG9wZW5zYyBwZW9wbGUsIHJlcHJvZHVjaW5nIGlzIGFzIGVhc3kgYXM6CgogICBnaXQgY2xvbmUg
LWIgPHlvdXJicmFuY2g+IGdpdDovL3lvdXIucmVwb3NpdG9yeS5jb20KICAgY2QgYnVpbGRyb290
LwogICBtYWtlIG9wZW5zY19kZW1vX2RlZmNvbmZpZwogICBtYWtlCgpDb3VsZCB5b3UgcmVzb2x2
ZSB0aGUgcmVtYWluaW5nIGlzc3VlcyBhbmQgc2VuZCBhbiB1cGRhdGVkIHBhdGNoPyBBbHNvLApw
bGVhc2UgcmVtZW1iZXIgdG8gYWRkIGEgdmVyc2lvbiB0byB5b3VyIHBhdGNoZXMgd2hlbiBzdWJt
aXR0aW5nLCBpdApyZWFsbHkgbWFrZXMgdGhpbmdzIGVhc2llci4KCkJlc3QgcmVnYXJkcywKClRo
b21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
