Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC9DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC9B84047;
	Sat, 26 Feb 2022 10:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVERDJ2nqYFV; Sat, 26 Feb 2022 10:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF9884040;
	Sat, 26 Feb 2022 10:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 481A91BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36EC360C1B
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOVyyg12lZLB for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:20:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8060960ADE
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:20:04 +0000 (UTC)
Received: from smtpclient.apple ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPA
 id NuBEnLwINX0z7NuBEnsKtY; Sat, 26 Feb 2022 11:20:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645870802; bh=Jx2Zr6cWOFNzTz0LmebjnpFan3/CHQjH2dZrPfCxO2g=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=LtLfGODStRiNCv+qvj8tyjCYcH8t80JF9Qi++iboQKrFaXfTuRqKwBV51bfTiirWx
 +sHgRWhCacKVit8VsNoViQd//4cgKpeyWLOVd1ow8M7d7rTSZTFpPzAFxhRcQjFY6C
 LFCDbhYykqq8Kzha6tM9BapjUBXHHxjg4dvRdJlzX4MK9/aOwNOOxJ+5B4EOcDFcJz
 AF/6UQSOOFEs+iCNAqNIbz33jayqmXU+esa93MjwBDlEXmPVs6YoRnqps2ktocEKMV
 jMetSCooN+GuQt9cbRTRCFDM0i/wkZqQU7NvXDChW0bqgMH0r6VxNdjcEWdqrdDmRd
 LXmCw4HRo/IXA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 26 Feb 2022 11:19:59 +0100
Message-Id: <3D49BD64-4189-4E96-BE05-B39A4D75C04B@benettiengineering.com>
References: <42058D10-AAA9-41FE-91E3-1D5153134FCA@benettiengineering.com>
In-Reply-To: <42058D10-AAA9-41FE-91E3-1D5153134FCA@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>,
 Nicholas Sielicki <sielicki@yandex.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4wfKvCpG483HcwtcWC7VPgaVxSLlmMlSVGvpJ4+COQBPyeDp48aEhRJZka4fbvGozneB+PQ5uubEIXmWu2jmen7f4tl38xZs3hd14B0WWZ0bEd3Rvk1wRw
 oP0kNA7sJOhMRN5eEWOaCSzy6TZWwuCp6d7eyqpHMOe3IzRdPCnj3JGbf6Y+XHTQorP7uYGFYEyYp2wTh0qRJ1bbaPL5rWNlj87Dqz25hXM12Welq3AiZNYE
 UA+8K946uVQZfTl16FWIqA==
Subject: Re: [Buildroot] [PATCH] board/intel/galileo: fix build failure with
 host gcc 10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKTmljaG9sYXMgd2lsbCB0YWtlIGNhcmUgYWJvdXQgYnVtcGluZyB1Ym9vdCBhbmQg
