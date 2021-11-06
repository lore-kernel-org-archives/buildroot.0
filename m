Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD8AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:50:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9376124A
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F9376124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB66405F8;
	Sat,  6 Nov 2021 10:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izZ3zHmg-T1f; Sat,  6 Nov 2021 10:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DF340092;
	Sat,  6 Nov 2021 10:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0A601BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F2BF402EF
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bwlbi2zul_F0 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:50:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AA2840242
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:50:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AA6EFFF807;
 Sat,  6 Nov 2021 10:50:28 +0000 (UTC)
Date: Sat, 6 Nov 2021 11:50:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211106115027.79c8bc06@windsurf>
In-Reply-To: <20211106091508.29167-1-ps.report@gmx.net>
References: <20211106091508.29167-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gdb: fix gdb-10.2 compile for
 uclibc < v1.0.35 (getrandom related)
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

T24gU2F0LCAgNiBOb3YgMjAyMSAxMDoxNTowOCArMDEwMApQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IHdyb3RlOgoKPiAtIGZpeCBnZXRyYW5kb20gY29tcGlsZSBmb3IgdWNsaWJj
IDwgdjEuMC4zNSwgYWRkIG1pc3Npbmcgc3RkZGVmLmgKPiAgIGluY2x1ZGUgKGZpeGVkIGluIHVj
bGliYyBzaW5jZSB2MS4wLjM1LCBzZWUgWzFdKQo+IAo+IEZpeGVzOgo+IAo+ICAgLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82ZDRhNjJjNzAzYzg1ZGQ5OTNkZGIyZDkw
ZWJlMWY2Y2FkMjRlMGIwCj4gCj4gICAuLi4vaG9zdC94ODZfNjQtYnVpbGRyb290LWxpbnV4LXVj
bGliYy9zeXNyb290L3Vzci9pbmNsdWRlL3N5cy9yYW5kb20uaDoyNzozNTogZXJyb3I6IHVua25v
d24gdHlwZSBuYW1lIOKAmHNpemVfdOKAmQo+ICAgICAgMjcgfCBleHRlcm4gaW50IGdldHJhbmRv
bSh2b2lkICpfX2J1Ziwgc2l6ZV90IGNvdW50LCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KPiAKPiBbMV0gaHR0
cHM6Ly9jZ2l0LnVjbGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJjLW5nLmdpdC9jb21taXQvP2lk
PTAwOTcyYzAyYzJiNmUwYTk1ZDVkZWY0YTcxYmRmYjE4OGUwOTE3ODJ0Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0Pgo+IC0tLQo+ICAuLi5nZXRy
YW5kb20tY29tcGlsZS1mb3ItdWNsaWJjLXYxLjAuMzUucGF0Y2ggfCAzOSArKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2dkYi8xMC4yLzAwMDYtRml4LWdldHJhbmRvbS1jb21waWxlLWZvci11
Y2xpYmMtdjEuMC4zNS5wYXRjaAoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gRGlkIHlvdSB2
ZXJpZnkgdGhhdCB0aGlzIHdhcyBvbmx5IGFwcGxpY2FibGUKdG8gZ2RiIDEwLngsIGFuZCBub25l
IG9mIHRoZSBvbGRlciBvciBuZXdlciB2ZXJzaW9ucyA/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
