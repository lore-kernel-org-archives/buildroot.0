Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDDAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D215460BF7;
	Fri, 18 Mar 2022 22:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOrEmp1jHkuW; Fri, 18 Mar 2022 22:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D776F60AE6;
	Fri, 18 Mar 2022 22:32:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88A7C1BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 769A140275
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wj_Xfo2ahw3u for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:32:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60EA840131
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:32:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BC44A13F846;
 Fri, 18 Mar 2022 23:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647642759;
 bh=aLsfJxbFHabmiqEOlpplXhf8hLow7JjTO3ui4Xl6PkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MI0cY32P1BYNiTOKVeomWQVV4CrhQ5X2JebRjKQxTvFgW4NJXMO5QPA4pXl8rGlfo
 qz1WCII/vmxskPvuXAxCATS8h/ajQrK9npSCFISYNzygjoPLMSJCCAf9OgdFSIsX3H
 Juyb3xGbGpT2ybCHTnNbZgX1GWrc2mcZoNnoM3RgLAkR87/yuYvYzSK9bp8W6welOb
 CEPef+8/DRN+TZacAmE4oVRILT3g5UPyZEHEdMMB2YdJU4bwH3kUZ7NjqwIfBxT1bi
 Jt6y3Y37r5DdJZ1I3vksWnecijb97Wqt7RMd9Z01+aJUP7BjS0VGkKDFgPMRBcd/S3
 CIfEIpoTZ4+Ow==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:32:35 +0100
Date: Fri, 18 Mar 2022 23:32:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220318223235.GT283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-3-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318132427.48737-3-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 2/8] package/python-cryptography: enable
 host package
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
ciBzcGFrZSB0aHVzbHk6Cj4gRW5hYmxlIGhvc3QgcGFja2FnZSBhbmQgYWRkIG5lZWRlZCB2YXJp
YWJsZXMuIEhvc3QgUE9TVF9QUk9DRVNTIGFuZAo+IERPV05MT0FEX0RFUEVOREVOQ0lFUyB2YXJp
YWJsZXMgYXJlIGluaGVyaXRlZCBmcm9tIHRhcmdldCBvbmVzLgo+IAo+IEFja2VkLWJ5OiBFdGll
bm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgoKQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNr
YWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayB8IDEyICsrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayBi
L3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gaW5k
ZXggYTUyNGY3MjljOC4uODcyZWRlOWI4OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1j
cnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gQEAgLTE3LDE0ICsxNywyNiBA
QCBQWVRIT05fQ1JZUFRPR1JBUEhZX0RFUEVOREVOQ0lFUyA9IFwKPiAgCWhvc3QtcHl0aG9uLWNm
ZmkgXAo+ICAJaG9zdC1ydXN0YyBcCj4gIAlvcGVuc3NsCj4gK0hPU1RfUFlUSE9OX0NSWVBUT0dS
QVBIWV9ERVBFTkRFTkNJRVMgPSBcCj4gKwlob3N0LXB5dGhvbi1zZXR1cHRvb2xzLXJ1c3QgXAo+
ICsJaG9zdC1weXRob24tY2ZmaSBcCj4gKwlob3N0LXJ1c3RjIFwKPiArCWhvc3Qtb3BlbnNzbAo+
ICBQWVRIT05fQ1JZUFRPR1JBUEhZX0VOViA9IFwKPiAgCSQoUEtHX0NBUkdPX0VOVikgXAo+ICAJ
UFlPM19DUk9TU19MSUJfRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9O
M19WRVJTSU9OX01BSk9SKSIKPiArSE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX0VOViA9IFwKPiAr
CSQoSE9TVF9QS0dfQ0FSR09fRU5WKSBcCj4gKwlQWU8zX0NST1NTX0xJQl9ESVI9IiQoSE9TVF9E
SVIpL3Vzci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpIgo+ICAjIFdlIG5lZWQg
dG8gdmVuZG9yIHRoZSBDYXJnbyBjcmF0ZXMgYXQgZG93bmxvYWQgdGltZQo+ICBQWVRIT05fQ1JZ
UFRPR1JBUEhZX0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9IGNhcmdvCj4gIFBZVEhPTl9DUllQVE9H
UkFQSFlfRE9XTkxPQURfREVQRU5ERU5DSUVTID0gaG9zdC1ydXN0Ywo+ICBQWVRIT05fQ1JZUFRP
R1JBUEhZX0RMX0VOViA9IFwKPiAgCSQoUEtHX0NBUkdPX0VOVikgXAo+ICAJQlJfQ0FSR09fTUFO
SUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJnby50b21sCj4gK0hPU1RfUFlUSE9OX0NSWVBUT0dSQVBI
WV9ETF9FTlYgPSBcCj4gKwkkKEhPU1RfUEtHX0NBUkdPX0VOVikgXAo+ICsJQlJfQ0FSR09fTUFO
SUZFU1RfUEFUSD1zcmMvcnVzdC9DYXJnby50b21sCj4gIAo+ICAkKGV2YWwgJChweXRob24tcGFj
a2FnZSkpCj4gKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+IC0tIAo+IDIuMzQuMQo+
IAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
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
