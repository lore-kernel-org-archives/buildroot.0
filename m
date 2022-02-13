Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A8DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 12:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6D2C40119;
	Sun, 13 Feb 2022 12:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0wmuZQLkSGC; Sun, 13 Feb 2022 12:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714614022C;
	Sun, 13 Feb 2022 12:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85A5C1BF398
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CFF14030C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHkHC_8YxOks for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 12:56:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id B252440302
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:56:09 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id JEQ9naTN1XmFAJEQAnsIJl; Sun, 13 Feb 2022 13:56:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644756966; bh=4wgZ+aikty+PiqaK8l3vGqegv/Z8tGg5ZdodgzV6MCU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=lBgpeYEX6EHpnGVn8yhgW1N0hFkjHUE/90cAHLw5odroQabEoLmBziekU0aNxMxxy
 QHu+O5PNQHlF/0cilbQmTua8+50FZdkR1MD79457cA5UlaAaINgWes0NuwvkLIZ/Ux
 sr6//3+r1ytAT/uN+dCaLTFOVWOc6KonhWYoQ+6D/75ymhLGmk3Usv58G2aQxuUZRU
 QeDn9son3Kb7Am5tYqHAg4kPAWx/8D/xMmStXX11kacUXISNeUkYcj/iNz1lnQLLuD
 QpyjFIuDC8dwEBCkTeae4fGvP08H1wTDAyvBMJokDp6GibYwhwJSdpSDab5VeYTY8S
 ht4AOpeAuHf5w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 13 Feb 2022 13:56:05 +0100
Message-Id: <42058D10-AAA9-41FE-91E3-1D5153134FCA@benettiengineering.com>
References: <c60cb2e3-c822-3f9f-0f16-f206f9f407b3@mind.be>
In-Reply-To: <c60cb2e3-c822-3f9f-0f16-f206f9f407b3@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>,
 Nicholas Sielicki <sielicki@yandex.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfNHBsWFuxS58wOIkp92oOl1oMI8CXNHPNQHQ99n0PwIXDeRN2d/JzfmXayMe5nQR03FsEkUKJLxD1Yy6a6ln5meN1jHZ9+psE4dQ/sv8OZnntG39FfEk
 UNwjqxf70yXqO9VnFbo+5pwGwdlml4MNwlIUG68VJNqSsxz3mCfGI2cLNonzc5jdrS+6vyhoUYBhzMILhtEe9boDu7KpTuHlQODAlC9t4YjI/YXPbjV+W//J
 BxpZRtuR6rRjg7c3UFI7jVwgI5JaQqYbcFxaR4hT8zs=
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

