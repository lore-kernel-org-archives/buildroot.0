Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07A8EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6260F41883;
	Tue, 25 Jul 2023 21:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6260F41883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5l7rpwTC2pWY; Tue, 25 Jul 2023 21:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3B6418A0;
	Tue, 25 Jul 2023 21:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3B6418A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACBB11BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 867DF817FD
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867DF817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EZDi36jj4Ah for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:13:42 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3AA81551
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 21:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3AA81551
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9F492780344;
 Tue, 25 Jul 2023 23:13:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:13:38 +0200
Date: Tue, 25 Jul 2023 23:13:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230725211338.GW3544423@scaer>
References: <20230725103157.941537-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725103157.941537-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319620;
 bh=g6w9bXsMq8TqH7wHGuXeVfjZzqlVGRvS+JUFpXKJ+zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQqnu9iItQe08CNPk0N81LJwqjfdTQ9iS+zjy7mvBkjGDtmGG0WqcwsNZtOZE1ag8
 Ickve801OqKj0t2ipWaHf/05jESvuu9A3aQJkT1sd+8jdi5ywWMM7OVv9CqXOrIiW4
 RfHGzaPajrDO3skinuG4fYaMYdpsIezfxVd0QL3FNcyCKFfLKyXVQJVEHU56Wqrk/L
 v6/T4Jk9OgKr8DkIbldJwRTwjDhXU0WUQP4j0az8t/rZJ4vXYnhhMypBAAfZWn4GUd
 uGGOAaJmtWocCviGd4nvrlwFtZNtXf6LTM1ZSLnbgwGWQWHjoRzxSrxX0TA4vZx9Z+
 zUse8nGcPjD7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NQqnu9iI
Subject: Re: [Buildroot] [PATCH] package/mbedtls: bump to 2.28.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA3LTI1IDEyOjMxICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICBwYWNrYWdlL21iZWR0bHMvbWJlZHRscy5oYXNo
IHwgNCArKy0tCj4gIHBhY2thZ2UvbWJlZHRscy9tYmVkdGxzLm1rICAgfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL21iZWR0bHMvbWJlZHRscy5oYXNoIGIvcGFja2FnZS9tYmVkdGxzL21iZWR0
bHMuaGFzaAo+IGluZGV4IDg3NmNkN2I3Ny4uYTFkNWQ2ZTcxIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvbWJlZHRscy9tYmVkdGxzLmhhc2gKPiArKysgYi9wYWNrYWdlL21iZWR0bHMvbWJlZHRscy5o
YXNoCj4gQEAgLTEsNCArMSw0IEBACj4gLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vQVJNbWJl
ZC9tYmVkdGxzL3JlbGVhc2VzL3RhZy92Mi4yOC4yOgo+IC1zaGEyNTYgIGJjNTUyMzJiZjcxZmQ2
NjA0NTEyMmJhOTA1MGEyOWVhN2NiMmU4Zjk5YjA2NGE5ZTYzMzRhODJmNzE1ODgxYTAgIG1iZWR0
bHMtMi4yOC4yLnRhci5nego+ICsjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL0FSTW1iZWQvbWJl
ZHRscy9yZWxlYXNlcy90YWcvdjIuMjguMzoKPiArc2hhMjU2ICBiZGY3YzViYmRjMzM4ZGEzZWRh
ZDg5YjI4ODVkNGY4NjY4ZjlhNmZmZmViYTZlYzE3YTYwMzMzZTM2ZGFkZTZmIG1iZWR0bHMtMi4y
OC4zLnRhci5negoKICAgICQgbWFrZSBjaGVjay1wYWNrYWdlCiAgICBwYWNrYWdlL21iZWR0bHMv
bWJlZHRscy5oYXNoOjI6IHNlcGFyYXRpb24gZG9lcyBub3QgbWF0Y2ggZXhwZWN0YXRpb24gKGh0
dHA6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI2FkZGluZy1wYWNrYWdlcy1oYXNoKQoKLi4gd2hp
Y2ggaXMgZXZlbiBtb3JlIHNhZCBhcyB0aGUgc3BhY2luZyB3YXMgcHJldmlvdXNseSBjb3JyZWN0
Li4uCgpBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHRoZSBhYm92ZSBmaXhlZCwgdGhhbmtzLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAg
Y2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdi
YzUyM2QzMCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21iZWR0bHMvbWJlZHRscy5t
ayBiL3BhY2thZ2UvbWJlZHRscy9tYmVkdGxzLm1rCj4gaW5kZXggN2E2MDVhYzViLi44ZjA5ZmQ3
MmEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tYmVkdGxzL21iZWR0bHMubWsKPiArKysgYi9wYWNr
YWdlL21iZWR0bHMvbWJlZHRscy5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1NQkVEVExTX1ZFUlNJT04gPSAyLjI4LjIKPiArTUJFRFRM
U19WRVJTSU9OID0gMi4yOC4zCj4gIE1CRURUTFNfU0lURSA9ICQoY2FsbCBnaXRodWIsQVJNbWJl
ZCxtYmVkdGxzLHYkKE1CRURUTFNfVkVSU0lPTikpCj4gIE1CRURUTFNfQ09ORl9PUFRTID0gXAo+
ICAJLURDTUFLRV9DX0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1zdGQ9Yzk5IiBcCj4gLS0gCj4g
Mi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
