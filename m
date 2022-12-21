Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C40C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45338205A;
	Wed, 21 Dec 2022 21:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45338205A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hc0Y5aUavnSB; Wed, 21 Dec 2022 21:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB52082056;
	Wed, 21 Dec 2022 21:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB52082056
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19CAD1BF2F5
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E95AE82057
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 21:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E95AE82057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cy9nTpWRrbrV for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 21:17:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D38C82026
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D38C82026
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 21:17:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:11b5:850a:c0e4:4863])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B3C5E2003C6;
 Wed, 21 Dec 2022 22:16:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Dec 2022 22:16:57 +0100
Date: Wed, 21 Dec 2022 22:16:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20221221211657.GN2909@scaer>
References: <10881_1666122188_634F01CC_10881_33_1_cover.1666122184.git.yann.morin@orange.com>
 <18712_1666122192_634F01D0_18712_304_1_aadcab6f9e8f71b5581c8a15b2773a431bb29ca0.1666122184.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18712_1666122192_634F01D0_18712_304_1_aadcab6f9e8f71b5581c8a15b2773a431bb29ca0.1666122184.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671657423;
 bh=U1Asu7wFJ2PHXyI3M5qNI5peNbQEkTXMP2UQWVYBAzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jg91G5bYFya7piRoPKbNdXNhcxO7e9zWVq/02R39bBgGJMTRtnoUIFtW8+4x0YChy
 /KFHcZYUVklmsnQF6/FN1iEyZNMDM+GIkcZCPAsaYTIcbMN2lX+nIAGVqHax+3Iir3
 cZ2kaC7NSx90WZSmjaZfDsmhGmRYRN2uJmnnyXZugudYhc+q2v5DFzYIcCdE8Zu0AC
 AAkBFcL7nF+BKethsiOAHcCVpzAlzzdVIr26YuDFUrDKYxiq7m6+4JAx4lNXmTWArL
 va+2ScCXNL6m+M/JySaGVx9OzkZlej/4G3TPvGPeGAkQITUVbItDLZsQGFQVyuOGNA
 Eyb9U+VCyN3jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jg91G5bY