SGkgTmljb2xhcywKCnNvcnJ5IGZvciBodG1sIGJ1dCBJ4oCZbSBtb2JpbGUuCgpNeSBwYXRjaCBm
b3IgZml4aW5nIHRoZSBidWlsZCBmYWlsdXJlIGZvciBHYWxpbGVvIGhhcyBiZWVuIHVwc3RyZWFt
LCBidXQgTGludXggdmVyc2lvbiBpcyB2ZXJ5IG9sZCwKSeKAmXZlIGFkZGVkIGEgbG9jYWwgcGF0
Y2ggZnJvbSAyMDE0IGFzIHBvaW50ZWQgQXJub3V0IGJlbG93LgpJIGRvbuKAmXQgaGF2ZSBhIEdh
bGlsZW8gYm9hcmQgYW5kIHlvdSBhcmUgdGhlIG1haW50YWluZXIsIGNhbiB5b3UgcGxlYXNlIHVw
ZGF0ZSB1Ym9vdCBhbmQgTGludXggdmVyc2lvbnMgYW5kIHNlbmQgYSBwYXRjaCBmb3IgdGhhdCBh
ZnRlciB0ZXN0aW5nIHBsZWFzZT8KClRoYW5rIHlvdSEK4oCULQpHaXVsaW8gQmVuZXR0aQpCZW5l
dHRpIEVuZ2luZWVyaW5nIHNhcwoKPiBJbCBnaW9ybm8gMTMgZmViIDIwMjIsIGFsbGUgb3JlIDEy
OjQ2LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IGhhIHNjcml0dG86Cj4g
Cj4g77u/Cj4gCj4+IE9uIDAyLzAyLzIwMjIgMjI6NDMsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+
PiBCdWlsZGluZyBnYWxpbGVvX2RlZmNvbmZpZyB0aHJvd3MgZXJyb3I6Cj4+IGBgYAo+PiAvdXNy
L2Jpbi9sZDogYXJjaC94ODYvdG9vbHMvcmVsb2NzXzY0Lm86KC5ic3MrMHgwKTogbXVsdGlwbGUg
ZGVmaW5pdGlvbiBvZiBgcGVyX2NwdV9sb2FkX2FkZHInOyBhcmNoL3g4Ni90b29scy9yZWxvY3Nf
MzIubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKPj4gYGBgCj4+IFRvIGZpeCB0aGlz
IGxldCdzIGFkZCBhbiB1cHN0cmVhbWVkIHBhdGNoWzFdIGFuZCBhZGQgQlIyX0dMT0JBTF9QQVRD
SF9ESVIKPj4gdG8gZ2FsaWxlb19kZWZjb25maWcgdG8gcG9pbnQgdG8gd2hlcmUgcGF0Y2ggaXMu
Cj4+IFsxXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9ZWVlZGE0Y2QwNmU4MjhiMzMxYjE1NzQxYTIw
NGZmOWY1ODc0ZDI4ZC5wYXRjaAo+PiBGaXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL3ltb3Jp
bi9idWlsZHJvb3QvLS9qb2JzLzIwMzU4MjEwMzkKPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJl
bmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gCj4gWW91IGNh
bid0IGltYWdpbmUgaG93IG11Y2ggam95IGl0IGdpdmVzIG1lIHRvIHNlZSBhIHBhdGNoIGZyb20g
MjAxNCBhcHBsaWVkIGhlcmUuLi4KPiAKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+
IAo+IFJlZ2FyZHMsCj4gQXJub3V0Cj4gCj4+IC0tLQo+PiAgLi4ucmVsb2NzLU1ha2UtcGVyX2Nw
dV9sb2FkX2FkZHItc3RhdGljLnBhdGNoIHwgMzkgKysrKysrKysrKysrKysrKysrKwo+PiAgY29u
Zmlncy9nYWxpbGVvX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+PiAgMiBm
aWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvaW50ZWwvZ2FsaWxlby9wYXRjaGVzL2xpbnV4LzAwMDEteDg2LXJlbG9jcy1NYWtlLXBlcl9j
cHVfbG9hZF9hZGRyLXN0YXRpYy5wYXRjaAo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvaW50ZWwvZ2Fs
aWxlby9wYXRjaGVzL2xpbnV4LzAwMDEteDg2LXJlbG9jcy1NYWtlLXBlcl9jcHVfbG9hZF9hZGRy
LXN0YXRpYy5wYXRjaCBiL2JvYXJkL2ludGVsL2dhbGlsZW8vcGF0Y2hlcy9saW51eC8wMDAxLXg4
Ni1yZWxvY3MtTWFrZS1wZXJfY3B1X2xvYWRfYWRkci1zdGF0aWMucGF0Y2gKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMWQyMDZjYzZkMQo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL2JvYXJkL2ludGVsL2dhbGlsZW8vcGF0Y2hlcy9saW51eC8wMDAxLXg4Ni1y
ZWxvY3MtTWFrZS1wZXJfY3B1X2xvYWRfYWRkci1zdGF0aWMucGF0Y2gKPj4gQEAgLTAsMCArMSwz
OSBAQAo+PiArRnJvbSBlZWVkYTRjZDA2ZTgyOGIzMzFiMTU3NDFhMjA0ZmY5ZjU4NzRkMjhkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogQmVuIEh1dGNoaW5ncyA8YmVuQGRlY2Fk
ZW50Lm9yZy51az4KPj4gK0RhdGU6IFdlZCwgMjQgU2VwIDIwMTQgMTM6MzA6MTIgKzAxMDAKPj4g
K1N1YmplY3Q6IFtQQVRDSF0geDg2L3JlbG9jczogTWFrZSBwZXJfY3B1X2xvYWRfYWRkciBzdGF0
aWMKPj4gKwo+PiArcGVyX2NwdV9sb2FkX2FkZHIgaXMgb25seSB1c2VkIGZvciA2NC1iaXQgcmVs
b2NhdGlvbnMsIGJ1dCBpcwo+PiArZGVjbGFyZWQgaW4gYm90aCBjb25maWd1cmF0aW9ucyBvZiBy
ZWxvY3MuYyAtIHdpdGggZGlmZmVyZW50Cj4+ICt0eXBlcy4gIFRoaXMgaGFzIHVuZGVmaW5lZCBi
ZWhhdmlvdXIgaW4gZ2VuZXJhbC4gIEdOVSBsZCBpcwo+PiArZG9jdW1lbnRlZCB0byB1c2UgdGhl
IGxhcmdlciBzaXplIGluIHRoaXMgY2FzZSwgYnV0IG90aGVyIHRvb2xzCj4+ICttYXkgZGlmZmVy
IGFuZCBzb21lIHdhcm4gYWJvdXQgdGhpcy4KPj4gKwo+PiArUmVmZXJlbmNlczogaHR0cHM6Ly9i
dWdzLmRlYmlhbi5vcmcvNzQ4NTc3Cj4+ICtSZXBvcnRlZC1ieTogTWljaGFlbCBUYXV0c2Nobmln
IDxtdEBkZWJpYW4ub3JnPgo+PiArU2lnbmVkLW9mZi1ieTogQmVuIEh1dGNoaW5ncyA8YmVuQGRl
Y2FkZW50Lm9yZy51az4KPj4gK0NjOiA3NDg1NzdAYnVncy5kZWJpYW4ub3JnCj4+ICtDYzogTGlu
dXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+PiArTGluazogaHR0
cDovL2xrbWwua2VybmVsLm9yZy9yLzE0MTE1NjE4MTIuMzY1OS4yMy5jYW1lbEBkZWNhZGVudC5v
cmcudWsKPj4gK1NpZ25lZC1vZmYtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgo+
PiArU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+Cj4+ICstLS0KPj4gKyBhcmNoL3g4Ni90b29scy9yZWxvY3MuYyB8IDIg
Ky0KPj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4g
Kwo+PiArZGlmZiAtLWdpdCBhL2FyY2gveDg2L3Rvb2xzL3JlbG9jcy5jIGIvYXJjaC94ODYvdG9v
bHMvcmVsb2NzLmMKPj4gK2luZGV4IGJiYjFkMjI1OWVjZi4uYTVlZmIyMWQ1MjI4IDEwMDY0NAo+
PiArLS0tIGEvYXJjaC94ODYvdG9vbHMvcmVsb2NzLmMKPj4gKysrKyBiL2FyY2gveDg2L3Rvb2xz
L3JlbG9jcy5jCj4+ICtAQCAtNjk1LDcgKzY5NSw3IEBAIHN0YXRpYyB2b2lkIHdhbGtfcmVsb2Nz
KGludCAoKnByb2Nlc3MpKHN0cnVjdCBzZWN0aW9uICpzZWMsIEVsZl9SZWwgKnJlbCwKPj4gKyAg
Kgo+PiArICAqLwo+PiArIHN0YXRpYyBpbnQgcGVyX2NwdV9zaG5keCAgICA9IC0xOwo+PiArLUVs
Zl9BZGRyIHBlcl9jcHVfbG9hZF9hZGRyOwo+PiArK3N0YXRpYyBFbGZfQWRkciBwZXJfY3B1X2xv
YWRfYWRkcjsKPj4gKwo+PiArIHN0YXRpYyB2b2lkIHBlcmNwdV9pbml0KHZvaWQpCj4+ICsgewo+
PiArLS0KPj4gKzIuMjUuMQo+PiArCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2dhbGlsZW9fZGVm
Y29uZmlnIGIvY29uZmlncy9nYWxpbGVvX2RlZmNvbmZpZwo+PiBpbmRleCAwM2NhMjNmNDE0Li5h
OGZkMGE2ZGNjIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL2dhbGlsZW9fZGVmY29uZmlnCj4+ICsr
KyBiL2NvbmZpZ3MvZ2FsaWxlb19kZWZjb25maWcKPj4gQEAgLTEsNCArMSw1IEBACj4+ICBCUjJf
eDg2X3gxMDAwPXkKPj4gK0JSMl9HTE9CQUxfUEFUQ0hfRElSPWJvYXJkL2ludGVsL2dhbGlsZW8v
cGF0Y2hlcwo+PiAgIyBOZWVkZWQgZm9yIFRBUkdFVF9HUlVCMgo+PiAgQlIyX1RPT0xDSEFJTl9C
VUlMRFJPT1RfV0NIQVI9eQo+PiAgIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDMu
MTQgc2VyaWVzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
