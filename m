Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF5C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 10:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78398813A1;
	Wed, 24 Jul 2024 10:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgmmcAItib4f; Wed, 24 Jul 2024 10:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EFB4813A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EFB4813A6;
	Wed, 24 Jul 2024 10:39:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 362561BF396
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 10:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AE0B404B4
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 10:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljVPu-kqSiwg for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 10:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 867C040173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 867C040173
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 867C040173
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 10:38:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 63D5635211B7; Wed, 24 Jul 2024 12:38:54 +0200 (CEST)
Date: Wed, 24 Jul 2024 12:38:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: =?utf-8?B?Sm9zw6k=?= Mendes <jp.baltazar.mendes@gmail.com>
Message-ID: <ZqDZvsDOz8ArGZPN@waldemar-brodkorb.de>
References: <CAFAK9+cph-594kM4jz+4zYV3zTkQZa22o9OwQpsaFBrCrL598g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFAK9+cph-594kM4jz+4zYV3zTkQZa22o9OwQpsaFBrCrL598g@mail.gmail.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721817534; bh=0LDa6/9i9g9EBg078izpAz31KmPEQ76bUMIpqToGs6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ays7W2cK92biNCyVRFNXZMmiKoL1ARk0ifoSv93dLK2iXdi/+4lsNOob9+ymweXkk
 wBB92XtX81TuBmRF6GtcZibhk2nwoMsDMwK1Vf7GTOHRtn2tgZiHKZlNttbS5z6XJY
 dhBU8Nn5nBr36wxoQieVLqkQKI6BiuqsjT2UZyT2hJRU/iI6nGJCkOjlPMufp7SLfl
 XtgYQD70z/vSyWtReqsu3cipea+jEl0e36oLpoEU4GFlkEkgtTT+ajMYPeK/eJZFaz
 w7xY2o0QBYn+T4ZVsJ3XkR3EAB6JNZmBclRDGM1oUYlKMnRsXzMgEeQLAJt+uYnS1m
 8Wm/OuJe33Hag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ays7W2cK
Subject: Re: [Buildroot] RaspberryPi U-Boot watchdog
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

