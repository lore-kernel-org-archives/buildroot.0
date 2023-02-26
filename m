Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490E2C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 17:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E25DF40B42;
	Sun, 26 Feb 2023 17:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E25DF40B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZhSazsFI83A; Sun, 26 Feb 2023 17:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BA80408B6;
	Sun, 26 Feb 2023 17:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BA80408B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA8E1BF59B
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 17:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 147FE60E78
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 17:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 147FE60E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wH9xpXgtXTME for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 17:45:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BC4E60E6F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BC4E60E6F
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 17:45:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 067F31BF204;
 Sun, 26 Feb 2023 17:44:57 +0000 (UTC)
Date: Sun, 26 Feb 2023 18:44:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230226184456.550cc7dc@windsurf>
In-Reply-To: <20230226172328.114504-1-fontaine.fabrice@gmail.com>
References: <20230226172328.114504-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677433498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbMGTDiunEzj2NEXVUgHBKyGRJofDhUfRqlE6BM+HZM=;
 b=j3MCQVz4nAk8NS2y7rSH/exPWEbeIV+wSwQqyTAjRjpT+koglubwWFSD/YW3ztHJmK4+OV
 u/zwzQSGn0NAbQTNKqUsxJ2ZMSHLxsxL0MazPDdG8CLDqjCplmMamHrnw/ecmfrjfNP+9L
 MJhoLcwWmgWkaFK0/K3yvNkIJK/kSpKKytodenTKlfaH3q0b0elOEMekNO+PZl20HVuWxg
 To+5KYAIW7Oe1CtNzLRtZ10iVT3R6wZGiSO0DQOdlGuqurvl0h3q73aAsLetM7tk+mD2hZ
 Tqe5hW8RpPoZm89KJ69urwUGv17yECzgkm8x2c/kSLpJnilwx27/LUI+zgM18A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j3MCQVz4
Subject: Re: [Buildroot] [PATCH v2,1/1] package/uccp420wlan: drop package
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

T24gU3VuLCAyNiBGZWIgMjAyMyAxODoyMzoyOCArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IHVjY3A0MjB3bGFuIGlzIG5vdCBtYWlu
dGFpbmVkIGFueW1vcmUgKG5vIGNvbW1pdCBzaW5jZSAyMDE3KSBhbmQgZmFpbHMKPiB0byBidWls
ZCB3aXRoIGFueSAicmVjZW50IiBrZXJuZWwgKGUuZy4gPj0gNC43IHdoaWNoIGluY2x1ZGVzCj4g
aHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC81N2ZiY2NlMzdiZTdjMWQy
NjIyYjU2NTg3YzEwYWRlMDBlOTZhZmEzCj4gb3IKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvY29tbWl0Lzg1NTJhNDM0YjZhMDVjYzM4MDA2NzMzYWZlNmEyMzlhZDRkNjAwYTIp
Ogo+IAo+IC9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5zdGFuY2UtMS9vdXRwdXQtMS9idWlsZC91
Y2NwNDIwd2xhbi02LjkuMS8uL3NyYy90eC5jOiBJbiBmdW5jdGlvbiDigJh1Y2NwNDIwd2xhbl90
eF9mcmVlX2J1ZmZfcmVx4oCZOgo+IC9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5zdGFuY2UtMS9v
dXRwdXQtMS9idWlsZC91Y2NwNDIwd2xhbi02LjkuMS8uL3NyYy90eC5jOjExNDI6NDk6IGVycm9y
OiDigJhJRUVFODAyMTFfQkFORF8yR0ha4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmElFRUU4MDIxMV9DSEFOXzJHSFrigJk/Cj4gIDEx
NDIgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChldHNfYmFuZCA9PSBJRUVF
ODAyMTFfQkFORF8yR0haKQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSUVFRTgwMjExX0NIQU5fMkdI
Wgo+IAo+IFsuLi5dCj4gCj4gL2hvbWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS0xL291dHB1
dC0xL2J1aWxkL3VjY3A0MjB3bGFuLTYuOS4xLy4vc3JjL2NvcmUuYzo0Mjg6Mjk6IGVycm9yOiBp
bXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhpZWVlODAyMTFfY3NhX2lzX2NvbXBs
ZXRl4oCZOyBkaWQgeW91IG1lYW4g4oCYaWVlZTgwMjExX3NjYW5fY29tcGxldGVk4oCZPyBbLVdl
cnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIDQyOCB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChpZWVlODAyMTFfY3NhX2lzX2NvbXBsZXRlKHV2aWYtPnZpZikpCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGllZWU4MDIxMV9zY2Fu
X2NvbXBsZXRlZAo+IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzdjZDcxNTFlMzkwYjhmN2EwZGYzZTY0N2ZlNGNkNWQ2MzE5YTgzMGIKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAtIFVwZGF0ZSBwYWNrYWdlL0NvbmZpZy5p
bgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
