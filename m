Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C906ECD4846
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67AA341193;
	Fri, 22 Sep 2023 17:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67AA341193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhppF4hDWMLu; Fri, 22 Sep 2023 17:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 476A341480;
	Fri, 22 Sep 2023 17:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 476A341480
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04B881BF2FA
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 17:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF6EF41480
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 17:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6EF41480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1Nw5X__Q2Fl for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 17:06:20 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8953741193
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 17:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8953741193
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 340D513F86A;
 Fri, 22 Sep 2023 19:06:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 19:06:14 +0200
Date: Fri, 22 Sep 2023 19:06:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230922170614.GS512384@scaer>
References: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
 <20230922160448.GR512384@scaer>
 <CADYjeSv4H7rqSaq5D7a9zHyZxSMp1vJv5sNs6Lj7RJLgmXEd3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYjeSv4H7rqSaq5D7a9zHyZxSMp1vJv5sNs6Lj7RJLgmXEd3w@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695402377;
 bh=qGjlYIpBPXNZ0lTfUffOzfeJ2ZaXn3LTBf9OfTLeJmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DzHy7MiPZE+bK7pOE53MV2esf8WsaOdYHNPuVUBtGsCgZabr1eb9dt8JRBQS4+NUg
 iTJvJMqaSwOTfqURuNaLjRVNhNnXeuBiBDsqGYyzXU1alqGFOaEflEFi7Ydi7E+L6O
 ZYXsxth+Fdq7XdGJbeedle0f1WB2C6jKETiLAIITDFgSN30cqoLTfbAu302lwihIX0
 zhufDZ+ozOaetjATKbxdCOO5FqKXJVE+dscZEbE6aqOI2KcYMY8zBREzd5Yj5b5ztO
 c3CFSx71UlAa/F3CVHtQSjmVYnIMtE9CM7vkHro1epfacwbVEhpaP4hPghYoTn3wVy
 YTXaWxxzFIe4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DzHy7MiP
Subject: Re: [Buildroot] How to pass EXTRA_OECMAKE_BUILD in Buildroot
 package definition?
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

