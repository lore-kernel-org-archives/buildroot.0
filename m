Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353B2C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:18:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4ECA60C41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4ECA60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796FC40423;
	Tue,  3 Aug 2021 08:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SODcrRc-EJgx; Tue,  3 Aug 2021 08:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C9740412;
	Tue,  3 Aug 2021 08:18:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1A81BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A9A282F84
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DVBIoEMYZQo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:18:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp48.i.mail.ru (smtp48.i.mail.ru [94.100.177.108])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B57C82F57
 for <buildroot@busybox.net>; Tue,  3 Aug 2021 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DsoK4rmhN9sVP8fmBtTQgqha3gpKa8AumKxq+7Tsw6U=; 
 t=1627978694;x=1628584094; 
 b=LKvOZ8QQjz2Lzj2xASlZCASkCduAZiQMkKMvT/J3xbHk7ExGFWFel2uqi/oR0xn2HLj/KPJcZIz864MebonyvR1yY5a/sMSM9x0Zr85aB6Jo538Ne+QcvVqYDkpCRAzR3MGMIosNN3vir/FXgUS2sBKV64WL18npJJf5mRAh93Y=;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mApcp-0000Nv-RG
 for buildroot@busybox.net; Tue, 03 Aug 2021 11:18:12 +0300
To: buildroot@busybox.net
References: <20210802172116.10073-1-petr.vorel@gmail.com>
Message-ID: <b5fbbdc1-7cd5-fb13-5442-143625d22d70@inbox.ru>
Date: Tue, 3 Aug 2021 11:20:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802172116.10073-1-petr.vorel@gmail.com>
Content-Language: en-US
Authentication-Results: smtp48.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C30A5AB0699C09BB51E5FD76225F0C99C3182A05F53808504068194577828DED1F05F4534A46828E72D533A3F1BB9E0F71F15706A12DF70B19
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E5D7EAC6EBA58433EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E149C29A36E092738638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C8C39AF27D230636E7C3A5F4814F36926F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCAA867293B0326636D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8C7ADC89C2F0B2A5A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCBFE0324B79888C573AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006372EAD9671FF2E8332D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16BCE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A50A2EC1557FFC02579B201080F3CAD191C279BFCB246D2148D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AC632F0BE69382F34B6893BC32A23C8F596DC9E991AE08653F874CDA847F8F28B13E3E0FE38D3A721D7E09C32AA3244CD51879C03CE9E83D192FC46846B73DE930363D8B7DA7DD443EB3F6AD6EA9203E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9N286KAyvN5u0XfZI6AcBg==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24CAFF99B4E550595E2E7AFE54EADB3BDFD1E3F8224A72C47DEE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

