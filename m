Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6278C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 18:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD2870833;
	Sun, 29 Oct 2023 18:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD2870833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sjz1ZrclHynD; Sun, 29 Oct 2023 18:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC7170815;
	Sun, 29 Oct 2023 18:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC7170815
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 288571BF33E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA7270815
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA7270815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWdX8CtnHFYA for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 18:45:39 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A43AE7080F
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 18:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43AE7080F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bcbc:1bd1:5057:b8bc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DB65E200587;
 Sun, 29 Oct 2023 19:45:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 19:45:33 +0100
Date: Sun, 29 Oct 2023 19:45:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <20231029184533.GY687180@scaer>
References: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698605137;
 bh=2JXkUIRPz9XrF8tDD+YMOfcYQjcwO8morVcEcRyJ3JY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H9PhZmOeSlvExS/Vv79DXm5LJB5O/cJn2HhFre+5RDDrdHLZbZ1lGEtb8OwSgGlLr
 tw/pPb5z59hieqFLoVpybGTA3ldbPuQzkASg8un2n/u2g/+au5dqpx4+xom9b8Pp6A
 kpwVa3qjV8P1aeslb9Dj178WFsME0uhBNmTjzzxWoukYu4CM9D8hhFtossyMy1A3VJ
 9WtZnVvIkytlVALs7zjMqqof8JHfA7va2PgDKDhsmibJuxnXCer35aQYymWNk6i9sP
 iEOuvSuQcuU757w0lnlEQ/pfaPLhZCfXY59m9596lNX4PoyM19bMFlHMjcI0c7ChwK
 AYoU0GwvmLANQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H9PhZmOe
