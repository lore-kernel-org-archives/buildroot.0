Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34085C46467
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 18:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76A8E82393;
	Thu, 19 Jan 2023 18:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A8E82393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tyovl1y8DBLC; Thu, 19 Jan 2023 18:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99EC8238D;
	Thu, 19 Jan 2023 18:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A99EC8238D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EBA51BF33E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6F58238B
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6F58238B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbZKMYb2QXx9 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 18:42:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4848A82389
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4848A82389
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1674153708; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T3NMT8p/+VLXd5xxI+vYUhfkTrhkZEnEEZob3WdCVVxght4CvHZsaXcTFrjNNb4NlgfGu1yUvAS0mJLEQzKwNDLFlO/zddNOWEK+TfgTe83onF+cNBCfDUguvCQjYVdVDVeP8KYYkUmzWXEqG+SSrLXo4fJXBbxOooahremqx5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1674153708;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=VWB4JtvRyId5TJFu+ityFG0nnuKxodgwmB3GvEA0Xpo=; 
 b=m1NkC7MTSGtQiD05TaWeK/n0JUjMtbmvsMkSNlF41KoT513PNnYG75jX/Ig8qb4fT73lbGUWvnBZHxQ98QapJEo9uiDrgW0Azy3pteQO3tCDo0fLMKobmvl5fXEKq950Zv1Jk5bGamQTgOuFCNVoVBofHzjPPYHCOP9L3Wu4tqY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1674153704547674.3297220531965;
 Thu, 19 Jan 2023 10:41:44 -0800 (PST)
Message-ID: <cedbf0b8-878c-1833-4325-772ce522d16d@arinc9.com>
Date: Thu, 19 Jan 2023 21:41:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: buildroot@buildroot.org
References: <454a1894-af38-7818-7880-8e6a29466f63@arinc9.com>
Content-Language: en-US
In-Reply-To: <454a1894-af38-7818-7880-8e6a29466f63@arinc9.com>
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1674153708; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VWB4JtvRyId5TJFu+ityFG0nnuKxodgwmB3GvEA0Xpo=;
 b=QUTEBOlyF5MIJEUnBhNXXAv0wktoYtNfR/PbXY/4uei37jhBRzFJikuviNic863O
 CG4Vu01sS+weeVZM2nzteGkRpaURuMrLKimx/Mf+WWRKznV8e3ciJMMB/z5qLmduuuY
 MjK+9xKIpVWlz6mTyDXWTumWRQz88Wp3irRx/fDw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=arinc9.com header.i=arinc.unal@arinc9.com
 header.a=rsa-sha256 header.s=zmail header.b=QUTEBOly