U291cmFiaCwgYWxsLAoKUGxlYXNlIGRvIG5vdCB0b3AtcG9zdCwgdGhpcyBpcyBjb25zaWRlcmVk
IGJhZCBldGlxdWV0dGUuIFJlcGx5IGluLWxpbmUKYXMgSSBkbzoKCk9uIDIwMjMtMDktMjIgMTg6
MjIgKzAyMDAsIFNvdXJhYmggSGVnZGUgc3Bha2UgdGh1c2x5Ogo+IFllcywgSSBjaGVja2VkIGlu
ICJJbmZyYXN0cnVjdHVyZSBmb3IgQ21ha2UgYmFzZWQgcGFja2FnZXMiIGJ1dCBjb3VsZG4ndCBm
aW5kIGFueXRoaW5nIHJlbGV2YW50Lgo+IFRoZXJlIHNlZW1zIHRvIGJlIG5vIGRpcmVjdCB3YXkg
dG8gZG8gdGhpcyBpbiBCdWlsZHJvb3QuIFBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZy4K
ClNvLCB5b3UgaGF2ZSB0byBrbm93IHdoYXQgdGhhdCBPRSB2YXJpYWJsZSBkb2VzIChJIGhhdmUg
bm8gaWRlYSwgSSBkb24ndApkbyBPRSkuIEJ1dCBieSB0aGUgbmFtZSwgYW5kIHRoZSB2YWx1ZSBp
dCBpcyBhc3NpZ25lZCwgaXQgbG9va3MgbGlrZSBpdAppcyB0aGUgbGlzdCBvZiBjbWFrZSBydWxl
cyB0byBidWlsZC4KCldlIGRvIGhhdmUgdGhhdCBpbiBCdWlsZHJvb3Q6IExJQkZPT19NQUtFX09Q
VFMKCllvdSBjb3VsZCBsb29rIGF0IGV4aXN0aWduIHBhY2thZ2VzIHRvIHNlZSBob3cgaXQgaXMg
dXNlZCwgZS5nLjoKCiAgICAkIGdyZXAgX01BS0VfT1BUUyAkKGdpdCBncmVwIC1sIC1FICdldmFs
IFwkXChjbWFrZS0nKQoKTm93LCBpZiB5b3UgYXJlIHRyeWluZyB0byB1c2UgdGVuc29yZmxvdy1s
aXRlLCB0aGVyZSBpcyBhIHBlbmRpbmcgc2VyaWVzCmJ5IEphbWVzLCBhbmQgaXQgd291bGQgYmUg
bmljZSBpZiB5b3UgY291bGQgaGF2ZSBhIGxvb2sgYXQgaXQsIHRlc3QgaXQsCmFuZCByZXBvcnQs
IHJhdGhlciB0aGFuIHRyeSB5ZXQgc29tZXRoaW5nIGVsc2U6CiAgICBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zNDY1NDYKClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBPbiBGcmksIFNl
cCAyMiwgMjAyMywgMTg6MDQgWWFubiBFLiBNT1JJTiA8IFsxXXlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPiAKPiAgIFNvdXJhYmgsIEFsbCwKPiAKPiAgIE9uIDIwMjMtMDktMjIgMTc6
MzMgKzAyMDAsIFNvdXJhYmggSGVnZGUgc3Bha2UgdGh1c2x5Ogo+ICAgPiBIaSwKPiAgID4gSSBh
bSB0cnlpbmcgdG8gYWRkIGEgQnVpbGRyb290IHBhY2thZ2Ugd2hlcmUgSSBuZWVkIHRvIHNwZWNp
ZnnCoEVYVFJBX09FQ01BS0VfQlVJTEQuIEJ1dCBJIGNvdWxkbid0wqBmaW5kIGFueSByZWxldmFu
dAo+ICAgPiB2YXJpYWJsZSBpbiBCdWlsZHJvb3QgZm9yIHRoaXMuCj4gCj4gICBUaGlzIHZhcmlh
YmxlIGlzIHNwZWNpZmljIHRvIHRoZSBPcGVuRW1iZWRkZWQgd29ybGQuCj4gCj4gICBMb29rIGF0
IHRoZSBCdWlsZHJvb3QgbWFudWFsIHRvIGZpbmQgdGhlIGNvcnJlc3BvbmRpbmcgdmFyaWFibGU6
Cj4gCj4gICDCoCDCoCBbMl1odHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9t
YW51YWwuaHRtbAo+IAo+ICAgSGludDogIkluZnJhc3RydWN0dXJlIGZvciBDTWFrZS1iYXNlZCBw
YWNrYWdlcyIKPiAKPiAgIFJlZ2FyZHMsCj4gICBZYW5uIEUuIE1PUklOLgo+IAo+ICAgPiBFeGFt
cGxlIHdpbGwgYmUgZnJvbcKgCj4gICA+IFsxXQo+ICAgWzNdaHR0cHM6Ly9naXRodWIuY29tL254
cC1pbXgvbWV0YS1pbXgvYmxvYi82NGE4NjRhYjc3ZGUwNmE1NTdhZmNiMDFlNmRkNGQyMTYwNmU2
OTQ4L21ldGEtbWwvcmVjaXBlcy1saWJyYXJpZXMvdGVuc29yZmxvdy1saXRlL3RlbnNvcmZsb3ct
bGl0ZV8yLjEwLjAuYmIjTDQxCj4gICA+IENhbiBhbnlvbmUgcGxlYXNlIGxldCBtZSBrbm93IGhv
dyB0byBhY2hpZXZlIHRoaXM/Cj4gICA+IFRoYW5rcyBpbiBhZHZhbmNlLgo+ICAgPgo+ICAgPiBM
aW5rczoKPiAgID4gMS4KPiAgIFs0XWh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L21ldGEtaW14
L2Jsb2IvNjRhODY0YWI3N2RlMDZhNTU3YWZjYjAxZTZkZDRkMjE2MDZlNjk0OC9tZXRhLW1sL3Jl
Y2lwZXMtbGlicmFyaWVzL3RlbnNvcmZsb3ctbGl0ZS90ZW5zb3JmbG93LWxpdGVfMi4xMC4wLmJi
I0w0MQo+IAo+ICAgPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ICAgPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gICA+IFs1XWJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gICA+IFs2XWh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+IAo+ICAgLS0KPiAgIC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4g
ICB8wqAgWWFubiBFLiBNT1JJTsKgIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gICB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlwqAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR07CoCDCoCDCoHzCoCBfX1/CoCDCoCDCoCDCoCDC
oCDCoAo+ICAgwqAgwqB8Cj4gICB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06wqAgWMKgIEFHQUlOU1TCoCDCoCDCoCB8wqAgXGUvwqAgVGhlcmUgaXMgbm/CoCB8Cj4gICB8
IFs3XWh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUzC
oCDCoCB8wqAgwqB2wqAgwqBjb25zcGlyYWN5LsKgIHwKPiAgICctLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCj4gCj4gTGlua3M6Cj4gMS4gbWFpbHRvOnlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyCj4gMi4g
aHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwKPiAzLiBo
dHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9tZXRhLWlteC9ibG9iLzY0YTg2NGFiNzdkZTA2YTU1
N2FmY2IwMWU2ZGQ0ZDIxNjA2ZTY5NDgvbWV0YS1tbC9yZWNpcGVzLWxpYnJhcmllcy90ZW5zb3Jm
bG93LWxpdGUvdGVuc29yZmxvdy1saXRlXzIuMTAuMC5iYiNMNDEKPiA0LiBodHRwczovL2dpdGh1
Yi5jb20vbnhwLWlteC9tZXRhLWlteC9ibG9iLzY0YTg2NGFiNzdkZTA2YTU1N2FmY2IwMWU2ZGQ0
ZDIxNjA2ZTY5NDgvbWV0YS1tbC9yZWNpcGVzLWxpYnJhcmllcy90ZW5zb3JmbG93LWxpdGUvdGVu
c29yZmxvdy1saXRlXzIuMTAuMC5iYiNMNDEKPiA1LiBtYWlsdG86YnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiA2LiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPiA3LiBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvCgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
