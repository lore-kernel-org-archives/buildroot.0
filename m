Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FC9C6379F
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 08:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D644F40CE2;
	Thu,  9 Feb 2023 08:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D644F40CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtYB1KWFE8Y0; Thu,  9 Feb 2023 08:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B26A940CEB;
	Thu,  9 Feb 2023 08:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26A940CEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1171BF361
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 08:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BAEB40591
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 08:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BAEB40591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_j7EgzXsfVj for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 08:58:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9486B408B4
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9486B408B4
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 08:58:53 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pQ2lW-0000DJ-MI; Thu, 09 Feb 2023 11:58:51 +0300
Message-ID: <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
Date: Thu, 9 Feb 2023 11:58:50 +0300
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
In-Reply-To: <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC660488DBEAA600CFE3E7FC6ADC3ACCE4BA65182A05F538085040B7FC838A9E21AD4C43AD7AC9352FC77AF072EA6D21F4D9BA4C687525DA30DD39
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DECE8D0A5E25C0FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063770519A3AF4A224F58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A7D0E29623D509708FB5DAACE19E545B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FBDFBBEFFF4125B51D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BCDDA9AEF61929F65A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C565C1E6824D8037B43847C11F186F3C59DAA53EE0834AAEE
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3433E9BC74ABA5769F9A2C6746E96A7393BFA919C0973A8F860682550805C51923F6F5E646749753C01D7E09C32AA3244C0751C53C1330008890DEF080ECE9944281560E2432555DBBFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhUGBdNDf2gqHpnJrXN6Egw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF546954AA22C7F5D17CCD0ADA8C937949A98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=byyjuERDQB2AakyPJTLmJmL4BdOOmhfVvLVDxaIrfHQ=; 
 t=1675933134;x=1676023134; 
 b=bG4RfPoqHzslR38YO151BPoMl1H1HZtBYrlF8/fQix8IkoS3zKffwqdqvndeITrW0NoXYcBdDWjdy3yUNpzpVxJS8d7ZJDJYfWtyLWPHWjOBl0zP+SMXGvi6HXMfwNK26yzqcJsddntPtNkbJD+5rVOBE6PTf5ww8OYfQtjYUl45g/3xwav586bEdNcgOeyPuj1uZw8hCq33qlBFTzwLaIs8F2vexsSpDgjmlPnxoZswV8YYfaGJJzmvuuLCH8Qs3bPE9cfo2C0K8X+N2pZnGBGBz7VhFBBYB7d8mkWffyuEzYjT0Cl4Y9mfiXdAMJi0S+2LffgTslOy0LDpkhEtwg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=bG4RfPoq
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

CgpPbiAwOS4wMi4yMDIzIDExOjE0LCBTb3VyYWJoIEhlZ2RlIHdyb3RlOgo+IEhlbGxvIE1heGlt
LAo+IAo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLgo+IAo+IFdoZW4gSSB0cmllZCB0aGlz
IDrCoHV0aWxzL3NjYW5weXBpIGF3c2NydCBhd3Npb3RzZGsgLW8gcGFja2FnZSAswqAgSSBhbSAK
PiBnZXR0aW5nIGJlbG93IGVycm9yOgo+IAo+IHV0aWxzL3NjYW5weXBpOjIxOiBEZXByZWNhdGlv
bldhcm5pbmc6IHRoZSBpbXAgbW9kdWxlIGlzIGRlcHJlY2F0ZWQgaW4gCj4gZmF2b3VyIG9mIGlt
cG9ydGxpYjsgc2VlIHRoZSBtb2R1bGUncyBkb2N1bWVudGF0aW9uIGZvciBhbHRlcm5hdGl2ZSB1
c2VzCj4gIMKgIGltcG9ydCBpbXAKPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6
Cj4gIMKgIEZpbGUgInV0aWxzL3NjYW5weXBpIiwgbGluZSAyMywgaW4gPG1vZHVsZT4KPiAgwqAg
wqAgaW1wb3J0IHNpeC5tb3Zlcy51cmxsaWIucmVxdWVzdAo+IE1vZHVsZU5vdEZvdW5kRXJyb3I6
IE5vIG1vZHVsZSBuYW1lZCAnc2l4JwoKWW91IGhhdmUgbm8gInNpeCIgbW9kdWxlIGluc3RhbGxl
ZCBmb3IgcHl0aG9uLiBJIGhhdmUgdG8gaW5zdGFsbCBpdCAKZmlyc3QuIEZvciB1YnVudHU6IHN1
ZG8gYXB0IGluc3RhbGwgcHl0aG9uMy1zaXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
