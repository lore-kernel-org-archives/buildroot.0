Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9462C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 18:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C3F40632;
	Mon, 15 Aug 2022 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C3F40632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYZ2dMQ9cLPc; Mon, 15 Aug 2022 18:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A34440544;
	Mon, 15 Aug 2022 18:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A34440544
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34B691BF279
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 18:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CE0481495
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 18:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE0481495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LrQRmF6OJyA for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 18:46:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17F3781311
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17F3781311
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 18:46:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DCBC96012C;
 Mon, 15 Aug 2022 20:46:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 20:46:32 +0200
Date: Mon, 15 Aug 2022 20:46:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220815184632.GE2854108@scaer>
References: <20220815165632.1278597-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815165632.1278597-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660589195;
 bh=icMiNx2Vg789YuOcYtmXyxIvbdrUuQeaVS80WvQ1bJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUzrPgSex+mSjwtCiHpxek1lYHs+hC3rBjWfiLO5qTL0XDgOEkujZKne9r/V2FOCZ
 634amxXtJrpXoGWtMPtv7H2JE2iYh9ZVD982kUCrK1SwOaUHWOtkblJTN3+8gFHJ44
 CcuE3+wteS+83pBDu1MbjZZucYSJRQgyg9tG5CRZr5FoVWKP+skFmvrbt+UK9jDNct
 e4joRIwzeyMc/XM2YAZb0PCkasdSaUieTyAbYdnZ7YjLwP1C/ArgruaPusxjkjaazW
 J5epIgl8ruXtU/ov3YWDfdsc08fiKIvnqs1j5G6NhcXKMUL7KgwjFVK3op1JBMiBt7
 uClTUpgzVuSyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aUzrPgSe
Subject: Re: [Buildroot] [PATCH 1/4] package/qoriq-cadence-dp-firmware: fix
 license info
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE1IDE4OjU2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICAuLi4vcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9x
b3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlLmhhc2ggIHwgMiArKwo+ICAuLi4vcW9yaXEtY2FkZW5j
ZS1kcC1maXJtd2FyZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlLm1rICAgIHwgNCArKy0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5j
ZS1kcC1maXJtd2FyZS5oYXNoIGIvcGFja2FnZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlL3Fv
cmlxLWNhZGVuY2UtZHAtZmlybXdhcmUuaGFzaAo+IGluZGV4IGQzMDJkOTI3OC4uODhhYzNkYjk3
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9xb3JpcS1j
YWRlbmNlLWRwLWZpcm13YXJlLmhhc2gKPiArKysgYi9wYWNrYWdlL3FvcmlxLWNhZGVuY2UtZHAt
ZmlybXdhcmUvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS5oYXNoCj4gQEAgLTEsMyArMSw1IEBA
Cj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgNTg3MWM1NzE3YmUzMmYxNGE1OTYy
NGQ1Njk5ZDQwNWU4Y2U5YWUyZTljOWVmODZmZDE2ZTEzZDI2NGE0MGU1OCAgZmlybXdhcmUtY2Fk
ZW5jZS1sc2RrMTkwOS5iaW4KPiAgc2hhMjU2ICBkNTVmMDI0YWYyYmZmZjcxNGI5MGRlNTk2ZjZk
MDM5OTEyNGI5OTllOGMxOGE4NmIxM2EzYjUwN2JhZTZmNTYxICBDT1BZSU5HCj4gK3NoYTI1NiAg
OTY2NTkzMGY2OWMwYjZmNGE0YzA1NWQ3ZmUyYjhlZTU2M2U3NzFlZmJjODM4OTJhYmIxOTU1ZTYx
NDkyY2RmNyAgRVVMQQo+ICtzaGEyNTYgIDUzZTNlYjBiMmJkODFjMTcxZmEwNGMxNzUxNGUyMGIz
OWI3YmIxZmUxMjI0YzU5M2Y3NzE3ZjYxNWZiOWQ1MmIgIEVVTEEudHh0Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13
YXJlLm1rIGIvcGFja2FnZS9xb3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlL3FvcmlxLWNhZGVuY2Ut
ZHAtZmlybXdhcmUubWsKPiBpbmRleCAyMzY0M2QyNGUuLjdkNzAxYzRhYyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3FvcmlxLWNhZGVuY2UtZHAtZmlybXdhcmUvcW9yaXEtY2FkZW5jZS1kcC1maXJt
d2FyZS5tawo+ICsrKyBiL3BhY2thZ2UvcW9yaXEtY2FkZW5jZS1kcC1maXJtd2FyZS9xb3JpcS1j
YWRlbmNlLWRwLWZpcm13YXJlLm1rCj4gQEAgLTcsOCArNyw4IEBACj4gIFFPUklRX0NBREVOQ0Vf
RFBfRklSTVdBUkVfVkVSU0lPTiA9IGxzZGsxOTA5Cj4gIFFPUklRX0NBREVOQ0VfRFBfRklSTVdB
UkVfU0lURSA9IGh0dHA6Ly93d3cubnhwLmNvbS9sZ2ZpbGVzL3Nkay8kKFFPUklRX0NBREVOQ0Vf
RFBfRklSTVdBUkVfVkVSU0lPTikKPiAgUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9TT1VSQ0Ug
PSBmaXJtd2FyZS1jYWRlbmNlLSQoUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9WRVJTSU9OKS5i
aW4KPiAtUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9MSUNFTlNFID0gTlhQLUJpbmFyeS1FVUxB
Cj4gLVFPUklRX0NBREVOQ0VfRFBfRklSTVdBUkVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAr
UU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9MSUNFTlNFID0gTlhQIFNlbWljb25kdWN0b3IgU29m
dHdhcmUgTGljZW5zZSBBZ3JlZW1lbnQKPiArUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9MSUNF
TlNFX0ZJTEVTID0gQ09QWUlORyBFVUxBIEVVTEEudHh0Cj4gIFFPUklRX0NBREVOQ0VfRFBfRklS
TVdBUkVfUkVESVNUUklCVVRFID0gTk8KPiAgUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9JTlNU
QUxMX0lNQUdFUyA9IFlFUwo+ICBRT1JJUV9DQURFTkNFX0RQX0ZJUk1XQVJFX0lOU1RBTExfVEFS
R0VUID0gTk8KPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
