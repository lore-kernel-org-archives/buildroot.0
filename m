Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C37C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 19:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4630405C4;
	Sun, 20 Nov 2022 19:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4630405C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YSxkvHpo2YH; Sun, 20 Nov 2022 19:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD920405C1;
	Sun, 20 Nov 2022 19:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD920405C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1DB1BF3BF
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 19:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 661BC60BF5
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 19:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 661BC60BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9akCIt_8XqUU for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 19:19:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D47606F2
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4D47606F2
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 19:19:02 +0000 (UTC)
Received: from smtpclient.apple ([151.38.236.245])
 by Aruba Outgoing Smtp  with ESMTPA
 id wpqGo5uRD8fubwpqGo5tD6; Sun, 20 Nov 2022 20:19:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 20 Nov 2022 20:18:57 +0100
Message-Id: <EE45B9E4-9FF5-4F6A-A534-068AA4733613@benettiengineering.com>
References: <CADvTj4pVzogcB1FaYa-WRZ_og=W1c7S7icXxFFmqSB6kwhC4Lw@mail.gmail.com>
In-Reply-To: <CADvTj4pVzogcB1FaYa-WRZ_og=W1c7S7icXxFFmqSB6kwhC4Lw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: iPhone Mail (20B101)
X-CMAE-Envelope: MS4xfOlD0YhO1rGaM24ixXxTDFmqHM/juU4py2KZSWHb7r5mpygSnpMEahUnLIZZ6qILt2Wi8J7Cje1ggozp3Q4zJI6CZg/yYJJYIrK/DlhfAVsDr6hJBlN1
 M2jqpKSdO1mOJQt5+ECQDPDafVhyYZuhQPrH45cUkCMD/KgJBNa00I/sxV/gEkfALAxPHLwb63PiWYYBJxRX1AQHOe8GYMjPF1bNX9LW7JiMFcFhLVrK3f2z
 uw+JiIFqdzFGsZJJIuOKRT28BZs2qh2T7ZgIZNNK8hohvVQMbL+/SGpIptDD9X19
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668971941; bh=o+MWK7T+xZFsZ3N8rUQ/zsMIUvJpFav/MSSXAo6aYEo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=IHwxlxTixfkskgR/nprMCEGK0b/spZv9wZdU8v2W72/0Q2pslmzYotMu4ZBNhcE5V
 +zjabFSyWd7fwNY5VEhFITHSQdf91Em4vwvjMxjDAzZJAmufjwz9Z4WNmjt+h70jta
 hoqYPTHSwR07XqHzUH4C0vZfZrXEkqRSFW4cxq2D2CfEr4+cKbZU6TaVVvUIjN+dl0
 Wt04hmwBGExvr0EozoL8Ojz9X9kCFug+1w29qA7wDvcjfa/vClvXzGI98iJzwryQNE
 mjzIQQMJ+GvRNOux3LU+0n/+m7JDhZ9Vf448mAX+l2q3EJ1okdcaxJBR1D++oVjnfW
 ZQh+AxR2BVq1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IHwxlxTi