Subject: Re: [Buildroot] ifupdown bridging interfaces support
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
Cc: Carlos Santos <unixmania@gmail.com>, erkin.bozoglu@xeront.com,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBkaWQgdGhpcyBbMF0gZm9yIHRoZSB0aW1lIGJlaW5nLiBXZSBjYW4gc3RpbGwgc3VwcG9ydCBh
bGwgb2YgdGhlIApvcHRpb25zIHdoaWNoIHJlcXVpcmUgaXByb3V0ZTIgYW5kIGJyY3RsLgoKNCBz
Y3JpcHRzIGluIHRvdGFsOgotIEJhc2UKLSBCYXNlICsgaXByb3V0ZTIKLSBCYXNlICsgYnJjdGwK
LSBCYXNlICsgYnJjdGwgKyBpcHJvdXRlMgoKSW50cm9kdWNlIDMga2NvbmZpZyBzdWJvcHRpb25z
IGZvciB0aGUgaWZ1cGRvd24tc2NyaXB0cyBwYWNrYWdlLgotIEJhc2UgKyBpcHJvdXRlMiB0byBz
ZWxlY3QgaXByb3V0ZTIuCi0gQmFzZSArIGJyY3RsIHRvIHNlbGVjdCBicmlkZ2UtdXRpbHMgKGJy
Y3RsKS4KLSBCYXNlICsgYnJjdGwgKyBpcHJvdXRlMiB0byBzZWxlY3QgYnJpZGdlLXV0aWxzIChi
cmN0bCkgYW5kIGlwcm91dGUyLgoKWzBdIApodHRwczovL2dpdGh1Yi5jb20vYXJpbmM5L2J1aWxk
cm9vdC9jb21taXQvYTRkNGQwOGExZTg5MGU5Njk0NzBhOGUzMTY1MzRjYWE0YTA3Y2VlMwoKTG9v
a2luZyBmb3J3YXJkIHRvIHlvdXIgdGhvdWdodHMuCgpBcsSxbsOnCgpPbiAxOC4wMS4yMDIzIDIw
OjIwLCBBcsSxbsOnIMOcTkFMIHdyb3RlOgo+IEhlbGxvIGZvbGtzLAo+IAo+IEkgd2FudCB0byB1
c2UgQnVpbGRyb290IGFzIHRoZSBmaWxlc3lzdGVtIG9uIHNvbWUgZW1iZWRkZWQgZGV2aWNlcyBJ
J3ZlIAo+IGdvdC4gSSB3YW50IHRvIHB1dCB0aGUgaW50ZXJmYWNlcyBpbiBhIGJyaWRnZS4KPiAK
PiBJIHNlZSBidWlsZHJvb3QgdXNlcyBpZnVwZG93biBieSBkZWZhdWx0IHRvIG1hbmFnZSBpbnRl
cmZhY2VzLiBIb3dldmVyLCAKPiB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBicmlkZ2luZyBpbnRl
cmZhY2VzLiBUaGUgYnJpZGdlLXV0aWxzIHBhY2thZ2Ugb24gCj4gRGViaWFuIGNvbnRhaW5zIGEg
c2NyaXB0IGZvciBpZnVwZG93biBbMV0gd2hpY2ggZG9lcyB0aGlzLiBIb3dldmVyIHRoZSAKPiBz
YW1lIHBhY2thZ2Ugb24gQnVpbGRyb290IGhhc24ndCBnb3QgaXQuCj4gCj4gSSBhbHJlYWR5IGNo
YW5nZWQgdGhlIHNjcmlwdCBhIGxpdHRsZSBhbmQgcHV0IGl0IG9uIG15IHJvb3RmcyBvdmVybGF5
IAo+IHdoaWNoIHdvcmtzIGZpbmUsIGJ1dCBJJ2QgbGlrZSB0byBpbmNsdWRlIHRoaXMgaW4gYSBi
dWlsZHJvb3QgcGFja2FnZSBzbyAKPiBpdCBoZWxwcyBldmVyeW9uZS4KPiAKPiBJIHNlZSB0aGUg
cGFja2FnZSBpcyBkZXByZWNhdGVkIHNvIGl0IG1ha2VzIHNlbnNlIG5vdCB0byB0b3VjaCBpdCBh
dCAKPiBhbGwuIE15IHBsYW4gaXMgdG8gYWRkIGEgc2NyaXB0IG9uIHRoZSBpZnVwZG93bi1zY3Jp
cHRzIHBhY2thZ2UgdG8gCj4gc2ltcGx5IHN1cHBvcnQgdGhlIGJyaWRnZV9wb3J0cyBvcHRpb24u
IEdldCB0aGUgRGViaWFuIHRhcmJhbGwgWzJdLCAKPiBleHRyYWN0IHRoZSBzY3JpcHQsIGFuZCBw
YXRjaCBpdCB0byBqdXN0IHN1cHBvcnQgdGhlIGJyaWRnZV9wb3J0cyBvcHRpb24gCj4gd2l0aG91
dCBuZWVkaW5nIGlwcm91dGUyIG9yIGJyY3RsLgo+IAo+IEkgY2FuIGFsc28ganVzdCBpbmNsdWRl
IHRoZSBtb2RpZmllZCBzY3JpcHQgb24gdGhlIHBhY2thZ2Ugd2l0aG91dCAKPiByZXRyaWV2aW5n
IGFuZCBwYXRjaGluZyBidXQgSSBkb24ndCB0aGluayB0aGF0IHdvdWxkIGJlIGZpbmUgd2l0aCAK
PiBsaWNlbnNpbmcuCj4gCj4gSSB3b25kZXIgaWYgdGhpcyB3YXMgZGlzY3Vzc2VkIGJlZm9yZSwg
dGhlIG9ubHkgY29udmVyc2F0aW9uIHRoYXQgY2FtZSAKPiB1cCBvbiBteSBzZWFyY2ggd2FzIEZy
YW5rJ3MgYnVnIHJlcG9ydCBbM10uCj4gCj4gSSdkIGFwcHJlY2lhdGUgeW91ciB0aG91Z2h0cywg
aG93IEkgc2hvdWxkIHByb2NlZWQgdG8gc3VwcG9ydCBpdCBvbiAKPiBCdWlsZHJvb3QuIEFsc28s
IGlmIHRoZXJlJ3MgYW55IG90aGVyIG5ldHdvcmsgY29uZmlndXJhdGlvbiB0b29sIG9uIAo+IEJ1
aWxkcm9vdCB3aGljaCBzdXBwb3J0cyBicmlkZ2luZyBpbnRlcmZhY2VzLCBwbGVhc2UgbGV0IG1l
IGtub3cuCj4gCj4gWzFdIGh0dHBzOi8vc291cmNlcy5kZWJpYW4ub3JnL3NyYy9icmlkZ2UtdXRp
bHMvMS43LTEvZGViaWFuL3J1bGVzLyNMNTkKPiBbMl0gCj4gaHR0cDovL2RlYi5kZWJpYW4ub3Jn
L2RlYmlhbi9wb29sL21haW4vYi9icmlkZ2UtdXRpbHMvYnJpZGdlLXV0aWxzXzEuNy0xLmRlYmlh
bi50YXIueHoKPiBbM10gaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0x
MzQ2Ngo+IAo+IENoZWVycy4KPiBBcsSxbsOnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
