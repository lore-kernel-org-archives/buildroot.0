Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E969C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 18:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0121740A62;
	Thu,  2 Dec 2021 18:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhng0bRuUcCa; Thu,  2 Dec 2021 18:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2156140A65;
	Thu,  2 Dec 2021 18:30:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ED201BF330
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 18:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388D440A65
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 18:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnSwg30U-yCX for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 18:30:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B048E40A62
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638469851;
 bh=F1xzMd926xLgU6GZJuyYIvAByEodEs8uH1i4cEhBcXU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LnBImxSEZCptGaktmlxIrng7qPmEaJzWc+4rrzN7ZC/MzIhkTGQsvkXaO4+yKiC/d
 52HlhcnlcE+qon2ldOCyZ7VUJqzwQMP4uGVytmITzghieiy5sgl2ku0rPV1kgaEzwK
 13w+qP4SGoFwkb1vvbgNGG2FfN1bcCTIaNfXcRqc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.208.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f5T-1ms2ho0zTL-004Cn3; Thu, 02
 Dec 2021 19:30:51 +0100
Date: Thu, 2 Dec 2021 19:30:49 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211202193049.13ceb96e@gmx.net>
In-Reply-To: <CAJPV9MrzFk0obQYSyFKeF-PgQfnOi6GKow3tSPomtLcmdor3Yw@mail.gmail.com>
References: <CAJPV9MrzFk0obQYSyFKeF-PgQfnOi6GKow3tSPomtLcmdor3Yw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:R8iA96jXiS1r4+ne2bXlHu7EIvDiHqysTGqZ1B4fjB3dDilzlEC
 GSKtHhZyQhGjeBvHeLN4n0GD2dSRaxB2pCWJQrSay9FvjBghJJRtZWkj/Tj6MbWZtRnqg29
 RAP2Z2RlKlCt1itlouyfsIhUqki7yoZtxMd3oRlFdXLaV7I6XwstquJgmfHR4DVrAY7a7wK
 eBgj2QXXX+hSF3tFvMUig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LAJZMmxBn84=:5Il7PntqjPtM3iAGaBcSgD
 h5IITkF9N9zoxRjibsPuCt4i1jUxsZxX8rwkC/HzKkEfGoAp+nWU8sG3xdBPggKbGc30mx0q9
 WoePjr0FmCs7UMOoe5VLd56H6/bjQ0qA4+easr8wVXQyFczmnvNuSBq7R3XiAISZ0OrtD3Ryp
 tOJih2YozCrKf2bdNFN8HQbA06U7Fq3KoevKOwK/CGXI0vFF3hejoLwZoQsGeQKOni/4Y8U4b
 J6o118gnYnmfCSiEgKjyZ1TBRi5lF+frJttG/1hGkYzXeYHVoYVzAChHRxJBaDJbQwMkftFyR
 86R9xPT/4kFVvAV0wWu8SEp4pD7jPNvphqKabVWcwNs1BCyG2qdcy9WDw3mBvsnRPZRoSCI/F
 haFoXA2tbS9VmRQuxsowQqGZgGHwXGjcqRV2QZcvToFEIdCJQOToUIjfopnbD4LnJzuwgxm+w
 bV6+CnRlwzpYkuQe/hkOZ1TFjJghonQGCTwxLv1RdZ1gFquI+kM3WGopHtxVbWcWIQeIFb8sN
 hsdV9ZqvRRoYdjS9qACR12290wWygwrPS5TBM6Ebt0VBS8Jy2zanm3YntDzmfdYPfmglLb0mO
 Xj9v7E4tFcRjTcImlI73mdeRlCHO/DHdD+fGeJ9fzIabjEcJi50HLqGmqI5piJ+jN6meqn42S
 f55RT0A7s4zyk5PLo9J+/uug2QRI+4D8c5ztFKWjvhriHqc9sXoP+uE84eX5T1tqBiYllJSoV
 7h8LfqI0q7NkmZFd/8bAmFViRWjQ7UHA6qKAmwkPM0/8DEqIrsn9n7ZfXvhj7Q1eRkj2cVRWF
 ZvNDAUjf7dHVea5cActJ3ogbyd+yrzNGPtgzIDfH5eQ4T4o7q8B+6ECBeCjzpCPhLh1kQJgQv
 pek3/LNVNQDRwX6IGxUAEsKZo0pr09n0ZCw9A5bCC/lGEIQJHuTW2SAyo1nEls8DWyyiiOMa7
 r92bClKm5uI3dEOEECKFi4NQFnFNat4OXfyoUlUDYsDaZm2tKRR+6yB0dYSZpumTazQ06ES0f
 PcfoDrW0aOwCdkchBEA6lI5IOu0DXVeeGdiJTRAU2rMfE3/czBqtu6YTvDHwmikL87/8fwW5G
 HH4rVD9WEJ623U=