Subject: Re: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgo+IElsIGdpb3JubyAyMCBub3YgMjAyMiwgYWxsZSBvcmUgMTk6NDEsIEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7
v09uIFRodSwgTm92IDE3LCAyMDIyIGF0IDM6NDggUE0gR2l1bGlvIEJlbmV0dGkKPiA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+IAo+PiBIaSBKYW1lcywK
Pj4gCj4+PiBPbiAyMC8xMC8yMiAxNToyOSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4+PiBPbiBU
aHUsIE9jdCAyMCwgMjAyMiBhdCAyOjUzIEFNIEdpdWxpbyBCZW5ldHRpCj4+PiA8Z2l1bGlvLmJl
bmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+Pj4gCj4+Pj4gSGkgSmFtZXMs
Cj4+Pj4gCj4+Pj4+IElsIGdpb3JubyAyMCBvdHQgMjAyMiwgYWxsZSBvcmUgMDI6MjMsIEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+Pj4+PiAK
Pj4+Pj4g77u/T24gV2VkLCBPY3QgMTksIDIwMjIgYXQgNzozNiBQTSBKYW1lcyBIaWxsaWFyZAo+
Pj4+PiA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+PiAKPj4+Pj4+PiBP
biBXZWQsIE9jdCAxOSwgMjAyMiBhdCAzOjU1IFBNIEdpdWxpbyBCZW5ldHRpCj4+Pj4+Pj4gPGdp
dWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Pj4+Pj4+IAo+Pj4+
Pj4+IEZpeGVzOgo+Pj4+Pj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzQzMy80MzM1ZDBkODQ1NDAzNWE4Zjc0NjQ1YmE4ZDZjMjMyOWFiMmU1NDgwLwo+Pj4+Pj4gCj4+
Pj4+PiBIbW0sIHRoaXMgbG9va3MgbGlrZSBhIGJ1ZyBpbiB0aGUgbGlibnNzIG1ha2VmaWxlLCB3
aGF0IHdhcyB0aGUgZmFpbHVyZQo+Pj4+Pj4gc2VlbiB3aXRoIG1ha2UgNC4zIGhlcmU6Cj4+Pj4+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMjAxMDEyMTA5NTIuMjE0ODI1
Ni0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCj4+Pj4+IAo+Pj4+PiBU
aGlzIHBhdGNoIGFsc28gZG9lcyBub3QgZml4IHRoZSBidWlsZCB3aXRoIG1ha2UgNC40KG1ha2Ug
ZnJvbSBtYXN0ZXIgYnJhbmNoKQo+Pj4+PiBmcm9tIG15IHRlc3RpbmcuCj4+Pj4+IAo+Pj4+PiBF
dmVuIHdpdGhvdXQgc2h1ZmZsZSBtb2RlIGVuYWJsZWQgdGhlIGJ1aWxkIGFwcGVhcnMgdG8gYWx3
YXlzIGZhaWwuCj4+Pj4gCj4+Pj4gVGhhbmsgeW91IGZvciB0ZXN0aW5nLCBJIGhhdmUgZm9yZ290
dGVuIGV4YWN0bHkgdG8gYXNrIHlvdSB0byBkbyBpdCA6LSkgc2luY2UgYWxtb3N0IGFsbCB0aGUg
ZmFpbHVyZXMgY29tZXMgZnJvbSB5b3VyIGFzYWhpLW1pbmkgdGhhdCBJIHJlbWVtYmVyIHRvIGhh
dmUgTWFrZSA0LjQuCj4+PiAKPj4+IEknbSBydW5uaW5nIG1ha2UgbWFzdGVyIGJyYW5jaCBvbiBh
bGwgbXkgYXV0b2J1aWxkZXJzIGF0IHRoZSBtb21lbnQsCj4+PiB0aGUgZmFpbHVyZXMgYXJlbid0
IGxpbWl0ZWQgdG8gYXNhaGktbWluaToKPj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC8/cmVhc29uPWxpYm5zcy0zLjg0Cj4+PiAKPj4+PiAKPj4+PiBTbyBJIHRyeSB0byByZXByb2R1
Y2UgdGhlIGJ1ZyBoZXJlIGF0IG1lIGFuZCBmaW5kIG91dCBhIGZpeC4KPj4+IAo+Pj4gVXNlIG1h
a2UgbWFzdGVyIGJyYW5jaCBmcm9tIGhlcmUgZm9yIHRlc3Rpbmc6Cj4+PiBnaXQgY2xvbmUgaHR0
cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9naXQvbWFrZS5naXQKPj4+IAo+PiAKPj4gQWZ0ZXIg
bG90IG9mIHRpbWUgSSd2ZSBmb3VuZCBhIHdheSB0byBmaXggdGhpcyBidWcgd2l0aCB0aGlzIHBh
dGNoOgo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjIxMTE3MTk0NTA1Ljk0OTg0Ni0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20vCj4+IAo+PiBDYW4geW91IHBsZWFzZSBnaXZlIGEgdHJ5IGF0IHlvdSB0b28gYW5k
IGdpdmUgYSBUZXN0ZWQtYnkgdGFnPwo+IAo+IFllYWgsIEkgdmVyaWZpZWQgaXQgd29ya3Mgb24g
dGhlIHJlY2VudGx5IHJlbGVhc2VkIG1ha2UgNC40IGZpbmFsLgoKVGhhbmtzIGEgbG90IQoKR2l1
bGlvCgo+IAo+PiAKPj4gVGhhbmsgeW91Cj4+IEJlc3QgcmVnYXJkcwo+PiAtLQo+PiBHaXVsaW8g
QmVuZXR0aQo+PiBDRU8vQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
