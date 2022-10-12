Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989E5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D85282FE4;
	Wed, 12 Oct 2022 13:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D85282FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7BA34jJFNd8T; Wed, 12 Oct 2022 13:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719BC82F8A;
	Wed, 12 Oct 2022 13:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 719BC82F8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35CA21C1148
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 13:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1154360F5E
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 13:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1154360F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gz2QkzUfC-EU for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 13:17:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1102E60F5D
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1102E60F5D
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 13:17:16 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ibbmodLeXaWj1ibbmov4Hj; Wed, 12 Oct 2022 15:17:14 +0200
Message-ID: <57364e0f-3e7d-d056-60f0-f935395d82ca@benettiengineering.com>
Date: Wed, 12 Oct 2022 15:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221010064610.388468291C@smtp1.osuosl.org>
 <20221012160546.GC2476394@igalia.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221012160546.GC2476394@igalia.com>
X-CMAE-Envelope: MS4xfIFJCisNLfLUwGjNEI/L+oe9y/eVZt9xrFcjNNn2IlAOdGb7aUYrqZkVD5G7ZvOnmC7MFTmU2MM6d4Lbg2IYFx12uvxEvSv/Ai5OORaNl/FsTGrThoFK
 3N/dFpsCnWRmBpiXTql292DHqguKosJPIABKALluDqugXPwLg6f6xaA1uLqrYA+8XPPzCUE1n5SKVc6v8c8Bwy5eU0Xh/bKrFa1w7iT9qC4/mB/lAhheLasS
 t+871kigQmPRvJt2nRwkbL7Yj4xPLirrFqu2cnMUQc0m9rk57CiP/G5bAoMAVuYo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665580634; bh=pB3O3oFEiIaU6jIhUalDu1ugPIyd/lAp9bCsMLRSZ9M=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=E0MDQDhVY16vtJiU9La1N02jOnoTRdrIi/E7b6LAZttUpNhhD61wBS8quK9cdyNmO
 3GvJ/tp6RmMPc727OAxKstSu6eIquE90G4OljPux8Za0EgmSTOeX2CpIxoKIUvrB8m
 +HjQTysM9/2E5CYbxzdFFKFOvq3VTDDaAgRfltCxfGsREnnOCgVRmitnm1buBACMwO
 VOO/ifwfe2lsE0gmTG749npz/JvRl58zImI+zblHoIL2C9QKFWST1WLP7XgTBqUODx
 GndbdfqZv/ZrrQGo6TKBIumfUyEms3UzY81stXNKOqm9LJVTnIeNbhbWEDxnvwTKiV
 J7hfrQ6YTlZYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=E0MDQDhV
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-10-09
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRyaWFuLAoKT24gMTIvMTAvMjIgMTU6MDUsIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gd3Jv
dGU6Cj4gSGVsbG8sCj4gCj4gT24gTW9uLCAxMCBPY3QgMjAyMiAwNjo0NjowMyArMDAwMCBUaG9t
YXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90
ZToKPiAgIAo+PiBBdXRvYnVpbGQgc3RhdGlzdGljcyBmb3IgMjAyMi0xMC0wOQo+PiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pgo+PiBbLi4uXQo+Pgo+PiAgICAgIGFyYyAg
ICAgIHwgICAgICAgICAgYnJvdGxpLTEuMC45ICAgICAgICAgIHwgTk9LIHwgaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYTc3MDAwMjUyMzQxMTMyOGM2OTMzMTU4NDYxYTAw
N2QwNzMwNWM5ZSB8Cj4gCj4gVGhpcyBidWlsZCBmYWlsdXJlIGlzIGR1ZSB0byBhbiBpbnRlcm5h
bCBjb21waWxlciBlcnJvciBpc3N1ZSB3aGljaCBJIGhhdmUKPiBzZWVuIHJlcG9ydGVkIGVsc2V3
aGVyZSBbMV0sIGFuZCB0aGUgZml4IGhhcyBtYWRlIGl0IGludG8gdXBzdHJlYW0gR0NDOgo+IAo+
ICAgIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXQ7aD05YmIyMDI5
OWJhMWQxY2MzYmJkODNhMDdhNzc3ZmNjNWE5M2NmZWIwCj4gCj4gR0NDIDEyIHNob3VsZCBiZSB1
bmFmZmVjdGVkLiBXaGF0IGlzIHRoZSBiZXN0IHdheSB0byBmaXggdGhpcz8gU2hvdWxkIHdlCj4g
ZGlzYWJsZSB0aGUgYnJvdGxpIHBhY2thZ2Ugd2hlbiBHQ0MgMTEgaXMgaW4gdXNlLCBpbXBvcnQg
YSBiYWNrcG9ydGVkIGZpeAo+IHRvIEdDQyAxMSwgb3IuLi4/CgpZb3UgY2FuIHRyeSB0byB3b3Jr
LWFyb3VuZCBpdCBieSBkaXNhYmxpbmcgdGhlIG9wdGltaXphdGlvbiwgY2hlY2sgaGVyZQphcyBh
IHJlZmVyZW5jZToKaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVpbGRyb290L3RyZWUvcGFja2Fn
ZS9icm90bGkvYnJvdGxpLm1rI24yMAphbmQgdG8gZG8gdGhpcyBhcyB5b3UgY2FuIHNlZSB5b3Ug
aGF2ZSB0byBhZGQgYSBnY2MgYnVnIGxpa2U6CkJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfNjg0
ODUKClRoZW4sIHNpbmNlIHRoZXJlIGlzIGEgZml4IHlvdSBjb3VsZCBiYWNrcG9ydCBpdCwgYnV0
IHRoZSBwcm9ibGVtIGlzCnRoYXQgZXh0ZXJuYWwgdG9vbGNoYWluIHdvbid0IGhhdmUgaXQgc28g
aXQgd2lsbCBmYWlsIGFueXdheS4KCklzIHRoaXMgZ2NjIGJ1ZyBwcmVzZW50IG9ubHkgb24gZ2Nj
IDExLng/IElmIHllcyBJIHdvdWxkIG9ubHkgYWRkIHRoZQp3b3JrYXJvdW5kLgoKQWxzbyB5b3Ug
bmVlZCB0byBjaGVjayBpZiBnY2MgMTIueCBpcyBub3QgYWZmZWN0ZWQgYW55bW9yZSBieSBidWls
ZGluZwpicm90bGkgcGFja2FnZSB3aXRoIGRpZmZlcmVudCBCdWlsZHJvb3QgVG9vbGNoYWlucyB3
aXRoIGRpZmZlcmVudCBnY2MKdmVyc2lvbnMsIGxpa2UgZ2NjIDEwLngsIDExLngsIDEyLnggYW5k
IHNlZSB0aGUgcmVzdWx0LgoKVGhpcyBpcyBhdCBsZWFzdCB3aGF0IEkgdXN1YWxseSBkby4KCkJl
c3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4g
Q2hlZXJzLAo+IOKAlEFkcmnDoW4KPiAKPiAtLS0KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2Zv
c3MtZm9yLXN5bm9wc3lzLWR3Yy1hcmMtcHJvY2Vzc29ycy90b29sY2hhaW4vaXNzdWVzLzM5OAo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
