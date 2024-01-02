Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C418AC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49C8A404C1;
	Tue,  2 Jan 2024 21:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49C8A404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SduB0cFGZAFk; Tue,  2 Jan 2024 21:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F054055F;
	Tue,  2 Jan 2024 21:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F054055F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD8E1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D6460F39
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D6460F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FA385TJOpHlh for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:48:50 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9732560E8A
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9732560E8A
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4T4RLh4mXHz9tHq;
 Tue,  2 Jan 2024 22:48:44 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------IJ0AxaG0SujyAA7CdE8o260E"
Message-ID: <43f070d8-53c2-4f85-a32f-aef9f6862398@lindra.de>
Date: Tue, 2 Jan 2024 22:48:42 +0100
MIME-Version: 1.0
From: Ralf Dragon <hypnotoad@lindra.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
 <20231217230704.003200c7@windsurf>
 <7f309df0-ae17-419b-8bca-c52d9ec48442@lindra.de>
 <20231218205156.619643b1@windsurf>
 <f329f198-4cb1-4e61-8e47-0653cab03893@lindra.de>
Content-Language: en-US
In-Reply-To: <f329f198-4cb1-4e61-8e47-0653cab03893@lindra.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1704232124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hRawH8in+5T1OKcTvkgLXT+Kehk9sXDqqVibGRwxhHQ=;
 b=HjnLE9EfuAZxpNUENbQs5oUruXWzSugA/2BGSBnqiM73pXU0ajdrn/bM8Mc3yEdouNolwY
 Zhw+qxW0adbWHo56/EJRICMzRoWXHG/xx7pi6Z8pEROgrxpklGmtKVOocAoPKEEXfPK6mD
 nZW1dJFtaUtoRs3UJxATs4CbAYT5Lc1mNOLqMhEGfDQmMpF8YeoDPjmWs5txIjjcqlUMvx
 cfj07f45by5C4LqOsXwfqhjtdEEmdhUwFjD6XzICZaJYRcNmJPHjHmgK0XGmWycAC4HN1G
 lAfUbB3n4XEkr/m0NTBkVw0RX5UkO9u2xDNqba/0f6e/CGObCpcfGW0lfZ5VyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=HjnLE9Ef
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: Julien Olivain <ju.o@free.fr>, gwenhael.goavec-merou@trabucayre.com,
 yann.morin.1998@free.fr, asafka7@gmail.com, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------IJ0AxaG0SujyAA7CdE8o260E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,

here is an updated patch which reflects everything that we discussed. 
The new package has no dependency which looks quite particular in this 
part of the code base, but indeed it only depends on Python which is 
available for setuptools-based packets.

Thank you!

Best,
Ralf


--------------IJ0AxaG0SujyAA7CdE8o260E
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-python-pyqt5-sip-add-PyQt5.sip-module.patch"
Content-Disposition: attachment;
 filename="0001-python-pyqt5-sip-add-PyQt5.sip-module.patch"
Content-Transfer-Encoding: base64

