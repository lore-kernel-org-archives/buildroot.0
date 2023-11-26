Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DCAC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B1E60A89;
	Sun, 26 Nov 2023 16:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B1E60A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjDYwyFw2jO7; Sun, 26 Nov 2023 16:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF3560888;
	Sun, 26 Nov 2023 16:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF3560888
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69DE01BF3FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F3E8124B
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F3E8124B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQRyqT_W7P8b for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 16:21:59 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FD658124A
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 16:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FD658124A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E9A33780371;
 Sun, 26 Nov 2023 17:21:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 17:21:51 +0100
Date: Sun, 26 Nov 2023 17:21:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20231126162151.GW3177259@scaer>
References: <20231112221115.2289525-3-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231112221115.2289525-3-salvador.joseluis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701015717;
 bh=n2JJeRg+ZFDaXLqQVnFFfMkO+JZEuE1YxO0ZDnkw7ic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7DZ/WpSmK91ao5RLyKsGuf/VHel7hErFmBHpL1uYWs3Gb1xoO1YpMogBXX2AVqX6
 AqkgnA/yY8EfL0PmAosKrP/qEzwerwGAhBjRyOVqhJVHma0KQx8eI/9Lt+3xRy0A/F
 mcZEt9qGVa3BfdWpSSZIDED0H/nbLImd/vRpLBYHdWvC1Q8lYis2utW959iJgF4ET8
 oWch6i9pkP9jm20l3LN2CprA0vyfmhNqY1TuRUcTPJnUqe7aCJM/dPeFyAQKtHvmca
 L1xOiavWKNDdfxArN2cFChplXv6ZlCDV2xI28Jn/qN2bkQFOxZlp30LBWx61kLAq2T
 2nN6VwgUbCxaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X7DZ/WpS