SGksCgpKb3PDqSBNZW5kZXMgd3JvdGUsCgo+IEhpIGFsbCwKPiAKPiBJJ20gdHJ5aW5nIHRvIGJ1
aWxkIGEgc3lzdGVtIHdpdGggcmVkdW5kYW50IHJvb3RmcyBwYXJ0aXRpb25zIGZvciBhIFJhc3Bi
ZXJyeQo+IFBpIDQgd2l0aCBVLUJvb3QuCj4gCj4gSSdtIHRyeWluZyB0byB0ZXN0IHRoZSByZWNv
dmVyeSBvZiB0aGlzIHN5c3RlbSBidXQgSSBjYW4ndCBzZWVtIHRvIGdldCB0aGUKPiByYXNwYmVy
cnkgcGkgdG8gcmVzZXQgYWZ0ZXIgYSBrZXJuZWzCoHBhbmljIG9uIGEgbm9uLXdvcmtpbmcgcm9v
dGZzLgo+IAo+IFRvIHByb3Zva2XCoHRoaXMga2VybmVsIHBhbmljIEkgYW0gc2ltcGx5IGRlbGV0
aW5nIGFsbCB0aGUgZmlsZXMgaW4gdGhlCj4gcGFydGljdWxhciByb290ZnMuIFRoZSBzeXN0ZW0g
c2VlbXMgdG8ganVzdCBoYW5nIHRoZXJlIGFmdGVyIHRoZSBwYW5pYzoKPiAKPiAuLi4uLgo+IFsg
wqAgwqAzLjM3NDI3M10gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE5vIHdvcmtpbmcgaW5p
dCBmb3VuZC7CoCBUcnkgcGFzc2luZwo+IGluaXQ9IG9wdGlvbiB0byBrZXJuZWwuIFNlZSBMaW51
eCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2luaXQucnN0IGZvcgo+IGd1aWRhbmNlLgo+IFsg
wqAgwqAzLjM4ODQ0NF0gQ1BVOiAzIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQg
Ni4xLjYxLXY4ICMyCj4gWyDCoCDCoDMuMzk0NjI3XSBIYXJkd2FyZSBuYW1lOiBSYXNwYmVycnkg
UGkgNCBNb2RlbCBCIFJldiAxLjUgKERUKQo+IFsgwqAgwqAzLjQwMDQ1Nl0gQ2FsbCB0cmFjZToK
PiBbIMKgIMKgMy40MDI4OTddIMKgZHVtcF9iYWNrdHJhY2UucGFydC4wKzB4ZTgvMHgxMDAKPiBb
IMKgIMKgMy40MDcyNjRdIMKgc2hvd19zdGFjaysweDIwLzB4MzAKPiBbIMKgIMKgMy40MTA1Nzld
IMKgZHVtcF9zdGFja19sdmwrMHg4OC8weGI0Cj4gWyDCoCDCoDMuNDE0MjQ2XSDCoGR1bXBfc3Rh
Y2srMHgxOC8weDM0Cj4gWyDCoCDCoDMuNDE3NTYxXSDCoHBhbmljKzB4MWEwLzB4MzcwCj4gWyDC
oCDCoDMuNDIwNjE4XSDCoGtlcm5lbF9pbml0KzB4MTM4LzB4MTQwCj4gWyDCoCDCoDMuNDI0MTk3
XSDCoHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwCj4gWyDCoCDCoDMuNDI3Nzc2XSBTTVA6IHN0b3Bw
aW5nIHNlY29uZGFyeSBDUFVzCj4gWyDCoCDCoDMuNDMxNzAxXSBLZXJuZWwgT2Zmc2V0OiAweDEz
NTNjMDAwMDAgZnJvbSAweGZmZmZmZmMwMDgwMDAwMDAKPiBbIMKgIMKgMy40Mzc2MTddIFBIWVNf
T0ZGU0VUOiAweDAKPiBbIMKgIMKgMy40NDA0OTJdIENQVSBmZWF0dXJlczogMHg4MDAwMCwyMDEz
YzA4MCwwMDAwNDIxYgo+IFsgwqAgwqAzLjQ0NTM2OF0gTWVtb3J5IExpbWl0OiBub25lCj4gWyDC
oCDCoDMuNDQ4NDIzXSAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogTm8gd29y
a2luZyBpbml0IGZvdW5kLsKgIFRyeQo+IHBhc3NpbmcgaW5pdD0gb3B0aW9uIHRvIGtlcm5lbC4g
U2VlIExpbnV4IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvaW5pdC5yc3QKPiBmb3IgZ3VpZGFu
Y2UuIF0tLS0KPiAKPiBXaGF0IEkndmUgdHJpZWQ6Cj4gLSBGcm9tIGBUYXJnZXQgcGFja2FnZXNg
OiB3YXRjaGRvZywgd2F0Y2hkb2dkCj4gLSBCdXN5Ym94IHdhdGNoZG9nCj4gLSBGcm9tIGxpbnV4
LW1lbnVjb25maWcgPiBkZXZpY2UgZHJpdmVycyA+IHdhdGNoZG9nCj4gLSBGcm9tIHVib290LW1l
bnVjb25maWfCoD4gZGV2aWNlIGRyaXZlcnMgPiB3YXRjaGRvZwo+IAo+IE5vbmUgb2YgdGhlc2Ug
c2VlbSB0byBiZSB3b3JraW5nIGZvciBtZS4KCkhhdmUgeW91IHRyaWVkIHRvIGFkZCBwYW5pYz01
IHRvIHlvdXIga2VybmVsIGNvbW1hbmRsaW5lPyBJIGFtIG5vdApzdXJlIHdoYXQgdGhlIGRlZmF1
bHQgZm9yIHBhbmljIGlzLgpMb29rcyBsaWtlIGl0IGlzIDAsIHNvIHdhaXRpbmcgZm9yZXZlci4K
CmJlc3QgcmVnYXJkcwogV2FsZGVtYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
