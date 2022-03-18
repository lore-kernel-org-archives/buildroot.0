Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DC5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701B4418B8;
	Fri, 18 Mar 2022 22:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbThnm6vKmUF; Fri, 18 Mar 2022 22:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47952418BD;
	Fri, 18 Mar 2022 22:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC5101BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C542940275
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kn3BAcGSpT2D for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:32:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8464240131
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:32:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8413713F86F;
 Fri, 18 Mar 2022 23:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647642745;
 bh=s1m6E3dX8DN7Qkpplw2MUv6BL38X/WmQS39blBAD8Ks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vV+v1sj07GbXS2/SGS4O5bA4jr1gV3wd+4WI60r6i3Y0Iq+Raa0jWgoEJaP6x/rcP
 FPqX/JiO6qsXld5EGKxenjkeephB0Tic/aabAoE7CqUqUQ4lzgTIRqnemzh+RarExL
 Zo7Sg11MGps+bSOxlBQkwvf5RTpntPYxvwbCHdhC97Fy6ycALDgelEh51PSXQcw5sA
 yIYEzwE8gaZnz9QjYoXaJFZ+5UEbOc8cB21UJ2EXMFSg4omu9vRYkA3FXVIEitmg0m
 RIVREs5kzpydVSwy6lMmIQa4nld7jUTaoa5vXdy1HhzFWXVomreEMx7mE+WBAltOdo
 WSbzbbhkJw3OQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:32:21 +0100
