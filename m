Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413B0C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 09:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B861240B57;
	Thu,  9 Feb 2023 09:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B861240B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B31NYHart3_8; Thu,  9 Feb 2023 09:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0F9D404AE;
	Thu,  9 Feb 2023 09:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0F9D404AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66B9A1BF28D
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 09:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CFB7408B6
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 09:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFB7408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWIVCxgI72FG for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 09:10:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB544089D
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FB544089D
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 09:10:40 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pQ2wv-0004Yg-FE; Thu, 09 Feb 2023 12:10:37 +0300
Message-ID: <eeb3b4bc-12fa-eea5-4ec0-89c90ac75394@inbox.ru>
Date: Thu, 9 Feb 2023 12:10:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Sourabh Hegde <hrsourabh011@gmail.com>
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
 <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
 <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
 <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
 <CADYjeStesndVUqdWqmPVP5=xfW1PFcwzNk=9o0TUM+tXBez8mA@mail.gmail.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <CADYjeStesndVUqdWqmPVP5=xfW1PFcwzNk=9o0TUM+tXBez8mA@mail.gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC6604BDCFF1ECAF5FB1B4224B71692CFBE72C182A05F538085040962A76334E31A36BACCA77449444F564A19B1D17C6FFD8C6C48C09A8C4BBD105
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7F544D30F1A6FA191EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEB8EE906D0D8175FC19B6FDCDE41C105920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0C7E80E60854EA9278941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A32D918A17158F1389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C264B329661203DA9792548BB64559FC0F55FC24C8258A0E180C630C56FDDCE2C20D0D922FC27F861D7E09C32AA3244C801A3F652F293A035FAD6E296E25ADB7F522A1CF68F4BE05FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhUGBdNDf2gpRxCp8MjbQIw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5A9DADE5EF702F040D4F82808B92196FA98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=B/pstJFQEHHMCwxcL6kYizG4PmXLwxni6k9QGU78+aU=; 
 t=1675933840;x=1676023840; 
 b=kvjjCqcCGRYohGHH3mjaAbE1U4sKS6lHto4D2Y+SRRb0uLPuCvUpnb1FPbHcHvOgFoaHYLTYTllZroIdPSJhXSWhibMJrr4i//3umh5TxOp1kFFD0miSPBamHyHcPZBK7A3ThteWvEFizM4tQdH2WPoO1K2IH0xD6gb+6t2sb5+cTx5TkB+5cAttsFRRQxSdTjopJ9WEaQDtQSYX0odr007hrIN8Fs6GAQmmX4mnoie4DehXobWphBHQEgnnOU2DmLJwaJwk64lK6l2Fic6s7Aram0AX9/hh7wfxuWs9pMkqWo2/7ByVL2e14V3VgVPekCwO8nbnDebP3cfVywAgpQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=kvjjCqcC
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS4wMi4yMDIzIDEyOjAzLCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxvIE1heGlt
LAo+IAo+IFVwZGF0ZToKPiAKPiBUaGUgYWJvdmUgaXNzdWUgcmVzb2x2ZWQgYnkgaXRzZWxmIQo+
IAo+IE5vdyB3aGVuIEkgZG86wqB1dGlscy9zY2FucHlwaSBhd3NjcnQgLW8gcGFja2FnZSAsIGl0
IHNheXMKPiAKPiBzcGR4X2xvb2t1cCBtb2R1bGUgaXMgbm90IGluc3RhbGxlZC4gVGhpcyBjYW4g
bGVhZCB0byBhbiBpbmFjY3VyYXRlIAo+IGxpY2VuY2UgZGV0ZWN0aW9uLiBQbGVhc2UgaW5zdGFs
bCBpdCB2aWEKPiBwaXAgaW5zdGFsbCBzcGR4X2xvb2t1cAo+IGJ1aWxkcm9vdCBwYWNrYWdlIG5h
bWUgZm9yIGF3c2NydDogcHl0aG9uLWF3c2NydAo+IFBhY2thZ2U6IHB5dGhvbi1hd3NjcnQKPiBG
ZXRjaGluZyBwYWNrYWdlIGF3c2NydAo+IEVSUk9SOiBDb3VsZCBub3QgZmluZCBwYWNrYWdlIGF3
c2NydC4KPiBDaGVjayBzeW50YXggaW5zaWRlIHRoZSBweXRob24gcGFja2FnZSBpbmRleDoKPiBo
dHRwczovL3B5cGkucHl0aG9uLm9yZy9weXBpLyA8aHR0cHM6Ly9weXBpLnB5dGhvbi5vcmcvcHlw
aS8+Cj4gCj4gQnV0IHRoZSBwYWNrYWdlIGlzIGF2YWlsYWJsZcKgYXQgaHR0cHM6Ly9weXBpLm9y
Zy9wcm9qZWN0L2F3c2NydC8gCj4gPGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9hd3NjcnQvPgoK
SXQgd29ya3MgZmluZSBmb3IgbWU6CgpidWlsZHJvb3QgcGFja2FnZSBuYW1lIGZvciBhd3NjcnQ6
IHB5dGhvbi1hd3NjcnQKUGFja2FnZTogcHl0aG9uLWF3c2NydApGZXRjaGluZyBwYWNrYWdlIGF3
c2NydApEb3dubG9hZGluZyBwYWNrYWdlIGF3c2NydCBmcm9tIApodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvYWUvOTgvZGRhMDkyMDc4ZjJkNDdiYWQwOGUxODRhYjlkMzY0
YjhmODkxNjY0OTcwNjJiYzFjZjgxMWMwYmJiZGUyL2F3c2NydC0wLjE2LjEwLnRhci5nei4uLgpD
aGVja2luZyBpZiBwYWNrYWdlIHBhY2thZ2UvcHl0aG9uLWF3c2NydCBhbHJlYWR5IGV4aXN0cy4u
LgpDcmVhdGluZyBwYWNrYWdlL3B5dGhvbi1hd3NjcnQvcHl0aG9uLWF3c2NydC5tay4uLgpNb3Jl
IHRoYW4gb25lIGZpbGUgZm91bmQgZm9yIGxpY2Vuc2U6IExJQ0VOU0UsIGNydC9hd3MtYy1jb21t
b24vTElDRU5TRSwgCmNydC9hd3MtYy1pby9MSUNFTlNFLCBjcnQvYXdzLWxjL0xJQ0VOU0UsIApj
cnQvYXdzLWxjL3RoaXJkX3BhcnR5L2ZpYXQvTElDRU5TRSwgY3J0L2F3cy1jLW1xdHQvTElDRU5T
RSwgCmNydC9hd3MtY2hlY2tzdW1zL0xJQ0VOU0UsIGNydC9hd3MtYy1zMy9MSUNFTlNFLCAKY3J0
L2F3cy1jLWNvbXByZXNzaW9uL0xJQ0VOU0UsIGNydC9hd3MtYy1odHRwL0xJQ0VOU0UsIApjcnQv
YXdzLWMtc2RrdXRpbHMvTElDRU5TRSwgY3J0L3Mybi9MSUNFTlNFLCBjcnQvYXdzLWMtY2FsL0xJ
Q0VOU0UsIApjcnQvYXdzLWMtYXV0aC9MSUNFTlNFLCBjcnQvYXdzLWMtZXZlbnQtc3RyZWFtL0xJ
Q0VOU0UKQ3JlYXRpbmcgcGFja2FnZS9weXRob24tYXdzY3J0L3B5dGhvbi1hd3NjcnQuaGFzaC4u
LgpDcmVhdGluZyBwYWNrYWdlL3B5dGhvbi1hd3NjcnQvQ29uZmlnLmluLi4uCk5PVEU6IFJlbWVt
YmVyIHRvIGFsc28gbWFrZSBhbiB1cGRhdGUgdG8gdGhlIERFVkVMT1BFUlMgZmlsZQogICAgICAg
YW5kIGluY2x1ZGUgYW4gZW50cnkgZm9yIHRoZSBwa2cgaW4gcGFja2FnZXMvQ29uZmlnLmluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
