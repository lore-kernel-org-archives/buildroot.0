Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C67C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 14:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF46408F6;
	Mon, 21 Mar 2022 14:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yEbacqID-HOZ; Mon, 21 Mar 2022 14:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED1F408F4;
	Mon, 21 Mar 2022 14:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4021BF324
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 14:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1006E408ED
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 14:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjdFZdBDUPrx for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 14:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-outgoing-1701.laposte.net (smtp-outgoing-1701.laposte.net
 [160.92.124.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05AAB40106
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:53:35 +0000 (UTC)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KMd0S3LhpzgY7s",
 "contextId":"31610295-3491-46c9-87f6-50d640a30a3d"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0104.laposte.net (SMTP Server) with ESMTP id 4KMd0S3LhpzgY7s;
 Mon, 21 Mar 2022 15:53:28 +0100 (CET)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KMd0S2Yy3zgY7R",
 "contextId":"a1744501-f2c6-4fe5-99c5-9ff9af82c252"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (0)(0000)gggruggvucftvghtrhhoucdtuddrgedvvddrudegfedgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecunfetrffquffvgfdpggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeggihhntggvnhhtucfuthgvhhhlrocuoehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvtheqnecuggftrfgrthhtvghrnhepteeivdehieejtdfgledvgffhvedtveejhefftdeukeeuieduudetjeektdeuffetnecukfhppeekkedrudeiledruddvledrvddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeiledruddvledrvddvhedphhgvlhhopehrohhmuhgrlhgurdgsvghrghgvrhhivgdpmhgrihhlfhhrohhmpehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhmohguvgepshhmthhpohhuth
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0104.laposte.net (SMTP Server) with ESMTPSA id 4KMd0S2Yy3zgY7R;
 Mon, 21 Mar 2022 15:53:28 +0100 (CET)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 085E5485458E;
 Mon, 21 Mar 2022 15:53:28 +0100 (CET)
Received: from vincent by radicelle.bergerie with local (Exim 4.95)
 (envelope-from <vincent@radicelle.bergerie>) id 1nWJPT-0006DK-Vw;
 Mon, 21 Mar 2022 15:53:27 +0100
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 15:53:22 +0100
Message-Id: <20220321145322.23881-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1647874413; bh=ED5jm8DY3KjJRdC5x43zsRUQcwJMFkd0ynd6D/n7+0s=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=Pu4WcvpDRFI87mZUKZMtSZ4qOGc3dIS0NlO6uHtPe84TjVs9mki3Bb4PchnJvFL2r6xNP845+SpgodeyNqZJh5AVmrvsjqVvudMbT00NQQgMxErDYynngUcJVuZVV39vuy10Zao/cvuZHbtTTc5Fq9FSXS1CJLwfkDs4t5u8WMbHcgRC1Fq3TMOHtH4/begsUHtBhnl9drRp2tw21HUl9JYQY6vwJ1+TmxgU0hBCJvxB7LERnMBDir+gJl4BIeYIDe2NLqMLq5qlNBsZDpqPrxd2mx+ZhnthoZWvCElp6keLkQB455PFS8L813ea1Safx3T3NUcUmWSq1VCWvgBcAg==;
Subject: [Buildroot] [PATCH] package/busybox: fix udhcpc options in minimal
 config
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGJ1c3lib3gtbWluaW1hbC5jb25maWcsIHdoaWNoIGlzIHVzZWQgYnkgc3lzdGVtcyB3aXRo
b3V0IGFuIE1NVSwgc3BlY2lmaWVzCnRoZSAiLWIiIGNvbW1hbmQgbGluZSBvcHRpb24gZm9yIHVk
aGNwYy4gSG93ZXZlciwgdGhpcyBvcHRpb24gaXMgbm90IHN1cHBvcnRlZApieSBCdXN5Qm94IHVk
aGNwYyBhbnltb3JlIHNpbmNlIHZlcnNpb24gMS4yNy4wIHdoZW4gYnVpbGRpbmcgZm9yIHN5c3Rl
bXMKd2l0aG91dCBhbiBNTVUuCgpSZW1vdmUgdGhlICItYiIgb3B0aW9uIGZyb20gYnVzeWJveC1t
aW5pbWFsLmNvbmZpZyB0byByZXBhaXIgbmV0d29yawppbml0aWFsaXphdGlvbiBvbiBzeXN0ZW1z
IHdpdGhvdXQgYW4gTU1VLgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIG5ldHdvcmsgaW5pdGlh
bGl6YXRpb24gZmFpbHVyZToKCiAgdWRoY3BjOiBpbnZhbGlkIG9wdGlvbiAtLSBiCiAgRkFJTAoK
U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5l
dD4KLS0tCgoKSGksCgpJIGhhdmUgdmVyaWZpZWQgb24gcWVtdSB0aGF0IHRoaXMgcGF0Y2ggZG9l
cyBmaXggdGhlIG5ldHdvcmsgaW5pdGlhbGl6YXRpb24gZm9yCnFlbXVfYXJtX3ZlcnNhdGlsZV9u
b21tdV9kZWZjb25maWcgYW5kIHFlbXVfbTY4a19tY2Y1MjA4X2RlZmNvbmZpZy4KCkkgY291bGQg
b25seSB2ZXJpZnkgdGhlIGJ1aWxkIGZvciBzdG0zMmY0MjlfZGlzY29feGlwX2RlZmNvbmZpZywK
c3RtMzJmNDY5X2Rpc2NvX3NkX2RlZmNvbmZpZyBhbmQgc3RtMzJmNDY5X2Rpc2NvX3hpcF9kZWZj
b25maWcuCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgoKIHBhY2thZ2UvYnVzeWJveC9idXN5Ym94
LW1pbmltYWwuY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9idXN5Ym94L2J1c3lib3gtbWluaW1h
bC5jb25maWcgYi9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZwppbmRleCA5
ZWFlMGY1MWY0Li4xZmI0ZTM5ZTIxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2J1c3lib3gvYnVzeWJv
eC1taW5pbWFsLmNvbmZpZworKysgYi9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNv
bmZpZwpAQCAtMTAxOCw3ICsxMDE4LDcgQEAgQ09ORklHX1VESENQX0RFQlVHPTkKIENPTkZJR19V
REhDUENfU0xBQ0tfRk9SX0JVR0dZX1NFUlZFUlM9ODAKICMgQ09ORklHX0ZFQVRVUkVfVURIQ1Bf
UkZDMzM5NyBpcyBub3Qgc2V0CiAjIENPTkZJR19GRUFUVVJFX1VESENQXzgwMjFRIGlzIG5vdCBz
ZXQKLUNPTkZJR19JRlVQRE9XTl9VREhDUENfQ01EX09QVElPTlM9Ii1iIC1SIgorQ09ORklHX0lG
VVBET1dOX1VESENQQ19DTURfT1BUSU9OUz0iLVIiCiAKICMKICMgUHJpbnQgVXRpbGl0aWVzCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
