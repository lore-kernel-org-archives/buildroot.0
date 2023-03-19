Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12948C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 20:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ECCF40981;
	Sun, 19 Mar 2023 20:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ECCF40981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xln1-OOIIJDn; Sun, 19 Mar 2023 20:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D7B40992;
	Sun, 19 Mar 2023 20:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D7B40992
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC2891BF3E8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8672640385
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8672640385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyAVHAvsascT for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 20:05:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7346B4013D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7346B4013D
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 20:05:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1pgzxr1Qmr-00Eb2x; Sun, 19
 Mar 2023 21:05:26 +0100
Date: Sun, 19 Mar 2023 21:05:25 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230319210525.4188a98b@gmx.net>
In-Reply-To: <6f57dc7b-ed61-7218-13a1-34f1456478c8@benettiengineering.com>
References: <20230319192915.264584-1-giulio.benetti@benettiengineering.com>
 <CA+fTLhhVYuSq+ygavwF5wg2SonW55Mg0_ZM2CyOc=jhFUVsOzw@mail.gmail.com>
 <6f57dc7b-ed61-7218-13a1-34f1456478c8@benettiengineering.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:340ssMNxfyiApO1/Cs0IEn1GK+EhBGqvJP5sczJvkSAWg7ZUiak
 vcBOhMyXE9m0O9rWKaZGiaNAC7JwaiNaCcLKSv372mX/2OZ+/nojwggICMwKcg2i19DpL6T
 1t87XHljmiN3N74tClL7m1X0q48SGbotbQf9kHvuRfDn5Jc+Gi9N9ZVuH6cGCTCS+u1eq/O
 auYNSUXSbtxaF2MUUaLTw==
