Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BF7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 23:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45174403B8;
	Tue, 31 May 2022 23:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDn8HFCAOyrZ; Tue, 31 May 2022 23:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51F85401D5;
	Tue, 31 May 2022 23:20:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5A151BF3DE
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 23:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D106D60BA4
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 23:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2r57VqaMm1d4 for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 23:20:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTP id 583E960B4C
 for <buildroot@buildroot.org>; Tue, 31 May 2022 23:20:22 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wB9vneSQlXOlAwB9vn2xMa; Wed, 01 Jun 2022 01:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654039221; bh=r/LvFUQWNHJGtdwSl0ouzYUHWfHAWF1yhvhotSdWEHk=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=i1iY9Jh8WVOw9vKpBdryzJbrod11Nphc6iWvUvXOVsxqc/+9rlaiN2w9y5qNNojKd
 1tOFtfkECH+3SrsxflPby4l46z3hpW2JsT4M77kPi3166TKqwJTSdNHFzU9rtvmiso
 RD9S0p892OgOq/vvvZ4Eq1CWqUPL/EA1PGT8XV5alBIcA3eeh22ir8m5/RTI91BLbW
 xH7MhilE/w8qf/6pFdW86tjfsJrcOmvFMJU/SykYpierqFgjTgaksp8OHZRp7QPMbJ
 QhbtjLasQnWAN37RgljacK81t9tJBZtqwiEhDwR3Y5x21Ixik+iwATKp36JB041FvN
 qlHT4Rqus3Iuw==
Message-ID: <9eed64b3-946e-3f13-1fcd-168e68cad471@benettiengineering.com>
Date: Wed, 1 Jun 2022 01:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220531210109.472212-1-fontaine.fabrice@gmail.com>
 <224404ba-53e9-d97c-0ace-aa8885052ea5@benettiengineering.com>
In-Reply-To: <224404ba-53e9-d97c-0ace-aa8885052ea5@benettiengineering.com>
X-CMAE-Envelope: MS4xfJPICOrhKU0zU+JwqfzDROyWXcggTwMR3UExd1XB6ngMb0gvItMnf74Jh3t5kFCaTwjgb0iR7VcowLxs1A8h7ZsBr8L9SeBruhPRmoRTyDJKCfCdToqH
 beo15CRb2HSuMsZTRLTIGc93FI3qCCzujDCEjbGMNWLv7asvkEZimFcBJ/WQlvnw44GE0Rl6Tcpyr5j2aCYEvBaHBkId2kY451OagKfYpFsNY8l18fIV9tpI
 MTy/Oro20VlQw+lgMz9O1YVx+2Qk26xDzsmAXKrpBJqiMPdI/H4CZDnMC8a/bxgjwgck0bdqyBgG+gqwxw7Ypr6Yf7Nx3uS3WIwjn7+bsAykQnJjuVUmAICh
 sGsmNR97srmXAsh6i2nLIp9zzmd5+GLtDXQ6N7hWnepb3FcGjhg=
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: sh4{eb, a,
 aeb} are affected by GCC bug 101737
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDEvMDYvMjIgMDE6MDMsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIEZhYnJpY2UsCj4g
Cj4gT24gMzEvMDUvMjIgMjM6MDEsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4+IHBpeG1hbiBm
YWlscyB0byBidWlsZCB3aXRoIEJSMl9PUFRJTUlaRV9TIG9uIHNoNHtlYixhLGFlYn06Cj4+Cj4+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwaXhtYW4tZmFzdC1wYXRoLmM6MzM6Cj4+IHBpeG1hbi1m
YXN0LXBhdGguYzogSW4gZnVuY3Rpb24gCj4+ICdmYXN0X2NvbXBvc2l0ZV9zY2FsZWRfbmVhcmVz
dF84ODg4XzU2NV9ub3JtYWxfT1ZFUic6Cj4+IHBpeG1hbi1pbmxpbmVzLmg6NTg2OjE6IGludGVy
bmFsIGNvbXBpbGVyIGVycm9yOiBTZWdtZW50YXRpb24gZmF1bHQKPj4gwqDCoCA1ODYgfCB9Cj4+
IMKgwqDCoMKgwqDCoCB8IF4KPj4KPj4gRml4ZXM6Cj4+IMKgIC0gCj4+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2M5ZDM1ZDU5NzUzMTFhMTkxZGZiZTEyMjkxMzk4NTAz
OTg3ZTgwNGUgCj4+Cj4+IMKgIC0gCj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzL2QzNGI4NjcyZjYyMTFkNjBhZjQxMjJiZGQ5NGZhOGMyZjRmNGJmNmEgCj4+Cj4+IMKg
IC0gCj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzkzM2M0YTJlNzNj
OTg3NTczZWNjOTcxNzJmNDQyYjc4MTk5NDYyZDUgCj4+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAg
dG9vbGNoYWluL0NvbmZpZy5pbiB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90b29sY2hhaW4vQ29uZmln
LmluIGIvdG9vbGNoYWluL0NvbmZpZy5pbgo+PiBpbmRleCA3M2VhNzg2MjRhLi43NTg0Yjg1Zjcx
IDEwMDY0NAo+PiAtLS0gYS90b29sY2hhaW4vQ29uZmlnLmluCj4+ICsrKyBiL3Rvb2xjaGFpbi9D
b25maWcuaW4KPj4gQEAgLTE5OSw3ICsxOTksNyBAQCBjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNf
R0NDX0JVR185OTE0MAo+PiDCoCAjIHN0aWxsIGV4aXN0cyBpbiBnY2MgPSAxMS4xLjAKPj4gwqAg
Y29uZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfMTAxNzM3Cj4+IMKgwqDCoMKgwqAgYm9v
bAo+PiAtwqDCoMKgIGRlZmF1bHQgeSBpZiBCUjJfc2g0Cj4+ICvCoMKgwqAgZGVmYXVsdCB5IGlm
IEJSMl9zaDQgfHwgQlIyX3NoNGViIHx8IEJSMl9zaDRhIHx8IEJSMl9zaDRhZWIKPiAKPiBJJ3Zl
IHNlZW4gb25seSBub3cgdGhhdCBCUjJfc2g0IHN0YW5kcyBvbmx5IGZvcjoKPiAic2g0IChTSDQg
bGl0dGxlIGVuZGlhbikiCj4gSGVyZSBJJ3ZlIG1lYW50IHRvIG1ha2UgaXQgZGVmYXVsdCB5IHdo
ZW4gYW55IEJSMl9zaDQqIGlzIHNlbGVjdGVkLgo+IEJ1dCBhdCB0aGlzIHBvaW50IEkgd291bGQg
dXNlIEJSMl9zaCBzaW5jZSBpZiB3ZSBoYXZlIHRoYXQgc2VsZWN0ZWQKPiB0aGVuIGFsbCBCUl9z
aDQqIGNhc2VzIGFyZSBpbmNsdWRlZCBhbmQgbm8gb3RoZXIgQlIyX3NoKiBpcyBwcmVzZW50Lgo+
IAo+IENhbiB5b3UgcGxlYXNlIG1vZGlmeSBhY2NvcmRpbmcgdG8gdGhhdD8KCkFuZCB3aXRoIHRo
YXQgY2hhbmdlOgpSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+CgotLSAKR2l1bGlvIEJlbmV0dGkKQ1RPL0NFT0BCZW5ldHRp
IEVuZ2luZWVyaW5nIHNhcwoKPiBUaGFua3MgYSBsb3QKPiBLaW5kIHJlZ2FyZHMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
