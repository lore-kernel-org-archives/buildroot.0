Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E4C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FAF982122;
	Sat,  5 Jul 2025 17:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Egrp4v3X-xF; Sat,  5 Jul 2025 17:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9796F83661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9796F83661;
	Sat,  5 Jul 2025 17:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF025445
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4F60400BA
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7BfNV8W71Ro for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 264D840088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 264D840088
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 264D840088
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:50:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CFEF719F57E;
 Sat,  5 Jul 2025 19:50:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 19:50:42 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 19:50:42 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dick Olsson <hi@senzilla.io>
In-Reply-To: <dbf55473-aede-485c-a896-8d014d103d06@app.fastmail.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
 <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
 <3f1060fd8783b35211b3de718d350dd1@free.fr>
 <dbf55473-aede-485c-a896-8d014d103d06@app.fastmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ecc1d845fa77dc51dc67bf25fe08de42@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751737848;
 bh=/ahL6lW9HGtE8KYIKUakZV73/tLfLN2r2WaMXptuRKk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iUX0EbpS38RxK2OL0YqEbXxUUL6iLYNdHZVegJJWAu36joHHfOE4fX1LHZ+ywI+o8
 f3Jwkncjmq6ry/oK/CBV6Su9d3bkOB4lpB0QEUV04bleIZ5hbaShuAXpLFtr646F3I
 in1453sR1GXx5IcxXxT4CO27bIQomgzH5srb6hsZ8vuaMdKBEHXpEEtZOB1yBJsHap
 +WuqxIteMSXkEkywsUYS+ixU2LBDmowoOoD3hyWxWGq2CavQQYpUbtwJOeLsTMOFLi
 bxWXhD3dqugXy00mcTJdlAdRZR3FtXKYefBs2FCKOVhyB/mQRP0z4A58zvCdlegrLV
 OxmIqXQlw1DXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iUX0EbpS
Subject: Re: [Buildroot] [PATCH v3 02/11] arch: Introduce LoongArch64
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmlheHVuLAoKT24gMDUvMDcvMjAyNSAxNToyNCwgSmlheHVuIFlhbmcgd3JvdGU6Cj4g5Zyo
MjAyNeW5tDfmnIg15pel5ZGo5YWtIOS4i+WNiDE6MTfvvIxKdWxpZW4gT2xpdmFpbuWGmemBk++8
mgo+PiBIaSBKaWF4dW4sCj4+IAo+IEhpIEp1bGllbiwKPiAKPiBBbGwgc291bmRzIGdvb2QgdG8g
bWUhIE1hbnkgdGhhbmtzIGZvciBsb29raW5nIGludG8gaXQuCj4gCj4gWy4uLl0KPiAKPj4gSWYg
eW91IHByb21pc2UgdG8gaGVscCB1cyBkb2luZyB0aGlzIG1haW50ZW5hbmNlLCBJIHRoaW5rIHdl
IGNvdWxkCj4+IHRoaXMgc2VyaWVzIG1lcmdlZCBzb29uLgo+IAo+IFN1cmUsIEkgd2lsbCB0cnkg
bXkgYmVzdC4KPiAKPiBJIGp1c3Qgd2FudCB0byBub3RlIHRoYXQgSSdtIGEgaG9iYnlpc3Qgc28g
bXkgYXZhaWxhYmlsaXR5IG1heSB2YXJ5LAo+IGJ1dCBpdCBzaG91bGQgYmUgZmluZSB0byBkZXZv
dGUgYSBjb3VwbGUgb2YgaG91cnMgcGVyIHdlZWsuCj4gCj4gSSdsbCBtb25pdG9yIENjIGZyb20g
YnVpbGRyb290IGxpc3QgcHJvbXB0bHkuCgpUaGFua3MgZm9yIHlvdXIgY29uZmlybWF0aW9uLgoK
V2l0aCB0aGF0LCBJIGp1c3QgbWVyZ2VkIHRoaXMgc2VyaWVzIGludG8gbWFzdGVyLgoKTGV0J3Mg
c2VlIGhvdyBpdCBnb2VzIHdpdGggdGhlIGF1dG9idWlsZGVycy4KCj4+IAo+PiBXaGF0IGRvIHlv
dSB0aGluaz8KPiAKPiBUaGFua3MgYWdhaW4uCj4gCj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IAo+
PiBKdWxpZW4uCj4gCj4gLS0KPiAtIEppYXh1bgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
