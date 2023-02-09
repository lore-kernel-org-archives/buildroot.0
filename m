Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8724C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 05:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 083B440612;
	Thu,  9 Feb 2023 05:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 083B440612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sek_7x7J4BRe; Thu,  9 Feb 2023 05:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02D7840526;
	Thu,  9 Feb 2023 05:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02D7840526
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151001BF3CA
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 05:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E22434050F
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 05:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22434050F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YP2uSCDxqOYu for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 05:35:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A458403C5
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A458403C5
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 05:35:06 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pPzaJ-0004RF-IZ; Thu, 09 Feb 2023 08:35:03 +0300
Message-ID: <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
Date: Thu, 9 Feb 2023 08:35:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Sourabh Hegde <hrsourabh011@gmail.com>
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC660424D76829FF8423F3625EFC1F9A06FFAB182A05F53808504044B2F71DB6199F17124A11D1B4083C201B2231E673AD00C9FA5521F1744CA096
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76042E2DB3E33BF2BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379428F6EA0D091379EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEBAD75F14803B65736281FF1057CF0C8720879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FA18204E546F3947C5FF72824B19451C6F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637D2AD7660D07C2C48389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D75CEA0D7A80616E5F82A9C890026EC77415D08115D7FA612C029596FAC61445EC0AF11B0A8B25471D7E09C32AA3244CA11C70A262BE64880A2377564CA116B163871F383B54D9B3FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhUGBdNDf2goedEP3J9OUog==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5FCFD82EE08D9C2A21CAAC570D409971298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Jpu2Wr0Sb7mujFO4cAg9RTOPIb0a8rDCOH2KfPxbwUA=; 
 t=1675920907;x=1676010907; 
 b=Yd9u7sU16jhcTOrFOtWb1jPT5zjOy3CdKvk4So6Uwu7eXMIfYo8l9y5STWU6WyfB5mFhWgyhw1QCJhoVY6zAuaPpXG/OE+vbXIYOPQNCZWhj/MnZn89DHqBTkI9uQtN1xtOl3yoLKmekIYgt2iM5o0JaeQWEVvi8H+Kj6Bb83No5mHnq3hxK1xiVARIV0PteSQqgfUeLUTpb9DkvoFD4M0b22HmDDiQHZhDD0mK/106ix0YZevRC/gSmHQBtyVGQ0JtkHWhPiUQ5hwxNp4LUD6yCiLvP9r8lpnhtqKRjVp8ylpO6aTgseRt6QRzIQ7PWJt6dM+KyAvr78zgtHHOfxg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Yd9u7sU1
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS4wMi4yMDIzIDAwOjI4LCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxvIE1heGlt
LAo+IAo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4KPiAKPiBJIHRoaW5rIGZvciBtZSwgdGhlIG9w
dGlvbiAiMTguOS4zLiBHZW5lcmF0aW5nIGEgcHl0aG9uLXBhY2thZ2UgZnJvbSBhIAo+IFB5UEkg
cmVwb3NpdG9yeSIgCj4gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFu
dWFsLmh0bWwjX2luZnJhc3RydWN0dXJlX2Zvcl9weXRob25fcGFja2FnZXMgPGh0dHBzOi8vYnVp
bGRyb290Lm9yZy9kb3dubG9hZHMvbWFudWFsL21hbnVhbC5odG1sI19pbmZyYXN0cnVjdHVyZV9m
b3JfcHl0aG9uX3BhY2thZ2VzPsKgaXMgc3VpdGVkLgo+IEkgd2FudCB0byBpbnN0YWxsIHRoaXMg
cGFja2FnZSBodHRwczovL3B5cGkub3JnL3Byb2plY3QvYXdzaW90c2RrLyAKPiA8aHR0cHM6Ly9w
eXBpLm9yZy9wcm9qZWN0L2F3c2lvdHNkay8+LiBBbmQgdGhpcyBwYWNrYWdlIHJlcXVpcmVzIAo+
IGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9hd3NjcnQvIDxodHRwczovL3B5cGkub3JnL3Byb2pl
Y3QvYXdzY3J0Lz7CoGFzIAo+IGRlcGVuZGVuY3kuIFNob3VsZCBJIGNyZWF0ZSBib3RoIEJ1aWxk
cm9vdCBwYWNrYWdlcyBmcm9tIHB5dGhvbiBwYWNrYWdlcz8KClN1cmUuCgo+IEluIHRoZSBCdWls
ZHJvb3QgbWFudWFsLCBpdCdzIG1lbnRpb25lZCAiRmluZCB0aGUgZXh0ZXJuYWwgcHl0aG9uIAo+
IG1vZHVsZXMgbWVudSBhbmQgaW5zZXJ0IHlvdXIgcGFja2FnZSBpbnNpZGUuIiwgd2hhdCBzaG91
bGQgSSBpbnNlcnQgCj4gaGVyZT8gc291cmNlIGNvZGU/CgpUaGUgb3V0cHV0IGZyb20gc2NhbnB5
cGkgdXRpbC4gIlRoaXMgd2lsbCBnZW5lcmF0ZSBwYWNrYWdlcyBweXRob24tZm9vIAphbmQgcHl0
aG9uLWJhciBpbiB0aGUgcGFja2FnZSBmb2xkZXIgaWYgdGhleSBleGlzdCBvbiAKaHR0cHM6Ly9w
eXBpLnB5dGhvbi5vcmcuIgoKImV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIiBpcyBsb2NhdGVkIGF0
IHBhY2thZ2UvQ29uZmlnLmluOgoKLi4uCmlmIEJSMl9QQUNLQUdFX1BZVEhPTjMKbWVudSAiRXh0
ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCglzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFlbnVtL0NvbmZp
Zy5pbiIKCXNvdXJjZSAicGFja2FnZS9weXRob24tYWV4cGVjdC9Db25maWcuaW4iCi4uLgoKVHJ5
IHRoaXMgc2VxdWVuY2U6Cgp1dGlscy9zY2FucHlwaSBhd3NjcnQgYXdzaW90c2RrIC1vIHBhY2th
Z2UKCnRoZW4gYWRkCglzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWF3c2NydC9Db25maWcuaW4iCglz
b3VyY2UgInBhY2thZ2UvcHl0aG9uLWF3c2lvdHNkay9Db25maWcuaW4iCnRvIHRoZSBwYWNrYWdl
L0NvbmZpZy5pbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
