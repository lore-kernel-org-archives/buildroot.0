Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF163C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 15:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10FF98141E;
	Mon, 17 Jan 2022 15:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNlbQPKzn-jq; Mon, 17 Jan 2022 15:54:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DBE781419;
	Mon, 17 Jan 2022 15:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 061EE1BF38D
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 15:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE5C402A9
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 15:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hKoOuuD2Bn1 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 15:54:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C251940285
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 15:54:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c4f:55a9:fb74:ca3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 34DBB13F80A;
 Mon, 17 Jan 2022 16:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642434862;
 bh=XVqm475ggX4KqTpMwDSfUSga+sk5SracFynA7JAELGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AOu5QODMpTobVFDKproAmn2plpOqe98t9qqpUTO5533KruXjofzUn5l9eNXectcwn
 YWaFHBrAEWmprZedWs9p169I3dBC9wPTHfRIVogQqxvx2Lx2lpxUZOFdlmjTMDzOeX
 01W4bPFm3y/1VPW7C80dkfDO0i2VAdCFbhGFHvH2GMjff+nV6OwAz13lHqXuL4bV1a
 lg6gnDPMRMqDfLg+wI1ztKxfUxVafG/8jHMsNIGm7SHdIq3qNYcex+YQi/1rguTm4K
 5oYyxzQQXgEkp9ZkIj9lcA3B+WvIcubqEBUIYD6iSgQR2QKi4KJhFwD0gbESIGjyvU
 d5HDQKMdr/oCw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Jan 2022 16:54:18 +0100
Date: Mon, 17 Jan 2022 16:54:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20220117155418.GE2313964@scaer>
References: <20220116230404.71f68dbb@c3po>
 <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
 <20220116233758.59918490@c3po>
 <CADvTj4pjgwNt4ZnFB2ZmDeZP0nGaGPveqAapCTC+TOx3SEoBrw@mail.gmail.com>
 <20220117101705.GB2313964@scaer>
 <1ae38367-2e5c-20c7-0ba1-ebaff05cf8e7@dbrgn.ch>
 <20220117103218.GD2313964@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117103218.GD2313964@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Hash verification from GitHub
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFuaWxvLCBBbGwsCgpPbiAyMDIyLTAxLTE3IDExOjMyICswMTAwLCBZYW5uIEUuIE1PUklOIHNw
YWtlIHRodXNseToKPiBPbiAyMDIyLTAxLTE3IDExOjI0ICswMTAwLCBEYW5pbG8gQmFyZ2VuIHNw
YWtlIHRodXNseToKWy0tU05JUC0tXQo+ID4gTWF5YmUgYSBjb3JyZXNwb25kaW5nIHBhcmFncmFw
aCBjb3VsZCBiZSBhZGRlZCB0byB0aGUgZG9jcyBhdAo+ID4gaHR0cHM6Ly9uaWdodGx5LmJ1aWxk
cm9vdC5vcmcvI19pbnRlZ3JhdGlvbl9vZl9jYXJnb19iYXNlZF9wYWNrYWdlcyA/Cj4gWWVhaCwg
c28gSSBhbHJlYWR5IG5vdGljZWQgdGhhdCB0aGUgbmlnaHRseSBtYW51YWwgaXMgbm90IHVwIHRv
IGRhdGUuLi4KCkl0IGFwcGVhcnMgdGhhdCB0aGUgbG9jYWwgdHJlZSB0aGF0IHNlcnZlcyB0byBn
ZW5lcmF0ZSB0aGUgbWFudWFsIHdhcwpzb21laG93IGNvcnJ1cHRlZCwgYW5kIHdlIHdlcmUgb25s
eSBldmVyIGJ1aWxkaW5nIHRoZSBzYW1lIG9sZCBtYW51YWwKb3ZlciBhbmQgb3ZlciBhZ2Fpbi4u
LgoKSXQgaGFzIG5vdyBwcmVzdW1hYmx5IGJlZW4gcmVzb2x2ZWQsIGFuZCBbMF0gbm93IHJlYWRz
OgoKICAgIEEgY3JhdGUgY2FuIGRlcGVuZCBvbiBvdGhlciBsaWJyYXJpZXMgZnJvbSBjcmF0ZXMu
aW8gb3IgZ2l0CiAgICByZXBvc2l0b3JpZXMsIGxpc3RlZCBpbiBpdHMgQ2FyZ28udG9tbCBmaWxl
LiBCdWlsZHJvb3QgYXV0b21hdGljYWxseQogICAgdGFrZXMgY2FyZSBvZiBkb3dubG9hZGluZyBz
dWNoIGRlcGVuZGVuY2llcyBhcyBwYXJ0IG9mIHRoZSBkb3dubG9hZAogICAgc3RlcCBvZiBwYWNr
YWdlcyB0aGF0IHVzZSB0aGUgY2FyZ28tcGFja2FnZSBpbmZyYXN0cnVjdHVyZS4gU3VjaAogICAg
ZGVwZW5kZW5jaWVzIGFyZSB0aGVuIGtlcHQgdG9nZXRoZXIgd2l0aCB0aGUgcGFja2FnZSBzb3Vy
Y2UgY29kZSBpbgogICAgdGhlIHRhcmJhbGwgY2FjaGVkIGluIEJ1aWxkcm9vdOKAmXMgRExfRElS
LCBhbmQgdGhlcmVmb3JlIHRoZSBoYXNoIG9mCiAgICB0aGUgcGFja2FnZeKAmXMgdGFyYmFsbCBp
bmNsdWRlcyBzdWNoIGRlcGVuZGVuY2llcy4KClswXSBodHRwczovL25pZ2h0bHkuYnVpbGRyb290
Lm9yZy8jX2luZnJhc3RydWN0dXJlX2Zvcl9jYXJnb19iYXNlZF9wYWNrYWdlcwoKTWF5YmUgaXQg
aXMgbm90IHNvIG9idmlvdXMgYW5kIHByb21pbmVudGx5IGFkdmVydGlzZWQsIGluZGVlZDsgcGF0
Y2hlcwp0byBpbXByb3ZlIHRoZSBzaXR1YXRpb24gYXJlIG1vc3Qgd2VsY29tZSEgOi0pCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