Subject: Re: [Buildroot] [PATCH] package/zfs: fix zfs autotools
 cross-compilation
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>, Philippe.Serbruyns@ugent.be,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjMtMTEtMTIgMjM6MTEgKzAxMDAsIEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyBzcGFrZSB0aHVzbHk6Cj4gVGhpcyBjb21taXQgYWRkcmVzc2VzIGEgbG9uZy1zdGFu
ZGluZyBidWcgZW5jb3VudGVyZWQgZHVyaW5nIFpGUwo+IGNvbXBpbGF0aW9uIGluIGNyb3NzLXBs
YXRmb3JtIGVudmlyb25tZW50cy4gVGhlIGlzc3VlIGFyaXNlcyBiZWNhdXNlIFpGUwo+IGF1dG9j
b25mIHRyaWdnZXJzIGEgYG1ha2UgbW9kdWxlc2AgdG8gZGV0ZWN0IGlmIHRoZSBrZXJuZWwgY2Fu
IGNvbXBpbGUKPiBtb2R1bGVzIFsxXS4gVGhlIHByb2JsZW0gb2NjdXJzIHdoZW4gYXV0b2NvbmYg
dXNlcyB0aGUgaG9zdCBlbnZpcm9ubWVudAo+IGluc3RlYWQgb2YgdGhlIGNyb3NzLXBsYXRmb3Jt
IGVudmlyb25tZW50Lgo+IAo+IFRvIGZpeCB0aGlzLCB3ZSBleHBvcnQgbmVjZXNzYXJ5IGVudmly
b25tZW50IHZhcmlhYmxlcyB0byBlbnN1cmUgdGhhdCBaRlMKPiBhdXRvY29uZiB1dGlsaXplcyB0
aGUgY3Jvc3MtcGxhdGZvcm0gZW52aXJvbm1lbnQgY29ycmVjdGx5Lgo+IAo+IFRoaXMgcGF0Y2gg
cmVzb2x2ZXMgWkZTIGNyb3NzLXBsYXRmb3JtIGNvbXBpbGF0aW9uczoKPiAtIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2ViZWFiMjU2MTAxYmNiYTM4YzM1ZmQ1NTA3NWM0
MTRlNjJmOTJjYWEvCj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8w
M2I5ZjEyYTEwNmJmMTAwZWVjNjk1YTkyYjgzYmYwOWIyMmM2OGIwLwo+IC0gaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYzJkYTkwMzM3NDYzNjA3YzJmYWRmZWFjN2FkNzJl
NWMzODk5YTYxZi8KPiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzQ2
NWEyNDlmOTJkMmY1ZGI3YWM0YjYxYjQxMTFlNmNiYWFhMTU2ODgvCj4gLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy83ZTJkMzI3N2UyNmZhNWIwYzgwNzNhMGU4YjllODJm
NDdhZGU5Njk3Lwo+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYThm
Yjg3MzM2YjA5ZmVmODc4N2E3ODg5ZGZjY2NmMTRmZTEyMTViOS8KPiAtIGh0dHBzOi8vZ2l0bGFi
LmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNTIyODQ4NDgzCj4gCj4gQW5kIGZpeCBhIGZl
dyBlbWFpbHM6Cj4gLSBhbHBpbmUuREVCLjIuMjIuMzk0LjIxMDgxODE2MzAyODAuMjAyODI2MkBy
aWR6byBbYnVpbGQgemZzIGludG8gYnVpbGRyb290IGZvciByYXNwYmVycnkgcGkgNF0KPiAtIGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtQXVndXN0
LzYyMTY5Ni5odG1sCj4gLSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1
aWxkcm9vdC8yMDIxLUF1Z3VzdC82MjEzNDUuaHRtbAo+IC0gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1KdWx5LzY0NjM3OS5odG1sCj4gLSBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIzLUp1bmUvNjY4
NDY3Lmh0bWwKPiAKPiBbMV0gVGhpcyBpcyB0aGUgZnVsbCBjYWxsYmFjaywgeW91IGNhbiBqdXN0
IGNoZWNrIHRoZSBsYXN0IGxpbms6Cj4gLSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMv
YmxvYi96ZnMtMi4xLjEyL2NvbmZpZy9rZXJuZWwtZGVjbGFyZS1ldmVudC1jbGFzcy5tNCNMN0Mx
MS1MN0MxMQo+IC0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2Jsb2IvemZzLTIuMS4x
Mi9jb25maWcva2VybmVsLm00I0w4ODMKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pm
cy9ibG9iL3pmcy0yLjEuMTIvY29uZmlnL2tlcm5lbC5tNCNMODY4Cj4gLSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4xLjEyL2NvbmZpZy9rZXJuZWwubTQjTDY2OAo+
IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9z
ZWx1aXNAZ21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3pmcy96ZnMubWsgfCA4ICsrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS96ZnMvemZzLm1rIGIvcGFja2FnZS96ZnMvemZzLm1rCj4gaW5kZXggZjA0NjFlYTllYy4uYWI1
MzBjYmNmMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKPiArKysgYi9wYWNrYWdl
L3pmcy96ZnMubWsKPiBAQCAtNTksNiArNTksMTQgQEAgZWxzZQo+ICBaRlNfQ09ORl9PUFRTICs9
IC0tZGlzYWJsZS1wYW0KPiAgZW5kaWYKPiAgCj4gKyMgU2V0cyB0aGUgZW52aXJvbm1lbnQgZm9y
IHRoZSBgbWFrZWAgdGhhdCB3aWxsIGJlIHJ1biBaRlMgYXV0b3Rvb2xzIGNoZWNrcy4KPiArWkZT
X0NPTkZfRU5WICs9IFwKPiArCUFSQ0g9JChLRVJORUxfQVJDSCkgXAo+ICsJQ1JPU1NfQ09NUElM
RT0iJChUQVJHRVRfQ1JPU1MpIgo+ICtaRlNfTUFLRV9FTlYgKz0gXAo+ICsJQVJDSD0kKEtFUk5F
TF9BUkNIKSBcCj4gKwlDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9TUykiCj4gKwo+ICAjIFpG
UyB1c2VybGFuZCB0b29scyBhcmUgdW5mdW5jdGlvbmFsIHdpdGhvdXQgdGhlIExpbnV4IGtlcm5l
bCBtb2R1bGVzLgo+ICBaRlNfTU9EVUxFX1NVQkRJUlMgPSBcCj4gIAltb2R1bGUvYXZsIFwKPiAt
LSAKPiAyLjQyLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
