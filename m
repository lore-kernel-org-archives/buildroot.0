Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C76C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A26A81395;
	Sun, 11 Dec 2022 20:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A26A81395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcXQFj2fk0LH; Sun, 11 Dec 2022 20:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7707080C80;
	Sun, 11 Dec 2022 20:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7707080C80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52EE11BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A4D44013E
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4D44013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM3cdiRPk6xX for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:09:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638E4400DF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 638E4400DF
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:09:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C18271C0004;
 Sun, 11 Dec 2022 20:09:34 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:09:33 +0100
To: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Message-ID: <20221211210933.19fb5199@windsurf>
In-Reply-To: <20221206171719.747581-3-gadiyar@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-3-gadiyar@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670789375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiMpQOpDspsp316dTP8d+fLMj5KK/ZHf9e2wZt7Zr80=;
 b=e2XnQgkqdvOImq3tTZCZYHC6r+LyR5jJdaHB7Eo0zB2i+ubhzPLkyf8tAck3OzrxPthAB/
 7D2xNN27dEGnwr0MuuNeS0E0DFUzGvsmTUaFyl7ozz8oekJ9aX6O62qeqh3fMSkAguQhkd
 eOLwAoEV/V4RwxXnidop5wncy11f06jj0ZnvJpLuPnrfk6aqTkeI907CwE0ds07zfA66a0
 g8PCOTsGyjTYQzAbY6a1ttt6Fuibs4JJSphu9Fwaxdiq0NTzqpmiblTB+3KC+krRz3Jc3K
 YV1x/54diE+YHbKPVS0NERAH5pwa9h3UdK9ryvSrhMAoMeLzJvw8Ptw4CgNqDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e2XnQgkq
