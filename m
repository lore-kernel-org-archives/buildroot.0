Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C49AC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F74182324;
	Sat, 21 Jan 2023 15:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F74182324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJvcMtW0pr8w; Sat, 21 Jan 2023 15:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D58D8230C;
	Sat, 21 Jan 2023 15:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D58D8230C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4281BF377
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777CD8230C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 15:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 777CD8230C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWTILVYi1yeH for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 15:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C6D8228B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7C6D8228B
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 15:18:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7C7145FFA7;
 Sat, 21 Jan 2023 16:18:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Jan 2023 16:18:15 +0100
Date: Sat, 21 Jan 2023 16:18:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Prasad Sankaran <prasad@cradlewise.com>
Message-ID: <20230121151815.GD558596@scaer>
References: <CANtE+cKcemOj_DTSOZ_TzuThSrXBwah38WJYM-AVH1nGTJikDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANtE+cKcemOj_DTSOZ_TzuThSrXBwah38WJYM-AVH1nGTJikDw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674314298;
 bh=XpRLd2jSkVjMqGRAWfCvikkh+2f537wh2leuexGXAYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2umR/O8uaaTmLvivEGDzZXMlaDiGKNTmdHetjfEmlLKzXb4jtUnZRg8yX2lE+aJH
 KXlNaOgm0yYemM43Oz03TO85GB+TCZOw23JOWGJ2AhAaM0s+rHQc24NwEgxSHRcd+B
 b/bG9HFhEyiRcyOccu7uTBUZRa4eXldSybLlJZBl9eXujX1wFLukYCY2UZjd1DZo7o
 xUr3M4D23NVUhvsPf1gZKhEvxpN42Fdz3k5/BlahnirYVxDQ/Pa8f0bhBdnU4g3z5t
 UF6qO47YjXG26+w//wuIYp3zEUZdKirdZMnzCPUShuGfQuQskmY2Hnv57z00dehdPg
 9AKNn9vdG5cSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C2umR/O8
Subject: Re: [Buildroot] Not able to build python-numpy 1.23.5 on buildroot
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
Cc: Archit Taneja <archit@cradlewise.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UHJhc2FkLCBBbGwsCgpPbiAyMDIzLTAxLTIxIDIwOjEyICswNTMwLCBQcmFzYWQgU2Fua2FyYW4g
dmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVGhlIGZvbGxvd2luZyBlcnJvcnMgYXJlIHJl
cG9ydGVkIHdoaWxlIGdlbmVyYXRpbmcgbnVtcHkvY29yZS9fIFsxXW11bHRpYXJyYXlfdW1hdGgu
Y3B5dGhvbi0zOC1hYXJjaDY0LWxpbnV4LWdudS5zbyB1c2luZwo+IGFhcmNoNjQtYnVpbGRyb290
LWxpbnV4LWdudS1nY2MuCj4gSXMgdGhlcmUgYSB3YXkgdG8gYXZvaWQgaW5jbHVkaW5nIEFWWDUx
MiAucyBmaWxlcyBmcm9tIHRoZSBjb21waWxhdGlvbj8KPiAKPiBudW1weS9jb3JlL3NyYy91bWF0
aC9zdm1sL2xpbnV4L2F2eDUxMi9zdm1sX3owX2Fjb3NfZF9sYS5zOjE5OiBFcnJvcjogdW5rbm93
biBtbmVtb25pYyDCoCBwdXNocScgLS0gcHVzaHEgJXJicCcKPiBudW1weS9jb3JlL3NyYy91bWF0
aC9zdm1sL2xpbnV4L2F2eDUxMi9zdm1sX3owX2Fjb3NfZF9sYS5zOjIxOiBFcnJvcjogdW5rbm93
biBtbmVtb25pYyDCoCBtb3ZxJyAtLSBtb3ZxICVyc3AsJXJicCcKPiBudW1weS9jb3JlL3NyYy91
bWF0aC9zdm1sL2xpbnV4L2F2eDUxMi9zdm1sX3owX2Fjb3NfZF9sYS5zOjI0OiBFcnJvcjogdW5r
bm93biBtbmVtb25pYyDCoCBhbmRxJyAtLSBhbmRxICQtNjQsJXJzcCcKPiBudW1weS9jb3JlL3Ny
Yy91bWF0aC9zdm1sL2xpbnV4L2F2eDUxMi9zdm1sX3owX2Fjb3NfZF9sYS5zOjI1OiBFcnJvcjog
dW5rbm93biBtbmVtb25pYyDCoCBzdWJxJyAtLSBzdWJxICQxOTIsJXJzcCcKPiBudW1weS9jb3Jl
L3NyYy91bWF0aC9zdm1sL2xpbnV4L2F2eDUxMi9zdm1sX3owX2Fjb3NfZF9sYS5zOjI2OiBFcnJv
cjogdW5rbm93biBtbmVtb25pYyDCoCB2bW92dXBzJyAtLSB2bW92dXBzCj4gX19zdm1sX2RhY29z
X2RhdGFfaW50ZXJuYWwoJXJpcCksJXptbTcnCj4gbnVtcHkvY29yZS9zcmMvdW1hdGgvc3ZtbC9s
aW51eC9hdng1MTIvc3ZtbF96MF9hY29zX2RfbGEuczoyNzogRXJyb3I6IHVua25vd24gbW5lbW9u
aWMgwqAgdm1vdnVwcycgLS0gdm1vdnVwcwo+IDY0K19fc3ZtbF9kYWNvc19kYXRhX2ludGVybmFs
KCVyaXApLCV6bW04Jwo+IG51bXB5L2NvcmUvc3JjL3VtYXRoL3N2bWwvbGludXgvYXZ4NTEyL3N2
bWxfejBfYWNvc19kX2xhLnM6MzA6IEVycm9yOiB1bmtub3duIG1uZW1vbmljIMKgIHZtb3Z1cHMn
IC0tIHZtb3Z1cHMKPiAxMjgrX19zdm1sX2RhY29zX2RhdGFfaW50ZXJuYWwoJXJpcCksJXptbTEx
JwoKSSB3YXMgbm90IGFibGUgdG8gcmVwcm9kdWNlIHN1Y2ggYW4gZXJyb3IgaGVyZSwgd2l0aCB0
aGUgZm9sbG93aW5nCmRlZmNvbmZpZyBhbmQgbWFzdGVyIGFzIG9mIGNvbW1pdCBmMDkwMTE2MDY2
OgoKICAgIEJSMl9hYXJjaDY0PXkKICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogICAgQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKICAgIEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RP
UklFUz15CiAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9O
VU1QWT15CgpDYW4geW91IHNoYXJlIGEgX21pbmltYWxfIGRlZmNvbmZpZyB0aGF0IGV4aGliaXRz
IHRoZSBpc3N1ZT8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