MDIuMDguMjAyMSAyMDoyMSwgUGV0ciBWb3JlbCB3cm90ZToKPiBQcmV2aW91cyBmaXhlcyBmcm9t
IGRhYTU0NTliNmEgY2F1c2VkIHJlZ3Jlc3Npb24gdGhhdCBldmVuIG1vcmUgYnVpbGRzCj4gd2Vy
ZSBicm9rZW4uIEJhY2twb3J0aW5nIHVwc3RyZWFtIGZpeCAzODNkNzg3ZCAoIm5mc2RjbHRyYWNr
OiBVc2UKPiB1aW50NjRfdCBpbnN0ZWFkIG9mIHRpbWVfdCIpIHdoaWNoIGZpeGVzIGl0Lgo+IEl0
IGZpeGVzIGJ1ZzoKPiBuZnNkY2x0cmFjay5jOiBJbiBmdW5jdGlvbiDigJhjbHRyYWNrX2dyYWNl
ZG9uZeKAmToKPiBuZnNkY2x0cmFjay5jOjUyOToxODogZXJyb3I6IGZvcm1hdCDigJglbGx14oCZ
IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGxvbmcgdW5zaWduZWQgaW504oCZLCBi
dXQgYXJndW1lbnQgNCBoYXMgdHlwZSDigJh0aW1lX3TigJkge2FrYSDigJhsb25nIGludOKAmX0g
Wy1XZXJyb3I9Zm9ybWF0PV0KPiAgICA1MjkgfCAgeGxvZyhEX0dFTkVSQUwsICIlczogZ3JhY2Ug
ZG9uZS4gZ3JhY2V0aW1lPSUiUFJJdTY0LCBfX2Z1bmNfXywgZ3JhY2V0aW1lKTsKPiAgICAgICAg
fCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+ICAgICAgICAg
ICAgICAgICAgfn5+fn5+fn5+Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dGltZV90IHtha2EgbG9uZyBpbnR9Cj4gCj4gRml4ZXM6Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy81NTBhZDljNzQ2NjY3NzU4NTg4ODcwNTBlYTgzYTg2MTg3OTdk
ZTc5Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jYWYwYTY5MTIx
ZDQ5NTA0ZGI2MzkxMGNlMWRmMzQ3ODAyMDY1Y2Q5Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5uZXQvcmVzdWx0cy8yOTRkMTFmOGM0MzMwYmNmZDk0MTJmNDdmMjFkZjIyZDRmMmI2ZTgy
Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xY2I2YjE5Y2JiYzJi
ODI5YTAzOGE5YTcwYjY3MzRjMDg0ZTgxYzkzCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5uZXQvcmVzdWx0cy9jMGViMTIwZjVkMTQ3OThiNGY4OGI5MGVhY2NkM2JjMWY2NTdjMDBkCj4g
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9hMDI4Mjk5YjYxMmEwY2E2
ZDFhNjk3NTc3NDlhOGI5ZTM3MDk0OTU0Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5u
ZXQvcmVzdWx0cy85OTZiYjc0NDQ1Y2ZiZGUwZTIzMGIyMTg1MjA3ZDkxZDRlYzQ2ZGZiCj4gLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82MjRiNmRjMDc5M2QwMjYzZjQ2
ODMxZWQwZjI5ZmEyNjVmZjBlNDFmCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy81ZWIyZGQ1ZDZiYzA1NDA0NDNhNTJmMGI5Yjk1NjhhZjAxODkyYTIzCj4gLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82NWJhZDgzNDczOGQ1YzViMTE3NmU4
ODQ3Nzc3YjNjZmQ5NWM0MzUxCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy8zMTQ2MjM3YzM1NmU1NjQ5MTYzNzg0ZmI2NjI4ZmJiYmM3YzYxMTUzCj4gLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yYzVlNzc2MDBjYmY1MDA5ZTY5ZjA1N2U3
YTJkYzE2NGZjOGIwNDY2Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy9lYzhlYzAyOWRjMGQ3ZDdkMjk0ZjhhZGU4MWVlNTNjYTJmYzNjNTRjCj4gLSBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82MGVhM2JkZWRkZjcxMjcwNDY4ZDYxNzdjY2Y5
NWExZGM2YjY4ZGFjCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9m
ZjkzYTYzY2QwODQwNDNkYjVmNjFhYzVlYTJiYmJjYTRmMGU2ODU5Cj4gLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jYWMzMzkyMzczZDA1ZDc4YzI5OWQwN2Q4MDgwYWU0
OTM4NzczNDAxCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80Mzgx
NTVmODMxZDhhNDRlYzZlMGY3MDIwZTg3ODNiNDhkMmM4ZGYyCj4gLSBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82NmJjMWNhMWEwNWUxNjc2YzRlNjVlZjczNjRiYTE0MTVi
ZGJjNzIzCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy81YmFjYjNj
MzhkYzEwMTJmOTQ0NWEwYzIzZTU5MzM2ZGNhYzVhYmNlCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0
ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CgpUZXN0ZWQtYnk6IE1heGltIEtvY2hldGtv
diA8Zmlkb19tYXhAaW5ib3gucnU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
