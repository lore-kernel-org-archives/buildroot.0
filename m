Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 11:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7454086A;
	Sat, 19 Feb 2022 11:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5t4fHKHdJVBZ; Sat, 19 Feb 2022 11:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7948E405C8;
	Sat, 19 Feb 2022 11:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235EE1BF86D
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 11:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2039980C2B
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 11:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ePg8h_X7BzH for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 11:53:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E00580B7B
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 11:53:30 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id LOIqnV15CroAhLOIqnK1m5; Sat, 19 Feb 2022 12:53:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645271609; bh=3dimpaHOHYov9g7wRi0Dvec8PoCDkuSUZbj+viogWmM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=RY5caRwW+s1XQWeqOUK3iNA9qKKGVjKs4KQABnf7jHvRnuN3fErItsorg8vqX0T0I
 e0XvOfNONm4QysXnIc96IWfl4dEospvSE06vFnPm127uw9FYot97UA7HvL64g4dbL4
 q6fwe9FKKcMQQRzBwtlqxz87cj31v1NAvLWrD842BhPP+ArzMkBVdG6ACFH1xNZl/5
 +OhVgIq36I0FVj7wxn45ThocnMrW3w8HJ1MUvK2AIoJSD9ICvyKhEZzXzV4fzbhxFe
 cO/4KjH7sVuOyhd0/SO+xMt4YuDvGgePHQwkazoASviUYEVgAxArxOPqmbyCaMtcWY
 DucbxPdZMPC0w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 19 Feb 2022 12:53:27 +0100
Message-Id: <E07BF61F-5158-4276-831E-D95B551FEBC1@benettiengineering.com>
References: <20220219090159.GA822323@scaer>
In-Reply-To: <20220219090159.GA822323@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfIYtJaNHUHYf2DK1ElKoP+jQcG7kikRV21f2TYv97NQrpJmTrj2Y8wEZg7P8UNFHVADEHGJPJtAHkw3B9n1+OnaIuF0U36O98j8xSltb0iNmj2lJ9FFu
 4H+Sa4kGwG74OdIR1ttjAPWUXokidx72dVXpeCBP66OwELxtO78UD3hTJdVBQc+Gj9f5P6sZk3qbyHm0e20oJSuYfMFfnrTNFIr5eIxFDZ+Wb5rA4wyHx8ao
 0LwgBb6qE3V2+aB3xJnT3EJmqCnlkxAH5D/m7+wckJFe7B1ESQCJby9kTiH1m6PU
Subject: Re: [Buildroot] Buildroot Failure 2022-02-16 02:25:21
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgUGV0ZXIsIEFsbCwKCj4gSWwgZ2lvcm5vIDE5IGZlYiAyMDIyLCBhbGxlIG9yZSAx
MDowMiwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGhhIHNjcml0dG86
Cj4gCj4g77u/R2l1bGlvLCBQZXRlciwgQWxsLAo+IAo+IE9uIDIwMjItMDItMTggMjI6NDEgKzAx
MDAsIEdpdWxpbyBCZW5ldHRpIHNwYWtlIHRodXNseToKPj4+PiBJbCBnaW9ybm8gMTggZmViIDIw
MjIsIGFsbGUgb3JlIDIwOjAzLCBQZXRlciBUaG9tcHNvbiA8cGV0ZXIubWFjbGVvZC50aG9tcHNv
bkBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4+PiBNeSBidW1wIG9mIHNkbDJfdHRmLTIuMC4xNSB0
byBzZGwyX3R0Zi0yLjAuMTggIGNhdXNlZCBhbiBhdXRvYnVpbGRlciBmYWlsdXJlICAyMDIyLTAy
LTE2IDAyOjI1OjIxLiAgICAgIFRoZSBsb2cgaW5kaWNhdGVzIHRoZSBwcm9ibGVtIGlzICBwdGhy
ZWFkLmggbWlzc2luZyB3aGVuIGhhcmZidXp6IGlzIHNwZWNpZmllZC4gICAgU2VlIGxvZyBiZWxv
dy4uLgo+Pj4gTm90IHN1cmUgd2h5IHNkbDJfdHRmLTIuMC4xNSB3b3JrZWQgYmVmb3JlLi4uLi4g
IAo+PiBJdCBzZWVtcyBsaWtlIHRoYXQgYmV0d2VlbiAyLjAuMTUgdG8gMi4wLjE4KG1heWJlKQo+
PiBzZGwyX3R0ZiBvbmx5IHVzZXMgaGFyZmJ1enogcHJvdmlkZWQgYnkgc2RsMl90dGYgaXRzZWxm
Lgo+PiBUaGlzIG1lYW5zIGl04oCZcyBza2lwcGluZyB0aGUgb25lIHByb3ZpZGVkIGZyb20gQnVp
bGRyb290IHRoYXQgaXMgYWxyZWFkeSBwYXRjaGVkIGZvciBoYXJmYnV6eiBwdGhyZWFkLmggaXNz
dWUuCj4gWy0tU05JUC0tXQo+PiBJZiBsb29rIGNsb3NlciB0aGUgYnVpbGQgZmFpbHVyZSB5b3Ug
d2lsbCBzZWUgdGhhdCBpdOKAmXMgbm90IEJ1aWxkcm9vdCBoYXJmYnV6eiB0aGF0IGZhaWxzIGJ1
dCBhIGhhcmZidXp6IGVtYmVkZGVkIGludG8gc2RsMl90dGYuIAo+PiBTbyB3aGF0IEkgc2hvdWxk
IHRvIGlzIHRvIHRyeSB0byBtYWtlIHNkbDJfdHRmIGRyb3AgaXRzIGludGVybmFsIGhhcmZidXp6
IGFuZCB1c2UgdGhlIEJ1aWxkcm9vdCBvbmUuCj4gCj4gSSB0aGluayB0aHMgbWlnaHQgaGF2ZSBi
ZWVuIGZpeGVkIHdpdGggY29tbWl0IGUyNTNlNDFjZTJlNSAocGFja2FnZS9zZGwyX3R0ZjoKPiBh
ZGQgaGFyZmJ1enogb3B0aW9uYWwgZGVwZW5kZW5jeSkKClBldGVyIHRoaXMgaXMgd2h5IHdoZW4g
eW91IGNoZWNrIGZvciBhdXRvYnVpbGRlciBmYWlsdXJlIHlvdSBuZWVkIHRvIHB1bGwgQnVpbGRy
b290IHRvIGxhdGVzdCB2ZXJzaW9uIDotKS4KCkFsc28sIGJlZm9yZSBnb2luZyB0byB3b3JrIG9u
IHNvbWV0aGluZywgYWx3YXlzIGNoZWNrIEJ1aWxkcm9vdCBwYXRjaHdvcmsgaWYgc29tZW9uZSBl
bHNlIGhhcyBhbHJlYWR5IGRvbmUgaXQuCgpBbmQgbGFzdCBidXQgbm90IGxlYXN0LCBjaGVjayB0
aGUgcGFja2FnZSBnaXQgcmVwb3NpdG9yeSBpdHNlbGYgZm9yIGEgZml4LCBsaWtlIGEgY29tbWl0
IG9yIGEgcGVuZGluZyBQUi9NUiBvciBhbiBpc3N1ZSB3aXRoIGEgc29sdXRpb24gZXhwbGFpbmVk
LgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4g
Cj4gLS0gCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
