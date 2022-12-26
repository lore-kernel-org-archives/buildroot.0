Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F95C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B528581284;
	Mon, 26 Dec 2022 21:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B528581284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KGGE8vme92r; Mon, 26 Dec 2022 21:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AB48127F;
	Mon, 26 Dec 2022 21:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AB48127F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E66B1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49C21813B3
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49C21813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8Ev5ZP8WJGd for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:14:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C1E2813A9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C1E2813A9
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 21:14:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3448278035D;
 Mon, 26 Dec 2022 22:13:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 22:13:55 +0100
Date: Mon, 26 Dec 2022 22:13:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221226211355.GH2893@scaer>
References: <20221226074801.143640-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226074801.143640-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672089238;
 bh=QNNuEU6bkSHNF7QNe09B5Ep3ja68EPgYtABnIkDVfoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qXUQ0rmdfSpKSX6poEx8fnY8I4lYXCrYvHuCOxpvbCjphVyOePbNjs8MBZ4EyTd50
 7GHOYmelVX25crO5+6su8gqGQnUia/cEC0TDfKQ76TIlky3MMRp4YuMq+N0C00/g3n
 9I9eWOctprWcAQwS51vGUlKisJbwmRZBLg5vzUJE45sSbZXLS2ftvGHw41FIfV5MAr
 gXBUf9m7KJlxp4rZc0QWymu1bTKVmdUSGxQ206GKUmbxEYjOwPDZSmG4bTUaNhs8aQ
 vLoLbuXISGJlL1GeUF+0CJ1WFlzzQbVjOmGzoxUDyPrF8d2fIa2LnpqM23CmmsCzWF
 IzZva3M2evTpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qXUQ0rmd
Subject: Re: [Buildroot] [PATCH] package/lua-datafile: bump to version 0.7
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTEyLTI2IDA4OjQ4ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2x1YS1kYXRhZmlsZS9sdWEtZGF0YWZp
bGUuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9sdWEtZGF0YWZpbGUvbHVhLWRhdGFmaWxlLm1rICAg
fCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS1kYXRhZmlsZS9sdWEtZGF0YWZpbGUuaGFz
aCBiL3BhY2thZ2UvbHVhLWRhdGFmaWxlL2x1YS1kYXRhZmlsZS5oYXNoCj4gaW5kZXggMDdhMTNl
N2U4Li5lM2I0MTVhZDQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWEtZGF0YWZpbGUvbHVhLWRh
dGFmaWxlLmhhc2gKPiArKysgYi9wYWNrYWdlL2x1YS1kYXRhZmlsZS9sdWEtZGF0YWZpbGUuaGFz
aAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIGNvbXB1dGVkIGJ5IGx1YXJvY2tzL2J1aWxkcm9vdAo+
IC1zaGEyNTYgIDRmN2Q1OGM1MDI2N2I1ZWJkMjE0NWU1MmFhYTVmYjYzZmJmNjNhNzRhZTc2NWYw
OGUyZDBkZGRkNTcwYjZiNmEgIGRhdGFmaWxlLTAuNi0xLnNyYy5yb2NrCj4gK3NoYTI1NiAgYjUx
MWNlNWE0ZjQwNzJiYjZjNDk2YmQ0Mjc2MGZhOTJhMDU3NmQwYzc3ODI4YjZhMjYwMGQ2OGZlOWQ3
ZTk5OCAgZGF0YWZpbGUtMC43LTEuc3JjLnJvY2sKPiAgc2hhMjU2ICAwNDQzZGRhYmFiMTRmNjlk
NGM1ZTI2NDE4NjAzNDM3ODRhMGNjYmU1YWU3YTM3NDNmMjBkZTlhMTM5OTFkYTY2ICBkYXRhZmls
ZS9MSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhLWRhdGFmaWxlL2x1YS1kYXRhZmls
ZS5tayBiL3BhY2thZ2UvbHVhLWRhdGFmaWxlL2x1YS1kYXRhZmlsZS5tawo+IGluZGV4IDVkMzBm
ZGNmOS4uM2I0YzY1ZDNlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhLWRhdGFmaWxlL2x1YS1k
YXRhZmlsZS5tawo+ICsrKyBiL3BhY2thZ2UvbHVhLWRhdGFmaWxlL2x1YS1kYXRhZmlsZS5tawo+
IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1M
VUFfREFUQUZJTEVfVkVSU0lPTiA9IDAuNi0xCj4gK0xVQV9EQVRBRklMRV9WRVJTSU9OID0gMC43
LTEKPiAgTFVBX0RBVEFGSUxFX05BTUVfVVBTVFJFQU0gPSBkYXRhZmlsZQo+ICBMVUFfREFUQUZJ
TEVfU1VCRElSID0gZGF0YWZpbGUKPiAgTFVBX0RBVEFGSUxFX0xJQ0VOU0UgPSBNSVQKPiAtLSAK
PiAyLjM3LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoK
LS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0t
LTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
