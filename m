Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAAFC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A8B581347;
	Mon, 15 Aug 2022 19:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8B581347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzQjpFCTtTyW; Mon, 15 Aug 2022 19:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C768581351;
	Mon, 15 Aug 2022 19:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C768581351
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBE421BF279
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6FDA81351
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6FDA81351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQGdJKIvN9ad for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B4C81347
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85B4C81347
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 19:01:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CBBD26012D;
 Mon, 15 Aug 2022 21:01:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:01:40 +0200
Date: Mon, 15 Aug 2022 21:01:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220815190140.GF2854108@scaer>
References: <20220815165632.1278597-1-francois.perrad@gadz.org>
 <20220815165632.1278597-2-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815165632.1278597-2-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660590102;
 bh=Qvvrl/VR1LFT35AUjnrg+x31gwXaKN/xGnOK1hiIR1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HD44MtfLdtwm0o4H9ZI4uItMcipiFwaJINjcWuLya0jFP+6zkZRZ9E+zrK5bkevqO
 oZ+z6FyLrer+5lP6jOQ0LNXZn8s5BW9yvfMeEhRxCtAPctC1aw1N/HzNtA/V17AyE4
 pG/D1EpNKnlKsDPviDvQL/Ql2wMkBUjGdicZdCOWW1QoXlQgA33ZZhY1cLkLYCrjZI
 DRzPFH12hBe7kMUfX3djyxL03YFrME1+EBqmFJHPpzNzh+pLzYwoaRtiCphhNFYhRj
 EbcPoCHUOAwK4Fa+aA/uO3fyqjWySoT2/EuPLWjKDK55bilH/gzcvplQaOoHKMDWWz
 ttsy4nF88DrTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HD44MtfL