UI-OutboundReport: notjunk:1;M01:P0:CHLAvGs6+wM=;qaKdSIWl0rIuPnEaBIadG6QLLbj
 OthlWptmbemBnujsvKkVbBLJPhm83lU+j2Z4xTIDuiuH0aPAclpRkIRuiv3fnWvALYKE9ZwZc
 o+UwbN6ztAE9+jFyQ/R/yJAz21KIJ6ZlyqW0lV/XxtWErCisUoSYFbxhaoTJeGjRapyHq219b
 AiUCaRKaHCCyZ7fqmeDC4h0Ej9NXKgmWvA9Z2FDz4kFicQOco5CFaN1aDnPYiJjV2E+DWbWJQ
 wChZQgxExWHw29UeL/V5sPX+gxTCnjo7a4nPPPxZysUvvfmPbEW5SeD5pEx2EaWNlbJg+2SyP
 La2ieWBeZaX3GYw6gAgjfWu4VPRwiYPtzLIdHPcohYn5u0p98Mj7XulEPNl5ApKP/3rynq2ty
 1146BC0w5aFlhTd6uiwTnRQWRIDx6tSGF2Im3AZmCwVY+a0Bw0o3He67ulbpGQQckPcPDyGhp
 3vB6IrlFF9ITXiOROX8p+MFbmjZfLic1h5+Lb2vFJJp0rmq/lW8LxlzZFxD2CLsoF83tnC7tw
 IuEqOsTQtoBYFpTqVGgDOhvy1Lr7Qr+VuuL71R1VXWwVvPWGeGkbmHfmQA+2WQBn0Crie1gEA
 IJY/pNy6QTLstEHBd0DVj0lrrFIRHIUjF9Ju7ePohtdgXhmlxt9ByYbPksdEUifNxHkUxkJ8S
 mae0YjfY6U6E69atYrMkf1an1B7AnyZ3VxNd7jjq9ctjOYwPgsRii67C6k3vQH4DE5S+rcCCP
 riFQz4dQY0ol4nE0h1jNAoiboIe7ugfo5clvFD+D3kmcJea17GMuPBn7ReFnIDEVumM5QO7qh
 BEEpWRu4L1mGy45+CqyrsxOqJVNwvmHs+PJOtcFiZjaf3o/r25S3MoCVHG6WgR3MEt7wdYwJ7
 M4MgosajH3p8bSoUq5nLFvbFHKYhihgW33RDdI5FW5ckTwFqOQmI3tB122c8iFHN3vgcicaCc
 IO1PhGSwHtz1ffki2I2Trtl2acY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679256326; i=ps.report@gmx.net;
 bh=rgNvkpzZYAMz23+x7i2uV8FLckU55T16Y2tdHe3Ev2Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Mm+CV9YROfThxH9mCcVXK5ow2Y2xnETWdiYg9aTsyoN7bOa+eX3XeiEH66u4Pdi+B
 xhdL2+5+28p4UziUV+O54E292E5hxrA2TLnqk6PW6atoaIS9dF85BbBlxf751RWnn2
 tG9CpJFZohx86DjF5XoBdJSQjNQx10X1Gep6cheiet+W+H2eoThjLA0KRXRY1KBkUU
 QzzBKW0BEYwW67B5ET/fIzRhcMd+OvN1ki1oeysjtR8sOxbDkFw+Z9Staln9P4aCvi
 yXpMiMIwo0GeNV69qyk4vMJjp37U/4PaVciKTDMNa57VJE+HVVghCaRZSMJDnObWMD
 bvMV2MU8lwW3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Mm+CV9YR
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKCk9uIFN1biwgMTkgTWFyIDIwMjMgMjA6NTY6MTkgKzAxMDAsIEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKCj4gSGkg
SW5kcmVrLAo+IAo+IHBsZWFzZSB1c2UgcGxhaW4tdGV4dCBlLW1haWwgYW5kIG5vdCBIVE1MIG9u
ZSwKPiAKPiBPbiAxOS8wMy8yMyAyMDo0MiwgSW5kcmVrIEtydXVzYSB3cm90ZToKPiA+IEtvbnRh
a3QgR2l1bGlvIEJlbmV0dGkgKDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
IAo+ID4gPG1haWx0bzpnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPj4pIGtp
cmp1dGFzIGt1dXDDpGV2YWwgUCwgCj4gPiAxOS4gbcOkcnRzIDIwMjMga2VsbCAyMToyOToKPiA+
IAo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBi
ZW5ldHRpZW5naW5lZXJpbmcuY29tCj4gPiAgICAgPG1haWx0bzpnaXVsaW8uYmVuZXR0aUBiZW5l
dHRpZW5naW5lZXJpbmcuY29tPj4KPiA+ICAgICAtLS0KPiA+ICAgICAgwqBwYWNrYWdlL21tYy11
dGlscy9tbWMtdXRpbHMuaGFzaCB8IDQgKystLQo+ID4gICAgICDCoHBhY2thZ2UvbW1jLXV0aWxz
L21tYy11dGlscy5tayA8aHR0cDovL21tYy11dGlscy5taz7CoCDCoHwgMiArLQo+ID4gICAgICDC
oDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4g
PiAgICAgZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5oYXNoCj4gPiAg
ICAgYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMuaGFzaAo+ID4gICAgIGluZGV4IDEyNTZm
NjM0ODcuLjIyZDM0YzNkNDAgMTAwNjQ0Cj4gPiAgICAgLS0tIGEvcGFja2FnZS9tbWMtdXRpbHMv
bW1jLXV0aWxzLmhhc2gKPiA+ICAgICArKysgYi9wYWNrYWdlL21tYy11dGlscy9tbWMtdXRpbHMu
aGFzaAo+ID4gICAgIEBAIC0xLDMgKzEsMyBAQAo+ID4gICAgICDCoCMgTG9jYWxseSBjb21wdXRl
ZAo+ID4gICAgIC1zaGEyNTYgCj4gPiAgICAgZjZlZDFjYjJmMDJkNDlkZjQyNDRmODg3MmI0N2Iy
Mjc4MGRkNjM0ZmExOWQ4NTcyOThjZTFiNzkzNzUyNzc2ZiAKPiA+ICAgICBtbWMtdXRpbHMtZGZj
M2I2ZWNkYTg0ZDIxNDE4ZmI0NDA4YjM5YzVjNzFkYjRjNjQ1OC1icjEudGFyLmd6Cj4gPiAgICAg
LXNoYTI1NiAKPiA+ICAgICBmNTdlM2M2MTY5MTE2YWE5ZmYwNmVlYzk1NzM0Y2EwMDBlNGQwMTk2
NDY3YmIyMjFlODBlNTA1MzBjNzY4MDgxwqAgbW1jLmgKPiA+ICAgICArc2hhMjU2IAo+ID4gICAg
IGU1YThkYWNmMjZhMTc4MDEwMjAyYzhmYTdjYjI4YjAxZjUwZmU5NjdkYTk4Y2RiZGYzMjBiMmYx
MTA5MjAxMDYgCj4gPiAgICAgbW1jLXV0aWxzLWQ0YzI5MTA5ODFmZjk5Yjk4MzczNDQyNmRmYTk5
NjMyZmI4MWFjNmItYnIxLnRhci5nego+ID4gICAgICtzaGEyNTYgCj4gPiAgICAgZjBiNTNiOWQ1
OGVlMjRlOGJkOWJiNjliZjRiMzFmOGQxZDAzMWNmNGY1ZDUwNzg4NDIxOThiYmM2YTc3OWNhNcKg
IG1tYy5oCj4gPiAgICAgZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGlscy5t
ayA8aHR0cDovL21tYy11dGlscy5taz4KPiA+ICAgICBiL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11
dGlscy5tayA8aHR0cDovL21tYy11dGlscy5taz4KPiA+ICAgICBpbmRleCA0MzVlNmFlN2YxLi5i
YzBmYzdhYWYyIDEwMDY0NAo+ID4gICAgIC0tLSBhL3BhY2thZ2UvbW1jLXV0aWxzL21tYy11dGls
cy5tayA8aHR0cDovL21tYy11dGlscy5taz4KPiA+ICAgICArKysgYi9wYWNrYWdlL21tYy11dGls
cy9tbWMtdXRpbHMubWsgPGh0dHA6Ly9tbWMtdXRpbHMubWs+Cj4gPiAgICAgQEAgLTQsNyArNCw3
IEBACj4gPiAgICAgIMKgIwo+ID4gICAgICDCoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiAK
PiA+ICAgICAtTU1DX1VUSUxTX1ZFUlNJT04gPSBkZmMzYjZlY2RhODRkMjE0MThmYjQ0MDhiMzlj
NWM3MWRiNGM2NDU4Cj4gPiAgICAgK01NQ19VVElMU19WRVJTSU9OID0gZDRjMjkxMDk4MWZmOTli
OTgzNzM0NDI2ZGZhOTk2MzJmYjgxYWM2Ygo+ID4gICAgICDCoE1NQ19VVElMU19TSVRFID0KPiA+
ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jamIv
bW1jLXV0aWxzLmdpdAo+ID4gICAgIDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jamIvbW1jLXV0aWxzLmdpdD4KPiA+IAo+ID4gCj4gPiBJIGhhcHBlbmVk
IHRvIGNsaWNrIG9uIHRoYXQgZ2l0Lmtlcm5lbC5vcmcgCj4gPiA8aHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2piL21tYy11dGlscy5naXQ+wqBsaW5rIAo+
ID4gYW5kIGl0IGRvZXNuJ3TCoHdvcmsuIEJ1dCB0aGVuIHdoZXJlIGRvZXMgdGhpcyB2ZXJzaW9u
IGNvbWUgZnJvbT8gIAo+IAo+IHRoYXQgaXMgdGhlIGdpdCByZXBvc2l0b3J5IGFkZHJlc3MsIGl0
J3Mgbm90IHRoZSBzYW1lIGFkZHJlc3Mgb2YgdGhlCj4gZ2l0LXdlYiBmcm9udGVuZC4gSWYgZG9l
c24ndCBzaG93IHVwIG9uIHRoZSBicm93c2VyIGl0IGRvZXNuJ3QgbWVhbiBnaXQKPiBkb2Vzbid0
IHdvcmsuIFRyeSB0bzoKPiAkIGdpdCBjbG9uZSAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9jamIvbW1jLXV0aWxzLmdpdAo+IAo+IGFuZCB5b3Ugd2ls
bCBzZWUgdGhhdCBpdCB3aWxsIGNsb25lIHRoZSByZXBvc2l0b3J5LgoKQSBiZXR0ZXIgb25lIChi
b3RoIHdlYiBhbmQgZ2l0KSB3b3VsZCBiZToKCglodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vdXRpbHMvbW1jL21tYy11dGlscy5naXQKClJlZ2FyZHMsClBldGVyCgo+IAo+IEJlc3QgcmVn
YXJkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
