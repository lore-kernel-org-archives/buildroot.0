Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11558C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:02:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8195F61056
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8195F61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F6B60655;
	Fri, 12 Nov 2021 13:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcT9dTPvA_uf; Fri, 12 Nov 2021 13:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624DA6063F;
	Fri, 12 Nov 2021 13:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0673D1BF29D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E96374024E
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D79GKsiH6EN0 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:02:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFE3C4022E
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:02:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5D84419F59D;
 Fri, 12 Nov 2021 14:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636722152;
 bh=ncMwuZ92NrIXMOZHemYbD0j/IUyPNdNslcTEk/s5C8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bi9BJgWtwO+KOyudVVAcSFWNMXGTpiFyE0wPhf+u0WvstS0SakgjzYDx9qgbZ9Eds
 rLPEZAjQKPueFg/o06omQc+xTbqx3+P68gZ6ShExIz3iYcvfTzCGws3gyW2+R00ZiV
 5CczSsy5hucu5CbwMDf4QDbTjHrWD24n/321dPO8un5cYEg3qqvvejfd9e+BWtvNS+
 EfrPNo68BFddxSIiL2atW4P6zFNkDAsG2ZmRVTkXcSpnqkpDyU7IBWnNbJiKY296So
 a6F9mZh5Sl9e5dP2JH8fCBSrGxpsmiO5j4YjTpqRkRlshbnAnjEXC+UKG6lSIP+8oA
 /UQab1KikVGNg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 14:02:26 +0100
