Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C87C6FA8E
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 12:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48AF83123;
	Tue, 27 Sep 2022 12:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B48AF83123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5SVrOPv8dfF; Tue, 27 Sep 2022 12:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D709683051;
	Tue, 27 Sep 2022 12:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D709683051
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47A5E1BF352
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 12:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218CC4026F
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 12:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218CC4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaCDkDwL5fR9 for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 12:46:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C6294011D
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6294011D
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 12:46:21 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.20.153])
 by Aruba Outgoing Smtp  with ESMTPSA
 id d9yboPfNajvAqd9ycogfrx; Tue, 27 Sep 2022 14:46:20 +0200
Message-ID: <6e1c3811-8ebb-567c-f738-6072a91807ee@benettiengineering.com>
Date: Tue, 27 Sep 2022 14:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: kk <kk@aibs.ru>
References: <ff6b01776879d74878e8e1733e2a8e07@aibs.ru>
 <94563288-00A1-4ED7-B5FF-64E90E2B8D4D@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <94563288-00A1-4ED7-B5FF-64E90E2B8D4D@benettiengineering.com>
X-CMAE-Envelope: MS4xfEVfCsZCdQ24Q20D82mFhrqumTZzEC2uUf0DWKfBwGZPkWNPnbWrqtuHdqMMF0TA/sCBARbEqjC1lyGorosmz6XzXVhRRiUlycU31HMpFuhz8Hx2TSzT
 y6f3T3NUj1QiWuyaQrWTgkxL9ncnn3ea0zSapPi4J3RlQzEdD+Qvd0YfYaZj1nhQjwlNnANOCm/KUKiEjmH9K+kTvkkD2wjlWxUeslGSVc3vTf3xenfCMyNE
 znXGDYOBPa8hAgms0LzRKg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664282780; bh=7D3LK9ZhOm9tkLBc+bu2ekpC6qAUhrFPZrGts9eMblY=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=czVm4H8ZsMvm09B6AylWOvB6bgxZ5uIxo+PNvubtg8wcVt1/+HI9DM8wAJakRc23x
 6/45omFvOEUemNwz2dNSLkQYqjt/oQU7Bjc8b3ANrvyYvyHmbDOW0m6/Va19Mc/SHR
 dp3K0/fIK3l3OKE7yS7WuhPIWi12XlYASK9EGiPssBmggtN1+T10MO5OlgarDnYAwB
 7+x7wZeV/NS4YbpR3uaagZUlA2RhDQrhhgXoCbKBmoFOu2GrfCW+mkl5MUHq3DdkAH
 IK+bDLv+1GVPE5VA2Dmb6XtlQ2joP8fYkeNg5+pLaK7DhH+PFT4FxIgOnMXGh4RJ2O
 Lsd3KPg6Ef7kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=czVm4H8Z
Subject: Re: [Buildroot] [1/1] package/sleef: add new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSd2ZSBmb3Jnb3R0ZW4gYWxzbyB0byBwb2ludCB5b3UgQnVpbGRyb290IG1hbnVhbCBhYm91dCB0
aGlzIHRvcGljOgpodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwu
aHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMKCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkK
QmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCk9uIDI3LzA5LzIyIDE0OjEyLCBHaXVsaW8gQmVuZXR0
aSB3cm90ZToKPiBIZWxsbyBLaXJpbGwsCj4gCj4gcGxlYXNlIHVzZSBmb2xsb3dpbmcgY29tbWFu
ZCB0byBzZW5kIHRoZSBwYXRjaDoKPiAkIGdpdCBzZW5kLWVtYWlsIOKApgo+IAo+IFlvdSBjYW4g
b2J0YWluIHRoZSBlbnRpcmUgY29tbWFuZCBieSB1c2luZyBhIGhlbHBlciBzY3JpcHQgaW4gQnVp
bGRyb290Ogo+ICQgY2QgYnVpbGRyb290Cj4gJCBnaXQgZm9ybWF0LXBhdGNoIC1zIC1NIC1vIC4g
LTEKPiAkIC4vdXRpbHMvZ2V0LWRldmVsb3BlcnMgMDAwMS15b3VyLXBhdGNoLnBhdGNoCj4gCj4g
VGhlbiBjb3B5IGFuZCBwYXN0ZSB0aGUgb3V0cHV0IG9mIHRoaXMgXl5eIHNjcmlwdCBhbmQgYXBw
ZW5kIHRoZSBwYXRjaCBuYW1lLgo+IAo+IEJlc3QgcmVnYXJkcwo+IEdpdWxpbyBCZW5ldHRpCj4g
Cj4+IElsIGdpb3JubyAyNyBzZXQgMjAyMiwgYWxsZSBvcmUgMTM6MTcsIGtrIDxra0BhaWJzLnJ1
PiBoYSBzY3JpdHRvOgo+Pgo+PiDvu78KPj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