Date: Fri, 18 Mar 2022 23:32:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220318223221.GS283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-4-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318132427.48737-4-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 3/8] boot/optee-os: add support to build
 with python-cryptography
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTggMTQ6MjQgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciBzcGFrZSB0aHVzbHk6Cj4gTmV3ZXIgdmVyc2lvbiBvZiBvcHRlZS1vcyAoPj0gMy4xNikgdXNl
cyBweXRob24tY3J5cHRvZ3JhcGh5IGluc3RlYWQgb2YKPiBweXRob24tcHljcnlwdG9kb21leCBp
biBweXRob24gc2NyaXB0cy4gQWRkIHN1cHBvcnQgdG8gYnVpbGQgdGhlc2UKPiBuZXdlciB2ZXJz
aW9ucyBieSBhZGRpbmcgYSBuZXcKPiBCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9D
UllQVE9HUkFQSFkgb3B0aW9uIHdoaWNoIHdpbGwKPiBzZWxlY3QgaG9zdC1weXRob24tY3J5cHRv
Z3JhcGh5IGRlcGVuZGVuY3kgd2hlbiBidWlsZGluZyBvcHRlZS1vcy4KPiAKPiBBY2tlZC1ieTog
RXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiAtLS0K
PiAgYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICB8IDkgKysrKysrKysrCj4gIGJvb3Qvb3B0ZWUt
b3Mvb3B0ZWUtb3MubWsgfCA4ICsrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL0Nv
bmZpZy5pbiBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4gaW5kZXggZWExNjU1MGI3Mi4uMDJi
NWQ3Yzg2ZiAxMDA2NDQKPiAtLS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+ICsrKyBiL2Jv
b3Qvb3B0ZWUtb3MvQ29uZmlnLmluCj4gQEAgLTEsNiArMSw3IEBACj4gIGNvbmZpZyBCUjJfVEFS
R0VUX09QVEVFX09TCj4gIAlib29sICJvcHRlZV9vcyIKPiAgCWRlcGVuZHMgb24gQlIyX0FSTV9D
UFVfQVJNVjhBIHx8IEJSMl9BUk1fQ1BVX0FSTVY3QQo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKClRoYXQncyB3cm9uZzogMy4xNS4wIHN0aWxsIGRv
ZXMgbm90IG5lZWQgaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5LgoKRnVydGhlcm1vcmUsIGV2ZW4g
YWZ0ZXIgd2UgYnVtcCB0byAzLjE2LjAsIHNpbmNlIHdlIGNhbiBjaG9vc2UgYW4KYXJiaXRyYXJ5
IGdpdCB0cmVlIGF0IGFuIGFyYml0cmFyeSBjb21taXQsIGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRv
CnBvaW50IHRvIGEgdmVyc2lvbiBvZiBvcHRlZS1vcyB0aGF0IGRvZXMgbm90IHJlcXVpcmUgaXQg
ZWl0aGVyLgoKU28sIHRoYXQgZGVwZW5kZW5jeSBvbmx5IHJlYWxseSBiZWxvbmdzLi4uCgo+ICAJ
aGVscAo+ICAJICBPUC1URUUgT1MgcHJvdmlkZXMgdGhlIHNlY3VyZSB3b3JsZCBib290IGltYWdl
IGFuZCB0aGUgdHJ1c3QKPiAgCSAgYXBwbGljYXRpb24gZGV2ZWxvcG1lbnQga2l0IG9mIHRoZSBP
UC1URUUgcHJvamVjdC4gT1AtVEVFIE9TCj4gQEAgLTYxLDYgKzYyLDE0IEBAIGNvbmZpZyBCUjJf
VEFSR0VUX09QVEVFX09TX05FRURTX0RUQwo+ICAJICBTZWxlY3QgdGhpcyBvcHRpb24gaWYgeW91
ciBPUC1URUUgT1MgcGxhdGZvcm0gY29uZmlndXJhdGlvbgo+ICAJICByZXF1aXJlcyB0aGUgRGV2
aWNlIFRyZWUgY29tcGlsZXIgdG8gYmUgYXZhaWxhYmxlLgo+ICAKPiArY29uZmlnIEJSMl9UQVJH
RVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQo+ICsJYm9vbCAiT1AtVEVFIE9T
IG5lZWRzIGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSIKCi4uLiBoZXJlLgoKQXBwbGllZCB0byBt
YXN0ZXIgd2l0aCB0aGlzIGZpeGVkLCBtcmFvdS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
ICsJaGVscAo+ICsJICBPUC1URUUgT1MgdmVyc2lvbiBiZWxvdyAzLjE2IHVzZWQgcHl0aG9uLXB5
Y3J5cHRvZG9tZXgKPiArCSAgcGFja2FnZSBpbiBweXRob24gc2NyaXB0cy4gTmV3ZXIgdmVyc2lv
biB1c2VzCj4gKwkgIHB5dGhvbi1jcnlwdG9ncmFwaHkuIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiBv
cHRlZS1vcyBuZWVkcwo+ICsJICBweXRob24tY3J5cHRvZ3JhcGh5IHRvIGJlIGJ1aWx0Lgo+ICsK
PiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfQ09SRQo+ICAJYm9vbCAiQnVpbGQgY29yZSIK
PiAgCWRlZmF1bHQgeQo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL29wdGVlLW9zLm1rIGIv
Ym9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+IGluZGV4IDlmNzZkODQ1MGUuLjUzMTNhMWJhZGMg
MTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+ICsrKyBiL2Jvb3Qvb3B0
ZWUtb3Mvb3B0ZWUtb3MubWsKPiBAQCAtMjEsNyArMjEsMTMgQEAgZWxzZQo+ICBPUFRFRV9PU19T
SVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfb3MsJChPUFRFRV9PU19WRVJTSU9OKSkK
PiAgZW5kaWYKPiAgCj4gLU9QVEVFX09TX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0
LXB5dGhvbjMgaG9zdC1weXRob24tcHljcnlwdG9kb21leCBob3N0LXB5dGhvbi1weWVsZnRvb2xz
Cj4gK09QVEVFX09TX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0LXB5dGhvbjMgaG9z
dC1weXRob24tcHllbGZ0b29scwo+ICsKPiAraWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX05F
RURTX1BZVEhPTl9DUllQVE9HUkFQSFkpLHkpCj4gK09QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBo
b3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkKPiArZWxzZQo+ICtPUFRFRV9PU19ERVBFTkRFTkNJRVMg
Kz0gaG9zdC1weXRob24tcHljcnlwdG9kb21leAo+ICtlbmRpZgo+ICAKPiAgaWZlcSAoJChCUjJf
VEFSR0VUX09QVEVFX09TX05FRURTX0RUQykseSkKPiAgT1BURUVfT1NfREVQRU5ERU5DSUVTICs9
IGhvc3QtZHRjCj4gLS0gCj4gMi4zNC4xCj4gCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
