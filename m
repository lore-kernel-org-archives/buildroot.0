Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942B7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 03:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA23C60E9F;
	Thu, 19 May 2022 03:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2l5OKZ0D5qkH; Thu, 19 May 2022 03:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D4A60E2B;
	Thu, 19 May 2022 03:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2AA81BF20D
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 03:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B21D984404
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 03:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTvj-O0S2xfF for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 03:10:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 213D88427F
 for <buildroot@buildroot.org>; Thu, 19 May 2022 03:09:59 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 4FA1A440478;
 Thu, 19 May 2022 06:08:34 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652929729;
 bh=EAr9JMlGViGvgXOazJ6heNq90RbiCJKiL+D42+ri9e0=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=VZaldMEReNEqPpTh2v8KpyQPMiVllRnV9QzpWmZXQdtvP6BpdkrvBjcNmNhd/q6Yz
 ryxvRGS/XdSyDj4pys2BD11CUMaJLEnAlKehqL27kxXJ+1wFVHeuo2F8mUA5wiXIp+
 u5cpByC3dH6sONL2bY1gPZb+n8JmwhHJ9lG+SMpS09dk/Y0mb7Vku/dCnkQ9IowPvh
 ERbqt5wIZjc5CSB+YtLWWElJG4o5N/eWF7iJy7aYK+fDa7iHfwoAZk+lSU9tYsVaFc
 DamAbmmYXPxXrxGBBEAqKGILzsbL2//qbxxf8KsrMrM9VN/d1PhSnJ7EkYaaOJ5z9V
 UoogrnOT5ZadA==
