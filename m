Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D528CD4841
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 16:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B411A60B32;
	Fri, 22 Sep 2023 16:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B411A60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubt9sRvmCD4e; Fri, 22 Sep 2023 16:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29720610F0;
	Fri, 22 Sep 2023 16:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29720610F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCFD31BF369
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B081F41E2F
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B081F41E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIiOy4ePxTxz for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 16:04:53 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C28B41E19
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 16:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C28B41E19
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 612A613F8E1;
 Fri, 22 Sep 2023 18:04:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 18:04:48 +0200
Date: Fri, 22 Sep 2023 18:04:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230922160448.GR512384@scaer>
References: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695398690;
 bh=n2MrvR7HKvI1qONtxfiJfQ9ZsX6JNpoaRd2CBU9d2Hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P0wvP8RxLskMjwm0bWkxKYzyeYr9pcSsoUd+5gCUlGOVxxYz0tYO40XRxpsvC1bcv
 ZqGMU7mGbKksi09SpZDrTwHq02ZnnOB9WlTRGGxX/GdskPfnHWAK6eRXk8LPpVDn4H
 Dc3+gllYCL9pqKTMPf+ZJITdzXuKrnNC8c0T7MPcw7mQEM4KnViTqCZwr4XGb8UdtP
 k4iU2UnUV2glIbpRKfaPrTAFd/ZAmSplVhl8Qe7LOLa9r2VQui2DWByDol+7LsKdGi
 MnuAot/RSc4BR47LKZsfToRm1p31FDVMTU9YNuPhf63aZ8PWwC7X/bd7So8QhRWq8Z
 iNNKv138rJe4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P0wvP8Rx
Subject: Re: [Buildroot] How to pass EXTRA_OECMAKE_BUILD in Buildroot
 package definition?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U291cmFiaCwgQWxsLAoKT24gMjAyMy0wOS0yMiAxNzozMyArMDIwMCwgU291cmFiaCBIZWdkZSBz
cGFrZSB0aHVzbHk6Cj4gSGksCj4gSSBhbSB0cnlpbmcgdG8gYWRkIGEgQnVpbGRyb290IHBhY2th
Z2Ugd2hlcmUgSSBuZWVkIHRvIHNwZWNpZnnCoEVYVFJBX09FQ01BS0VfQlVJTEQuIEJ1dCBJIGNv
dWxkbid0wqBmaW5kIGFueSByZWxldmFudAo+IHZhcmlhYmxlIGluIEJ1aWxkcm9vdCBmb3IgdGhp
cy4KClRoaXMgdmFyaWFibGUgaXMgc3BlY2lmaWMgdG8gdGhlIE9wZW5FbWJlZGRlZCB3b3JsZC4K
Ckxvb2sgYXQgdGhlIEJ1aWxkcm9vdCBtYW51YWwgdG8gZmluZCB0aGUgY29ycmVzcG9uZGluZyB2
YXJpYWJsZToKCiAgICBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51
YWwuaHRtbAoKSGludDogIkluZnJhc3RydWN0dXJlIGZvciBDTWFrZS1iYXNlZCBwYWNrYWdlcyIK
ClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IEV4YW1wbGUgd2lsbCBiZSBmcm9twqAKPiBbMV1o
dHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9tZXRhLWlteC9ibG9iLzY0YTg2NGFiNzdkZTA2YTU1
N2FmY2IwMWU2ZGQ0ZDIxNjA2ZTY5NDgvbWV0YS1tbC9yZWNpcGVzLWxpYnJhcmllcy90ZW5zb3Jm
bG93LWxpdGUvdGVuc29yZmxvdy1saXRlXzIuMTAuMC5iYiNMNDEKPiBDYW4gYW55b25lIHBsZWFz
ZSBsZXQgbWUga25vdyBob3cgdG8gYWNoaWV2ZSB0aGlzPwo+IFRoYW5rcyBpbiBhZHZhbmNlLgo+
IAo+IExpbmtzOgo+IDEuIGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L21ldGEtaW14L2Jsb2Iv
NjRhODY0YWI3N2RlMDZhNTU3YWZjYjAxZTZkZDRkMjE2MDZlNjk0OC9tZXRhLW1sL3JlY2lwZXMt
bGlicmFyaWVzL3RlbnNvcmZsb3ctbGl0ZS90ZW5zb3JmbG93LWxpdGVfMi4xMC4wLmJiI0w0MQoK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
