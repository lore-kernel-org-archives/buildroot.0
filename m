Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12A6C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 22:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E1F40471;
	Sat, 18 Mar 2023 22:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E1F40471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5MKxx4kG-HH; Sat, 18 Mar 2023 22:21:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9E6E40407;
	Sat, 18 Mar 2023 22:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9E6E40407
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D14EB1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA02681B7B
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 22:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA02681B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MoxCKSfD0IyL for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 22:21:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5544981B70
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5544981B70
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 22:21:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 695F420003;
 Sat, 18 Mar 2023 22:21:17 +0000 (UTC)
Date: Sat, 18 Mar 2023 23:21:16 +0100
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Message-ID: <20230318232116.5481d3db@windsurf>
In-Reply-To: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
References: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679178077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILml7EMoriXx40zxo+Wg8cfM9UEuWC1a2l0YCYvTKwA=;
 b=VweFBf/eKWXgcej/RchXfNG2/UgWzEhsND1ldsz3gNYBWffZA3xw9qjSX3YIOIZe7WiTa4
 OXi2n2VrDFxqJ4hcKysPxEdr/owXptqcq2TxXiIPOyrULLd1wTWtjs/gnsvl5fVD6qHmCP
 /4O1WiMFzlG40tcR4tD6hO3+gXrw5H046DYYuIvWTMXEwl0K2FC+JrO/t8Q2h2pKmOou6s
 d8KA2Ykj4dpsAMU4GFOSOYJ8ejIy/KSdVQ7Ccm9sMb7J46C/pUjQq0fB1ozHUUvMA1lFZg
 r3S7gE8izU6hOxQ4Pz2tTNRRM0LP8mEiWoFlObusWMWhBS5SbxxP+oU+YcxHvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VweFBf/e
