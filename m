Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEECC636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 172AB404A5;
	Wed,  8 Feb 2023 20:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 172AB404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHnT3C3AIFrv; Wed,  8 Feb 2023 20:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 547AB40338;
	Wed,  8 Feb 2023 20:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 547AB40338
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 202741BF47E
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 20:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDCBD414D1
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 20:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCBD414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zr0e03n-BWXv for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 20:07:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA3F410E8
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDA3F410E8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 20:07:55 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pPqjR-00021v-85; Wed, 08 Feb 2023 23:07:53 +0300
Message-ID: <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
Date: Wed, 8 Feb 2023 23:07:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Sourabh Hegde <hrsourabh011@gmail.com>,
 Ramon Crichlow <rcrichlow9000@gmail.com>
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC66046397AEC088A59FC2E4C3B8ABD5857F3D182A05F538085040316EACCAA210457707596E742504F93947970D51CCC389D768F8B0C74E017751
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78D584A18421A528BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637838376990962B7D5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CE5540B56C4310731F9D550EFE43C4467220879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B97735A3E989B1926288338941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637036D0B7DAED17EFF389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D347341ACA13FB8BDD9D7903AB776A770D71BE40F0A481C18B8DBE20A1F4B708B058B2045920C16ADFF1D7E09C32AA3244C9A4415DBD79612203499A1F6631A807D05AB220A9D022EBCFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojDL2JcYrVG/8KrEl7Ks3gVA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF52B18ACD76BC18A8F8BD4850A6D102B5398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=mHdNR3djnz0HzA11KlBFQroB90iq9fcFN9MR4PuAeCA=; 
 t=1675886876;x=1675976876; 
 b=Sl7QbmCSqpMarQwuPO9r8MfSasOWWmY8/AeViU3QQGhiQvcTDZvCBCwRSMk52vdztNaGal0PBq8MhVtEHulP+LSuZ2ur8/YKgn0X1ZAPEa3qfD073a6ev8jNI2nDMfYoRBPt3IIQ0Ga3DyezzsbKLlplQaIOrkF1hsanzlNuOQbGbWda62yXmeMcWX1gVJIS/FLKf142GSuZ3/VoKsXdjWSKTRFmCplfLjE2PC1s5G0iR6D0s7aQCeXoeUG8LZ3Sbl/WX9rIVanoIVBFcmu1jE9Z2PU5JP5EACtAqMG31yTIvF4hDFHEwhYI+hhPpNkWl22FuAhWuKPGORRt4Cp5hA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Sl7QbmCS
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC4wMi4yMDIzIDIxOjE5LCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxvIFJhbW9u
LAo+IAo+IEkgZG9uJ3Qgd2FudCBhbiBleHRlcm5hbCB0b29sY2hhaW4uIE1heWJlIEkgd2FzIG5v
dCBjbGVhci4gTXkgZ29hbCBpcyB0byAKPiB1c2UgdGhlIHByb2dyYW0vc2RrIGZyb20gaGVyZSAK
PiBodHRwczovL2dpdGh1Yi5jb20vYXdzL2F3cy1pb3QtZGV2aWNlLXNkay1weXRob24tdjIgCj4g
PGh0dHBzOi8vZ2l0aHViLmNvbS9hd3MvYXdzLWlvdC1kZXZpY2Utc2RrLXB5dGhvbi12Mj7CoCwg
dGhpcyBpcyBhIHB5dGhvbiAKPiBiYXNlZCBwcm9qZWN0LiBBbmQgbm8gcGFja2FnZSBpcyBhdmFp
bGFibGUgZm9yIHRoaXMuIENhbiBJIHVzZSAKPiBweXRob24tcGlwIHRvIGluc3RhbGwgaXQ/CgpU
cnkgdG8gYWRkIHlvdXIgb3duIHBhY2thZ2UuCgpodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxv
YWRzL21hbnVhbC9tYW51YWwuaHRtbCNfaW5mcmFzdHJ1Y3R1cmVfZm9yX3B5dGhvbl9wYWNrYWdl
cwoKWW91IGNhbiB1c2UgYW55IHB5dGhvbiBwYWNrYWdlIGFzIGEgcmVmZXJlbmNlLgpGb3IgZXhh
bXBsZToKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0L3BhY2thZ2U/
aWQ9MDM3ZGJlNjRkODYxZTNkNTU4MGVjYWM2MDhiZDI3OGFmYzliYmNjNgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
