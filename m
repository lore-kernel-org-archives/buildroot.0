Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70794EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 22:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6CE561022;
	Sun, 30 Jul 2023 22:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6CE561022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2VPH0HrxCbF; Sun, 30 Jul 2023 22:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D04961026;
	Sun, 30 Jul 2023 22:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D04961026
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 450C01BF3BF
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 22:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219BE40310
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 22:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219BE40310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbtdhZtHESbl for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 22:08:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D714040304
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D714040304
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2FEAE0003;
 Sun, 30 Jul 2023 22:08:15 +0000 (UTC)
Date: Mon, 31 Jul 2023 00:08:14 +0200
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230731000814.18fbec6f@windsurf>
In-Reply-To: <20230105133738.751495-1-martin@geanix.com>
References: <20230105133738.751495-1-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690754896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSOI0PU95Qio0TkqkBxzdXBydnpcG0XRezhUCFZxh4g=;
 b=G0s4bZ7Ppt54My/CEifZJorAu7qVWOxubKb1tXtErzAvWx6QqeHqKzE5fWG0qCo4tfywK4
 dIpEagPNPmtHEnVCjeqLjrWhM26045lOAzbtgtVV9ejYHpHQi2JNcVzLhLvzWzn7tgrZAs
 IAFL9Vy1FCMwVTpSFi0o2vB4zgH87chszOIbA+wWL4ANOVoAM9BJd6ELSFFX9FvFJjwegu
 9fBlVCa2U++np7BV7uNgGOll35squbmwSY7SnArCH9zJbHUtNAklxMwMtKFpf8kIOask2q
 xgYUZtvM8R29z21zjoCHQs/KyWrzL5GQ790yjO2QJyJmX2zKgJJzbwYHVfFD/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G0s4bZ7P
Subject: Re: [Buildroot] [PATCH] package/nginx-njs: new package
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

