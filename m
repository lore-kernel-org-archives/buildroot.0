Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5129FCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 15:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06DF1406CD;
	Mon,  1 Apr 2024 15:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0IQqwHur5DN; Mon,  1 Apr 2024 15:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85811406BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85811406BF;
	Mon,  1 Apr 2024 15:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2528A1BF276
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 15:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F5C381380
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 15:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZX-X1TEaT2SA for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 15:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB4E081370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4E081370
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB4E081370
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 15:27:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 03E0A13F861;
 Mon,  1 Apr 2024 17:27:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 17:27:07 +0200
Date: Mon, 1 Apr 2024 17:27:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <ZgrSS-71Un9n_B_b@landeda>
References: <20240328174052.8677-1-francois.perrad@gadz.org>
 <ZgrB_CpdJbJOmv3T@landeda>
 <CAAE6iEVy2gvT4wH3Ow3OKzDDpFcR8+CuPtHo-Zz-7S2um_z67A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAE6iEVy2gvT4wH3Ow3OKzDDpFcR8+CuPtHo-Zz-7S2um_z67A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711985231;
 bh=iOfDKz4FczeAn17Jdek8Hm6mmz+usZgBoj49NFISALw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UAYue1UvkvTWPZosYNNMk4tsrni9/WsCDyH/ZsI7xAjLv/M45KSlP0UBxivjcjr/n
 VRYRbb2xJcWpIsSnN1rPjzmgFPzTAguZQs2UfQpFpS0MJ4onAlBxNt1NnAqxL8yrzT
 BZdFAsSRNPadwYCEzlXQSv7nwraEvUbWo0FfG0ArZbKEa0LsM/1E1PB+RxVpB2F+Ho
 9vE+xGY0W50+rkp8IvtAXidCoFYvbDMz7QP2cKK4OBCn2a11qntXUgP4bwv0jSYqI5
 fuig9Bjr80M/PWRLZTnk9ecad/ChH1ZZ1DK/1YGDxHhfi3DLNxTxL9vPFvuRTnihXm
 o70LCWpBOKu/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UAYue1Uv
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.8.4
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA0LTAxIDE3OjExICswMjAwLCBGcmFuw6dvaXMgUGVy
cmFkIHNwYWtlIHRodXNseToKPiBMZcKgbHVuLiAxIGF2ci4gMjAyNCDDoMKgMTY6MTcsIFlhbm4g
RS4gTU9SSU4gPFsxXXlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhCj4gw6ljcml0wqA6Cj4gICAg
IEFnYWluLCB5aW91ciBGcm9tIGFuZCBTb0IgZG8gbm90IG1hdGNoOiBbM11mcGVycmFkQGdtYWls
LmNvbSB2cy4KPiAgICAgWzRdZnJhbmNvaXMucGVycmFkQGdhZHoub3JnLgo+IHRoZW0gaGFkIG5l
dmVyIG1hdGNoIHNpbmNlIEkgY29udHJpYnV0ZS4KPiBJcyBpdCBhIG5ldyBydWxlID8KCk5vIGl0
IGlzIG5vdCBhIG5ldyBydWxlLCBpdCBqdXN0IGhhZCBuZXZlciBiZWVuIHdyaXR0ZW4sIGNoZWNr
ZWQsIG5vcgplbmZvcmNlZC4KCldoYXQgd291bGQgdGhlIHBvaW50IG9mIHRoZSBTb2IgbGluZSBp
ZiBpdCBkaWQgbm90IG1hdGNoIHRoZSBhdXRob3I/IFRoZQpTb0IgbGluZSBpcyB0aGVyZSBzbyB0
aGF0IHRoZSBhdXRob3IgYXNzZXNzZXMgdGhhdCB0aGV5IGhhdmUgdGhlIHJpZ2h0CnRvIGNvbnRy
aWJ1dGUgdGhlaXIgY2hhbmdlOgoKICAgIGh0dHBzOi8vZGV2ZWxvcGVyY2VydGlmaWNhdGUub3Jn
LwoKU28sIGlmIHRoZSBpZGVudGl0eSBvZiB0aGUgYXV0aG9yIG9mIGEgY2hhbmdlIGRvZXMgbm90
IG1hdGNoIHRoZSBTb0IKbGluZSwgdGhlIFNvQiBsaW5lIGRvZXMgbm90IG1lYW4gbXVjaC4uLgoK
SSBqdXN0IGhhcHBlbiB0byBoYXZlIHJlY2VudGx5IGFkZGVkIHN1Y2ggYSBjaGVjayBpbiBteSBw
b3N0LWFwcGx5cGF0Y2gKaG9vayBub3csIHNvIEkgbm93IG5vdGljZSBzdWNoIGRpc2NyZXBhbmN5
LCBhbmQgYXQgbGVhc3QgUGV0ZXIgaXMgdXNpbmcKaXQgKFJvbWFpbiBhcyB3ZWxsIEkgdGhpbmsp
OgoKICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2dpdC1ob29rcy8tL2NvbW1p
dC9jOWE4ZWI2YzQ3N2RjZmUyZjJiMzEwYjkyNTA3NWMwZWIxZGNkMDE5CgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
