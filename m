Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EFAC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845A243653;
	Thu, 30 Nov 2023 22:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845A243653
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5g_Em8ohOU6; Thu, 30 Nov 2023 22:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84BE143661;
	Thu, 30 Nov 2023 22:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84BE143661
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67D291BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B7341925
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B7341925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id is-ut_afk82b for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:48:40 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 361ED4174E
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 361ED4174E
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8ppj-008zKl-Fw; Thu, 30 Nov 2023 23:48:35 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 165c2164;
 Thu, 30 Nov 2023 22:48:34 +0000 (UTC)
Date: Fri, 1 Dec 2023 00:48:34 +0200
Message-ID: <20231201004834.GH232434@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20231114150725.GD1974649@igalia.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-2-thomas@devoogdt.com>
 <20231114150725.GD1974649@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w63IkDpIQdRsjeES0Bc7PQ+BbF1zLe6vt85OVSb55Js=; b=D7h5j66bgRCveKVAy91gan1uY9
 JM4Eo2DF7ix6dzlZBTWp6iLkbCp1FmkYCOftL5FvCDOwBbi3ox5NUD3c7afibUS1WFtthFXwdqNBJ
 4hyjzmPmpoBbuwZHb9BVRmV3TGCIyfaGyzR2nMEavtJLReGnGXykJlktPv+aGG9fgJCW+A/uUNCkq
 x32p+RPv2tCUiMtmKF4XaYOzkxzH/81gy5wJ0ed4HKmniIbbW24tkdRDoY2XWk05AOT2yFv2bRdXD
 3M/3Fl/aEf9eQVTAazEESsypzrjftIqZONXrNYvZU16D2d/dFrcVZeLMU9XXLb3+vadhhKdFThrDe
 Wd7QxRTA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=D7h5j66b
Subject: Re: [Buildroot] [PATCH v5 2/3] package/webkitgtk: select
 wpebackend-fdo if wayland target is enabled
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============8354095176002378458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8354095176002378458==
Content-Type: multipart/signed; boundary="xGa2JW6JnyTSLF0Q"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--xGa2JW6JnyTSLF0Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAxNCBOb3YgMjAyMyAxNTowNzoyNSArMDIwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAxMCBOb3YgMjAyMyAxNzo0Njox
NiArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+ID4g
bGlid2VwICYgd3BlYmFja2VuZC1mZG8gYXJlIG1hbmRhdG9yeSBpZiBFTkFCTEVfV0FZTEFORF9U
QVJHRVQgYW5kIEVHTF9GT1VORAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQv
YmxvYi8yZTM1ODkwYjFmYTlkYTM5ZmZhYTg4ZTBhY2Q5NzNiZWI1NWQ0YWQyL1NvdXJjZS9jbWFr
ZS9PcHRpb25zR1RLLmNtYWtlI0wzODgtTDQwMAo+ID4gCj4gPiBlZ2wgaXMgbWFuZGF0b3J5IGlm
IEVOQUJMRV9XQVlMQU5EX1RBUkdFVAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJL
aXQvYmxvYi8yZTM1ODkwYjFmYTlkYTM5ZmZhYTg4ZTBhY2Q5NzNiZWI1NWQ0YWQyL1NvdXJjZS9j
bWFrZS9PcHRpb25zR1RLLmNtYWtlI0w0NjItTDQ3Mwo+ID4gCj4gPiBTbyB3cGViYWNrZW5kLWZk
byAoLT4gbGlid3BlKSBoYXMgdG8gYmUgc2VsZWN0ZWQgaWYgQlIyX1BBQ0tBR0VfTElCR1RLM19X
QVlMQU5ELgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5k
ZXZvb2dkdEBiYXJjby5jb20+Cj4gCj4gVGVzdGVkLUJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4KCkFja2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxh
cGVyZXpAaWdhbGlhLmNvbT4KIAo+ID4gLS0tCj4gPiB2Mjogbi9hCj4gPiB2Myw0LDU6IG5vIGNo
YW5nZSAoYWRkZWQgZnJvbSBhbm90aGVyIHBhdGNoIHNlcmllKQo+ID4gLS0tCj4gPiAgcGFja2Fn
ZS93ZWJraXRndGsvQ29uZmlnLmluICAgIHwgMSArCj4gPiAgcGFja2FnZS93ZWJraXRndGsvd2Vi
a2l0Z3RrLm1rIHwgMiArLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay9Db25m
aWcuaW4gYi9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiA+IGluZGV4IDkyNzc5MmIxZTQu
LmNiMTA3ODQxMzMgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4K
PiA+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+ID4gQEAgLTUzLDYgKzUzLDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1dFQktJVEdUSwo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0Vf
V0VCUAo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfV0VCUF9ERU1VWAo+ID4gIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfV09GRjIKPiA+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPIGlm
IEJSMl9QQUNLQUdFX0xJQkdUSzNfV0FZTEFORAo+ID4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfWExJ
Ql9MSUJYQ09NUE9TSVRFIGlmIEJSMl9QQUNLQUdFX0xJQkdUSzNfWDExCj4gPiAgCXNlbGVjdCBC
UjJfUEFDS0FHRV9YTElCX0xJQlhEQU1BR0UgaWYgQlIyX1BBQ0tBR0VfTElCR1RLM19YMTEKPiA+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWFJFTkRFUiBpZiBCUjJfUEFDS0FHRV9MSUJH
VEszX1gxMQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayBi
L3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+ID4gaW5kZXggODhiZGZhZTI3Yi4uOWM2
OGZlNzNjZiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+
ID4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gPiBAQCAtMTE1LDcgKzEx
NSw3IEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCR1RLM19YMTEpOiQoQlIyX1BBQ0tBR0VfTElC
R1RLM19XQVlMQU5EKTokKEJSMl9QQUNLQUdFX0xJCj4gPiAgV0VCS0lUR1RLX0RFUEVOREVOQ0lF
UyArPSBsaWJlZ2wKPiA+ICBlbmRpZgo+ID4gIAo+ID4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElC
R1RLM19XQVlMQU5EKSQoQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8pLHl5KQo+ID4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8pLHkpCj4gPiAgV0VCS0lUR1RLX0NPTkZfT1BU
UyArPSAtRFVTRV9XUEVfUkVOREVSRVI9T04KPiA+ICBXRUJLSVRHVEtfREVQRU5ERU5DSUVTICs9
IHdwZWJhY2tlbmQtZmRvCj4gPiAgZWxzZQo+ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+IAo+IAo+IENo
ZWVycywKPiDigJRBZHJpw6FuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCkNoZWVycywK4oCUQWRyacOhbgo=

--xGa2JW6JnyTSLF0Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZWkRQgAKCRCRxVnb5MkS
O1U/AJ95FStTI6beY6Fwgv22trUn815+LQCfe2/K9l1MPyErwv4iz0ZHAMSBsyc=
=qs8d
-----END PGP SIGNATURE-----

--xGa2JW6JnyTSLF0Q--

--===============8354095176002378458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8354095176002378458==--