References: <fa9bd454f0e7d72a0eac64ddae226513b2968126.1652914532.git.stefan@agner.ch>
User-agent: mu4e 1.6.10; emacs 27.1
To: Stefan Agner <stefan@agner.ch>
Date: Thu, 19 May 2022 06:06:48 +0300
In-reply-to: <fa9bd454f0e7d72a0eac64ddae226513b2968126.1652914532.git.stefan@agner.ch>
Message-ID: <87pmkaqkuv.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openvmtools: bump version to 11.3.5
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: kaszak@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFuLAoKT24gVGh1LCBNYXkgMTkgMjAyMiwgU3RlZmFuIEFnbmVyIHdyb3RlOgo+IFJl
YmFzZSBwYXRjaGVzIGFzIG5lY2Vzc2FyeSBhbmQgYnVtcCB2ZXJzaW9uIHRvIDExLjMuNS4gVGhp
cyBhbGxvd3MKPiB0byBidWlsZCBvcGVudm10b29scyBmb3IgYWFyY2g2NC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+IC0tLQo+ICAuLi5fcG9sbC1o
LXRvLWZpeC1idWlsZC1mYWlsdXJlLW9uLW11c2wucGF0Y2ggfCA4NSArKysrKysrKysrKy0tLS0t
LS0tCj4gIC4uLi10ZXN0LWZvci1mZWF0dXJlLWluc3RlYWQtb2YtcGxhdGZvci5wYXRjaCB8ICAx
ICsKPiAgLi4uLzAwMDktU2V0LXBlcm1pc3Npb25zLW9uLXJ1bGVzLWZpbGUucGF0Y2ggIHwgMjMg
LS0tLS0KPiAgLi4uLzAwMTAtQ2hhbmdlLURFVlBBVEgtdG8tZGV2cGF0aC5wYXRjaCAgICAgIHwg
MjUgLS0tLS0tCj4gIHBhY2thZ2Uvb3BlbnZtdG9vbHMvb3BlbnZtdG9vbHMuaGFzaCAgICAgICAg
ICB8ICAyICstCj4gIHBhY2thZ2Uvb3BlbnZtdG9vbHMvb3BlbnZtdG9vbHMubWsgICAgICAgICAg
ICB8ICA0ICstCj4gIDYgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgODYgZGVsZXRp
b25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW52bXRvb2xzLzAwMDktU2V0
LXBlcm1pc3Npb25zLW9uLXJ1bGVzLWZpbGUucGF0Y2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2Uvb3BlbnZtdG9vbHMvMDAxMC1DaGFuZ2UtREVWUEFUSC10by1kZXZwYXRoLnBhdGNoCj4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVudm10b29scy8wMDAzLVJlbmFtZS1wb2xsLWgtaW50
by12bV9wb2xsLWgtdG8tZml4LWJ1aWxkLWZhaWx1cmUtb24tbXVzbC5wYXRjaCBiL3BhY2thZ2Uv
b3BlbnZtdG9vbHMvMDAwMy1SZW5hbWUtcG9sbC1oLWludG8tdm1fcG9sbC1oLXRvLWZpeC1idWls
ZC1mYWlsdXJlLW9uLW11c2wucGF0Y2gKPiBpbmRleCBlOTQ5NWNlNDNmLi40NzQ5ZjNmNDYyIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbnZtdG9vbHMvMDAwMy1SZW5hbWUtcG9sbC1oLWludG8t
dm1fcG9sbC1oLXRvLWZpeC1idWlsZC1mYWlsdXJlLW9uLW11c2wucGF0Y2gKPiArKysgYi9wYWNr
YWdlL29wZW52bXRvb2xzLzAwMDMtUmVuYW1lLXBvbGwtaC1pbnRvLXZtX3BvbGwtaC10by1maXgt
YnVpbGQtZmFpbHVyZS1vbi1tdXNsLnBhdGNoCj4gQEAgLTEsNCArMSw1IEBACj4gLUZyb20gOWQx
M2UzMmUzNjJhZDNjZTUxNjlmNDliN2YwZmUxZDkzODBlNTU4YyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKPiArRnJvbSAxZGZhYjQ2ZDM2N2QxMWU5MTMyNTA2ZWUwZjdkM2ViMmNlZmY1ZjNjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtNZXNzYWdlLUlkOiA8MWRmYWI0NmQzNjdkMTFlOTEz
MjUwNmVlMGY3ZDNlYjJjZWZmNWYzYy4xNjUyOTEzODMyLmdpdC5zdGVmYW5AYWduZXIuY2g+Cj4g
IEZyb206IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICBE
YXRlOiBNb24sIDMwIFNlcCAyMDE5IDEzOjMyOjM1ICswMjAwCj4gIFN1YmplY3Q6IFtQQVRDSF0g
UmVuYW1lIHBvbGwuaCBpbnRvIHZtX3BvbGwuaCB0byBmaXggYnVpbGQgZmFpbHVyZSBvbiBtdXNs
Cj4gQEAgLTI1LDcgKzI2LDcgQEAgYXN5bmNzb2NrZXQuYzoyNTM4OjMzOiBlcnJvcjog4oCYUE9M
TElO4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW8KPiAgICAgICAgICAg
IHBmZFtpXS5ldmVudHMgPSByZWFkID8gUE9MTElOIDogUE9MTE9VVDsKPiAgCj4gIFNvIHJlbmFt
ZSBwb2xsLmggaW50byB2bV9wb2xsLmggYXMgc3VnZ2VzdGVkIGJ5IHNyb3dlIGluCj4gLWh0dHBz
Oi8vZ2l0aHViLmNvbS92bXdhcmUvb3Blbi12bS10b29scy9pc3N1ZXMvMzU5I2lzc3VlY29tbWVu
dC01MzM1Mjk5NTYKPiAraHR0cHM6Ly9naXRodWIuY29tL3Ztd2FyZS9pc3N1ZXMvMzU5I2lzc3Vl
Y29tbWVudC01MzM1Mjk5NTYKClRoaXMgbGVhZHMgdG8gNDA0IGVycm9yIHBhZ2UuCgo+ICBGaXhl
czoKPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNGY1NzVlZjQy
YmJjNDM4N2EwN2UzOTYyMDUwNTJiMmRhMDgxYzY0ZAo+IEBAIC0zMywyNCArMzQsMjQgQEAgRml4
ZXM6Cj4gIEZpeCAjMzU5Cj4gIAo+ICBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtW1Vwc3RyZWFtIHN0YXR1czogaHR0cHM6Ly9n
aXRodWIuY29tL3Ztd2FyZS9vcGVuLXZtLXRvb2xzL3B1bGwvMzgzXQo+ICtbVXBzdHJlYW0gc3Rh
dHVzOiBodHRwczovL2dpdGh1Yi5jb20vdm13YXJlL3B1bGwvMzgzXQoKQWxzbyBoZXJlLgoKYmFy
dWNoCgotLSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB+LiAufiAgIFRrIE9wZW4gU3lzdGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLW9vTy0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1
Y2hAdGtvcy5jby5pbCAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNv
LmlsIC0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