TGludXggaW4gYSBjb3VwbGUgb2Ygd2Vla3MuIEhl4oCZcyB3cml0dGVuIG1lIHByaXZhdGVseS4K
CkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4gSWwgZ2lvcm5vIDEzIGZlYiAyMDIyLCBhbGxlIG9yZSAx
Mzo1NiwgR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5j
b20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgTmljb2xhcywKPiAKPiBzb3JyeSBmb3IgaHRtbCBi
dXQgSeKAmW0gbW9iaWxlLgo+IAo+IE15IHBhdGNoIGZvciBmaXhpbmcgdGhlIGJ1aWxkIGZhaWx1
cmUgZm9yIEdhbGlsZW8gaGFzIGJlZW4gdXBzdHJlYW0sIGJ1dCBMaW51eCB2ZXJzaW9uIGlzIHZl
cnkgb2xkLAo+IEnigJl2ZSBhZGRlZCBhIGxvY2FsIHBhdGNoIGZyb20gMjAxNCBhcyBwb2ludGVk
IEFybm91dCBiZWxvdy4KPiBJIGRvbuKAmXQgaGF2ZSBhIEdhbGlsZW8gYm9hcmQgYW5kIHlvdSBh
cmUgdGhlIG1haW50YWluZXIsIGNhbiB5b3UgcGxlYXNlIHVwZGF0ZSB1Ym9vdCBhbmQgTGludXgg
dmVyc2lvbnMgYW5kIHNlbmQgYSBwYXRjaCBmb3IgdGhhdCBhZnRlciB0ZXN0aW5nIHBsZWFzZT8K
PiAKPiBUaGFuayB5b3UhCj4g4oCULQo+IEdpdWxpbyBCZW5ldHRpCj4gQmVuZXR0aSBFbmdpbmVl
cmluZyBzYXMKPiAKPj4gSWwgZ2lvcm5vIDEzIGZlYiAyMDIyLCBhbGxlIG9yZSAxMjo0NiwgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+PiAKPj4g77u/
Cj4+IAo+Pj4+IE9uIDAyLzAyLzIwMjIgMjI6NDMsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+Pj4g
QnVpbGRpbmcgZ2FsaWxlb19kZWZjb25maWcgdGhyb3dzIGVycm9yOgo+Pj4gYGBgCj4+PiAvdXNy
L2Jpbi9sZDogYXJjaC94ODYvdG9vbHMvcmVsb2NzXzY0Lm86KC5ic3MrMHgwKTogbXVsdGlwbGUg
ZGVmaW5pdGlvbiBvZiBgcGVyX2NwdV9sb2FkX2FkZHInOyBhcmNoL3g4Ni90b29scy9yZWxvY3Nf
MzIubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4+IGBgYAo+Pj4gVG8gZml4IHRo
aXMgbGV0J3MgYWRkIGFuIHVwc3RyZWFtZWQgcGF0Y2hbMV0gYW5kIGFkZCBCUjJfR0xPQkFMX1BB
VENIX0RJUgo+Pj4gdG8gZ2FsaWxlb19kZWZjb25maWcgdG8gcG9pbnQgdG8gd2hlcmUgcGF0Y2gg
aXMuCj4+PiBbMV06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWVlZWRhNGNkMDZlODI4YjMzMWIxNTc0
MWEyMDRmZjlmNTg3NGQyOGQucGF0Y2gKPj4+IEZpeGVzOgo+Pj4gaHR0cHM6Ly9naXRsYWIuY29t
L3ltb3Jpbi9idWlsZHJvb3QvLS9qb2JzLzIwMzU4MjEwMzkKPj4+IFNpZ25lZC1vZmYtYnk6IEdp
dWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAK
Pj4gWW91IGNhbid0IGltYWdpbmUgaG93IG11Y2ggam95IGl0IGdpdmVzIG1lIHRvIHNlZSBhIHBh
dGNoIGZyb20gMjAxNCBhcHBsaWVkIGhlcmUuLi4KPj4gCj4+IAo+PiBBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgo+PiAKPj4gUmVnYXJkcywKPj4gQXJub3V0Cj4+IAo+Pj4gLS0tCj4+PiAuLi5y
ZWxvY3MtTWFrZS1wZXJfY3B1X2xvYWRfYWRkci1zdGF0aWMucGF0Y2ggfCAzOSArKysrKysrKysr
KysrKysrKysrCj4+PiBjb25maWdzL2dhbGlsZW9fZGVmY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCj4+PiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKPj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBib2FyZC9pbnRlbC9nYWxpbGVvL3BhdGNoZXMvbGludXgvMDAwMS14ODYt
cmVsb2NzLU1ha2UtcGVyX2NwdV9sb2FkX2FkZHItc3RhdGljLnBhdGNoCj4+PiBkaWZmIC0tZ2l0
IGEvYm9hcmQvaW50ZWwvZ2FsaWxlby9wYXRjaGVzL2xpbnV4LzAwMDEteDg2LXJlbG9jcy1NYWtl
LXBlcl9jcHVfbG9hZF9hZGRyLXN0YXRpYy5wYXRjaCBiL2JvYXJkL2ludGVsL2dhbGlsZW8vcGF0
Y2hlcy9saW51eC8wMDAxLXg4Ni1yZWxvY3MtTWFrZS1wZXJfY3B1X2xvYWRfYWRkci1zdGF0aWMu
cGF0Y2gKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi4xZDIw
NmNjNmQxCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9ib2FyZC9pbnRlbC9nYWxpbGVvL3Bh
dGNoZXMvbGludXgvMDAwMS14ODYtcmVsb2NzLU1ha2UtcGVyX2NwdV9sb2FkX2FkZHItc3RhdGlj
LnBhdGNoCj4+PiBAQCAtMCwwICsxLDM5IEBACj4+PiArRnJvbSBlZWVkYTRjZDA2ZTgyOGIzMzFi
MTU3NDFhMjA0ZmY5ZjU4NzRkMjhkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+Pj4gK0Zyb206
IEJlbiBIdXRjaGluZ3MgPGJlbkBkZWNhZGVudC5vcmcudWs+Cj4+PiArRGF0ZTogV2VkLCAyNCBT
ZXAgMjAxNCAxMzozMDoxMiArMDEwMAo+Pj4gK1N1YmplY3Q6IFtQQVRDSF0geDg2L3JlbG9jczog
TWFrZSBwZXJfY3B1X2xvYWRfYWRkciBzdGF0aWMKPj4+ICsKPj4+ICtwZXJfY3B1X2xvYWRfYWRk
ciBpcyBvbmx5IHVzZWQgZm9yIDY0LWJpdCByZWxvY2F0aW9ucywgYnV0IGlzCj4+PiArZGVjbGFy
ZWQgaW4gYm90aCBjb25maWd1cmF0aW9ucyBvZiByZWxvY3MuYyAtIHdpdGggZGlmZmVyZW50Cj4+
PiArdHlwZXMuICBUaGlzIGhhcyB1bmRlZmluZWQgYmVoYXZpb3VyIGluIGdlbmVyYWwuICBHTlUg
bGQgaXMKPj4+ICtkb2N1bWVudGVkIHRvIHVzZSB0aGUgbGFyZ2VyIHNpemUgaW4gdGhpcyBjYXNl
LCBidXQgb3RoZXIgdG9vbHMKPj4+ICttYXkgZGlmZmVyIGFuZCBzb21lIHdhcm4gYWJvdXQgdGhp
cy4KPj4+ICsKPj4+ICtSZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy83NDg1NzcK
Pj4+ICtSZXBvcnRlZC1ieTogTWljaGFlbCBUYXV0c2NobmlnIDxtdEBkZWJpYW4ub3JnPgo+Pj4g
K1NpZ25lZC1vZmYtYnk6IEJlbiBIdXRjaGluZ3MgPGJlbkBkZWNhZGVudC5vcmcudWs+Cj4+PiAr
Q2M6IDc0ODU3N0BidWdzLmRlYmlhbi5vcmcKPj4+ICtDYzogTGludXMgVG9ydmFsZHMgPHRvcnZh
bGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+Pj4gK0xpbms6IGh0dHA6Ly9sa21sLmtlcm5lbC5v
cmcvci8xNDExNTYxODEyLjM2NTkuMjMuY2FtZWxAZGVjYWRlbnQub3JnLnVrCj4+PiArU2lnbmVk
LW9mZi1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+Cj4+PiArU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Cj4+PiArLS0tCj4+PiArIGFyY2gveDg2L3Rvb2xzL3JlbG9jcy5jIHwgMiArLQo+Pj4gKyAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+ICsKPj4+ICtkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvdG9vbHMvcmVsb2NzLmMgYi9hcmNoL3g4Ni90b29scy9yZWxvY3Mu
Ywo+Pj4gK2luZGV4IGJiYjFkMjI1OWVjZi4uYTVlZmIyMWQ1MjI4IDEwMDY0NAo+Pj4gKy0tLSBh
L2FyY2gveDg2L3Rvb2xzL3JlbG9jcy5jCj4+PiArKysrIGIvYXJjaC94ODYvdG9vbHMvcmVsb2Nz
LmMKPj4+ICtAQCAtNjk1LDcgKzY5NSw3IEBAIHN0YXRpYyB2b2lkIHdhbGtfcmVsb2NzKGludCAo
KnByb2Nlc3MpKHN0cnVjdCBzZWN0aW9uICpzZWMsIEVsZl9SZWwgKnJlbCwKPj4+ICsgICoKPj4+
ICsgICovCj4+PiArIHN0YXRpYyBpbnQgcGVyX2NwdV9zaG5keCAgICA9IC0xOwo+Pj4gKy1FbGZf
QWRkciBwZXJfY3B1X2xvYWRfYWRkcjsKPj4+ICsrc3RhdGljIEVsZl9BZGRyIHBlcl9jcHVfbG9h
ZF9hZGRyOwo+Pj4gKwo+Pj4gKyBzdGF0aWMgdm9pZCBwZXJjcHVfaW5pdCh2b2lkKQo+Pj4gKyB7
Cj4+PiArLS0KPj4+ICsyLjI1LjEKPj4+ICsKPj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2dhbGls
ZW9fZGVmY29uZmlnIGIvY29uZmlncy9nYWxpbGVvX2RlZmNvbmZpZwo+Pj4gaW5kZXggMDNjYTIz
ZjQxNC4uYThmZDBhNmRjYyAxMDA2NDQKPj4+IC0tLSBhL2NvbmZpZ3MvZ2FsaWxlb19kZWZjb25m
aWcKPj4+ICsrKyBiL2NvbmZpZ3MvZ2FsaWxlb19kZWZjb25maWcKPj4+IEBAIC0xLDQgKzEsNSBA
QAo+Pj4gQlIyX3g4Nl94MTAwMD15Cj4+PiArQlIyX0dMT0JBTF9QQVRDSF9ESVI9Ym9hcmQvaW50
ZWwvZ2FsaWxlby9wYXRjaGVzCj4+PiAjIE5lZWRlZCBmb3IgVEFSR0VUX0dSVUIyCj4+PiBCUjJf
VE9PTENIQUlOX0JVSUxEUk9PVF9XQ0hBUj15Cj4+PiAjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBr
ZXJuZWwsIGEgMy4xNCBzZXJpZXMKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
