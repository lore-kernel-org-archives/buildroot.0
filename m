Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C18C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA783611E9;
	Tue,  6 Feb 2024 13:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA783611E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9uITe1frvmZ; Tue,  6 Feb 2024 13:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E621611F8;
	Tue,  6 Feb 2024 13:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E621611F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F23C71BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8FC240C2D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8FC240C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJIVKpjtQHk6 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:46:04 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4161940C96
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4161940C96
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 32D2313F879;
 Tue,  6 Feb 2024 14:45:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 14:45:57 +0100
Date: Tue, 6 Feb 2024 14:45:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZcI4FZx1kKqT8Xwk@landeda>
References: <20240111052225.2922249-1-james.hilliard1@gmail.com>
 <687fa6af-4d6f-4890-bd3a-c420ede9cdfd@mind.be>
 <CADvTj4ptOXX-KXLrdykFUZnQBo1YCmgd1niQ10rRv5PBXGbV+g@mail.gmail.com>
 <c48e9859-c68f-46ca-8d76-4af73535f488@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c48e9859-c68f-46ca-8d76-4af73535f488@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707227162;
 bh=8uGNIzF1XZrrFi/PLzJeLsR99oy6pADSZDmn4mr5qjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PuYpieRgKEJXYqyK6cUznsa2mlvzGch4zg5v4TtlHgV+ZnFgC0cju4LfUqJql5y8y
 zt8pfrwc+tZlFP5YdJxsgA3fSHw8R1OdyDttEjhAS9kV2swwj9JAYnRGTgmz/iBspI
 yQa8m5KpiTLVKNVa1vrvuyxuTB98ngm9Tpet6FoBSBEetMds3DFcD03DG01xc9BhsC
 mTipE02gUartw5JNPkgAeDfzIhDmhLfWNNfr68euQHLOhn0+fzSUoq2oXoTnP7HWkA
 /I2Vhxac/HiCIX7qDRWcqh/odrXXBs1P6/l1q1mvE7LfVkXdwck0tinOvfUGfxPVTq
 8VANrXDp17QgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PuYpieRg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version
 0.10.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBBbGwsCgpPbiAyMDI0LTAyLTA2IDA5OjQ5ICswMTAwLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBPbiAwNS8wMi8yMDI0IDE4OjIxLCBK
YW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDUsIDIwMjQgYXQgNDoyOeKAr0FN
IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4gPiA+IE9uIDEx
LzAxLzIwMjQgMDY6MjIsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gPiA+IE1pZ3JhdGUgZnJv
bSBzZXR1cHRvb2xzLXJ1c3QgdG8gbWF0dXJpbiBpbmZyYXN0cnVjdHVyZS4KPiA+ID4gPiAKPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgICBwYWNrYWdlL3B5dGhvbi1ydG9tbC9weXRob24t
cnRvbWwuaGFzaCB8IDIgKy0KPiA+ID4gPiAgICBwYWNrYWdlL3B5dGhvbi1ydG9tbC9weXRob24t
cnRvbWwubWsgICB8IDYgKysrLS0tCj4gPiA+ID4gICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5oYXNoIGIvcGFja2FnZS9weXRob24tcnRv
bWwvcHl0aG9uLXJ0b21sLmhhc2gKPiA+ID4gPiBpbmRleCAwNGQyMmVkMWE0Li41OWYxN2Q5ZDYy
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXJ0b21sL3B5dGhvbi1ydG9tbC5o
YXNoCj4gPiA+ID4gKysrIGIvcGFja2FnZS9weXRob24tcnRvbWwvcHl0aG9uLXJ0b21sLmhhc2gK
PiA+ID4gPiBAQCAtMSw0ICsxLDQgQEAKPiA+ID4gPiAgICAjIExvY2FsbHkgY2FsY3VsYXRlZCBh
ZnRlciB2ZW5kb3JpbmcKPiA+ID4gPiAtc2hhMjU2ICA4MjFhNDMwYWI2NTg3YmRhYWY3Y2I5NTA0
NGU4ZTBkOTljNzdjNmFlZDBhZGNlNWEzNzAwNDViMjcwZjdlZTIwICBydG9tbC0wLjguMC50YXIu
Z3oKPiA+ID4gPiArc2hhMjU2ICA5ODdkM2Q5ZTlkNTY3NjFiMTdjM2U0ZTE3MjkzN2NiY2M3OTNi
ZjI0YjBlYmIyNzMwNjQ3YTlhMmNmODZjNzg5ICBydG9tbC0wLjEwLjAudGFyLmd6Cj4gPiA+IAo+
ID4gPiAgICBTYW1lIHByb2JsZW06Cj4gPiA+IAo+ID4gPiBFUlJPUjogd2hpbGUgY2hlY2tpbmcg
aGFzaGVzIGZyb20gcGFja2FnZS9weXRob24tcnRvbWwvL3B5dGhvbi1ydG9tbC5oYXNoCj4gPiA+
IEVSUk9SOiBydG9tbC0wLjEwLjAudGFyLmd6IGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoKPiA+ID4g
RVJST1I6IGV4cGVjdGVkOiA5ODdkM2Q5ZTlkNTY3NjFiMTdjM2U0ZTE3MjkzN2NiY2M3OTNiZjI0
YjBlYmIyNzMwNjQ3YTlhMmNmODZjNzg5Cj4gPiA+IEVSUk9SOiBnb3QgICAgIDogNjI0Y2MxZmYy
YjNmZGVhNDJhZWVlM2E0ZDE1MzdkMzc0MzFlYzAwMTg3MGRmZWUxZTA0YTEyYmQzMDc2YTJkMwo+
ID4gSG1tLCBJJ20gdW5hYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlLgoKVHVybmVkIG91dCB0
aGF0IEFybm91dCdzIHNldHVwIHdhcyBzbGlnaHRseSBib3JrZWQsIGFuZCBoZSB3YXMgdXNpbmcg
YQoxLjM1IHRhciB0byBjcmVhdGUgdGhlIGFyY2h2aWVzLi4uCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