Subject: Re: [Buildroot] New packages question
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBUaHUsIDIgRGVjIDIwMjEgMTI6NDE6MzAgKzAyMDAsIEpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gSGksCj4gCj4g
SSdtIHJlYWRpbmcgYSBwYWNrYWdlIGZvciBibXg3IHRvIGJlIHVwc3RyZWFtZWQuCj4gCj4gSSBm
b3VuZCB0aGUgZm9sbG93aW5nIGVycm9yIGluIG9uZSBvZiB0aGUgdG9vbGNoYWlucwo+IChib290
bGluLXg4Ni02NC1tdXNsKSwgYW5kIEkgd29uZGVyIHdoZXRoZXIgaXQgaXMgYW4gaXNzdWUKPiBp
biB0aGUgdG9vbGNoYWluLCBhbmQgaWYgaXQgY2FuIGJlIGEgYmxvY2tlciBmb3IgdGhlIHBhY2th
Z2UgdG8KPiBiZSBtZXJnZWQ6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tCj4gL2hvbWUvZGVi
aWFuL2JyLXRlc3QtcGtnL2Jvb3RsaW4teDg2LTY0LW11c2wvaG9zdC94ODZfNjQtYnVpbGRyb290
LWxpbnV4LW11c2wvc3lzcm9vdC91c3IvaW5jbHVkZS9uZXQvZXRoZXJuZXQuaDoxMCwKPiAgICAg
ICAgICAgICAgICAgZnJvbQo+IC9ob21lL2RlYmlhbi9ici10ZXN0LXBrZy9ib290bGluLXg4Ni02
NC1tdXNsL2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC1tdXNsL3N5c3Jvb3QvdXNyL2luY2x1
ZGUvaXdsaWIuaDoyOSwKPiAgICAgICAgICAgICAgICAgZnJvbSBpcC5jOjUxOgo+IC9ob21lL2Rl
Ymlhbi9ici10ZXN0LXBrZy9ib290bGluLXg4Ni02NC1tdXNsL2hvc3QveDg2XzY0LWJ1aWxkcm9v
dC1saW51eC1tdXNsL3N5c3Jvb3QvdXNyL2luY2x1ZGUvbmV0aW5ldC9pZl9ldGhlci5oOjExNjo4
Ogo+IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYc3RydWN0IGV0aGhkcuKAmQo+ICAxMTYgfCBz
dHJ1Y3QgZXRoaGRyIHsKPiAgICAgIHwgICAgICAgIF5+fn5+fgo+IAo+IEJlc3QgcmVnYXJkcy4K
ClNvbWV0aW1lcyB0aGUgbXVzbCBidWlsZCBmYWlsdXJlIGlzIGZpeGFibGUsIHNlYXJjaCB0aGUg
Z2l0IGhpc3RvcnkgZm9yCmV4YW1wbGVzLCBlLmcuIFsxXSwgb3IgYXQgbGVhc3QgcmVzb3J0IGRp
c2FibGUgZm9yIG11c2wuLi4KClJlZ2FyZHMsClBldGVyCgpbMV0gaHR0cHM6Ly9naXQuYnVpbGRy
b290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1lMGMxY2UwMTlmOGE1YWFmOWY1NGFlODVlMTg4
MjEwNDhiMjNkOTQwCgo+IAo+IAo+IEpvc8OpIFBla2thcmluZW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
