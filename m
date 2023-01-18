Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (unknown [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD0FC32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD9DB820C9;
	Wed, 18 Jan 2023 17:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9DB820C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zk_g2TzYx5Sm; Wed, 18 Jan 2023 17:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4324820C2;
	Wed, 18 Jan 2023 17:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4324820C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BC441BF2B5
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 17:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E32EE4188F
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 17:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32EE4188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4ivHQBZqVBQ for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 17:36:05 +0000 (UTC)
X-Greylist: delayed 00:15:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6DED4188B
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6DED4188B
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 17:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1674062446; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mmK66/+XLZ3Bqi5vaKej1RhvBMmDxeVACEhkgy7XqDZ0Uj05AvSaMbcaNEDdd7nIBK2qZacIAjQCmXMkJPDky9KSKVusludRQXAKSDrgIJ9Ik8Iizy0RA5COBDUQ8RkAPqEcOeFsucjvCamYePu6uzES240DUKBsl1lwGxB4d+c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1674062446;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=+L0ZRB/mwqTH9QridhDrJobWNfkqTnLLN6p8RynSlPA=; 
 b=MUcHPjeKroPoW9lBdDG8k0StaeSiOQRDgdAohg9Fml2LIVMX9ckIt+RkB1U9CIzfsOoFYEKgQ3TXRC8GzMbzo6Jxii+X5do4Oib//fmjfBnbAeSYn3+eGGXHOaFaqbe+lhShXb4T8U4+wXU5I7F3T+apcxhgCcWUPqpyPQk/18I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1674062444024300.12376436861257;
 Wed, 18 Jan 2023 09:20:44 -0800 (PST)
Message-ID: <454a1894-af38-7818-7880-8e6a29466f63@arinc9.com>
Date: Wed, 18 Jan 2023 20:20:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: buildroot@buildroot.org
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1674062446; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=+L0ZRB/mwqTH9QridhDrJobWNfkqTnLLN6p8RynSlPA=;
 b=Pi9MrotckqBKGYdCK6Fzc3rOw2maKXVrIzCsEiSlxhGhXZzVZ/8xKlDw6bEHrtpE
 q+YGUPAOb772ljMVaabpKqFqolepbbLkpZ73KkYMoW1VwXyMNSSbgMhZ7jalWTCACgX
 CXX/OxE3GHXtzFRq16GzkxbWtAb1/v5B/6siZE7o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=arinc9.com header.i=arinc.unal@arinc9.com
 header.a=rsa-sha256 header.s=zmail header.b=Pi9Mrotc
Subject: [Buildroot] ifupdown bridging interfaces support
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
Cc: erkin.bozoglu@xeront.com, Frank Wunderlich <frank-w@public-files.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gZm9sa3MsCgpJIHdhbnQgdG8gdXNlIEJ1aWxkcm9vdCBhcyB0aGUgZmlsZXN5c3RlbSBv
biBzb21lIGVtYmVkZGVkIGRldmljZXMgSSd2ZSAKZ290LiBJIHdhbnQgdG8gcHV0IHRoZSBpbnRl
cmZhY2VzIGluIGEgYnJpZGdlLgoKSSBzZWUgYnVpbGRyb290IHVzZXMgaWZ1cGRvd24gYnkgZGVm
YXVsdCB0byBtYW5hZ2UgaW50ZXJmYWNlcy4gSG93ZXZlciwgCnRoZXJlIGlzIG5vIHN1cHBvcnQg
Zm9yIGJyaWRnaW5nIGludGVyZmFjZXMuIFRoZSBicmlkZ2UtdXRpbHMgcGFja2FnZSBvbiAKRGVi
aWFuIGNvbnRhaW5zIGEgc2NyaXB0IGZvciBpZnVwZG93biBbMV0gd2hpY2ggZG9lcyB0aGlzLiBI
b3dldmVyIHRoZSAKc2FtZSBwYWNrYWdlIG9uIEJ1aWxkcm9vdCBoYXNuJ3QgZ290IGl0LgoKSSBh
bHJlYWR5IGNoYW5nZWQgdGhlIHNjcmlwdCBhIGxpdHRsZSBhbmQgcHV0IGl0IG9uIG15IHJvb3Rm
cyBvdmVybGF5IAp3aGljaCB3b3JrcyBmaW5lLCBidXQgSSdkIGxpa2UgdG8gaW5jbHVkZSB0aGlz
IGluIGEgYnVpbGRyb290IHBhY2thZ2Ugc28gCml0IGhlbHBzIGV2ZXJ5b25lLgoKSSBzZWUgdGhl
IHBhY2thZ2UgaXMgZGVwcmVjYXRlZCBzbyBpdCBtYWtlcyBzZW5zZSBub3QgdG8gdG91Y2ggaXQg
YXQgCmFsbC4gTXkgcGxhbiBpcyB0byBhZGQgYSBzY3JpcHQgb24gdGhlIGlmdXBkb3duLXNjcmlw
dHMgcGFja2FnZSB0byAKc2ltcGx5IHN1cHBvcnQgdGhlIGJyaWRnZV9wb3J0cyBvcHRpb24uIEdl
dCB0aGUgRGViaWFuIHRhcmJhbGwgWzJdLCAKZXh0cmFjdCB0aGUgc2NyaXB0LCBhbmQgcGF0Y2gg
aXQgdG8ganVzdCBzdXBwb3J0IHRoZSBicmlkZ2VfcG9ydHMgb3B0aW9uIAp3aXRob3V0IG5lZWRp
bmcgaXByb3V0ZTIgb3IgYnJjdGwuCgpJIGNhbiBhbHNvIGp1c3QgaW5jbHVkZSB0aGUgbW9kaWZp
ZWQgc2NyaXB0IG9uIHRoZSBwYWNrYWdlIHdpdGhvdXQgCnJldHJpZXZpbmcgYW5kIHBhdGNoaW5n
IGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgd291bGQgYmUgZmluZSB3aXRoIGxpY2Vuc2luZy4KCkkg
d29uZGVyIGlmIHRoaXMgd2FzIGRpc2N1c3NlZCBiZWZvcmUsIHRoZSBvbmx5IGNvbnZlcnNhdGlv
biB0aGF0IGNhbWUgCnVwIG9uIG15IHNlYXJjaCB3YXMgRnJhbmsncyBidWcgcmVwb3J0IFszXS4K
CkknZCBhcHByZWNpYXRlIHlvdXIgdGhvdWdodHMsIGhvdyBJIHNob3VsZCBwcm9jZWVkIHRvIHN1
cHBvcnQgaXQgb24gCkJ1aWxkcm9vdC4gQWxzbywgaWYgdGhlcmUncyBhbnkgb3RoZXIgbmV0d29y
ayBjb25maWd1cmF0aW9uIHRvb2wgb24gCkJ1aWxkcm9vdCB3aGljaCBzdXBwb3J0cyBicmlkZ2lu
ZyBpbnRlcmZhY2VzLCBwbGVhc2UgbGV0IG1lIGtub3cuCgpbMV0gaHR0cHM6Ly9zb3VyY2VzLmRl
Ymlhbi5vcmcvc3JjL2JyaWRnZS11dGlscy8xLjctMS9kZWJpYW4vcnVsZXMvI0w1OQpbMl0gCmh0
dHA6Ly9kZWIuZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2IvYnJpZGdlLXV0aWxzL2JyaWRn
ZS11dGlsc18xLjctMS5kZWJpYW4udGFyLnh6ClszXSBodHRwczovL2J1Z3MuYnVzeWJveC5uZXQv
c2hvd19idWcuY2dpP2lkPTEzNDY2CgpDaGVlcnMuCkFyxLFuw6cKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
