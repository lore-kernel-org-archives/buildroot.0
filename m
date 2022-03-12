Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D890C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 14:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A942E817AB;
	Sat, 12 Mar 2022 14:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FBEoFA3zQIZr; Sat, 12 Mar 2022 14:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54C7817BA;
	Sat, 12 Mar 2022 14:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 627391BF279
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 14:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D84340463
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 14:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38c8Y3UDPnPj for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 14:59:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1AA4403A7
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 14:59:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 109CB200002;
 Sat, 12 Mar 2022 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647097154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EAxbXPoohhTRmSOOxLHyHV+CzPMkwt7XL1FaEyPXss=;
 b=oxwKEjP15o7aDH4UMlWCCSMnRh+HhAj5whb27oOhwaqJlf1Ob2cq+J9WXOAjF8THkv6vBk
 0Rkz0JrGWIA8pMd/Rybr9OizwWPnsnJ+T3IZPJDfxyK9U5jtiRVJpohQgFW6aMWMWnZmRr
 Vg75QPd5TSmReRPM2tkc8QLf8A0v49ei62ca8fDNK5+p8TN+g9Zr9CRvw5BZwP9AcmHzta
 FyTkJzSglanrwpxuVcXdRyinDZOaKgsQpQloo1vAJNiR4dg+DAw4oQnVeps6WTx3ZSQAjH
 ageOYgCZSu4y1Z/GIDoIxAj8VwS7M1MST8XBLkPodB+FQItb5ZHAGntNpOO+3g==
Date: Sat, 12 Mar 2022 15:59:13 +0100
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220312155913.280739e0@windsurf>
In-Reply-To: <20220311123636.13415-2-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220311123636.13415-2-clement.leger@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/7] package/python-cryptography: enable
 host package
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIDExIE1hciAyMDIyIDEzOjM2OjMwICswMTAwCkNsw6ltZW50IEzDqWdl
ciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cgo+IEVuYWJsZSBob3N0IHBhY2th
Z2UgYW5kIGFkZCBuZWVkZWQgZGVwZW5kZW5jaWVzLgo+IAo+IEFja2VkLWJ5OiBFdGllbm5lIENh
cnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBwYWNrYWdl
L3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayB8IDcgKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rIGIvcGFja2FnZS9w
eXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsKPiBpbmRleCBhNTI0Zjcy
OWM4Li40ZmY2MWM3Zjg2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBo
eS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tY3J5cHRvZ3Jh
cGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsKPiBAQCAtMTcsNiArMTcsMTEgQEAgUFlUSE9OX0NS
WVBUT0dSQVBIWV9ERVBFTkRFTkNJRVMgPSBcCj4gIAlob3N0LXB5dGhvbi1jZmZpIFwKPiAgCWhv
c3QtcnVzdGMgXAo+ICAJb3BlbnNzbAo+ICtIT1NUX1BZVEhPTl9DUllQVE9HUkFQSFlfREVQRU5E
RU5DSUVTID0gXAo+ICsJaG9zdC1weXRob24tc2V0dXB0b29scy1ydXN0IFwKPiArCWhvc3QtcHl0
aG9uLWNmZmkgXAo+ICsJaG9zdC1ydXN0YyBcCj4gKwlvcGVuc3NsCgpBbHNvLCBJIGFtIGFjdHVh
bGx5IHN1cnByaXNlZCB0aGlzIGlzIGVub3VnaC4gSW5kZWVkLCB0aGVyZSBhcmUgc29tZQpwYXJ0
cyBpbiBSdXN0IGluIHB5dGhvbi1jcnlwdG9ncmFwaHksIHNvIHdlIGhhdmUgcXVpdGUgc29tZSBl
eHRyYQp2YXJpYWJsZXMgZm9yIHRoZSB0YXJnZXQgcGFja2FnZXMgdG8gaGFuZGxlIHRoaXM6CgpQ
WVRIT05fQ1JZUFRPR1JBUEhZX0VOViA9IFwKICAgICAgICAkKFBLR19DQVJHT19FTlYpIFwKICAg
ICAgICBQWU8zX0NST1NTX0xJQl9ESVI9IiQoU1RBR0lOR19ESVIpL3Vzci9saWIvcHl0aG9uJChQ
WVRIT04zX1ZFUlNJT05fTUFKT1IpIgojIFdlIG5lZWQgdG8gdmVuZG9yIHRoZSBDYXJnbyBjcmF0
ZXMgYXQgZG93bmxvYWQgdGltZQpQWVRIT05fQ1JZUFRPR1JBUEhZX0RPV05MT0FEX1BPU1RfUFJP
Q0VTUyA9IGNhcmdvClBZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxPQURfREVQRU5ERU5DSUVTID0g
aG9zdC1ydXN0YwpQWVRIT05fQ1JZUFRPR1JBUEhZX0RMX0VOViA9IFwKICAgICAgICBCUl9DQVJH
T19NQU5JRkVTVF9QQVRIPXNyYy9ydXN0L0NhcmdvLnRvbWwKCkZvciB0aGUgbGFzdCAzIHZhcmlh
YmxlcywgSSBjYW4gZXhwbGFpbiB0aGF0IGl0IHBvc3NpYmx5IHdvcmtlZCBmb3IgeW91CmJlY2F1
c2UgeW91IHBlcmhhcHMgYWxyZWFkeSBoYWQgdGhlIHB5dGhvbi1jcnlwdG9ncmFwaHkgdGFyYmFs
bCBpbgpETF9ESVIgZG93bmxvYWRlZCBieSB0aGUgaG9zdCB2YXJpYW50IG9mIHRoZSBwYWNrYWdl
LiBCdXQgaWYgeW91IHJlbW92ZQp0aGlzIHRhcmJhbGwsIGFuZCBidWlsZCBqdXN0IHRoZSBob3N0
IHZhcmlhbnQsIEkgd291bGQgc3VzcGVjdCB0aGF0IGl0CndpbGwgZmFpbCB0byBidWlsZC4KCkhv
d2V2ZXIsIEkgY2FuJ3QgcmVhbGx5IGV4cGxhaW4gd2h5IHlvdXIgcGFja2FnZSB3b3JrcyB3aXRo
b3V0CkhPU1RfUFlUSE9OX0NSWVRPR1JBUEhZX0VOVi4KCk1ha2Ugc3VyZSB0byBkbyBhIGNsZWFu
IGJ1aWxkIGluIGEgRG9ja2VyIGNvbnRhaW5lciB0aGF0IGRvZXNuJ3QgaGF2ZQpSdXN0IGluc3Rh
bGxlZCAodGhlcmUgaXMgYW4gb2ZmaWNpYWwgQnVpbGRyb290IERvY2tlciBpbWFnZSB0aGF0IGlz
CmF2YWlsYWJsZSBmb3IgdGhpcyBraW5kIG9mIHRlc3RpbmcpLgoKVGhhbmtzIQoKVGhvbWFzCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
