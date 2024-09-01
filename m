Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C1CD342A
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AC040403;
	Sun,  1 Sep 2024 16:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiZJtmI-RLAl; Sun,  1 Sep 2024 16:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5DE0404CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5DE0404CA;
	Sun,  1 Sep 2024 16:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 483521BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 366C280ED8
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZScYMGGX_8ah for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D3D980C4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D3D980C4E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D3D980C4E
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:25:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 891AD13F8AD;
 Sun,  1 Sep 2024 18:24:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Sep 2024 18:24:56 +0200
Date: Sun, 1 Sep 2024 18:24:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZtSVWOOM9d57FC6h@landeda>
References: <20240901-aer-v1-1-03b124cb64b1@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901-aer-v1-1-03b124cb64b1@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725207898;
 bh=G85jPmL915Lj3+o0rCsgkE0HaWw1sVOuRwZSU+fEKHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tz0jziUjOEuPWeOEGJcOWej+nH0FYPOaD8woYQNptIua2gyMRh4D61ET7O3eZPh0K
 nUrP2GxR9S570Eh3dsWzSHtgUSy7ceoieHiZRo5kxTwsIWK7DgSxs5yECADiNd5w5m
 7mq3oA02AfklcdJFeVJ0MuLNSKwABZoDFwu59svDd/9EIUu0+ic5+3LYjlqK+RfX5R
 7ojRYjUwvOfjQeMee+RP8dhY1xIJus2t7H5WmyTE0A9dfiw1StuQ5+NP62cB0P1a1Y
 LmmUCRCkzGjgvh2V1s6fSAp1XVD1/blHhDLFeAAz63qLVlgvdliBzRC5okR0mtzZDL
 erf+WSrqd/Neg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tz0jziUj
Subject: Re: [Buildroot] [PATCH] package/aer-inject: switch upstream
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

Si4sIEFsbCwKCk9uIDIwMjQtMDktMDEgMTg6MTEgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEFjY29yZGluZyB0byBhIGNvbW1pdCBpbiBMaW51eFsx
XSwgdGhlIHVwc3RyZWFtIG9mIGFlci1pbmplY3QgY2hhbmdlZCB0bwo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC9hZXItaW5qZWN0Lgo+IAo+IFRoZSBoYXNoIGNoYW5nZWQgYmVjYXVzZSB0aGUg
dGFyYmFsbCBpcyBnZW5lcmF0ZWQgZGlmZmVyZW50bHkuCj4gCj4gWzFdOiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL2xpbnVzL2EyOWU1MjkwZTM1NjZhZTRkYjRlNmZlNWYzMWNhZjIzMTE4YzgyYjYK
PiAKPiAtLS0KPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBn
bXgubmV0Pgo+IC0tLQo+ICBwYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5oYXNoIHwgMiAr
LQo+ICBwYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5tayAgIHwgMyArLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvYWVyLWluamVjdC9hZXItaW5qZWN0Lmhhc2ggYi9wYWNrYWdlL2Flci1pbmpl
Y3QvYWVyLWluamVjdC5oYXNoCj4gaW5kZXggM2I5ZDE0NGVjOS4uZWUwOTdjODczYSAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9hZXItaW5qZWN0L2Flci1pbmplY3QuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2Fs
bHkgY29tcHV0ZWQKPiAtc2hhMjU2ICA3ZWQ1OTk0YjQ4ZjFjMDUwNGFkZDM4MGJhNGQxODZmNDhh
NWEyMmI5YmMyZGQ5MGM3OWQwZDJmMGMxODM1NDBjICBhZXItaW5qZWN0LTliZDVlMmM3ODg2ZmNh
NzJmMTM5Y2Q4NDAyNDg4YTIyMzU5NTdkNDEtZ2l0NC50YXIuZ3oKPiArc2hhMjU2ICA0OWE0NGI3
YTllMzk4M2RjMTVmZGM1YmFjZDBlMDk1ZGY2NTAyOTYwMjRmNDNmOWQ2YzA4MGFkNTRkZTBiMDdm
ICBhZXItaW5qZWN0LTliZDVlMmM3ODg2ZmNhNzJmMTM5Y2Q4NDAyNDg4YTIyMzU5NTdkNDEudGFy
Lmd6Cj4gIHNoYTI1NiAgNjU5YTE5MWQ4Nzc1ZTA1YzZjNmE5YTRiYTY2YjM1NzdjNTc3MzQyYmI4
M2YyMGQzOTMxMzVlYjY2MzNjODk3MyAgUkVBRE1FCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWVy
LWluamVjdC9hZXItaW5qZWN0Lm1rIGIvcGFja2FnZS9hZXItaW5qZWN0L2Flci1pbmplY3QubWsK
PiBpbmRleCA2YmM5Y2I0NGRhLi5kMGFlM2NjNTE2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYWVy
LWluamVjdC9hZXItaW5qZWN0Lm1rCj4gKysrIGIvcGFja2FnZS9hZXItaW5qZWN0L2Flci1pbmpl
Y3QubWsKPiBAQCAtNSw4ICs1LDcgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiAg
QUVSX0lOSkVDVF9WRVJTSU9OID0gOWJkNWUyYzc4ODZmY2E3MmYxMzljZDg0MDI0ODhhMjIzNTk1
N2Q0MQo+IC1BRVJfSU5KRUNUX1NJVEUgPSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9nb25nLmNoZW4vYWVyLWluamVjdC5naXQKPiAtQUVSX0lOSkVDVF9T
SVRFX01FVEhPRCA9IGdpdAo+ICtBRVJfSU5KRUNUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGludGVs
LGFlci1pbmplY3QsJChBRVJfSU5KRUNUX1ZFUlNJT04pKQoKUGxlYXNlLCBrZWVwIHVzaW5nIHRo
ZSBnaXQgZG93bmxvYWQgYmFja2VuZCwgcmF0aGVyIHRoYW4gdXNlIHRoZSBnaXRodWIKbWFjcm87
IGFuZCBqdXN0IGNoYW5nZSB0aGUgX1NJVEUuIFRoaXMgd2F5LCB0aGUgaGFzaCB3aWxsIG5vdCBj
aGFuZ2UuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgQUVSX0lOSkVDVF9MSUNFTlNFID0g
R1BMLTIuMAo+ICBBRVJfSU5KRUNUX0xJQ0VOU0VfRklMRVMgPSBSRUFETUUKPiAgQUVSX0lOSkVD
VF9ERVBFTkRFTkNJRVMgPSBob3N0LWZsZXggaG9zdC1iaXNvbgo+IAo+IC0tLQo+IGJhc2UtY29t
bWl0OiAzNzgwMTc2N2Y2OGMwNTUwMGYxZDQ0OTViNWJhYWMwZTczNDBmN2E5Cj4gY2hhbmdlLWlk
OiAyMDI0MDkwMS1hZXItZGMyMzVjZjhlNDgzCj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gSi4g
TmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