SGVsbG8gTWFydGluLAoKT24gVGh1LCAgNSBKYW4gMjAyMyAxNDozNzozOCArMDEwMApNYXJ0aW4g
SHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5jb20+IHdyb3RlOgoKPiBBIG1vZHVsZSBmb3IgZXh0
ZW5kaW5nIHRoZSBuZ2lueCBzZXJ2ZXIgY29uZmlndXJhdGlvbiB3aXRoIGphdmFzY3JpcHQKPiBt
b2R1bGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5AZ2Vh
bml4LmNvbT4KClllYWgsIGl0J3MgYmVlbiBtb3JlIHRoYW4gNiBtb250aHMsIGJ1dCBiZWxpZXZl
IGl0IG5vdCwgSSBmaW5hbGx5IHRvb2sKdGhlIHRpbWUgdG8gbG9vayBhdCB5b3VyIHBhdGNoLCBh
bmQgSSB3YXMgYWJvdXQgdG8gcHVzaCBpdCwgYnV0IGl0CmRvZXNuJ3QgYnVpbGQuIEkgYWxzbyBo
YXZlIGEgZmV3IGNvbW1lbnRzLCBzZWUgYmVsb3cuCgpGaXJzdCBvZiBhbGwsIHlvdSBmb3Jnb3Qg
dG8gYWRkIGFuIGVudHJ5IGluIHRoZSBERVZFTE9QRVJTIGZpbGUuCgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL25naW54L25naW54Lm1rIGIvcGFja2FnZS9uZ2lueC9uZ2lueC5tawo+IGluZGV4IDYy
ZWEzNzlmZmMuLmNiMGMwNzk3MTIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uZ2lueC9uZ2lueC5t
awo+ICsrKyBiL3BhY2thZ2UvbmdpbngvbmdpbngubWsKPiBAQCAtMjkwLDYgKzI5MCwxMSBAQCBO
R0lOWF9ERVBFTkRFTkNJRVMgKz0gbmdpbngtbW9kc2VjdXJpdHkKPiAgTkdJTlhfQ09ORl9PUFRT
ICs9IC0tYWRkLW1vZHVsZT0kKE5HSU5YX01PRFNFQ1VSSVRZX0RJUikKPiAgZW5kaWYKPiAgCj4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfTkdJTlhfTkpTKSx5KQo+ICtOR0lOWF9DT05GX09QVFMgKz0g
JChhZGRwcmVmaXggLS1hZGQtbW9kdWxlPSwkKE5HSU5YX05KU19ESVIpL25naW54KQoKV2h5IGRv
IHlvdSBuZWVkIHRoaXMgJChhZGRwcmVmaXggLi4uKSBkYW5jZSA/IFdoeSBkb24ndCB5b3UgZG8g
aXQgbGlrZQp0aGUgb3RoZXIgbmdpbnggZXh0ZXJuYWwgbW9kdWxlcyBpbiBuZ2lueC5taz8KCj4g
K05HSU5YX0RFUEVOREVOQ0lFUyArPSBuZ2lueC1uanMKCkFsc28sIHBsZWFzZSBwdXQgTkdJTlhf
REVQRU5ERU5DSUVTICs9IG5naW54LW5qcyBiZWZvcmUgdGhlCk5HSU5YX0NPTkZfT1BUUyArPSBs
aW5lLCBqdXN0IHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgb3RoZXIgbmdpbngKZXh0ZXJuYWwg
bW9kdWxlcyBpbiBuZ2lueC5tay4KCkkgaGFkIGZpeGVkIHRoZXNlIG1pbm9yIGRldGFpbHMgbG9j
YWxseSwgYnV0IHVuZm9ydHVuYXRlbHkgaXQgZmFpbHMgdG8KYnVpbGQgaGVyZToKCkJSMl9hcm09
eQpCUjJfY29ydGV4X2E5PXkKQlIyX0FSTV9FTkFCTEVfVkZQPXkKQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CkJSMl9JTklUX05PTkU9eQpC
UjJfU1lTVEVNX0JJTl9TSF9OT05FPXkKIyBCUjJfUEFDS0FHRV9CVVNZQk9YIGlzIG5vdCBzZXQK
QlIyX1BBQ0tBR0VfTkdJTlg9eQpCUjJfUEFDS0FHRV9OR0lOWF9OSlM9eQojIEJSMl9UQVJHRVRf
Uk9PVEZTX1RBUiBpcyBub3Qgc2V0CgpleGhpYml0czoKCmNvbmZpZ3VyaW5nIGZvciBMaW51eCA2
LjIuOS0zMDAuZmMzOC54ODZfNjQgeDg2XzY0CmNoZWNraW5nIGZvciBDIGNvbXBpbGVyOiAvaG9t
ZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2FybS1saW51eC1nY2MK
ICsgdXNpbmcgR05VIEMgY29tcGlsZXIKICsgZ2NjIHZlcnNpb24gMTIuMi4wIChCdWlsZHJvb3Qg
MjAyMS4xMS00NDI4LWc2YjY3NDFiKSAKY2hlY2tpbmcgZm9yIHNpemVvZihpbnQpIC4uLiBub3Qg
Zm91bmQKY2hlY2tpbmcgZm9yIHNpemVvZih1X2ludCkgLi4uIG5vdCBmb3VuZApjaGVja2luZyBm
b3Igc2l6ZW9mKHZvaWQgKikgLi4uIG5vdCBmb3VuZApjaGVja2luZyBmb3Igc2l6ZW9mKHVpbnRw
dHJfdCkgLi4uIG5vdCBmb3VuZApjaGVja2luZyBmb3Igc2l6ZW9mKHNpemVfdCkgLi4uIG5vdCBm
b3VuZApjaGVja2luZyBmb3Igc2l6ZW9mKG9mZl90KSAuLi4gbm90IGZvdW5kCmNoZWNraW5nIGZv
ciBzaXplb2YodGltZV90KSAuLi4gbm90IGZvdW5kCmNoZWNraW5nIGZvciBzeXN0ZW0gYnl0ZSBv
cmRlcmluZyAuLi4gbm90IGZvdW5kCgouL2NvbmZpZ3VyZTogZXJyb3I6IGNhbm5vdCBkZXRlY3Qg
c3lzdGVtIGJ5dGUgb3JkZXJpbmcKCm1ha2VbMl06ICoqKiBbb2Jqcy9NYWtlZmlsZToxMjYwOiAv
aG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL25naW54LW5qcy0wLjcu
OS9uZ2lueC8uLi9idWlsZC9saWJuanMuYV0gRXJyb3IgMQptYWtlWzJdOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUv
dGhvbWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC9uZ2lueC0xLjI0LjAnCm1ha2Vb
MV06ICoqKiBbTWFrZWZpbGU6MTA6IGJ1aWxkXSBFcnJvciAyCm1ha2VbMV06IExlYXZpbmcgZGly
ZWN0b3J5ICcvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL25naW54
LTEuMjQuMCcKbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI5MzogL2hvbWUvdGhv
bWFzL3Byb2pldHMvYnVpbGRyb290L291dHB1dC9idWlsZC9uZ2lueC0xLjI0LjAvLnN0YW1wX2J1
aWx0XSBFcnJvciAyCgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgaW50byB0aGlzLCBhbmQgc2VuZCBh
IHYyIG9mIHRoaXMgcGF0Y2g/CgoKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJh
aW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