Date: Fri, 12 Nov 2021 14:02:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211112130226.GK2609@scaer>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112110007.787836-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/6] package/luvi: don't use LUAJIT_VERSION
 for the luajit installation path
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIxLTExLTEyIDEyOjAwICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IEx1YWppdCBwYWNrYWdlIGhhcyBiZWVuIHJlY2VudGx5IHVwZGF0ZWQgdG8g
dGhlIGxhdGVzdCBjb21taXQgaW4gdGhlCj4gbWFzdGVyIGJyYW5jaCBbMV0uIFNpbmNlIHRoZW4g
TFVBSklUX1ZFUlNJT04gZG9lc24ndCBjb250YWluIHRoZSBsdWFqaXQKPiB2ZXJzaW9uIGFueW1v
cmUgYnV0IGEgY29tbWl0IGhhc2g6Cj4gCj4gTFVBSklUX1ZFUlNJT04gPSAwNWYxOTg0ZTFhODYy
ZTRiM2QzYzNiMzcwYzc3MzQ5MmUyZWRmODRhCj4gCj4gVXNlIHBrZy1jb25maWcgLS12YXJpYWJs
ZT12ZXJzaW9uIGx1YWppdCBpbiBsdXZpIHBhY2thZ2UgdG8gc2V0Cj4gTFVBX1BBVEggY29ycmVj
dGx5Lgo+IAo+IEZpeGVzOgo+IGx1YWppdDogdW5rbm93biBsdWFKSVQgY29tbWFuZCBvciBqaXQu
KiBtb2R1bGVzIG5vdCBpbnN0YWxsZWQKPiAKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI2MDUKPiAKPiBbMV0gOTQ1MGI1M2M4ZTA2ZjFi
NWE3NTg0MGI4MmMwZjQ2NjNhNWQ3NWM0NQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiBDYzogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1
c2VAZW1iZWRkZWQucm9ja3M+Cj4gVGVzdGVkLWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVz
ZUBlbWJlZGRlZC5yb2Nrcz4KPiBBY2tlZC1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5w
ZXJyYWRAZ2Fkei5vcmc+Cj4gLS0tCj4gVGhlIFRlc3RMdXZpIGRvZXNuJ3Qgd29yayB5ZXQgZHVl
IHRvIG1pc3Npbmcgcm5nIHN1cHBvcnQgb24gUWVtdSBhcm12NyB0YXJnZXQKPiB1c2VkIHRvIHJ1
biB0aGUgdGVzdC4gbHV2aSAtdiBpcyBzdHVjayBkdWUgdG8gZ2V0cmFuZG9tKCkuCj4gLS0tCj4g
IHBhY2thZ2UvbHV2aS9sdXZpLm1rIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1
dmkvbHV2aS5tayBiL3BhY2thZ2UvbHV2aS9sdXZpLm1rCj4gaW5kZXggMzg2ZGFhZmMzMS4uZWY1
Nzc3Y2FjOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1dmkvbHV2aS5tawo+ICsrKyBiL3BhY2th
Z2UvbHV2aS9sdXZpLm1rCj4gQEAgLTksNyArOSw3IEBAIExVVklfU09VUkNFID0gbHV2aS1zcmMt
diQoTFVWSV9WRVJTSU9OKS50YXIuZ3oKPiAgTFVWSV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L2x1dml0L2x1dmkvcmVsZWFzZXMvZG93bmxvYWQvdiQoTFVWSV9WRVJTSU9OKQo+ICBMVVZJX0xJ
Q0VOU0UgPSBBcGFjaGUtMi4wCj4gIExVVklfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4g
LUxVVklfREVQRU5ERU5DSUVTID0gbGlidXYgbHVhaml0IGx1diBob3N0LWx1YWppdAo+ICtMVVZJ
X0RFUEVOREVOQ0lFUyA9IGxpYnV2IGx1YWppdCBsdXYgaG9zdC1sdWFqaXQgaG9zdC1wa2djb25m
Cj4gIAo+ICAjIERpc3BhdGNoIGFsbCBhcmNoaXRlY3R1cmVzIG9mIEx1YUpJVAo+ICBpZmVxICgk
KEJSMl9pMzg2KSx5KQo+IEBAIC0zMCwxMiArMzAsMTYgQEAgZWxzZQo+ICBMVVZJX1RBUkdFVF9B
UkNIID0gJChCUjJfQVJDSCkKPiAgZW5kaWYKPiAgCj4gKyMgTFVBSklUX1ZFUlNJT04gYW5kIHRo
ZSBsdWFqaXQgaW5zdGFsbGF0aW9uIHBhdGggbWF5IG5vdCB1c2UgdGhlCj4gKyMgc2FtZSB2YWx1
ZS4gVXNlIHRoZSB2YWx1ZSBmcm9tIGx1YWppdC5wYyBmaWxlLgo+ICtMVVZJX0xVQUpJVF9WRVJT
SU9OID0gJChzaGVsbCAkKFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIC0tdmFyaWFibGU9dmVyc2lv
biBsdWFqaXQpCgpJJ20gdHJ5aW5nIGhhcmQgdG8gZ2V0IHJpZCBvZiBjYWxscyB0byAkKHNoZWxs
ICkgaW4gdmFyaWFibGVzLCBiZWNhdXNlCnRoYXQgZW1pdHMgc3B1cmlvdXMgZXJyb3JzIHdoZW4g
Y2FsbGluZyBwcmludHZhcnMgKHNlZSBlLmcuIFswXSk6CgogICAgJCBtYWtlIHByaW50dmFycyBW
QVJTPUxVVklfTFVBSklUX1ZFUlNJT04KICAgIG1ha2VbMV06IFsuLi5dL2hvc3QvYmluL3BrZy1j
b25maWc6IENvbW1hbmQgbm90IGZvdW5kCiAgICBMVVZJX0xVQUpJVF9WRVJTSU9OPQoKSW5zdGVh
ZCwgY291bGQgeW91IHRyeSB0byB1c2UgYnVpbGQtdGltZSBzaGVsbCBleHBhbnNpb246CgogICAg
TFVWSV9MVUFKSVRfVkVSU0lPTiA9IGAkKFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIC0tdmFyaWFi
bGU9dmVyc2lvbiBsdWFqaXRgCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjExMTA5MTY1OTA4LjE5NDI3OTAtMS15YW5uLm1vcmluLjE5OThAZnJlZS5mci8KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAjIEJ1bmRsZWQgbHVhIGJpbmRpbmdzIGhhdmUgdG8gYmUg
bGlua2VkIHN0YXRpY2FsbHkgaW50byB0aGUgbHV2aSBleGVjdXRhYmxlCj4gIExVVklfQ09ORl9P
UFRTID0gXAo+ICAJLURCVUlMRF9TSEFSRURfTElCUz1PRkYgXAo+ICAJLURXaXRoU2hhcmVkTGli
bHV2PU9OIFwKPiAgCS1EVEFSR0VUX0FSQ0g9JChMVVZJX1RBUkdFVF9BUkNIKSBcCj4gLQktRExV
QV9QQVRIPSQoSE9TVF9ESVIpL3NoYXJlL2x1YWppdC0kKExVQUpJVF9WRVJTSU9OKS8/Lmx1YQo+
ICsJLURMVUFfUEFUSD0kKEhPU1RfRElSKS9zaGFyZS9sdWFqaXQtJChMVVZJX0xVQUpJVF9WRVJT
SU9OKS8/Lmx1YQo+ICAKPiAgIyBBZGQgInJleCIgbW9kdWxlIChQQ1JFIHZpYSBidW5kbGVkIGxy
ZXhsaWIpCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfUENSRSkseSkKPiAtLSAKPiAyLjMxLjEKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
