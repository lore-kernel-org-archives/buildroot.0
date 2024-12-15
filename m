Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDA1E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 18:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B2B781076;
	Sun, 15 Dec 2024 18:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSYzpnG9qIeh; Sun, 15 Dec 2024 18:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2564381FDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2564381FDE;
	Sun, 15 Dec 2024 18:39:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA82BD1
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 18:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A0CD6082F
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 18:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dy-Zd6FIwJDy for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 18:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6020E605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6020E605E9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6020E605E9
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 18:39:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EE8942003C6;
 Sun, 15 Dec 2024 19:39:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60364])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Dec 2024 19:39:34 +0100
MIME-Version: 1.0
Date: Sun, 15 Dec 2024 19:39:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Martin_B=C3=B6h?= <martin@familie-boeh.de>
Cc: buildroot@buildroot.org, Marek Belisko <marek.belisko@open-nandra.com>
In-Reply-To: <93027240-dc7b-41e1-8dcd-8bdadbb3f239@email.android.com>
References: <93027240-dc7b-41e1-8dcd-8bdadbb3f239@email.android.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <47b077d5b77977f476bc5a6b2f6fbb91@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734287978;
 bh=EfuHQuEo3P27hvFqJGANYdJA5JC4EmnI/QmJ7Pw/VgE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ndFRK+/PvnOldraKftCeqLq8Uv0Sla+oBCY23pSQVsUdBdvYq75IZSxCrcqA88O2q
 gfmPCuCyc2ZejobdWJHC9HdF0EN4GJAi3v93b0OxZKsmHSXPAekRqvPalCuzj7YEAZ
 FzsNXqNjneSkFVzwJWsuhy09q/RrGrrL0ceedMqLxTXST5E7hZrxXOeFgvlvJIT/s4
 sIKbhnmXat7fE5IfZDBYC2thufHPHni7QFiLhBTVsUTX3dHto2/ek416Cgaxlg6r8e
 CIr94XddoAtPOGJmVPFF0XcM6JummTL1qFPwUPSTxkPjs176I1naWhWcizTHhGdLxH
 hvKJZX3XS+J4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ndFRK+/P
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: fix permissions after
 version bump to 125
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFydGluLAoKT24gMTUvMTIvMjAyNCAxMzoxNCwgTWFydGluIELDtmggd3JvdGU6Cj4gSGV5
IEp1bGllbiEKPiAKPiBJIG1vZGlmaWVkIGl0IHRvIDB4eHggYmVjYXVzZSBvZiB0aGUgcG9zdCBi
dWlsZCBzdGVwIG1lc3NhZ2UgZm91bmQKPiBoZXJlOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9w
b2xraXQtb3JnL3BvbGtpdC9ibG9iL2MxMzY5Y2Q0ZmZiOTc1ZTE3NzAzNTM5MjgzN2ZmOTEzNzM3
NzQ0MDcvbWVzb25fcG9zdF9pbnN0YWxsLnB5I0w2MgoKT2ssIHVuZGVyc3Rvb2QuIFRoYW5rcyBm
b3IgdGhlIGV4cGxhbmF0aW9uLiBCdWlsZHJvb3QgaXMgdXNpbmcKIm1ha2VkZXZzIiB3aGljaCBh
bHdheXMgc2NhbnMgcGVybWlzc2lvbnMgaW4gb2N0YWwgcmVwcmVzZW50YXRpb24uClNlZSBbMV0g
WzJdLiBTbyB0aG9zZSBsZWFkaW5nIHplcm9lcyBhcmUgdW5uZWVkZWQgaGVyZS4gSSByZW1vdmVk
CnRob3NlIHdoZW4gYXBwbHlpbmcgdGhlIHBhdGNoIGluIFszXSwgdG8ga2VlcCBhbGwgQnVpbGRy
b290Cl9QRVJNSVNTSU9OUyB0byB0aGUgc2FtZSBmb3JtYXQuCgpPdXQgb2YgY3VyaW9zaXR5OiB3
aGF0IHdhcyB5b3VyIHVzZSBjYXNlIHNob3dpbmcgdGhlIGZhaWx1cmU/CgpUaGVyZSBpcyBhIHBv
bGtpdCBydW50aW1lIHRlc3QgaW4gQnVpbGRyb290IFs0XSB3aGljaCBkaWQgbm90CmRldGVjdGVk
IHRoaXMgcGVybWlzc2lvbiBpc3N1ZS4gU2VlIFs1XS4gV2UgY291bGQgbWF5YmUgaW1wcm92ZQp0
aGlzIHRlc3Qgd2l0aCB5b3VyIHVzZSBjYXNlLgoKPiBLaW5kIHJlZ2FyZHMKPiBNYXJ0aW4KPiAK
PiBPbiAxNCBEZWMgMjAyNCAyMzowOCwgSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3Jv
dGU6Cj4gCj4+IEhpIE1hcnRpbiwKPj4gCj4+IE9uIDEzLzEyLzIwMjQgMDY6MzksIE1hcnRpbiBC
w7ZoIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+PiBGcm9tOiBNYXJ0aW4gQsO2aCA8Y29udGFjdEBt
YXJ0Yi5kZXY+Cj4+PiAKPj4+IFRoZSBzZXJ2aWNlIGZhaWxlZCB0byBzdGFydCBjb3JyZWN0bHkg
aWYgYW55IGN1c3RvbSBydWxlcyB3ZXJlCj4+PiBpbnN0YWxsZWQuCj4+PiBUaGlzIGNvbW1pdCBh
bGlnbnMgdGhlIHBlcm1pc3Npb25zIHdpdGggdGhlIHVwc3RyZWFtIG1lc29uIGJ1aWxkCj4+IHN0
ZXAuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBCw7ZoIDxjb250YWN0QG1hcnRiLmRl
dj4KPj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IHBhY2thZ2UvcG9sa2l0L3BvbGtp
dC5tayB8IDggKysrKy0tLS0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BvbGtpdC9wb2xraXQu
bWsgYi9wYWNrYWdlL3BvbGtpdC9wb2xraXQubWsKPj4+IGluZGV4IGZiNDlmNmNlMmEuLjZjZDJh
YTYwNDIgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL3BvbGtpdC9wb2xraXQubWsKPj4+ICsrKyBi
L3BhY2thZ2UvcG9sa2l0L3BvbGtpdC5tawo+Pj4gQEAgLTU2LDEwICs1NiwxMCBAQCBkZWZpbmUg
UE9MS0lUX1VTRVJTCj4+PiBlbmRlZgo+Pj4gCj4+PiBkZWZpbmUgUE9MS0lUX1BFUk1JU1NJT05T
Cj4+PiAtIC9ldGMvcG9sa2l0LTEvcnVsZXMuZCBkIDcwMCBwb2xraXRkIHJvb3QgLSAtIC0gLSAt
Cj4+PiAtIC91c3Ivc2hhcmUvcG9sa2l0LTEvcnVsZXMuZCBkIDcwMCBwb2xraXRkIHJvb3QgLSAt
IC0gLSAtCj4+PiAtIC91c3IvYmluL3BrZXhlYyBmIDQ3NTUgcm9vdCByb290IC0gLSAtIC0gLQo+
Pj4gLSAvdXNyL2xpYi9wb2xraXQtMS9wb2xraXQtYWdlbnQtaGVscGVyLTEgZiA0NzU1IHJvb3Qg
cm9vdCAtIC0gLSAtCj4+IC0KPj4+ICsgL2V0Yy9wb2xraXQtMS9ydWxlcy5kIGQgNzUwIHJvb3Qg
cG9sa2l0ZCAtIC0gLSAtIC0KPj4+ICsgL3Vzci9zaGFyZS9wb2xraXQtMS9ydWxlcy5kIGQgNzUw
IHJvb3QgcG9sa2l0ZCAtIC0gLSAtIC0KPj4gCj4+IEkgdW5kZXJzdGFuZCB0aG9zZSB0d28gZGly
ZWN0b3JpZXMgbmVlZHMgdGhvc2UgdXBkYXRlcywgZHVlIHRvCj4+IHVwc3RyZWFtCj4+IGNoYW5n
ZXMgc3VjaCBhczoKPj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL3BvbGtpdC1vcmcvcG9sa2l0L2Nv
bW1pdC9iNjE2OWYzMTEzYjNjZTVlZDgyMmU2NmFkY2M5NjI4NTBjMjQ2NjBhCj4+IAo+PiAKPj4+
ICsgL3Vzci9iaW4vcGtleGVjIGYgMDQ3NTUgcm9vdCByb290IC0gLSAtIC0gLQo+Pj4gKyAvdXNy
L2xpYi9wb2xraXQtMS9wb2xraXQtYWdlbnQtaGVscGVyLTEgZiAwNDc1NSByb290IHJvb3QgLSAt
IC0KPj4gLSAtCj4+IAo+PiBXaHkgZGlkIHlvdSB1cGRhdGVkIC91c3IvYmluL3BrZXhlYyBhbmQK
Pj4gL3Vzci9saWIvcG9sa2l0LTEvcG9sa2l0LWFnZW50LWhlbHBlci0xCj4+IHRvIHJlcGxhY2Ug
NDc1NSBieSAwNDc1NT8gKHRoZXJlIGlzIG5vIGp1c3RpZmljYXRpb24gaW4gdGhlIGNvbW1pdAo+
PiBsb2cpLgo+PiAKPj4+IGVuZGVmCj4+PiAKPj4+IGRlZmluZSBQT0xLSVRfSU5TVEFMTF9JTklU
X1NZU1RFTUQKPj4+IC0tCj4+PiAyLjQ3LjEKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IAo+PiBKdWxpZW4u
CgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCgpbMV0gCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4xMS9wYWNrYWdlL21ha2VkZXZzL21ha2VkZXZz
LmMjTDUzMQpbMl0gCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2Jsb2IvbWFzdGVyL2RvY3MvbWFudWFsL21ha2VkZXYtc3ludGF4LmFkb2MKWzNdIApodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvNjg4NDEyN2NiZTk4
Y2Q3ODgxYTZmM2NiYTViZmFlNGY3NTM3NjNiMApbNF0gCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfcG9sa2l0LnB5Cls1XSAKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icz9uYW1lPXRlc3RzLnBhY2thZ2UudGVzdF9wb2xraXQuVGVzdFBv
bGtpdFN5c3RlbWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
