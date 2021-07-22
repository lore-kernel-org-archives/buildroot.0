Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9098CC4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68CD60E8F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E68CD60E8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB93D6076D;
	Thu, 22 Jul 2021 21:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pr23aOpTH60B; Thu, 22 Jul 2021 21:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BF36069A;
	Thu, 22 Jul 2021 21:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA251BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9886069A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWME7RQwssH6 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:07:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA8260671
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 21:07:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9F334240002;
 Thu, 22 Jul 2021 21:07:39 +0000 (UTC)
Date: Thu, 22 Jul 2021 23:07:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Edmundo Ferreira <fc.edmundo@gmail.com>
Message-ID: <20210722230738.57510350@windsurf>
In-Reply-To: <20210608202434.10092-1-edmundo.ferreira@esa.int>
References: <20210608202434.10092-1-edmundo.ferreira@esa.int>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 31/35] package/x265: fixes SITE since
 upstream repo was moved
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thijs Vermeir <thijsvermeir@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gRWRtdW5kbywKCk9uIFR1ZSwgIDggSnVuIDIwMjEgMjI6MjQ6MzQgKzAyMDAKRWRtdW5k
byBGZXJyZWlyYSA8ZmMuZWRtdW5kb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBFZG11bmRv
IEZlcnJlaXJhIDxmYy5lZG11bmRvQGdtYWlsLmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFZG11
bmRvIEZlcnJlaXJhIDxmYy5lZG11bmRvQGdtYWlsLmNvbT4KClRoYW5rcyBhIGxvdCBmb3IgeW91
ciBwYXRjaC4gVGhlcmUgaXMgaW5kZWVkIGFuIGlzc3VlIGFzIHRoZSBjdXJyZW50ClVSTCBnaXZl
cyBhIDQwNC4gSG93ZXZlciwgeW91ciBwYXRjaCBkb2Vzbid0IGZpeCBpdCByZWFsbHk6IHRoZSBo
YXNoIG9mCnRoZSB0YXJiYWxsIGRvd25sb2FkZWQgZnJvbSB0aGlzIG5ldyBVUkwgaXMgZGlmZmVy
ZW50LCBhbmQgc28gaXQgZ2V0cwpyZWplY3RlZCwgYW5kIHdlIGZhbGxiYWNrIHRvIHNvdXJjZXMu
YnVpbGRyb290Lm5ldC4gU2VlOgoKPj4+IHgyNjUgMy4zIERvd25sb2FkaW5nCndnZXQgLS1wYXNz
aXZlLWZ0cCAtbmQgLXQgMyAtTyAnL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1
dC9idWlsZC8ueDI2NV8zLjMudGFyLmd6LllmU0g5NS9vdXRwdXQnICdodHRwczovL2JpdGJ1Y2tl
dC5vcmcvbXVsdGljb3Jld2FyZS94MjY1X2dpdC9kb3dubG9hZHMveDI2NV8zLjMudGFyLmd6JyAK
LS0yMDIxLTA3LTIyIDIzOjAyOjU1LS0gIGh0dHBzOi8vYml0YnVja2V0Lm9yZy9tdWx0aWNvcmV3
YXJlL3gyNjVfZ2l0L2Rvd25sb2Fkcy94MjY1XzMuMy50YXIuZ3oKUmVzb2x2aW5nIGJpdGJ1Y2tl
dC5vcmcgKGJpdGJ1Y2tldC5vcmcpLi4uIDI0MDY6ZGEwMDpmZjAwOjozNGNjOmVhNGEsIDI0MDY6
ZGEwMDpmZjAwOjoyMmMzOjliMGEsIDI0MDY6ZGEwMDpmZjAwOjoyMmMyOjUxMywgLi4uCkNvbm5l
Y3RpbmcgdG8gYml0YnVja2V0Lm9yZyAoYml0YnVja2V0Lm9yZyl8MjQwNjpkYTAwOmZmMDA6OjM0
Y2M6ZWE0YXw6NDQzLi4uIGNvbm5lY3RlZC4KSFRUUCByZXF1ZXN0IHNlbnQsIGF3YWl0aW5nIHJl
c3BvbnNlLi4uIDMwMiBGb3VuZApMb2NhdGlvbjogaHR0cHM6Ly9iYnVzZXJ1cGxvYWRzLnMzLmFt
YXpvbmF3cy5jb20vYzEwNWY0NzctMjAwMy00ZTEyLTgwZTUtMDY4NThjZjdlNDBiL2Rvd25sb2Fk
cy80MjQ3ZGU5Zi0xNDg0LTRlMzEtYjliOC1mNjlhNTA1MjMwZGUveDI2NV8zLjMudGFyLmd6P1Np
Z25hdHVyZT1HQVlDblhlV0lCbjN3MkZYJTJGTGVRblElMkJpMmM4JTNEJkV4cGlyZXM9MTYyNjk4
OTU3NiZBV1NBY2Nlc3NLZXlJZD1BS0lBNktPU0UzQk5KUlJGVVVYNiZ2ZXJzaW9uSWQ9czlmZmxG
Z3NlVDJPRVBtX2VUMUczM2V1M0c4cV9SSjUmcmVzcG9uc2UtY29udGVudC1kaXNwb3NpdGlvbj1h
dHRhY2htZW50JTNCJTIwZmlsZW5hbWUlM0QlMjJ4MjY1XzMuMy50YXIuZ3olMjImcmVzcG9uc2Ut
Y29udGVudC1lbmNvZGluZz1Ob25lIFtmb2xsb3dpbmddCi0tMjAyMS0wNy0yMiAyMzowMjo1Ni0t
ICBodHRwczovL2JidXNlcnVwbG9hZHMuczMuYW1hem9uYXdzLmNvbS9jMTA1ZjQ3Ny0yMDAzLTRl
MTItODBlNS0wNjg1OGNmN2U0MGIvZG93bmxvYWRzLzQyNDdkZTlmLTE0ODQtNGUzMS1iOWI4LWY2
OWE1MDUyMzBkZS94MjY1XzMuMy50YXIuZ3o/U2lnbmF0dXJlPUdBWUNuWGVXSUJuM3cyRlglMkZM
ZVFuUSUyQmkyYzglM0QmRXhwaXJlcz0xNjI2OTg5NTc2JkFXU0FjY2Vzc0tleUlkPUFLSUE2S09T
RTNCTkpSUkZVVVg2JnZlcnNpb25JZD1zOWZmbEZnc2VUMk9FUG1fZVQxRzMzZXUzRzhxX1JKNSZy
ZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPWF0dGFjaG1lbnQlM0IlMjBmaWxlbmFtZSUzRCUy
MngyNjVfMy4zLnRhci5neiUyMiZyZXNwb25zZS1jb250ZW50LWVuY29kaW5nPU5vbmUKUmVzb2x2
aW5nIGJidXNlcnVwbG9hZHMuczMuYW1hem9uYXdzLmNvbSAoYmJ1c2VydXBsb2Fkcy5zMy5hbWF6
b25hd3MuY29tKS4uLiA1Mi4yMTYuOTguMjQzCkNvbm5lY3RpbmcgdG8gYmJ1c2VydXBsb2Fkcy5z
My5hbWF6b25hd3MuY29tIChiYnVzZXJ1cGxvYWRzLnMzLmFtYXpvbmF3cy5jb20pfDUyLjIxNi45
OC4yNDN8OjQ0My4uLiBjb25uZWN0ZWQuCkhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNw
b25zZS4uLiAyMDAgT0sKTGVuZ3RoOiAxNTA4NTEzICgxLDRNKSBbYXBwbGljYXRpb24veC1nemlw
XQpTYXZpbmcgdG86IOKAmC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVp
bGQvLngyNjVfMy4zLnRhci5nei5ZZlNIOTUvb3V0cHV04oCZCgovaG9tZS90aG9tYXMvcHJvamV0
cy9idWlsZHJvbyAxMDAlWz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Pl0gICAxLDQ0TSAgIDkzMEtCL3MgICAgaW4gMSw2cyAgICAKCjIwMjEtMDctMjIgMjM6
MDI6NTkgKDkzMCBLQi9zKSAtIOKAmC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvLngyNjVfMy4zLnRhci5nei5ZZlNIOTUvb3V0cHV04oCZIHNhdmVkIFsxNTA4NTEz
LzE1MDg1MTNdCgpFUlJPUjogeDI2NV8zLjMudGFyLmd6IGhhcyB3cm9uZyBtZDUgaGFzaDoKRVJS
T1I6IGV4cGVjdGVkOiAwYzhjNzQ3YjU5YjU0MTFkZWE4Y2Y1NTc1NTQ2MzZjMQpFUlJPUjogZ290
ICAgICA6IGJlNmVhN2ExMzliMDFmYTZmMjYxNGQ1YzExOTc0OTJkCkVSUk9SOiBJbmNvbXBsZXRl
IGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCndnZXQgLS1wYXNz
aXZlLWZ0cCAtbmQgLXQgMyAtTyAnL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1
dC9idWlsZC8ueDI2NV8zLjMudGFyLmd6Lk45T0JUTS9vdXRwdXQnICdodHRwOi8vc291cmNlcy5i
dWlsZHJvb3QubmV0L3gyNjUveDI2NV8zLjMudGFyLmd6JyAKLS0yMDIxLTA3LTIyIDIzOjAyOjU5
LS0gIGh0dHA6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQveDI2NS94MjY1XzMuMy50YXIuZ3oKUmVz
b2x2aW5nIHNvdXJjZXMuYnVpbGRyb290Lm5ldCAoc291cmNlcy5idWlsZHJvb3QubmV0KS4uLiAy
NjA2OjQ3MDA6MjA6OjY4MWE6MTI1LCAyNjA2OjQ3MDA6MjA6OjY4MWE6MjUsIDI2MDY6NDcwMDoy
MDo6YWM0Mzo0ODM4LCAuLi4KQ29ubmVjdGluZyB0byBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQgKHNv
dXJjZXMuYnVpbGRyb290Lm5ldCl8MjYwNjo0NzAwOjIwOjo2ODFhOjEyNXw6ODAuLi4gY29ubmVj
dGVkLgpIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCkxlbmd0
aDogMTQzODY4NSAoMSw0TSkgW2FwcGxpY2F0aW9uL3gtZ3Rhci1jb21wcmVzc2VkXQpTYXZpbmcg
dG86IOKAmC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLngyNjVf
My4zLnRhci5nei5OOU9CVE0vb3V0cHV04oCZCgovaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJv
byAxMDAlWz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Pl0g
ICAxLDM3TSAgMSwxMk1CL3MgICAgaW4gMSwycyAgICAKCjIwMjEtMDctMjIgMjM6MDM6MDAgKDEs
MTIgTUIvcykgLSDigJgvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxk
Ly54MjY1XzMuMy50YXIuZ3ouTjlPQlRNL291dHB1dOKAmSBzYXZlZCBbMTQzODY4NS8xNDM4Njg1
XQoKeDI2NV8zLjMudGFyLmd6OiBPSyAobWQ1OiAwYzhjNzQ3YjU5YjU0MTFkZWE4Y2Y1NTc1NTQ2
MzZjMSkKeDI2NV8zLjMudGFyLmd6OiBPSyAoc2hhMjU2OiBmMjZlMTQ4ZWQxZjRkZmIzM2ZkMWVi
M2ZmNWU2MGUwODA3OGQxYjIwMTdlODhiY2JiMDQ1YjNmYjU4MzAwYjljKQoKQ291bGQgeW91IGhh
dmUgYSBsb29rPyBXZSBjYW4ndCBzaW1wbHkgY2hhbmdlIHRoZSBoYXNoLCBiZWNhdXNlIHRoYXQK
d291bGQgbWVhbiB0aGUgdGFyYmFsbCBjYWNoZWQgb24gc291cmNlcy5idWlsZHJvb3QubmV0IGlz
IG5vIGxvbmdlcgp2YWxpZC4gQW5kIHdlIGNhbm5vdCBkZWxldGUgaXQsIGFzIGl0IHdvdWxkIGJy
ZWFrIG9sZGVyIEJ1aWxkcm9vdApyZWxlYXNlcywgd2hpY2ggdXNlIHRoZSBjdXJyZW50IGhhc2gg
Zm9yIHRoZSB4MjY1IHRhcmJhbGwuCgpVc3VhbGx5LCB0aGUgZWFzaWVzdCBwYXRoIGlzIHRvIHVw
ZGF0ZSB0aGUgVVJMICphbmQqIGRvIGEgdmVyc2lvbiBidW1wCmF0IHRoZSBzYW1lIHRpbWUuCgpC
ZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
