Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CEEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41F883E4B;
	Tue, 26 Apr 2022 17:25:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xn8E7xAwFRAL; Tue, 26 Apr 2022 17:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96292832D1;
	Tue, 26 Apr 2022 17:25:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 710BC1BF9A4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DEC9409D6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yW6vECZr56dT for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:25:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7703040499
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:25:19 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9F9F74403CD;
 Tue, 26 Apr 2022 20:24:29 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650993870;
 bh=qnuqAM8DMZ/t/KxNIEaB1pwQypFQKVWI4l39wrb8orI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=gBngKHe1iVMN4HwLEcZeH5YrVv6vMnDwZhBbvEkNI/ic0iUQrZjGhFx1DelP/07jb
 FIbm5ae0tX8XFZqzsXBUCoJR0GXDOBCNUrXJ1cnuB+XfeFj43VwWcDIU7lF2qDMhTa
 wCyT5Q44MefvSYcPoK393ozkQvyGXUgcpKgywQ3Qq+8CpyxPaCzj2x3yspVwmh3jcU
 MLePuIggX5iK+70qn/VjsAM2yR7lRETScK+5VtSl2xdnbAceHLhdhAUQLEbJteXaR5
 UWQcaVENkIv/EkK+3nkj34POApcIl5zoGm9UKZOh6HtG786xPk/QgbGDKkFu3DQO73
 agdzYrMEP38AA==
References: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Date: Tue, 26 Apr 2022 20:16:12 +0300
In-reply-to: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
Message-ID: <87bkwn21vp.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 diffutils
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9zw6ksCgpPbiBUdWUsIEFwciAyNiAyMDIyLCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8g
d3JvdGU6Cj4gUGF0Y2ggdGl0bGU6IGRvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS50eHQ6IGFkZCBk
aWZmdXRpbHMKCk5vIG5lZWQgZm9yIHRoaXMgbGluZSBpbiB0aGUgY29tbWl0IGxvZyBib2R5LiBU
aGUgZW1haWwgc3ViamVjdCBsaW5lCmFwcGVhcnMgYXMgaGVhZCBsaW5lIG9mIHRoZSBnaXQgY29t
bWl0IG9uY2UgYXBwbGllZC4KCj4gVGhlIGNvbW1hbmQgYGNtcGAgaXMgdXNlZCBieSBgcGFja2Fn
ZS9wa2ctZ2VuZXJpYy5ta2AgYXQgY29tbWl0Cj4gODYyM2NjNWRlYjUuIFRoaXMgY29tbWFuZCBp
cyBwcm92aWRlZCBieSBgZGlmZnV0aWxzYC4KCkFjdHVhbGx5LCB3ZSBoYXZlIGhvc3QtZGlmZnV0
aWxzLCBzbyB3ZSBjYW4gYnVpbGQgY21wIGlmIHRoZSBob3N0IGRvZXMKbm90IGhhdmUgaXQgaW5z
dGFsbGVkLiBBbGwgd2UgbmVlZCBpcyBzdXBwb3J0IGFkZGVkIHVuZGVyCnN1cHBvcnQvZGVwZW5k
ZW5jaWVzLyBsaWtlIGEgZmV3IG90aGVyIHV0aWxpdGllcy4KCldlIGFsc28gZG9uJ3QgbGlzdCBm
aW5kdXRpbHMgYXMgcHJlcmVxdWlzaXRlLCBldmVuIHRob3VnaCB3ZSByZWx5CmhlYXZpbHkgb24g
dGhlICdmaW5kJyB1dGlsaXR5LgoKYmFydWNoCgo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMg
U2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+IC0tLQo+ICBkb2Nz
L21hbnVhbC9wcmVyZXF1aXNpdGUudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS50eHQgYi9k
b2NzL21hbnVhbC9wcmVyZXF1aXNpdGUudHh0Cj4gaW5kZXggNDAwNzE0OTFmOC4uNzYzZmU3OTA0
MSAxMDA2NDQKPiAtLS0gYS9kb2NzL21hbnVhbC9wcmVyZXF1aXNpdGUudHh0Cj4gKysrIGIvZG9j
cy9tYW51YWwvcHJlcmVxdWlzaXRlLnR4dAo+IEBAIC0yMyw2ICsyMyw3IEBAIGJldHdlZW4gZGlz
dHJpYnV0aW9ucykuCj4gICoqICttYWtlKyAodmVyc2lvbiAzLjgxIG9yIGFueSBsYXRlcikKPiAg
KiogK2JpbnV0aWxzKwo+ICAqKiArYnVpbGQtZXNzZW50aWFsKyAob25seSBmb3IgRGViaWFuIGJh
c2VkIHN5c3RlbXMpCj4gKyoqICtkaWZmdXRpbHMrCj4gICoqICtnY2MrICh2ZXJzaW9uIDQuOCBv
ciBhbnkgbGF0ZXIpCj4gICoqIGBnKytgICh2ZXJzaW9uIDQuOCBvciBhbnkgbGF0ZXIpCj4gICoq
ICtiYXNoKwoKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAt
IGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRr
b3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
