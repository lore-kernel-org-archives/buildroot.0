Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4018160B3D;
	Mon,  3 Jan 2022 20:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0n9v0ZLRB3Q; Mon,  3 Jan 2022 20:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C43460B33;
	Mon,  3 Jan 2022 20:46:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB301BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C90780C7A
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wSsekvAF-Qf for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:46:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 923D380C65
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 20:46:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CE91513F880;
 Mon,  3 Jan 2022 21:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641242799;
 bh=FsinOUqN11eOnXJUX3CO/cHdhY8T3Jr5nExK9R37g8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/l9+yL2/MMu+yDXOEpuFnzq1kJa9UgV6rM5PiJftpKX4xcNtl2V6/ZG0CKxSVKQF
 yVs6NWiqxmEXDB7eqsG4TG6S6FzozM+o/+1FNwV8YIgWphAlzw2hO84pdXSvU3mGOB
 vQinmBTKb60GkaPAb0VmvF6GbERMdCIi86e6W+KxNV+j8bZ54+Rv5y7xWipKZD0Ntc
 OcKhVn3ex+HWdrPqdoALJj6EDONDCrzG9D2YdNpvm0Os992n2O2QfIYkkexHw+jBVj
 heal82B9zafL9k+DAS1DaZ/Xw5E/4yR8upbKqEfYo1eS+GzSh2QyZYt8mM9nw9M9Se
 qzFa8mH4PUBqg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 21:46:35 +0100
Date: Mon, 3 Jan 2022 21:46:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220103204635.GL69135@scaer>
References: <20220103104355.16030-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103104355.16030-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/spi-tools: bump to version 1.0.1
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAxLTAzIDExOjQzICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3NwaS10b29scy9zcGktdG9vbHMuaGFz
aCB8IDIgKy0KPiAgcGFja2FnZS9zcGktdG9vbHMvc3BpLXRvb2xzLm1rICAgfCAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3NwaS10b29scy9zcGktdG9vbHMuaGFzaCBiL3BhY2thZ2Uvc3BpLXRv
b2xzL3NwaS10b29scy5oYXNoCj4gaW5kZXggYTFlZjRjMmI5Li4xNTk1Y2QzZDIgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9zcGktdG9vbHMvc3BpLXRvb2xzLmhhc2gKPiArKysgYi9wYWNrYWdlL3Nw
aS10b29scy9zcGktdG9vbHMuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIGxvY2FsbHkgY29t
cHV0ZWQgaGFzaAo+IC1zaGEyNTYgIDVlYjI0NjcwNDYxZGNmMmM1ODQ3MTExNGRjNjliNTIwNGRh
YjFjMGNjNTA1Mzg3OGY2ZGU3OTUwM2JkOGNjOWYgIHNwaS10b29scy0xLjAuMC50YXIuZ3oKPiAr
c2hhMjU2ICA4MWJiOWY3MjE4MTIzZjg2YzM2NDRkOTJhZDJjNDI3MzQzNzU4ZGYyMTQzZWU1ZGEz
OGU2Zjc0M2YxODcxNGZkICBzcGktdG9vbHMtMS4wLjEudGFyLmd6Cj4gIHNoYTI1NiAgYTAxMjU5
YTFiNTIyY2YwZGU5NTgyNGY5ODYwNjEzYjQ1MzE1M2VlYmFjNDY4ZTk2MTk2ZDVkN2RiYTg0Nzg2
YyAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NwaS10b29scy9zcGktdG9vbHMubWsg
Yi9wYWNrYWdlL3NwaS10b29scy9zcGktdG9vbHMubWsKPiBpbmRleCAyNmQwZGNmNTQuLmQ2MjNi
YWJmNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NwaS10b29scy9zcGktdG9vbHMubWsKPiArKysg
Yi9wYWNrYWdlL3NwaS10b29scy9zcGktdG9vbHMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtU1BJX1RPT0xTX1ZFUlNJT04gPSAxLjAu
MAo+ICtTUElfVE9PTFNfVkVSU0lPTiA9IDEuMC4xCj4gIFNQSV9UT09MU19TSVRFID0gJChjYWxs
IGdpdGh1YixjcGItLHNwaS10b29scywkKFNQSV9UT09MU19WRVJTSU9OKSkKPiAgIyBhdXRvcmVj
b25mIG11c3QgYmUgcnVuIGFzIHNwZWNpZmllZCBpbiBwYWNrYWdlIGRvY3VtZW50YXRpb24KPiAg
U1BJX1RPT0xTX0FVVE9SRUNPTkYgPSBZRVMKPiAtLSAKPiAyLjMyLjAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
