Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACD1C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 11:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17522606E3;
	Thu,  2 May 2024 11:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0C4owepkMakZ; Thu,  2 May 2024 11:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E42960788
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E42960788;
	Thu,  2 May 2024 11:19:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D27061BF2A9
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE732407A6
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fBQO6diPA6g for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 11:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F20C406EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F20C406EA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F20C406EA
 for <buildroot@buildroot.org>; Thu,  2 May 2024 11:19:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C06720007;
 Thu,  2 May 2024 11:19:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2USw-00Aa3v-1S;
 Thu, 02 May 2024 13:19:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <CANsE+Wd-NkLvVgKnNugSNqTYE8HNkO0yOLjpqKsnFt4t-aZ6LA@mail.gmail.com>
 <20240229052236.50171-1-nisargjhaveri@gmail.com>
 <CANsE+WfX7+hfpeTAeeugFQWSVOCUA3Sk81CxDX8BDh+yEtw_ig@mail.gmail.com>
 <15c47e9c-7ab6-4bc6-afd7-6afbfb8c88d7@mind.be>
Date: Thu, 02 May 2024 13:19:06 +0200
In-Reply-To: <15c47e9c-7ab6-4bc6-afd7-6afbfb8c88d7@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 7 Apr 2024 17:12:17
 +0200")