Subject: Re: [Buildroot] [PATCH v7 2/3] boot/ti-k3-image-gen: add new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUdWUsIDYgRGVjIDIwMjIgMTE6MTc6MTggLTA2MDAKQW5hbmQgR2FkaXlhciB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEZyb206IFh1
YW5oYW8gU2hpIDx4LXNoaUB0aS5jb20+Cj4gCj4gVGhpcyBpcyB0aGUgaW1hZ2UgZ2VuZXJhdG9y
IHRoYXQgYnVpbGRzIHRoZSBmdWxsIGJvb3QgYmluYXJ5LAo+IHRpYm9vdDMuYmluLCBmb3IgdGhl
IFI1IGNvcmUgb24gVEkncyBrMyBkZXZpY2VzLgo+IFRoaXMgcmVxdWlyZXMgdGhlIFI1IHNwbCBv
dXRwdXQgZnJvbSB0aGUgdGktazMtcjUtbG9hZGVyIHBhY2thZ2UuCj4gCj4gaHR0cHM6Ly9naXQu
dGkuY29tL2NnaXQvazMtaW1hZ2UtZ2VuL2szLWltYWdlLWdlbgoKVGhlIGNvbW1pdCB0aXRsZSBz
aG91bGQganVzdCBiZToKCglib290L3RpLWszLWltYWdlLWdlbjogbmV3IHBhY2thZ2UKCihub3Qg
ImFkZCBuZXcgcGFja2FnZSIpCgoKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4v
Q29uZmlnLmluIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wMjAxOGYyZjc4Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMzAgQEAK
PiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOCj4gKwlib29sICJ0aS1rMy1pbWFn
ZS1nZW4iCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVIKClNob3VsZCBiZSBh
OgoKCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVIKCj4gK2lmIEJSMl9UQVJH
RVRfVElfSzNfSU1BR0VfR0VOCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9T
T0MKPiArCXN0cmluZyAiU09DIHR5cGUgZm9yIGltYWdlIGdlbiIKCglzdHJpbmcgIlNvQyIKCj4g
KwloZWxwCj4gKwkgIFRoZSB0YXJnZXQgU29DIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgo+ICsJICBG
b3IgZXhhbXBsZSwgImFtNjR4IiBmb3IgQU02NFggYm9hcmRzLgo+ICsKPiArY29uZmlnIEJSMl9U
QVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19UWVBFCj4gKwlzdHJpbmcgIlNPQyBzZWN1cml0eSB0
eXBlIGZvciBpbWFnZSBnZW4iCgoJc3RyaW5nICJTb0Mgc2VjdXJpdHkgdHlwZSIKCj4gKwloZWxw
Cj4gKwkgIFRoZSBzZWN1cml0eSB0eXBlIG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLgo+ICsJICBPcHRp
b25zIGFyZSAiZ3AiLCAiaHMtZnMiLCBvciAiaHMtc2UiLgo+ICsKPiArY29uZmlnIEJSMl9UQVJH
RVRfVElfSzNfSU1BR0VfR0VOX0NPTkZJRwo+ICsJc3RyaW5nICJDT05GSUcgdHlwZSBmb3IgaW1h
Z2UgZ2VuIgoKCXN0cmluZyAiY29uZmlnIHR5cGUiCgoKPiArZGVmaW5lIFRJX0szX0lNQUdFX0dF
Tl9CVUlMRF9DTURTCj4gKwkkKFRJX0szX0lNQUdFX0dFTl9NQUtFKSAtQyAkKEBEKSAkKFRJX0sz
X0lNQUdFX0dFTl9NQUtFX09QVFMpCj4gK2VuZGVmCgpUaGVyZSBpcyBhIHNlcmlvdXMgcHJvYmxl
bTogdGhlIGJ1aWxkIHByb2Nlc3Mgb2YgdGhpcyBwYWNrYWdlIGRvd25sb2FkcwpzdHVmZjoKCkNv
bm5lY3RpbmcgdG8gZ2l0LnRpLmNvbSAoZ2l0LnRpLmNvbSl8MTk4LjQ3LjI4LjIwOHw6NDQzLi4u
IGNvbm5lY3RlZC4KSFRUUCByZXF1ZXN0IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDMwMSBN
b3ZlZCBQZXJtYW5lbnRseQpMb2NhdGlvbjogaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvcHJvY2Vz
c29yLWZpcm13YXJlL3RpLWxpbnV4LWZpcm13YXJlL2Jsb2JzL3Jhdy81OWQ2ZjkyMWIzYjU2MmUw
YWExZjQyY2UzMjJlNDY0NWIxYmZjNTJjL3RpLXN5c2Z3L3RpLXNjaS1maXJtd2FyZS1hbTY0eC1n
cC5iaW4gW2ZvbGxvd2luZ10KLS0yMDIyLTEyLTExIDIwOjUzOjU4LS0gIGh0dHBzOi8vZ2l0LnRp
LmNvbS9jZ2l0L3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51eC1maXJtd2FyZS9ibG9icy9yYXcv
NTlkNmY5MjFiM2I1NjJlMGFhMWY0MmNlMzIyZTQ2NDViMWJmYzUyYy90aS1zeXNmdy90aS1zY2kt
ZmlybXdhcmUtYW02NHgtZ3AuYmluClJldXNpbmcgZXhpc3RpbmcgY29ubmVjdGlvbiB0byBnaXQu
dGkuY29tOjQ0My4KSFRUUCByZXF1ZXN0IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDMwMSBN
b3ZlZCBQZXJtYW5lbnRseQpMb2NhdGlvbjogaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvcHJvY2Vz
c29yLWZpcm13YXJlL3RpLWxpbnV4LWZpcm13YXJlL3BsYWluL3RpLXN5c2Z3L3RpLXNjaS1maXJt
d2FyZS1hbTY0eC1ncC5iaW4/aWQ9NTlkNmY5MjFiM2I1NjJlMGFhMWY0MmNlMzIyZTQ2NDViMWJm
YzUyYyBbZm9sbG93aW5nXQotLTIwMjItMTItMTEgMjA6NTM6NTktLSAgaHR0cHM6Ly9naXQudGku
Y29tL2NnaXQvcHJvY2Vzc29yLWZpcm13YXJlL3RpLWxpbnV4LWZpcm13YXJlL3BsYWluL3RpLXN5
c2Z3L3RpLXNjaS1maXJtd2FyZS1hbTY0eC1ncC5iaW4/aWQ9NTlkNmY5MjFiM2I1NjJlMGFhMWY0
MmNlMzIyZTQ2NDViMWJmYzUyYwpSZXVzaW5nIGV4aXN0aW5nIGNvbm5lY3Rpb24gdG8gZ2l0LnRp
LmNvbTo0NDMuCkhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiAyMDAgT0sK
TGVuZ3RoOiAyMjUyNDggKDIyMEspIFthcHBsaWNhdGlvbi9vY3RldC1zdHJlYW1dClNhdmluZyB0
bzog4oCYdGktc2NpLWZpcm13YXJlLWFtNjR4LWdwLmJpbuKAmQoKdGktc2NpLWZpcm13YXJlLWFt
NjR4LWdwLmJpbiAgMTAwJVs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Pl0gMjE5LDk3SyAgIDExNEtCL3MgICAgaW4gMSw5cyAgICAKCjIwMjItMTItMTEgMjA6
NTQ6MDEgKDExNCBLQi9zKSAtIOKAmHRpLXNjaS1maXJtd2FyZS1hbTY0eC1ncC5iaW7igJkgc2F2
ZWQgWzIyNTI0OC8yMjUyNDhdCgpEb3dubG9hZCBTVUNDRVNTIQoKVGhpcyBpcyBub3QgYWNjZXB0
YWJsZSBhcyBpdCBjaXJjdW12ZW50cyB0aGUgZG93bmxvYWQgaW5mcmFzdHJ1Y3R1cmUgb2YKQnVp
bGRyb290LCBidXQgYWxzbyB0aGUgbGVnYWwgaW5mb3JtYXRpb24gY29sbGVjdGlvbiBpbmZyYXN0
cnVjdHVyZS4KClRoaXMgbmVlZHMgdG8gYmUgZml4ZWQgYnkgZG93bmxvYWRpbmcgdGhpcyBmaWxl
LCBlaXRoZXIgdGhyb3VnaCBhCnNlcGFyYXRlIHBhY2thZ2UsIG9yIGFzIGFuIF9FWFRSQV9ET1dO
TE9BRFMgb2YgdGhpcyBwYWNrYWdlLCBhbmQgdGhlCk1ha2VmaWxlIG5lZWRzIHRvIGJlIGNoYW5n
ZWQgdG8gbm90IGRvd25sb2FkIHRoaXMgZmlsZS4gTXkgaW1wcmVzc2lvbgppcyB0aGF0IHRoZSBN
YWtlZmlsZSB3aWxsIG5vdCBkb3dubG9hZCB0aGUgZmlsZXMgaWYgdGhleSBhcmUgYWxyZWFkeQph
dmFpbGFibGUuIFNvIHlvdSBjb3VsZCBoYXZlIF9FWFRSQV9ET1dOTE9BRFMgKyBzb21lIHBvc3Qt
ZXh0cmFjdCBsb2dpYwp0byBwdXQgdGhlIGZpbGVzIGF0IHRoZSByaWdodCBwbGFjZS4KCkJlc3Qg
cmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