RnJvbSA4MDY4NTE4MmQ2N2EzNTA1NmNjNmZjNzI3MTlmZDc0ZjVkMWMzMmU4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSYWxmIERyYWdvbiA8aHlwbm90b2FkQGxpbmRyYS5k
ZT4KRGF0ZTogVGh1LCAyMyBOb3YgMjAyMyAxODoyMzo1OSArMDEwMApTdWJqZWN0OiBbUEFU
Q0ggMS8xXSBweXRob24tcHlxdDUtc2lwOiBhZGQgUHlRdDUuc2lwIG1vZHVsZQoKVGhpcyBm
aXhlcyB0aGUgZm9sbG93aW5nIHJ1bnRpbWUgZXJyb3Igd2hlbiBpbXBvcnRpbmcgUHlRdDUg
aW4gcHl0aG9uOgoKZnJvbSBQeVF0NS5RdENvcmUgaW1wb3J0ICoKTW9kdWxlTm90Rm91bmRF
cnJvcjogTm8gbW9kdWxlIG5hbWVkICdQeVF0NS5zaXAnCgpUaGUgb2ZmaWNpYWwgZG9jdW1l
bnRhdGlvbiBbMV0gbWVudGlvbnMgdGhhdCB0aGlzIG1vZHVsZSBpcyBuZWVkZWQKZHVyaW5n
IFB5UXQ1IHJ1bnRpbWUuIEl0IGlzIGN1cnJlbnRseSBjb21waWxlZCB3aXRob3V0IGFueQpk
ZXBlbmRlbmNpZXMgdG8gUXQgb3IgUHlRdDUsIGJ1dCBpdCBzZWVtcyBxdWl0ZSB1c2VsZXNz
IHdpdGhvdXQgaXQuClRoZSBtb2R1bGUgd2FzIGludHJvZHVjZWQgdG9nZXRoZXIgd2l0aCBQ
eVF0IDUuMTEgWzJdLgoKVGhlIHByb2JsZW0gd2FzIGxpa2VseSB0cmlnZ2VyZWQgYnkgdGhl
IGF0b21pYyB1cGdyYWRlIGZyb20gNS43IHRvCjUuMTUgaW4gYjM2Y2U3ZS4gVGhpcyBjb21t
aXQgaXMgcGFydCBvZiB0aGUgMjAyMiBhbmQgMjAyMyBMVFMKYnJhbmNoZXMuCgpbMV0gaHR0
cHM6Ly93d3cucml2ZXJiYW5rY29tcHV0aW5nLmNvbS9zdGF0aWMvRG9jcy9QeVF0NS9pbnN0
YWxsYXRpb24uaHRtbCNidWlsZGluZy1hbmQtaW5zdGFsbGluZy1mcm9tLXNvdXJjZQpbMl0g
aHR0cHM6Ly93d3cucml2ZXJiYW5rY29tcHV0aW5nLmNvbS9zdGF0aWMvRG9jcy9QeVF0NS9p
bmNvbXBhdGliaWxpdGllcy5odG1sI3B5cXQtdjUtMTEKClNpZ25lZC1vZmYtYnk6IFJhbGYg
RHJhZ29uIDxoeXBub3RvYWRAbGluZHJhLmRlPgotLS0KQmFja3BvcnQgdG86IDIwMjMuMDIu
eAooMjAyMiBMVFMgYnJhbmNoZXMgYXJlIHByb2JhYmx5IGFsc28gYWZmZWN0ZWQgYnV0IEkg
Y291bGQgbm90IHRlc3QgYW55LCAyMDIxLjExLjMgaXMgZmluZSkKLS0tCiBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9w
eXRob24tcHlxdDUtc2lwL0NvbmZpZy5pbiAgICAgICAgICAgICB8ICA0ICsrKysKIHBhY2th
Z2UvcHl0aG9uLXB5cXQ1LXNpcC9weXRob24tcHlxdDUtc2lwLmhhc2ggfCAgNCArKysrCiBw
YWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvcHl0aG9uLXB5cXQ1LXNpcC5tayAgIHwgMTQgKysr
KysrKysrKysrKysKIHBhY2thZ2UvcHl0aG9uLXB5cXQ1L0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1weXF0NS1zaXAvQ29uZmlnLmluCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcHlxdDUtc2lwL3B5dGhvbi1weXF0NS1z
aXAuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXB5cXQ1LXNpcC9w
eXRob24tcHlxdDUtc2lwLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9w
YWNrYWdlL0NvbmZpZy5pbgppbmRleCBkNWQ4OWM1MGFhLi43YjEzMGZjMTczIDEwMDY0NAot
LS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTI2
OCw2ICsxMjY4LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNl
ICJwYWNrYWdlL3B5dGhvbi1weXBoZW4vQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9w
eXRob24tcHlxcmNvZGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tcHlx
dDUvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tcHlxdDUtc2lwL0NvbmZp
Zy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXB5cmF0ZW1wL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvcHl0aG9uLXB5cm91dGUyL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLXB5cnNpc3RlbnQvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tcHlxdDUtc2lwL0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXB5cXQ1LXNp
cC9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZjdi
ZTYwYzhlYwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXB5cXQ1LXNpcC9D
b25maWcuaW4KQEAgLTAsMCArMSw0IEBACitjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZ
UVQ1X1NJUAorCWJvb2wgInB5dGhvbi1weXF0NS1zaXAiCisJaGVscAorCSAgVGhpcyBpcyB0
aGUgUHlRdDUuc2lwIG1vZHVsZSB3aGljaCBpcyBuZWVkZWQgdG8gcnVuIFB5UXQ1LgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHlxdDUtc2lwL3B5dGhvbi1weXF0NS1zaXAuaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLXB5cXQ1LXNpcC9weXRob24tcHlxdDUtc2lwLmhhc2gKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uODAzOWNkYWZkOQotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXB5cXQ1LXNpcC9weXRob24tcHlxdDUtc2lw
Lmhhc2gKQEAgLTAsMCArMSw0IEBACisjIGZyb20gaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0
L1B5UXQ1LXNpcC8xMi4xMi4xCisKK3NoYTI1NiAgOGZkYzZlMDE0OGFiZDEyZDk3N2ExZDM4
MjhlN2I3OWFhZTk1OGU4M2M2Y2I1YWRhZTYxNDkxNmQ4ODhhNmIxMCAgUHlRdDVfc2lwLTEy
LjEyLjEudGFyLmd6CittZDUgIGMyMTE3ZGEzYjRjMGUwODFjMWM1YTkwODhiOGE0ZDU1ICBQ
eVF0NV9zaXAtMTIuMTIuMS50YXIuZ3oKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5
cXQ1LXNpcC9weXRob24tcHlxdDUtc2lwLm1rIGIvcGFja2FnZS9weXRob24tcHlxdDUtc2lw
L3B5dGhvbi1weXF0NS1zaXAubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMDUxZmE0ZTc3ZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXB5
cXQ1LXNpcC9weXRob24tcHlxdDUtc2lwLm1rCkBAIC0wLDAgKzEsMTQgQEAKKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1TSVAtUVQ1CisjCisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIworCitQWVRIT05fUFlRVDVfU0lQX1ZFUlNJT04gPSAxMi4xMi4x
CitQWVRIT05fUFlRVDVfU0lQX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5v
cmcvcGFja2FnZXMvYzEvNjEvNDA1NWU3YTBmMzYzMzk5NjQ5NTZmZjQxNWUzNmY0YWJmODI1
NjE5MDRjYzQ5YzAyMWRhMzI5NDlmYzU1CitQWVRIT05fUFlRVDVfU0lQX1NPVVJDRSA9IFB5
UXQ1X3NpcC0kKFBZVEhPTl9QWVFUNV9TSVBfVkVSU0lPTikudGFyLmd6CitQWVRIT05fUFlR
VDVfU0lQX0xJQ0VOU0UgPSBNSVQKK1BZVEhPTl9QWVFUNV9TSVBfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKK1BZVEhPTl9QWVFUNV9TSVBfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKKwor
JChldmFsICQocHl0aG9uLXBhY2thZ2UpKQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
cHlxdDUvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tcHlxdDUvQ29uZmlnLmluCmluZGV4
IDlmYTc2NzZmOTguLjBiMzdmMTQzMTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5
cXQ1L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1weXF0NS9Db25maWcuaW4KQEAg
LTUsNiArNSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fUFlRVDUKIAlib29sICJw
eXRob24tcHlxdDUiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9RVDUKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfUFlUSE9OX1NJUAorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUFlRVDVf
U0lQICMgcnVudGltZQogCXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVCQVNFX0dVSQogCWhlbHAK
IAkgIFB5dGhvbiBiaW5kaW5ncyBmb3IgUXQgNQotLSAKMi4zOS4yCgo=

--------------IJ0AxaG0SujyAA7CdE8o260E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------IJ0AxaG0SujyAA7CdE8o260E--
