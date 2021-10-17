Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C87C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 08:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D716861050
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 08:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D716861050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E70823E2;
	Sun, 17 Oct 2021 08:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADQZSaUiU5RO; Sun, 17 Oct 2021 08:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C9C81D98;
	Sun, 17 Oct 2021 08:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44CE71BF5B5
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 08:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33DDB60821
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 08:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNJclqIIrEsS for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 08:15:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ABEB6077C
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 08:15:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6052:794b:b800:c2f1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0F6D22003A4;
 Sun, 17 Oct 2021 10:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634458528;
 bh=63zaWp6E/RZAc6l0C3K/1+Nxgq9aetpvbsGuFID5P+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MimO6bt420794r/5FKW7QwzdcU2Pbbsddp7VVDGviNn5YrZRc3vxSFu9Thwf9n1Rk
 ziCjxW2WFJkTIU5iJLayWHl7rKtF19R9UEJuS1DqEoRbjdKZ/ZddfIPClonninyTQf
 ikWpigUFh0CnS8OORmjzA8Yrs+dS/4AMoRAJ/ohVaal8GVwxRBFZ2DzNmokIYCybXH
 fzwQ2eBBtjUw45Rz46howqN37UaYQM6Ck0bekSvb1Hf5jDXaD4eYuhcnE0LJ/2e2mo
 QaXbsYPrDc6L1ryCBPSJknBJaePBupv0wxmQiJ9PQ0UC2KwZglQjuhPn0ZaI5gAYRL
 jU8an4SV5Q+pw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 10:15:23 +0200
Date: Sun, 17 Oct 2021 10:15:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David Lechner <david@lechnology.com>
Message-ID: <20211017081523.GE2400@scaer>
References: <20211016213626.3264701-1-david@lechnology.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211016213626.3264701-1-david@lechnology.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/lego_ev3: update to U-Boot 2021.07
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

RGF2aWQsIEFsbCwKCk9uIDIwMjEtMTAtMTYgMTY6MzYgLTA1MDAsIERhdmlkIExlY2huZXIgc3Bh
a2UgdGh1c2x5Ogo+IEJ1aWxkcm9vdCBDSSBoYXMgYmVlbiBmYWlsaW5nIGR1ZSB0byA0MDQgZXJy
b3Igb24gb2xkZXIgVS1Cb290LgoKVGhlIHJlYWwgcHJvYmxlbSBpcyB0aGF0IHRoZSBjZXJ0aWZp
Y2F0ZSBwcmVzZW50ZWQgYnkgdGhlIGh0dHBzIHNlcnZlcgphdCBmdHAuZGVueC5kZSwgY2FuJ3Qg
YmUgdmFsaWRhdGVkOgoKICAgIHdnZXQgLS1wYXNzaXZlLWZ0cCAtbmQgLXQgMyAtTyAnL2J1aWxk
cy9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLnUtYm9vdC0yMDE4LjExLnRh
ci5iejIucnljSkQyL291dHB1dCcgJ2h0dHBzOi8vZnRwLmRlbnguZGUvcHViL3UtYm9vdC91LWJv
b3QtMjAxOC4xMS50YXIuYnoyJyAKICAgIC0tMjAyMS0xMC0xNCAxMzowNzoyMi0tIGh0dHBzOi8v
ZnRwLmRlbnguZGUvcHViL3UtYm9vdC91LWJvb3QtMjAxOC4xMS50YXIuYnoyCiAgICBSZXNvbHZp
bmcgZnRwLmRlbnguZGUgKGZ0cC5kZW54LmRlKS4uLiA4NS4yMTQuNDkuMywgMmEwMToyMzg6NDNm
NDo0NjAwOmJjNjQ6NGY0NDozODFmOjExNjMKICAgIENvbm5lY3RpbmcgdG8gZnRwLmRlbnguZGUg
KGZ0cC5kZW54LmRlKXw4NS4yMTQuNDkuM3w6NDQzLi4uIGNvbm5lY3RlZC4KICAgIEVSUk9SOiBU
aGUgY2VydGlmaWNhdGUgb2Yg4oCYZnRwLmRlbnguZGXigJkgaXMgbm90IHRydXN0ZWQuCiAgICBF
UlJPUjogVGhlIGNlcnRpZmljYXRlIG9mIOKAmGZ0cC5kZW54LmRl4oCZIGhhcyBleHBpcmVkLgoK
VGhhdCdzIHByb2JhYmx5IGJlY2F1c2Ugd2UgYXJlIHN0aWxsIHVzaW5nIGFuIG9sZCBkaXN0cmli
dXRpb24gYXMgdGhlCmJhc2UgaW1hZ2UgdG8gZG8gdGhlIHJ1biBpbiB0aGUgQ0kuCgpXZSBoYXZl
IGEgcGF0Y2ggcGVuZGluZyB0byB1cGRhdGUgdGhhdCBpbWFnZS4gSXQgaGFzIGp1c3QgYmVlbiBw
cm9tb3RlZAp0byB0aGUgdG9wIG9mIG15IGxpc3Qgb2YgcGF0Y2hlcyB0byBsb29rIGF0IHRvZGF5
Li4uCgo+IFVwZGF0aW5nCj4gdGhlIFUtQm9vdCB2ZXJzaW9uIHNob3VsZCBmaXggaXQgYW5kIGl0
IGRvZXNuJ3QgaHVydCB0byB1c2UgdGhlIGxhdGVzdAo+IFUtQm9vdCBhbnl3YXkuCgpBZ3JlZWQs
IGFsdGhvdWdoIHRoYXQgd2lsbCBzdGlsbCBmYWlsIGluIHRoZSBDSSwgdW50aWwgd2UgYnVtcCB0
byBuZXdlcgpjb21wb25lbnRzLgoKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBMZWNobmVyIDxkYXZp
ZEBsZWNobm9sb2d5LmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgY29uZmlncy9sZWdvX2V2M19kZWZjb25maWcgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9jb25maWdzL2xlZ29fZXYzX2RlZmNvbmZpZyBiL2NvbmZpZ3MvbGVnb19ldjNf
ZGVmY29uZmlnCj4gaW5kZXggYjRhMTAwMDAzNi4uNTU1YTYzZTM2YyAxMDA2NDQKPiAtLS0gYS9j
b25maWdzL2xlZ29fZXYzX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvbGVnb19ldjNfZGVmY29u
ZmlnCj4gQEAgLTQzLDcgKzQzLDcgQEAgQlIyX1RBUkdFVF9ST09URlNfU1FVQVNIRlM0X1haPXkK
PiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tD
T05GSUc9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAxOC4xMSIKPiArQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMS4wNyIKPiAgQlIyX1RBUkdFVF9VQk9PVF9CT0FS
RF9ERUZDT05GSUc9ImxlZ29ldjMiCj4gIAo+ICAjIGhvc3QKPiAtLSAKPiAyLjI1LjEKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