Subject: Re: [Buildroot] package/rtl8189fs: bug in conf, and a question
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
Cc: giulio.benetti@benettiengineering.com,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSW5kcmVrLAoKT24gU2F0LCAxOCBNYXIgMjAyMyAyMzo0NjoxNSArMDIwMApJbmRyZWsg
S3J1dXNhIDxpbmRyZWsua3J1dXNhQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEknbSB0cnlpbmcgdG8g
cHJlcGFyZSBhIHBhdGNoIGZvciBNYW5nb1BpIE1RIChBbGx3aW5uZXIgRDFzIFJJU0MtVikuIEkn
bQo+IGFsbW9zdCB0aGVyZSAtIFNhbXVlbCBIb2xsYW5kIG1hbmFnZWQgdG8gbWFpbmxpbmUgaW5p
dGlhbCBzdXBwb3J0IGZvciB0aGlzCj4gYm9hcmQsIHNvIHZhbmlsbGEgbGludXgga2VybmVsIDYu
My1yYzIgYm9vdHMgZmluZSAod2l0aCBwcm9wZXIvbW9kaWZpZWQKPiB1LWJvb3QgdmVyc2lvbiku
Cj4gVGhlIFdpRmkgbW9kdWxlIGlzIGJhc2VkIG9uIHJ0bDgxODlmdHYgY2hpcCAoU0RJTyBjb25u
ZWN0aW9uKSBhbmQgaXRzCj4gZHJpdmVyIHNlZW1zIHRvIGJlIHByb2JsZW1hdGljLgo+IEZpcnN0
LCBidWlsZHJvb3QncyBwYWNrYWdlL3J0bDgxODlmcyBpcyBjdXJyZW50bHkgYnJva2VuOyBpdCBw
b2ludHMgdG8gdGhlCj4gd3JvbmcgY29tbWl0IChzZWVtcyB0byBiZSBjb3B5IHBhc3RlIGVycm9y
LCBpbmhlcml0ZWQgZnJvbQo+IHBhY2thZ2UvcnRsODE4OWVzKS4gVGhlIHJlc3VsdCBpcyB1bnVz
YWJsZS4gSSB1cGRhdGVkIGl0IHRvIHRoZSBjb3JyZWN0Cj4gY29tbWl0IChvbiB0aGUgY29ycmVj
dCBicmFuY2gpIGFuZCB0aGUgZHJpdmVyIGJ1aWxkcyBmaW5lIGFuZCBsb2FkcyBmaW5lLgoKQXJl
IHlvdSBzdXJlPyBJdCB3b3JrcyBmaW5lIGhlcmU6CgokIG1ha2UgcnRsODE4OWZzLWV4dHJhY3QK
Pj4+IHJ0bDgxODlmcyBlNThiZDg2YzlkOTQwOGM2NDhiMTI0NmEwZGQ3NmIxNjg1NmVjMTcyIERv
d25sb2FkaW5nCndnZXQgLS1wYXNzaXZlLWZ0cCAtbmQgLXQgMyAtTyAnL2hvbWUvdGhvbWFzL3By
b2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC8ucnRsODE4OWZzLWU1OGJkODZjOWQ5NDA4YzY0
OGIxMjQ2YTBkZDc2YjE2ODU2ZWMxNzIudGFyLmd6LmJwbW0wNS9vdXRwdXQnICdodHRwczovL2dp
dGh1Yi5jb20vandyZGVnb2VkZS9ydGw4MTg5RVNfbGludXgvYXJjaGl2ZS9lNThiZDg2YzlkOTQw
OGM2NDhiMTI0NmEwZGQ3NmIxNjg1NmVjMTcyL3J0bDgxODlmcy1lNThiZDg2YzlkOTQwOGM2NDhi
MTI0NmEwZGQ3NmIxNjg1NmVjMTcyLnRhci5neicgCi0tMjAyMy0wMy0xOCAyMzoyMDoyOS0tICBo
dHRwczovL2dpdGh1Yi5jb20vandyZGVnb2VkZS9ydGw4MTg5RVNfbGludXgvYXJjaGl2ZS9lNThi
ZDg2YzlkOTQwOGM2NDhiMTI0NmEwZGQ3NmIxNjg1NmVjMTcyL3J0bDgxODlmcy1lNThiZDg2Yzlk
OTQwOGM2NDhiMTI0NmEwZGQ3NmIxNjg1NmVjMTcyLnRhci5negpSZXNvbHZpbmcgZ2l0aHViLmNv
bSAoZ2l0aHViLmNvbSkuLi4gMTQwLjgyLjEyMS40CkNvbm5lY3RpbmcgdG8gZ2l0aHViLmNvbSAo
Z2l0aHViLmNvbSl8MTQwLjgyLjEyMS40fDo0NDMuLi4gY29ubmVjdGVkLgpIVFRQIHJlcXVlc3Qg
c2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMzAyIEZvdW5kCkxvY2F0aW9uOiBodHRwczovL2Nv
ZGVsb2FkLmdpdGh1Yi5jb20vandyZGVnb2VkZS9ydGw4MTg5RVNfbGludXgvdGFyLmd6L2U1OGJk
ODZjOWQ5NDA4YzY0OGIxMjQ2YTBkZDc2YjE2ODU2ZWMxNzIgW2ZvbGxvd2luZ10KLS0yMDIzLTAz
LTE4IDIzOjIwOjI5LS0gIGh0dHBzOi8vY29kZWxvYWQuZ2l0aHViLmNvbS9qd3JkZWdvZWRlL3J0
bDgxODlFU19saW51eC90YXIuZ3ovZTU4YmQ4NmM5ZDk0MDhjNjQ4YjEyNDZhMGRkNzZiMTY4NTZl
YzE3MgpSZXNvbHZpbmcgY29kZWxvYWQuZ2l0aHViLmNvbSAoY29kZWxvYWQuZ2l0aHViLmNvbSku
Li4gMTQwLjgyLjEyMS45CkNvbm5lY3RpbmcgdG8gY29kZWxvYWQuZ2l0aHViLmNvbSAoY29kZWxv
YWQuZ2l0aHViLmNvbSl8MTQwLjgyLjEyMS45fDo0NDMuLi4gY29ubmVjdGVkLgpIVFRQIHJlcXVl
c3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCkxlbmd0aDogdW5zcGVjaWZpZWQg
W2FwcGxpY2F0aW9uL3gtZ3ppcF0KU2F2aW5nIHRvOiDigJgvaG9tZS90aG9tYXMvcHJvamV0cy9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy5ydGw4MTg5ZnMtZTU4YmQ4NmM5ZDk0MDhjNjQ4YjEyNDZh
MGRkNzZiMTY4NTZlYzE3Mi50YXIuZ3ouYnBtbTA1L291dHB1dOKAmQoKL2hvbWUvdGhvbWFzL3By
b2pldHMvYnVpbGRyb28gICAgIFsgIDw9PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBdICAgMiw0Mk0gIDksMDVNQi9zICAgIGluIDAsM3MgICAgCgoyMDIzLTAzLTE4
IDIzOjIwOjMwICg5LDA1IE1CL3MpIC0g4oCYL2hvbWUvdGhvbWFzL3Byb2pldHMvYnVpbGRyb290
L291dHB1dC9idWlsZC8ucnRsODE4OWZzLWU1OGJkODZjOWQ5NDA4YzY0OGIxMjQ2YTBkZDc2YjE2
ODU2ZWMxNzIudGFyLmd6LmJwbW0wNS9vdXRwdXTigJkgc2F2ZWQgWzI1MzkyOTldCgpydGw4MTg5
ZnMtZTU4YmQ4NmM5ZDk0MDhjNjQ4YjEyNDZhMGRkNzZiMTY4NTZlYzE3Mi50YXIuZ3o6IE9LIChz
aGEyNTY6IDk2MzQ3ZGJmZWRkOTVhMjE3ZmI4OWI3YjI5NWZlNDE3YjcxMWRiYWQzZGI4OTZlZjBj
MmZhNzMzYzZkMTUwZmQpCj4+PiBydGw4MTg5ZnMgZTU4YmQ4NmM5ZDk0MDhjNjQ4YjEyNDZhMGRk
NzZiMTY4NTZlYzE3MiBFeHRyYWN0aW5nCmd6aXAgLWQgLWMgL2hvbWUvdGhvbWFzL2RsL3J0bDgx
ODlmcy9ydGw4MTg5ZnMtZTU4YmQ4NmM5ZDk0MDhjNjQ4YjEyNDZhMGRkNzZiMTY4NTZlYzE3Mi50
YXIuZ3ogfCB0YXIgLS1zdHJpcC1jb21wb25lbnRzPTEgLUMgL2hvbWUvdGhvbWFzL3Byb2pldHMv
YnVpbGRyb290L291dHB1dC9idWlsZC9ydGw4MTg5ZnMtZTU4YmQ4NmM5ZDk0MDhjNjQ4YjEyNDZh
MGRkNzZiMTY4NTZlYzE3MiAgIC14ZiAtCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