Subject: Re: [Buildroot] [PATCH 2/4] package/pkg-utils.mk: move
 FREESCALE_IMX_EXTRACT_HELPER
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE1IDE4OjU2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKVGhpcyBjb21pdCBsb2cgd2FzIGJpdCB0b28gc2hvcnQsIHNv
IEkgZXh0ZW5kZWQgaXQgd2l0aCBhIHJhdGlvbmFsZSBmb3IKdGhlIG1vdmUuCgpBcHBsaWVkIHRv
IG5leHQsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvZnJlZXNjYWxlLWlteC5tayB8IDI1IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgcGFja2FnZS9wa2ctdXRpbHMubWsgICAgICAgICAgICAgICAgICAgfCAyNSArKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9mcmVlc2NhbGUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2ZyZWVzY2FsZS1pbXgu
bWsKPiBpbmRleCA4NGExNzI1Y2MuLjVmMzJhMDk4YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvZnJlZXNjYWxlLWlteC5tawo+ICsrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9mcmVlc2NhbGUtaW14Lm1rCj4gQEAgLTYsMjkgKzYsNCBAQAo+ICAKPiAgRlJFRVNDQUxFX0lN
WF9TSVRFID0gaHR0cDovL3d3dy5ueHAuY29tL2xnZmlsZXMvTk1HL01BRC9ZT0NUTwo+ICAKPiAt
IyBIZWxwZXIgZm9yIHNlbGYtZXh0cmFjdGluZyBiaW5hcmllcyBkaXN0cmlidXRlZCBieSBGcmVl
c2NhbGUuCj4gLSMKPiAtIyBUaGUgLS1mb3JjZSBvcHRpb24gbWFrZXMgc3VyZSBpdCBkb2Vzbid0
IGZhaWwgaWYgdGhlIHNvdXJjZQo+IC0jIGRpcmVjdG9yeSBhbHJlYWR5IGV4aXN0cy4gVGhlIC0t
YXV0by1hY2NlcHQgc2tpcHMgdGhlIGxpY2Vuc2UgY2hlY2ssCj4gLSMgYXMgaXQgaXMgbm90IG5l
ZWRlZCBpbiBCdWlsZHJvb3QgYmVjYXVzZSB3ZSBoYXZlIGxlZ2FsLWluZm8uIFNpbmNlCj4gLSMg
dGhlcmUncyBhIEVVTEEgaW4gdGhlIGJpbmFyeSBmaWxlLCB3ZSBleHRyYWN0IGl0IGluIHRoaXMg
bWFjcm8sIGFuZAo+IC0jIGl0IHNob3VsZCB0aGVyZWZvcmUgYmUgYWRkZWQgdG8gdGhlIExJQ0VO
U0VfRklMRVMgdmFyaWFibGUgb2YKPiAtIyBwYWNrYWdlcyB1c2luZyB0aGlzIG1hY3JvLiBBbHNv
LCByZW1lbWJlciB0byBzZXQgUkVESVNUUklCVVRFIHRvCj4gLSMgIk5PIi4gSW5kZWVkLCB0aGlz
IGlzIGEgbGVnYWwgbWluZWZpZWxkOiB0aGUgRVVMQSBzcGVjaWZpZXMgdGhhdCB0aGUKPiAtIyBC
b2FyZCBTdXBwb3J0IFBhY2thZ2UgaW5jbHVkZXMgc29mdHdhcmUgYW5kIGhhcmR3YXJlIChzaWMh
KSBmb3IKPiAtIyB3aGljaCBhIHNlcGFyYXRlIGxpY2Vuc2UgaXMgbmVlZGVkLi4uCj4gLSMKPiAt
IyAkKDEpOiBmdWxsIHBhdGggdG8gdGhlIGFyY2hpdmUgZmlsZQo+IC0jCj4gLWRlZmluZSBGUkVF
U0NBTEVfSU1YX0VYVFJBQ1RfSEVMUEVSCj4gLQlhd2sgJ0JFR0lOICAgICAgeyBzdGFydCA9IDA7
IH0gXAo+IC0JICAgICAvXkVPRVVMQS8gIHsgc3RhcnQgPSAwOyB9IFwKPiAtCSAgICAgICAgICAg
ICAgICB7IGlmIChzdGFydCkgcHJpbnQ7IH0gXAo+IC0JICAgICAvPDxFT0VVTEEvIHsgc3RhcnQg
PSAxOyB9JyBcCj4gLQkgICAgJCgxKSA+ICQoQEQpL0VVTEEKPiAtCWNkICQoQEQpICYmIHNoICQo
MSkgLS1mb3JjZSAtLWF1dG8tYWNjZXB0Cj4gLQlmaW5kICQoQEQpLyQoYmFzZW5hbWUgJChub3Rk
aXIgJCgxKSkpIC1taW5kZXB0aCAxIC1tYXhkZXB0aCAxIC1leGVjIG12IHt9ICQoQEQpIFw7Cj4g
LQlybWRpciAkKEBEKS8kKGJhc2VuYW1lICQobm90ZGlyICQoMSkpKQo+IC1lbmRlZgo+IC0KPiAg
aW5jbHVkZSAkKHNvcnQgJCh3aWxkY2FyZCBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvKi8qLm1rKSkK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5t
awo+IGluZGV4IDZlY2UyN2JhYS4uNTdmNGFmMDRjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGtn
LXV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctdXRpbHMubWsKPiBAQCAtMjc1LDMgKzI3NSwy
OCBAQCBsZWdhbC1kZXBzID0gXAo+ICAgICAgICAgICQoZmlsdGVyLW91dCAkKGlmICQoMTpob3N0
LSU9KSxob3N0LSUpLFwKPiAgICAgICAgICAgICAgJChjYWxsIG5vbi12aXJ0dWFsLWRlcHMsXAo+
ICAgICAgICAgICAgICAgICAgJCgkKGNhbGwgVVBQRVJDQVNFLCQoMSkpX0ZJTkFMX1JFQ1VSU0lW
RV9ERVBFTkRFTkNJRVMpKSksJChwKSBbJCgkKGNhbGwgVVBQRVJDQVNFLCQocCkpX0xJQ0VOU0Up
XSkKPiArCj4gKyMgSGVscGVyIGZvciBzZWxmLWV4dHJhY3RpbmcgYmluYXJpZXMgZGlzdHJpYnV0
ZWQgYnkgRnJlZXNjYWxlLgo+ICsjCj4gKyMgVGhlIC0tZm9yY2Ugb3B0aW9uIG1ha2VzIHN1cmUg
aXQgZG9lc24ndCBmYWlsIGlmIHRoZSBzb3VyY2UKPiArIyBkaXJlY3RvcnkgYWxyZWFkeSBleGlz
dHMuIFRoZSAtLWF1dG8tYWNjZXB0IHNraXBzIHRoZSBsaWNlbnNlIGNoZWNrLAo+ICsjIGFzIGl0
IGlzIG5vdCBuZWVkZWQgaW4gQnVpbGRyb290IGJlY2F1c2Ugd2UgaGF2ZSBsZWdhbC1pbmZvLiBT
aW5jZQo+ICsjIHRoZXJlJ3MgYSBFVUxBIGluIHRoZSBiaW5hcnkgZmlsZSwgd2UgZXh0cmFjdCBp
dCBpbiB0aGlzIG1hY3JvLCBhbmQKPiArIyBpdCBzaG91bGQgdGhlcmVmb3JlIGJlIGFkZGVkIHRv
IHRoZSBMSUNFTlNFX0ZJTEVTIHZhcmlhYmxlIG9mCj4gKyMgcGFja2FnZXMgdXNpbmcgdGhpcyBt
YWNyby4gQWxzbywgcmVtZW1iZXIgdG8gc2V0IFJFRElTVFJJQlVURSB0bwo+ICsjICJOTyIuIElu
ZGVlZCwgdGhpcyBpcyBhIGxlZ2FsIG1pbmVmaWVsZDogdGhlIEVVTEEgc3BlY2lmaWVzIHRoYXQg
dGhlCj4gKyMgQm9hcmQgU3VwcG9ydCBQYWNrYWdlIGluY2x1ZGVzIHNvZnR3YXJlIGFuZCBoYXJk
d2FyZSAoc2ljISkgZm9yCj4gKyMgd2hpY2ggYSBzZXBhcmF0ZSBsaWNlbnNlIGlzIG5lZWRlZC4u
Lgo+ICsjCj4gKyMgJCgxKTogZnVsbCBwYXRoIHRvIHRoZSBhcmNoaXZlIGZpbGUKPiArIwo+ICtk
ZWZpbmUgRlJFRVNDQUxFX0lNWF9FWFRSQUNUX0hFTFBFUgo+ICsJYXdrICdCRUdJTiAgICAgIHsg
c3RhcnQgPSAwOyB9IFwKPiArCSAgICAgL15FT0VVTEEvICB7IHN0YXJ0ID0gMDsgfSBcCj4gKwkg
ICAgICAgICAgICAgICAgeyBpZiAoc3RhcnQpIHByaW50OyB9IFwKPiArCSAgICAgLzw8RU9FVUxB
LyB7IHN0YXJ0ID0gMTsgfScgXAo+ICsJICAgICQoMSkgPiAkKEBEKS9FVUxBCj4gKwljZCAkKEBE
KSAmJiBzaCAkKDEpIC0tZm9yY2UgLS1hdXRvLWFjY2VwdAo+ICsJZmluZCAkKEBEKS8kKGJhc2Vu
YW1lICQobm90ZGlyICQoMSkpKSAtbWluZGVwdGggMSAtbWF4ZGVwdGggMSAtZXhlYyBtdiB7fSAk
KEBEKSBcOwo+ICsJcm1kaXIgJChARCkvJChiYXNlbmFtZSAkKG5vdGRpciAkKDEpKSkKPiArZW5k
ZWYKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