Subject: Re: [Buildroot] [PATCH 1/6 v3] package/skeleton-systemd: move /var
 factory tmpfiles out of /etc
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
Cc: Norbert Lange <nolange79@gmail.com>,
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gMjAyMi0xMC0xOCAyMTo0MyArMDIwMCwgeWFubi5tb3JpbkBvcmFuZ2Uu
Y29tIHNwYWtlIHRodXNseToKPiBXaGVuIHRoZSByb290ZnMgaXMgbm90IHJlbW91bnRlZCByZWFk
LXdyaXRlICh0aHVzIGFzc3VtaW5nIGEgcmVhZC1vbmx5Cj4gcm9vdGZzIGxpa2Ugc3F1YXNoZnMp
LCB3ZSBjcmVhdGUgYSB0bXBmaWxlcy5kIGZhY3RvcnkgZm9yIC92YXIuCj4gCj4gSG93ZXZlciwg
d2UgcmVnaXN0ZXIgdGhvc2UgaW4gL2V0Yy90bXBmaWxlcy5kLywgYnV0IC9ldGMgY291bGQgYWxz
byBiZQo+IGEgdG1wZnMgKGZvciBmdWxsIHN0YXRlLWxlc3Mgc3lzdGVtcywgb3IgZWFzeSBmYWN0
b3J5LXJlc2V0LCBzZWUgWzBdKS4KPiAKPiBTbywgd2UgbW92ZSBvdXIgdmFyIGZhY3RvcnkgdG8g
L3Vzci9saWIvdG1wZmlsZXMuZC8sIHdoaWNoIGlzIGFsc28gdGhlCj4gbG9jYXRpb24gd2hlcmUg
c3lzdGVtZCBpdHNlbGYgcGxhY2VzIGl0cyBvd24gdG1wZmlsZXMsIGFuZCB3aGVyZSB3ZQo+IGFs
cmVhZHkgcHV0IGFsbCBvdXIgb3RoZXIgdG1wZmlsZXMgKHNlZSBhdWRpdCwgYXZhaGksIGNyeXB0
c2V0dXAsIGRoY3AsCj4gbGlnaHR0cGQsIG5mcy11dGlscywgcXVhZ2dhLCBzYW1iYTQsIHN3dXBk
YXRlKSBhbmQgb3VyIGhhbmRsaW5nIG9mCj4gc3lzdGVtZCdzIGNhdGFsb2cgZmlsZXMgdG9vLiBX
ZSBhbHNvIHJlbmFtZSB0aGUgZmlsZSB0byBhIGJldHRlciBuYW1lLAo+IHNvIHRoYXQgaXQgaXMg
b2J2aW91cyBpdCBpcyBnZW5lcmF0ZWQgYnkgdXMgKHN5c3RlbWQgYWxyZWFkeSBpbnN0YWxscyBh
Cj4gdmFyLmNvbmYgb2YgaXRzIG93biwgc28gd2Ugd2FudCB0byBhdm9pZCBuYW1lIGNsYXNoaW5n
KS4KPiAKPiBMYXN0IGxpdHRsZSBkZXRhaWw6IHRoZXJlIGlzIG5vIG5lZWQgb3IgcmVhc29uIHRv
IGNyZWF0ZSAuLi4vdG1wZmlsZXMuZC8KPiBhdCBpbnN0YWxsIHRpbWU7IGl0IGlzIG9ubHkgbmVl
ZGVkIGluIHRoZSByb290ZnMtcHJlLWNtZCBob29rLCBzbyB3ZQo+IG9ubHkgY3JlYXRlIGl0IGp1
c3QgYmVmb3JlIHdlIG5lZWQgaXQuCj4gCj4gWzBdIGh0dHA6Ly8wcG9pbnRlci5kZS9ibG9nL3By
b2plY3RzL3N0YXRlbGVzcy5odG1sCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8
eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+IENjOiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21h
aWwuY29tPgo+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiBDYzog
SmXMgXJlzIFteSBSb3NlbiA8amVyZW15LnJvc2VuQHNtaWxlLmZyPgo+IFt5YW5uLm1vcmluLjE5
OThAZnJlZS5mcjoKPiAgIC0gc3BsaXQgb3JpZ2luYWwgcGF0Y2ggaW4gdHdvCj4gICAtIHRoaXMg
b25lIG9ubHkgbW92ZXMgb3V0IG9mIC9ldGMgYW5kIGludG8gL3Vzci9saWIKPiAgIC0gYWRhcHQg
Y29tbWl0IGxvZyBhY2NvcmRpbmdseQo+IF0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhlIHJl
bmFtaW5nIHN1Z2dlc3RlZCBieSBOb3JiZXJ0LCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKPiAtLS0KPiAgcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5p
dC1zeXN0ZW1kLm1rIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1z
eXN0ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tayBiL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1z
eXN0ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVtZC5tawo+IGluZGV4IDc5NWExNzE4MDkuLjdiNjY3
MzJlZjQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0
b24taW5pdC1zeXN0ZW1kLm1rCj4gKysrIGIvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQv
c2tlbGV0b24taW5pdC1zeXN0ZW1kLm1rCj4gQEAgLTI5LDcgKzI5LDYgQEAgZWxzZQo+ICAjIGEg
cmVhbCAoYnV0IGVtcHR5KSBkaXJlY3RvcnksIGFuZCB0aGUgImZhY3RvcnkgZmlsZXMiIHdpbGwg
YmUgY29waWVkCj4gICMgYmFjayB0aGVyZSBieSB0aGUgdG1wZmlsZXMuZCBtZWNoYW5pc20uCj4g
IGRlZmluZSBTS0VMRVRPTl9JTklUX1NZU1RFTURfUk9PVF9ST19PUl9SVwo+IC0JbWtkaXIgLXAg
JChUQVJHRVRfRElSKS9ldGMvc3lzdGVtZC90bXBmaWxlcy5kCj4gIAllY2hvICIvZGV2L3Jvb3Qg
LyBhdXRvIHJvIDAgMSIgPiQoVEFSR0VUX0RJUikvZXRjL2ZzdGFiCj4gIAllY2hvICJ0bXBmcyAv
dmFyIHRtcGZzIG1vZGU9MTc3NyAwIDAiID4+JChUQVJHRVRfRElSKS9ldGMvZnN0YWIKPiAgZW5k
ZWYKPiBAQCAtMzgsNiArMzcsNyBAQCBkZWZpbmUgU0tFTEVUT05fSU5JVF9TWVNURU1EX1BSRV9S
T09URlNfVkFSCj4gIAlybSAtcmYgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvZmFjdG9yeS92YXIK
PiAgCW12ICQoVEFSR0VUX0RJUikvdmFyICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3Rvcnkv
dmFyCj4gIAlta2RpciAtcCAkKFRBUkdFVF9ESVIpL3Zhcgo+ICsJbWtkaXIgLXAgJChUQVJHRVRf
RElSKS91c3IvbGliL3RtcGZpbGVzLmQKPiAgCWZvciBpIGluICQoVEFSR0VUX0RJUikvdXNyL3No
YXJlL2ZhY3RvcnkvdmFyLyogXAo+ICAJCSAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9mYWN0b3J5
L3Zhci9saWIvKiBcCj4gIAkJICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3RvcnkvdmFyL2xp
Yi9zeXN0ZW1kLyo7IGRvIFwKPiBAQCAtNTEsNyArNTEsNyBAQCBkZWZpbmUgU0tFTEVUT05fSU5J
VF9TWVNURU1EX1BSRV9ST09URlNfVkFSCj4gIAkJCXByaW50ZiAiQyEgJXMgLSAtIC0gLVxuIiAi
JCR7an0iIFwKPiAgCQkJfHwgZXhpdCAxOyBcCj4gIAkJZmk7IFwKPiAtCWRvbmUgPiQoVEFSR0VU
X0RJUikvZXRjL3RtcGZpbGVzLmQvdmFyLWZhY3RvcnkuY29uZgo+ICsJZG9uZSA+JChUQVJHRVRf
RElSKS91c3IvbGliL3RtcGZpbGVzLmQvYnVpbGRyb290LWZhY3RvcnkuY29uZgo+ICBlbmRlZgo+
ICBTS0VMRVRPTl9JTklUX1NZU1RFTURfUk9PVEZTX1BSRV9DTURfSE9PS1MgKz0gU0tFTEVUT05f
SU5JVF9TWVNURU1EX1BSRV9ST09URlNfVkFSCj4gIAo+IC0tIAo+IDIuMjUuMQo+IAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiAKPiBDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRl
bmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBldCBu
ZSBkb2l2ZW50IGRvbmMKPiBwYXMgZXRyZSBkaWZmdXNlcywgZXhwbG9pdGVzIG91IGNvcGllcyBz
YW5zIGF1dG9yaXNhdGlvbi4gU2kgdm91cyBhdmV6IHJlY3UgY2UgbWVzc2FnZSBwYXIgZXJyZXVy
LCB2ZXVpbGxleiBsZSBzaWduYWxlcgo+IGEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFp
bnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0
YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sCj4gT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVz
cG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lm
aWUuIE1lcmNpLgo+IAo+IFRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250
YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHBy
b3RlY3RlZCBieSBsYXc7Cj4gdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9y
IGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uCj4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhp
cyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMuCj4gQXMgZW1haWxzIG1heSBiZSBhbHRlcmVk
LCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZp
ZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLgo+IFRoYW5rIHlvdS4KPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
CnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERl
c2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2
MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8g
IFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwg
LyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
