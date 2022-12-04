Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E139C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 13:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4BB581852;
	Sun,  4 Dec 2022 13:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BB581852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8arBUXrytD4N; Sun,  4 Dec 2022 13:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D868A81831;
	Sun,  4 Dec 2022 13:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D868A81831
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F16C1BF239
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4464440288
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4464440288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nduQv1UN55j for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 13:08:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA01640033
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA01640033
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 13:08:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5198240002;
 Sun,  4 Dec 2022 13:08:11 +0000 (UTC)
Date: Sun, 4 Dec 2022 14:08:09 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20221204140809.5159d22f@windsurf>
In-Reply-To: <20221201183337.1588407-3-vincent.stehle@arm.com>
References: <20221201183337.1588407-1-vincent.stehle@arm.com>
 <20221201183337.1588407-3-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670159292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSXLC/wceILk10mJY33S8HPDZMbi3wYYQLGe/HPEBEQ=;
 b=U7U6bG5w79eDxbuKwThyjdVqLl5ImTvWFeuhDwJCWhOLcxxtFnBchbcYEascQDw3BsTAPk
 yivZjDkld3qhWzO+0bjTuOD6lQj1vVZt98EWs5frzInzDl3f6hp3oQ/weNIb5B335CWXDT
 mg6zgajLLRUG0zUO/L6iymUp5sijb5ljZU7NUgOPQ3FSe0DOi0vyF/7uAM2myxQBOa6uAk
 kOz1Co5EzFjr/c4EEZookrZ8ceqWPHSrq2EzhVPZQmClugGUCwJ9/rwwzacDgbpwPMEbob
 tN8+j80sPj4woPWbY63HS7EZqbf3qFL/0St1vqpjJsUXKRX9usR0oyiJnCDL1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U7U6bG5w
Subject: Re: [Buildroot] [PATCH 2/3 next] package/edk2-non-osi: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgMSBEZWMgMjAyMiAxOTozMzozNiArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBBZGQgYSBwYWNrYWdlIHRvIGluc3RhbGwgdGhl
IGFkZGl0aW9uYWwgZWRrMiBwbGF0Zm9ybXMgZmlsZXMsIG5vdAo+IGNvbXBhdGlibGUgd2l0aCB0
aGUgbm9ybWFsIGxpY2Vuc2luZyByZXF1aXJlbWVudHMgYW5kIGhlbGQgaW4gdGhlCj4gZWRrMi1u
b24tb3NpIHJlcG9zaXRvcnkuCj4gCj4gT25seSB0aGUgTWFydmVsbCBBcm1hZGEgZmlsZXMgYXJl
IGNvcGllZCBhdCB0aGlzIHBvaW50LCB0byBzdXBwb3J0IGJ1aWxkaW5nCj4gZWRrMiBmb3IgdGhl
IE1BQ0NISUFUT2JpbiBwbGF0Zm9ybS4KPiAKPiBUaGUgcmVmZXJlbmNlZCBjb21taXQgY29ycmVz
cG9uZHMgdG8gdmVyc2lvbiBlZGsyLXN0YWJsZTIwMjIwOCBvZiBlZGsyLAo+IGJhc2VkIG9uIHRo
ZSB0aW1lc3RhbXBzLgo+IAo+IFRoaXMgcGFja2FnZSBpcyBoZWF2aWx5IGluc3BpcmVkIGZyb20g
cGFja2FnZS9lZGsyLXBsYXRmb3Jtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpUbyBiZSBob25lc3QsIEkgZG9uJ3QgcmVhbGx5IHVu
ZGVyc3RhbmQgdGhlIHJlYXNvbmluZyBvZiB0aGUgbW92ZSBvZgp0aGUgTWFydmVsbCBmaWxlcyB0
byB0aGlzIGVkazItbm9uLW9zaSByZXBvc2l0b3J5LiBJbmRlZWQsIHRoZXkgYXJlCnVuZGVyIEJT
RC0yLVBhdGVudCwgd2hpY2ggaXMgYW4gT1NJLWNvbXBhdGlibGUgbGljZW5zZS4KCkJ1dCBhbnl3
YXkuLi4KCgo+ICsjIENvcHkgTWFydmVsbCBBcm1hZGEgZmlsZXMKPiArRURLMl9OT05fT1NJX0xJ
Q0VOU0UgKz0gLCBCU0QtMi1DbGF1c2UtUGF0ZW50IChNYXJ2ZWxsIEFybWFkYSkKCkkgY2hhbmdl
ZCB0aGUgKz0gYW5kIHJlbW92ZWQgdGhlIGNvbW1hLCBhcyBmb3Igbm93IHdlIG9ubHkgaGF2ZSB0
aGlzCnBhcnRpY3VsYXIgbGljZW5zZSwgYW5kIHdlIGRvbid0IHdhbnQgdGhlIF9MSUNFTlNFIHZh
cmlhYmxlIHZhbHVlIHRvCnN0YXJ0IHdpdGggYSBjb21tYS4KCj4gK0VESzJfTk9OX09TSV9MSUNF
TlNFX0ZJTEVTICs9IFNpbGljb24vTWFydmVsbC9Bcm1hZGE3azhrL0RldmljZVRyZWUvQXJtYWRh
ODB4ME1jQmluLmluZgo+ICtFREsyX05PTl9PU0lfRElSUyArPSBTaWxpY29uL01hcnZlbGwvQXJt
YWRhN2s4ay9EZXZpY2VUcmVlCj4gKwo+ICsjIFRoZXJlIGlzIG5vdGhpbmcgdG8gYnVpbGQgZm9y
IGVkazItbm9uLW9zaS4gQWxsIHdlIG5lZWQgdG8gZG8gaXMgdG8gY29weQo+ICsjIHRoZSBzZWxl
Y3RlZCBkZXNjcmlwdGlvbiBmaWxlcyB0byBzdGFnaW5nLCBmb3Igb3RoZXIgcGFja2FnZXMgdG8g
YnVpbGQgd2l0aC4KPiArZGVmaW5lIEVESzJfTk9OX09TSV9JTlNUQUxMX1NUQUdJTkdfQ01EUwo+
ICsJbWtkaXIgLXAgJChTVEFHSU5HX0RJUikvdXNyL3NoYXJlL2VkazItbm9uLW9zaQoKSSByZW1v
dmVkIHRoaXMgbWtkaXIsIHNpbmNlIGFud2F5IHlvdSBhcmUgdXNpbmcgbWtkaXIgLXAgYmVsb3cg
dG8KY3JlYXRlIHRoZSBzdWJkaXJzLgoKPiArCWZvciBkIGluICQoRURLMl9OT05fT1NJX0RJUlMp
OyBkbyBcCj4gKwkJbWtkaXIgLXAgJChTVEFHSU5HX0RJUikvdXNyL3NoYXJlL2VkazItbm9uLW9z
aS8kJGQ7IFwKPiArCQljcCAtcmYgJChARCkvJCRkLyogJChTVEFHSU5HX0RJUikvdXNyL3NoYXJl
L2VkazItbm9uLW9zaS8kJGQvOyBcCj4gKwlkb25lCgpSZXdvcmtlZCB3aXRoIGEgbWFrZSBmb3Jl
YWNoIGxvb3Agc28gdGhhdCBpIGFib3J0cyBpbiBjYXNlIG9mIGEgZmFpbHVyZS4KCkFwcGxpZWQg
dG8gbmV4dCB3aXRoIHRob3NlIGNoYW5nZXMuCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