Subject: Re: [Buildroot] [PATCH 1/2] board/licheepi_zero: move board files
 to their own directory
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTEwLTI3IDEzOjQ2ICswMjAwLCBGcmFuY29pcyBEdWdh
c3Qgc3Bha2UgdGh1c2x5Ogo+IEdyb3VwIGZpbGVzIGZvciBib2FyZCBsaWNoZWVwaV96ZXJvIHVu
ZGVyIGEgbmV3IGRpcmVjdG9yeS4gVGhpcyBpcwo+IHRvIHByZXBhcmUgZm9yIGEgbmV3IGJvYXJk
IGFsc28gY29taW5nIHRvIHRoZSBsaWNoZWVwaSBkaXJlY3RvcnkuCgpMaWNoZWVwaS16ZXJvIGlz
IGEgYm9hcmQgYnkgU2lwZWVkLCB0aGUgbWFudWZhY3R1cmVyLCBhbmQgd2UgYWxyZWFkeSBoYWQK
YSBzdWJkaXIgZm9yIHRoZW0sIHNvIEkgbW92ZWQgdGhlIGJvYXJkIGZpbGVzIHRoZXJlIHJhdGhl
ciB0aGFuCmludHJvZHVjZSB0aGUgYm9hcmQvbGljaGVlcGkvIHN1Yi1kaXIuCgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gU2lnbmVkLW9mZi1i
eTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3QuZm9zc0BnbWFpbC5jb20+Cj4gLS0t
Cj4gIGJvYXJkL2xpY2hlZXBpL3sgPT4gbGljaGVlcGlfemVyb30vYm9vdC5jbWQgICAgIHwgMAo+
ICBib2FyZC9saWNoZWVwaS97ID0+IGxpY2hlZXBpX3plcm99L2dlbmltYWdlLmNmZyB8IDAKPiAg
Ym9hcmQvbGljaGVlcGkveyA9PiBsaWNoZWVwaV96ZXJvfS9yZWFkbWUudHh0ICAgfCAwCj4gIGNv
bmZpZ3MvbGljaGVlcGlfemVyb19kZWZjb25maWcgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4g
IDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICByZW5h
bWUgYm9hcmQvbGljaGVlcGkveyA9PiBsaWNoZWVwaV96ZXJvfS9ib290LmNtZCAoMTAwJSkKPiAg
cmVuYW1lIGJvYXJkL2xpY2hlZXBpL3sgPT4gbGljaGVlcGlfemVyb30vZ2VuaW1hZ2UuY2ZnICgx
MDAlKQo+ICByZW5hbWUgYm9hcmQvbGljaGVlcGkveyA9PiBsaWNoZWVwaV96ZXJvfS9yZWFkbWUu
dHh0ICgxMDAlKQo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9saWNoZWVwaS9ib290LmNtZCBiL2Jv
YXJkL2xpY2hlZXBpL2xpY2hlZXBpX3plcm8vYm9vdC5jbWQKPiBzaW1pbGFyaXR5IGluZGV4IDEw
MCUKPiByZW5hbWUgZnJvbSBib2FyZC9saWNoZWVwaS9ib290LmNtZAo+IHJlbmFtZSB0byBib2Fy
ZC9saWNoZWVwaS9saWNoZWVwaV96ZXJvL2Jvb3QuY21kCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2xp
Y2hlZXBpL2dlbmltYWdlLmNmZyBiL2JvYXJkL2xpY2hlZXBpL2xpY2hlZXBpX3plcm8vZ2VuaW1h
Z2UuY2ZnCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVuYW1lIGZyb20gYm9hcmQvbGljaGVl
cGkvZ2VuaW1hZ2UuY2ZnCj4gcmVuYW1lIHRvIGJvYXJkL2xpY2hlZXBpL2xpY2hlZXBpX3plcm8v
Z2VuaW1hZ2UuY2ZnCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2xpY2hlZXBpL3JlYWRtZS50eHQgYi9i
b2FyZC9saWNoZWVwaS9saWNoZWVwaV96ZXJvL3JlYWRtZS50eHQKPiBzaW1pbGFyaXR5IGluZGV4
IDEwMCUKPiByZW5hbWUgZnJvbSBib2FyZC9saWNoZWVwaS9yZWFkbWUudHh0Cj4gcmVuYW1lIHRv
IGJvYXJkL2xpY2hlZXBpL2xpY2hlZXBpX3plcm8vcmVhZG1lLnR4dAo+IGRpZmYgLS1naXQgYS9j
b25maWdzL2xpY2hlZXBpX3plcm9fZGVmY29uZmlnIGIvY29uZmlncy9saWNoZWVwaV96ZXJvX2Rl
ZmNvbmZpZwo+IGluZGV4IDBkMzExNWE5OTYuLmM4Zjc0YTdmMDQgMTAwNjQ0Cj4gLS0tIGEvY29u
Zmlncy9saWNoZWVwaV96ZXJvX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvbGljaGVlcGlfemVy
b19kZWZjb25maWcKPiBAQCAtMTIsNyArMTIsNyBAQCBCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9
IldlbGNvbWUgdG8gQnVpbGRyb290IGZvciB0aGUgTGljaGVlUGkgWmVybyIKPiAgQlIyX1RBUkdF
VF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eVMwIgo+ICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlf
QkFVRFJBVEVfMTE1MjAwPXkKPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9y
dC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+IC1CUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1j
IGJvYXJkL2xpY2hlZXBpL2dlbmltYWdlLmNmZyIKPiArQlIyX1JPT1RGU19QT1NUX1NDUklQVF9B
UkdTPSItYyBib2FyZC9saWNoZWVwaS9saWNoZWVwaV96ZXJvL2dlbmltYWdlLmNmZyIKPiAgCj4g
ICMgS2VybmVsCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+IEBAIC00NSw3ICs0NSw3IEBAIEJSMl9U
QVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTT15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NV
U1RPTV9OQU1FPSJ1LWJvb3Qtc3VueGktd2l0aC1zcGwuYmluIgo+ICBCUjJfUEFDS0FHRV9IT1NU
X1VCT09UX1RPT0xTPXkKPiAgQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MU19CT09UX1NDUklQ
VD15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfQk9PVF9TQ1JJUFRfU09VUkNFPSJi
b2FyZC9saWNoZWVwaS9ib290LmNtZCIKPiArQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MU19C
T09UX1NDUklQVF9TT1VSQ0U9ImJvYXJkL2xpY2hlZXBpL2xpY2hlZXBpX3plcm8vYm9vdC5jbWQi
Cj4gIAo+ICAjIFJlcXVpcmVkIGhvc3QgdXRpbGl0aWVzIGZvciBidWlsZGluZyBhbiBTRENhcmQg
aW1hZ2UKPiAgQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiAtLSAKPiAyLjMwLjIKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
