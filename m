Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AE4C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FD24047D;
	Mon,  7 Mar 2022 19:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs2D8FdrsgAp; Mon,  7 Mar 2022 19:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D189D401FC;
	Mon,  7 Mar 2022 19:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAA821BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E39CF4014E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNZvSJAKTaE5 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:23:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EB344014A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:23:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00465100005;
 Mon,  7 Mar 2022 19:22:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRIwb-000xzF-J6; Mon, 07 Mar 2022 20:22:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunojpg@gmail.com>
References: <CAEXMXLQM7jq3REiVmSJCSAYW_p5rbwPY1+6Z2wtTSpca3AAeoA@mail.gmail.com>
Date: Mon, 07 Mar 2022 20:22:57 +0100
In-Reply-To: <CAEXMXLQM7jq3REiVmSJCSAYW_p5rbwPY1+6Z2wtTSpca3AAeoA@mail.gmail.com>
 ("Nuno =?utf-8?Q?Gon=C3=A7alves=22's?= message of "Sun, 27 Feb 2022
 19:54:14 +0000")
Message-ID: <87tuc97ejy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rauc: only install systemd service
 if built with dbus/service support
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

Pj4+Pj4gIk51bm8iID09IE51bm8gR29uw6dhbHZlcyA8bnVub2pwZ0BnbWFpbC5jb20+IHdyaXRl
czoKCiA+IFRoZSBzeXN0ZW1kIHNlcnZpY2Ugd2lsbCB0cnkgdG8gY2FsbCByYXVjIGluIHNlcnZp
Y2UgbW9kZSwgc28gaXQgaXMgdXNlbGVzcwogPiBhbmQgd2lsbCBmYWlsIGlmIHJhdWMgZG9lcyBu
b3QgaGF2ZSBzdWNoIHN1cHBvcnQKCiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gR29uw6dhbHZlcyA8
bnVub2pwZ0BnbWFpbC5jb20+CiA+IC0tLQogPiAgcGFja2FnZS9yYXVjL3JhdWMubWsgfCAyMCAr
KysrKysrKystLS0tLS0tLS0tLQogPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgogPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYXVjL3JhdWMubWsgYi9w
YWNrYWdlL3JhdWMvcmF1Yy5tawogPiBpbmRleCAzOWY1MjU1ODEyLi5kMjllZjY2MDQ2IDEwMDY0
NAogPiAtLS0gYS9wYWNrYWdlL3JhdWMvcmF1Yy5tawogPiArKysgYi9wYWNrYWdlL3JhdWMvcmF1
Yy5tawogPiBAQCAtMTUsNiArMTUsMTUgQEAgUkFVQ19ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2Nv
bmYgb3BlbnNzbCBsaWJnbGliMgogPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9SQVVDX0RCVVMpLHkp
CiA+ICBSQVVDX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1zZXJ2aWNlCiA+ICBSQVVDX0RFUEVOREVO
Q0lFUyArPSBkYnVzCiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1NZU1RFTUQpLHkpCiA+ICsjIGNv
bmZpZ3VyZSB1c2VzIHBrZy1jb25maWcgLS12YXJpYWJsZT1zeXN0ZW1kc3lzdGVtdW5pdGRpciBz
eXN0ZW1kCiA+ICtSQVVDX0RFUEVOREVOQ0lFUyArPSBzeXN0ZW1kCiA+ICtkZWZpbmUgUkFVQ19J
TlNUQUxMX0lOSVRfU1lTVEVNRAogPiArIG1rZGlyIC1wICQoVEFSR0VUX0RJUikvdXNyL2xpYi9z
eXN0ZW1kL3N5c3RlbS9yYXVjLnNlcnZpY2UuZAogPiArIHByaW50ZiAnW0luc3RhbGxdXG5XYW50
ZWRCeT1tdWx0aS11c2VyLnRhcmdldFxuJyBcCiA+ICsgPiQoVEFSR0VUX0RJUikvdXNyL2xpYi9z
eXN0ZW1kL3N5c3RlbS9yYXVjLnNlcnZpY2UuZC9idWlsZHJvb3QtZW5hYmxlLmNvbmYKCllvdXIg
bWFpbGVyIGhhZCBjb3JydXB0ZWQgdGhlIHBhdGNoICh0YWJzIHRvIHNwYWNlcyksIHNvIEkgY291
bGRuJ3QKYXBwbHkgdGhlIHBhdGNoIGFuZCBoYWQgdG8gbWFudWFsbHkgZml4IGl0IHVwLgoKQ29t
bWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
