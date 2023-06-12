Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC378C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A17640217;
	Mon, 12 Jun 2023 20:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A17640217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pLW3Kg7dR1h; Mon, 12 Jun 2023 20:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EFFE40136;
	Mon, 12 Jun 2023 20:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EFFE40136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB4E31BF2BF
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D212681EB0
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 20:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D212681EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzPjta7ofXUr for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 20:16:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBD68202B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBBD68202B
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 20:16:51 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74D7F240005;
 Mon, 12 Jun 2023 20:16:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q8ny3-003dOV-I0; Mon, 12 Jun 2023 22:16:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230210233658.3763549-1-romain.naour@gmail.com>
 <20230211104934.4c34267c@windsurf>
 <7bbd1030-488a-9876-7c69-0ac6ae15653e@smile.fr>
 <628684a7-6ad9-1055-ad0b-065761105349@smile.fr>
Date: Mon, 12 Jun 2023 22:16:47 +0200
In-Reply-To: <628684a7-6ad9-1055-ad0b-065761105349@smile.fr> (Romain Naour's
 message of "Wed, 10 May 2023 12:06:27 +0200")
Message-ID: <875y7szb9s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/busybox: disable stack optimization
 for i386 target
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdy
aXRlczoKCiA+IEhlbGxvIFRob21hcywgQWxsLAogPiBMZSAxMS8wMi8yMDIzIMOgIDExOjEwLCBS
b21haW4gTmFvdXIgYSDDqWNyaXTCoDoKID4+IEhlbGxvIFRob21hcywKID4+IAogPj4gTGUgMTEv
MDIvMjAyMyDDoCAxMDo0OSwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0
wqA6CiA+Pj4gT24gU2F0LCAxMSBGZWIgMjAyMyAwMDozNjo1OCArMDEwMAogPj4+IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6CiA+Pj4gCiA+Pj4+IFRoZSB0b29s
Y2hhaW4tYnVpbGRlciBwcm9qZWN0IHJlcG9ydGVkIGFuIGlzc3VlIHdpdGggUWVtdSA3LjIuMCBm
b3IKID4+Pj4geDg2LWNvcmUyLS1nbGliYy0tYmxlZWRpbmctZWRnZSB0b29sY2hhaW4gWzFdOgog
Pj4+PiAKID4+Pj4gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzCiA+Pj4+IHJhbmRvbTog
ZmFzdCBpbml0IGRvbmUKID4+Pj4gRVhUNC1mcyAodmRhKTogd2FybmluZzogbW91bnRpbmcgdW5j
aGVja2VkIGZzLCBydW5uaW5nIGUyZnNjayBpcyByZWNvbW1lbmRlZAogPj4+PiBFWFQ0LWZzICh2
ZGEpOiByZS1tb3VudGVkLiBPcHRzOiAobnVsbCkuIFF1b3RhIG1vZGU6IGRpc2FibGVkLgogPj4+
PiBTdGFydGluZyBzeXNsb2dkOiBPSwogPj4+PiB0cmFwczogc3lzbG9nZFs1Ml0gZ2VuZXJhbCBw
cm90ZWN0aW9uIGZhdWx0IGlwOmI3ZTIxNDY1CiA+Pj4+IHNwOmJmZTU5ZTZjIGVycm9yOjAgaW4g
bGliYy5zby42W2I3ZDliMDAwKzEyMzAwMF0KID4+Pj4gU3RhcnRpbmcga2xvZ2Q6IE9LCiA+Pj4+
IHRyYXBzOiBrbG9nZFs1Nl0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGlwOmI3ZTk0NDY1CiA+
Pj4+IHNwOmJmOGYwNjljIGVycm9yOjAgaW4gbGliYy5zby42W2I3ZTBlMDAwKzEyMzAwMF0KID4+
Pj4gUnVubmluZyBzeXNjdGw6IHRyYXBzOiBsb2dnZXJbNjJdIGdlbmVyYWwgcHJvdGVjdGlvbiBm
YXVsdAogPj4+PiBpcDpiN2U0OGI2YyBzcDpiZmQ3ZDE5NCBlcnJvcjowIGluIGxpYmMuc28uNlti
N2UwNTAwMCsxMjMwMDBdCiA+Pj4+IFNlZ21lbnRhdGlvbiBmYXVsdAogPj4+PiB0cmFwczogbG9n
Z2VyWzY0XSBnZW5lcmFsIHByb3RlY3Rpb24gZmF1bHQgaXA6YjdkZDNiNmMKID4+Pj4gc3A6YmY5
Yjg2MDQgZXJyb3I6MCBpbiBsaWJjLnNvLjZbYjdkOTAwMDArMTIzMDAwXQogPj4+PiBTZWdtZW50
YXRpb24gZmF1bHQKID4+Pj4gCiA+Pj4+IChGb2xsb3dlZCBieSBhIGtlcm5lbCBwYW5pYy4pCiA+
Pj4+IAogPj4+PiBUZXN0aW5nIHdpdGggdGhlIHBldmlvdXMgUWVtdSByZWxlYXNlICg3LjEuMCkg
YWxsb3dzIHRvIGJvb3QgdGhlCiA+Pj4+IHN5c3RlbSB3aXRob3V0IGFueSBwcm9ibGVtLgogPj4+
PiAKID4+Pj4gQnVpbGRpbmcgcWVtdSBzb3VyY2VzIGJldHdlZW4gNy4xLjAgYW5kIDcuMi4wIGFs
bG93cyB0byBpZGVudGlmeQogPj4+PiB0aGUgZmlyc3QgImJhZCIgY29tbWl0IFsyXSBhbmQKID4+
Pj4gcmVwb3J0IHRvIHRoZSBRZW11IHByb2plY3QgWzNdLgogPj4+PiAKID4+Pj4gVGhhbmtzIHRv
IFFlbXUgbWFpbnRhaW5lcnMgcmV2aWV3LCBzZXZlcmFsIGlzc3VlcyB3YXMgbm90aWNlZDoKID4+
Pj4gCiA+Pj4+ICJUaGUgZGVmYXVsdCBpMzg2IGJ1c3lib3ggYnVpbGQgY29uZmlnIGRvZXMgbm90
IHJlc3BlY3QgZ2xpYmMncwogPj4+PiByZXF1aXJlbWVudHMgYXJvdW5kIHN0YWNrIGFsaWdubWVu
dAogPj4+PiAoc2VlIFs0XSBmb3IgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYW5kIGEgd29ya2Fyb3Vu
ZCkuIgogPj4+PiAKID4+Pj4gRGlzYWJsaW5nIENPTkZJR19TVEFDS19PUFRJTUlaQVRJT05fMzg2
IG9wdGlvbiAoYXMgc3VnZ2VzdGVkIGluCiA+Pj4+IHRoZSBHZW50b28gYnVnIHJlcG9ydCkgZml4
ZWQgdGhlIGlzc3VlIQogPj4+PiAKID4+Pj4gVGhpcyBvcHRpb24gaGFzIGJlZW4gYWRkZWQgYW5k
IGVuYWJsZWQgYnkgZGVmYXVsdCBpbiBidXh5Ym94CiA+Pj4+IDFfMjlfMCwgc28gaXQgd2FzIHVz
ZWQgc2luY2UgdGhlbiB0aGUgZm9yCiA+Pj4+IEJ1aWxkcm9vdCdzIHFlbXUgZGVmY29uZmlnLgog
Pj4+PiAKID4+Pj4gTm90ZTogVGhlIHg4Ni1pNjg2LS1nbGliYy0tYmxlZWRpbmctZWRnZSAoZ2Vu
ZXJpYyB4ODYpIGRvZXNuJ3QgdHJpZ2dlciB0aGUgaXNzdWUgd2l0aAogPj4+PiBDT05GSUdfU1RB
Q0tfT1BUSU1JWkFUSU9OXzM4NiBlbmFibGVkLgogPj4+PiAKID4+Pj4gRml4ZXM6CiA+Pj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMv
MzczMTY4MzMzNwogPj4+PiAKID4+Pj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMzczMTY4MzMzNwogPj4+PiBbMl0gaHR0cHM6
Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29tbWl0Lzk1OGUxZGQxMzAwZjM3ZjE4
YjIxNjFkZmI0ZWI4MDZmYzhjMTliNDQKID4+Pj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11
LXByb2plY3QvcWVtdS8tL2lzc3Vlcy8xNDc4CiA+Pj4+IFs0XSBodHRwczovL2J1Z3MuZ2VudG9v
Lm9yZy83MjU2NzQKID4+PiAKID4+PiBUaGFua3MgYSBsbyBmb3IgdGhlIGdyZWF0IGludmVzdGln
YXRpb24uIERvIHdlIHVuZGVyc3RhbmQgcHJlY2lzZWx5CiA+Pj4gd2hhdCBpcyBoYXBwZW5pbmc/
IFRoZSBsaW5rIGF0IFs0XSBkb2VzIG5vdCByZWFsbHkgaGF2ZSBhbiBleHBsYW5hdGlvbiwKID4+
PiBpdCBvbmx5IGhhcyBleHBlcmltZW50YWwgb2JzZXJ2YXRpb25zIHRoYXQgbGVhZCB0byB0aGUg
Y29uY2x1c2lvbiB0aGF0CiA+Pj4gZGlzYWJsaW5nIENPTkZJR19TVEFDS19PUFRJTUlaQVRJT05f
Mzg2IGlzIGEgd29yay1hcm91bmQsIGJ1dCBpdCBkb2VzCiA+Pj4gbm90IHJlYWxseSBleHBsYWlu
IHdoYXQgaXMgaGFwcGVuaW5nLgogPj4gCiA+PiBBY3R1YWxseSB0aGVyZSBhcmUgdHdvIGRpZmZl
cmVudCBpc3N1ZXMgdGhhdCBjb250cmlidXRlIHRvIHRoaXMgaXNzdWU6CiA+PiAKID4+IDEpIEFu
IGV4aXN0aW5nIGxhdGVudCBCdXN5Ym94IGJ1ZyBvbiBpMzg2IChidXN5Ym94IGNvbXBpbGVkIHdp
dGgKID4+IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTIpCiA+PiAKID4+IGh0dHBzOi8vbGlz
dHMuZGViaWFuLm9yZy9kZWJpYW4tYm9vdC8yMDE4LzAxL21zZzAwMzUyLmh0bWwKID4+IAogPj4g
MikgQSBRZW11IGltcHJvdmVtZW50IHRoYXQgdHJpZ2dlciBhbiBleGNlcHRpb24gb24gdW5hbGln
bmVkIG1lbW9yeSBhY2Nlc3NlcwogPj4gdGhhdCByZXF1aXJlIDE2LWJ5dGUgYWxpZ25tZW50Lgog
Pj4gCiA+PiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvOTU4
ZTFkZDEzMDBmMzdmMThiMjE2MWRmYjRlYjgwNmZjOGMxOWI0NAogPj4gCiA+PiBJIGRpZG4ndCBk
aWdnaW5nIGZ1cnRoZXIgdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGlzc3VlLgoKID4gU2V2ZXJhbCBi
dWcgcmVwb3J0IGFyZSBjb25maXJtaW5nIGEgc3RhY2sgcHJvYmxlbSBkdWUgdG8gdGhlIGkzODYg
R0NDIEFCSSB3aGljaAogPiBhc3N1bWVzIHRoZSBzdGFjayBpcyAxNi1ieXRlIGFsaWduZWQgWzFd
IFsyXS4gVGhlIGdjYydzIGRlZmF1bHQgQUJJIGZvcgogPiBpMzg2LWxpbnV4LWdudSB3YXMgcXVp
ZXRseSBjaGFuZ2VkIFszXSAobWF5YmUgYmV0d2VlbiBnY2MgOSBhbmQgZ2NjIDEwKS4KCiA+IE5v
dGU6IFdoZW4gdGhlIG9wdGlvbiB3YXMgYWRkZWQgdG8gQnVzeWJveCBhbmQgZW5hYmxlZCBieSBk
ZWZhdWx0LCB0aGUgaGVscCB0ZXh0CiA+IGV4cGxhaW5zIHRoYXQgdGhpcyBvcHRpb24gbWF5IG5v
dCB3b3JrIHdpdGggc29tZSBsaWJjIHZlcnNpb25zOgoKID4gIlRoaXMgb3B0aW9uIG1ha2VzIGZv
ciBzbWFsbGVyIGNvZGUsIGJ1dCBzb21lIGxpYmMgdmVyc2lvbnMKID4gZG8gbm90IHdvcmsgd2l0
aCBpdCAodGhleSB1c2UgU1NFIGluc3RydWN0aW9ucyB3aXRob3V0CiA+IGVuc3VyaW5nIHN0YWNr
IGFsaWdubWVudCkuIgoKID4gVGhpcyBwcm9ibGVtIGJyZWFrIHRoZSB0ZXN0IG9mIHRoZSB4ODYg
Y29yZTIgdG9vbGNoYWluIG9uIHRvb2xjaGFpbi1idWlsZGVyLgoKID4gWzFdIGh0dHBzOi8vYnVn
cy5nZW50b28ub3JnLzcyNTY3NCNjMzAKID4gWzJdIGh0dHBzOi8vbGlzdHMuZGViaWFuLm9yZy9k
ZWJpYW4tYm9vdC8yMDE4LzAxL21zZzAwMzUyLmh0bWwKID4gWzNdIGh0dHBzOi8vYnVncy5kZWJp
YW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9ODg2NTA2O21zZz05NwogPiBbNF0KID4g
aHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC9jb21taXQvP2lkPTJjOTk3MDI4MTA4M2E5
OWFjZmEzYWVjOGM2ZDQxZGI5NTVjYjU4M2QKCkNvbW1pdHRlZCB0byAyMDIzLjAyLngsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