Message-ID: <878r0s7979.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/1] package/brcmfmac_sdio-firmware-rpi:
 bump version to 26ff205
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
Cc: Nisarg Jhaveri <nisargjhaveri@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IE9uIDMxLzAzLzIwMjQgMjI6MDMsIE5p
c2FyZyBKaGF2ZXJpIHdyb3RlOgogPj4gVGhpcyBzaG91bGQgYWxzbyBiZSBiYWNrcG9ydGVkIHRv
wqAyMDI0LjAyLjEgYXMgdGhlIGJ1aWxkcyBmb3IKID4+IFJhc3BiZXJyeSBQaSBib2FyZHMgYXJl
IGJyb2tlbgogPj4gc2luY2XCoDEzYmE2NjhhMmRhM2EwZGNiMzg2NTc4Y2UxNWIwMGE0NDQxMDFk
YmUuCgogPiAgVGhlIHByb3BlciB3YXkgdG8gaW5kaWNhdGUgdGhpcyBpcyB3aXRoIGEgRml4ZXM6
IHRhZy4KCiA+PiBCYWNrcG9ydCB0bzrCoDIwMjQuMDIuMQogPj4gT24gVGh1LCBGZWIgMjksIDIw
MjQgYXQgMTA6NTPigK9BTSBOaXNhcmcgSmhhdmVyaQogPj4gPG5pc2FyZ2poYXZlcmlAZ21haWwu
Y29tIDxtYWlsdG86bmlzYXJnamhhdmVyaUBnbWFpbC5jb20+PiB3cm90ZToKID4+IFRoZSBjdXJy
ZW50IHZlcnNpb24gaXMgbW9yZSB0aGFuIDIgeWVhcnMgb2xkLiBVcGRhdGUgdG8gdGhlCiA+PiBs
YXRlc3QuCiA+PiBBIGxvdCBvZiB0aGUgZmlsZXMgYXJlIHN5bWxpbmtlZC4gSW5zdGVhZCBvZiBp
bmRpdmlkdWFsbHkgcmVzdG9yaW5nIHRoZQogPj4gbGlua3MsIHVzaW5nIGBjcCAtLXJlbW92ZS1k
ZXN0aW5hdGlvbiAtLW5vLWRlcmVmZXJlbmNlYCBhbmQgYGNobW9kYCBpbnN0ZWFkCiA+PiBvZiBg
aW5zdGFsbGAuCgogPiAgUGxlYXNlIG1ha2Ugc3VyZSB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgd3Jh
cHBlZCBhdCA3MiBjb2x1bW5zLgoKID4+IFNpZ25lZC1vZmYtYnk6IE5pc2FyZyBKaGF2ZXJpIDxu
aXNhcmdqaGF2ZXJpQGdtYWlsLmNvbQogPj4gPG1haWx0bzpuaXNhcmdqaGF2ZXJpQGdtYWlsLmNv
bT4+CiA+PiAtLS0KID4+IENoYW5nZXMgdjIgLT4gdjM6CiA+PiDCoCAtIEF0dGVtcHQgdG8gZml4
IHBhdGNoIGZvcm1hdHRpbmcKID4+IENoYW5nZXMgdjEgLT4gdjI6CiA+PiDCoCAtIEF0dGVtcHQg
dG8gZml4IHBhdGNoIGZvcm1hdHRpbmcKID4+IC0tLQogPj4gwqAuLi4vYnJjbWZtYWNfc2Rpby1m
aXJtd2FyZS1ycGkuaGFzaMKgIMKgIMKgIMKgIMKgIMKgfMKgIDQgKy0tCiA+PiDCoC4uLi9icmNt
Zm1hY19zZGlvLWZpcm13YXJlLXJwaS5tawogPj4gPGh0dHA6Ly9icmNtZm1hY19zZGlvLWZpcm13
YXJlLXJwaS5taz4gICAgICDCoCDCoCDCoCDCoCDCoCDCoHwgMjcKID4+ICsrKysrKystLS0tLS0t
LS0tLS0KID4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlv
bnMoLSkKID4+IGRpZmYgLS1naXQKID4+IGEvcGFja2FnZS9icmNtZm1hY19zZGlvLWZpcm13YXJl
LXJwaS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS5oYXNoCiA+PiBiL3BhY2thZ2UvYnJjbWZt
YWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkuaGFzaAogPj4g
aW5kZXggYTEyZTkyY2JhYy4uYWExMDQzNTE4YiAxMDA2NDQKID4+IC0tLSBhL3BhY2thZ2UvYnJj
bWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkuaGFzaAog
Pj4gKysrIGIvcGFja2FnZS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS9icmNtZm1hY19zZGlv
LWZpcm13YXJlLXJwaS5oYXNoCiA+PiBAQCAtMSwzICsxLDMgQEAKID4+IMKgIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKID4+IC1zaGEyNTbCoAogPj4gZTUxYjcxN2MyYTYwY2EyOWZjZGQ4ZTA0ZTA3YzAw
OTk2MjI2Y2I0OGZhNTZhOGFkMTkzNGI1ZjRkZGVlMmUzZAogPj4gYnJjbWZtYWNfc2Rpby1maXJt
d2FyZS1ycGktZWE5OTYzZjNmNzdiNGJiNmNkMjgwNTc3ZWIxMTUxNTJiZGQ2N2U4ZC50YXIuZ3oK
ID4+IC1zaGEyNTbCoAogPj4gYjE2MDU2ZmM5MWI4MmEwZTNlOGRlOGY4NmMyZGFjOTgyMDFhYTlk
YzNjYmQzM2U4ZDM4ZjFiMDg3ZmNlYzMwZAogPj4gTElDRU5DRS5icm9hZGNvbV9iY200M3h4CiA+
PiArc2hhMjU2wqAKID4+IDJmMDkxN2IxMDQ3Mzk0NTVkZDQ4OGRkOGY1YWYyZWU0NDMwODAxYTdh
YzhmZThkOTg2NmU3NGJmYmIxODUzNTYKID4+IGJyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLTI2
ZmYyMDViNDVkYzEwOWI0OThhNzBhYWYxODI4MDRhZDlkYmZlYTUudGFyLmd6CiA+PiArc2hhMjU2
wqAKID4+IGVhOGI3YjdiNmNmYzZmZDMwNTg3ZWQ5NzcxMDBmNmE1NDI3MzRjZTUzMjE4YjViNjNk
ZTE2MTgwYWNkZGQ1OTkKID4+IExJQ0VOQ0UKCiA+ICBUaGUgbGljZW5zZSBmaWxlIGNoYW5nZWQg
bmFtZSBmcm9tIExJQ0VOQ0UgdG8gTElDRU5TRS4KCiA+PiBkaWZmIC0tZ2l0CiA+PiBhL3BhY2th
Z2UvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGku
bWsKID4+IDxodHRwOi8vYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWs+CiA+PiBiL3BhY2th
Z2UvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGku
bWsKID4+IDxodHRwOi8vYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWs+CiA+PiBpbmRleCA1
MzMyYmY1M2Q3Li43ODYwZGUzZWY3IDEwMDY0NAogPj4gLS0tIGEvcGFja2FnZS9icmNtZm1hY19z
ZGlvLWZpcm13YXJlLXJwaS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS5tawogPj4gPGh0dHA6
Ly9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS5taz4KID4+ICsrKyBiL3BhY2thZ2UvYnJjbWZt
YWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWsKID4+IDxo
dHRwOi8vYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWs+CiA+PiBAQCAtNCwzMyArNCwyNiBA
QAogPj4gwqAjCiA+PiDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiA+PiAtQlJDTUZNQUNfU0RJ
T19GSVJNV0FSRV9SUElfVkVSU0lPTiA9CiA+PiBlYTk5NjNmM2Y3N2I0YmI2Y2QyODA1NzdlYjEx
NTE1MmJkZDY3ZThkCiA+PiArQlJDTUZNQUNfU0RJT19GSVJNV0FSRV9SUElfVkVSU0lPTiA9IDI2
ZmYyMDViNDVkYzEwOWI0OThhNzBhYWYxODI4MDRhZDlkYmZlYTUKID4+IMKgQlJDTUZNQUNfU0RJ
T19GSVJNV0FSRV9SUElfU0lURSA9ICQoY2FsbAogPj4gZ2l0aHViLExpYnJlRUxFQyxicmNtZm1h
Y19zZGlvLWZpcm13YXJlLXJwaSwkKEJSQ01GTUFDX1NESU9fRklSTVdBUkVfUlBJX1ZFUlNJT04p
KQogPj4gwqBCUkNNRk1BQ19TRElPX0ZJUk1XQVJFX1JQSV9MSUNFTlNFID0gUFJPUFJJRVRBUlkK
ID4+IC1CUkNNRk1BQ19TRElPX0ZJUk1XQVJFX1JQSV9MSUNFTlNFX0ZJTEVTID0gTElDRU5DRS5i
cm9hZGNvbV9iY200M3h4CiA+PiArQlJDTUZNQUNfU0RJT19GSVJNV0FSRV9SUElfTElDRU5TRV9G
SUxFUyA9IExJQ0VOQ0UKID4+IMKgaWZlcSAoJChCUjJfUEFDS0FHRV9CUkNNRk1BQ19TRElPX0ZJ
Uk1XQVJFX1JQSV9CVCkseSkKID4+IMKgZGVmaW5lIEJSQ01GTUFDX1NESU9fRklSTVdBUkVfUlBJ
X0lOU1RBTExfVEFSR0VUX0JUCiA+PiAtwqAgwqAgwqAgwqAkKElOU1RBTEwpIC1kICQoVEFSR0VU
X0RJUikvbGliL2Zpcm13YXJlL2JyY20KID4+IC3CoCDCoCDCoCDCoCQoSU5TVEFMTCkgLW0gMDY0
NCAkKEBEKS9maXJtd2FyZS9icmNtLyouaGNkCiA+PiAkKFRBUkdFVF9ESVIpL2xpYi9maXJtd2Fy
ZS9icmNtCiA+PiArwqAgwqAgwqAgwqAkKElOU1RBTEwpIC1kICQoVEFSR0VUX0RJUikvbGliL2Zp
cm13YXJlL2JyY20KID4+ICQoVEFSR0VUX0RJUikvbGliL2Zpcm13YXJlL3N5bmFwdGljcwoKID4g
IFRoaXMgc3luYXB0aWNzIGRpcmVjdG9yeSBpcyBuZXcsIHRoYXQgc2hvdWxkIGhhdmUgYmVlbiBt
ZW50aW9uZWQgaW4KID4gIHRoZSBjb21taXQgbWVzc2FnZS4KCiA+ICBJIGFkZGVkIHRoZSBsaWNl
bnNlIGZpbGUgcmVuYW1lIGFuZCBtb2RpZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgZm9sbG93
cy4KCiA+ICAgICBwYWNrYWdlL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpOiBidW1wIHZlcnNp
b24gdG8gMjZmZjIwNQoKID4gICAgIFRoZSBjdXJyZW50IHZlcnNpb24gaXMgbW9yZSB0aGFuIDIg
eWVhcnMgb2xkLiBVcGRhdGUgdG8gdGhlIGxhdGVzdC4KCiA+ICAgICBUaGlzIGZpeGVzIHJ1bnRp
bWUgaXNzdWVzIHdpdGggdGhlIG5ld2VyIGtlcm5lbCB1c2VkIGluIG91ciBkZWZjb25maWdzCiA+
ICAgICBzaW5jZSBjb21taXQgMTNiYTY2OGEyZGEzYTBkY2IzODY1NzhjZTE1YjAwYTQ0NDEwMWRi
ZS4KCiA+ICAgICBMaWNlbnNlIGZpbGUgY2hhbmdlZCBuYW1lIGZyb20gTElDRU5DRSB0byBMSUNF
TlNFIGJ1dCBpcyBvdGhlcndpc2UKID4gICAgIHVuY2hhbmdlZC4KCiA+ICAgICBUaGVyZSBpcyBh
IG5ldyBkaXJlY3RvcnkgInN5bmFwdGljcyIsIGluc3RhbGwgdGhpcyBvbmUgYXMgd2VsbC4KCiA+
ICAgICBBIGxvdCBvZiB0aGUgZmlsZXMgYXJlIHN5bWxpbmtzLiAiaW5zdGFsbCIgY3JlYXRlcyBj
b3BpZXMgZm9yIHRoZXNlLAogPiAgICAgd2hpY2ggY29uc3VtZXMgYSBsb3Qgb2YgdW5uZWNlc3Nh
cnkgc3BhY2UuIEluc3RlYWQgb2YgaW5kaXZpZHVhbGx5CiA+ICAgICByZXN0b3JpbmcgdGhlIGxp
bmtzLCB1c2luZyBgY3AgLS1yZW1vdmUtZGVzdGluYXRpb24gLS1uby1kZXJlZmVyZW5jZWAKID4g
ICAgIGFuZCBgY2htb2RgIGluc3RlYWQgb2YgYGluc3RhbGxgLgoKID4gICAgIEZpeGVzOiAxM2Jh
NjY4YTJkYTNhMGRjYjM4NjU3OGNlMTViMDBhNDQ0MTAxZGJlCiA+ICAgICBTaWduZWQtb2ZmLWJ5
OiBOaXNhcmcgSmhhdmVyaSA8bmlzYXJnamhhdmVyaUBnbWFpbC5jb20+CiA+ICAgICBbQXJub3V0
OiBjb3JyZWN0IGxpY2Vuc2UgZmlsZSBuYW1lXQogPiAgICAgU2lnbmVkLW9mZi1ieTogQXJub3V0
IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPgoKCiA+ICBBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
