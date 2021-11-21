Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0F1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B222A607D1;
	Sun, 21 Nov 2021 21:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAslNx8rKD_e; Sun, 21 Nov 2021 21:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135F9607CF;
	Sun, 21 Nov 2021 21:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4A21BF3BB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CA3180F3B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 21:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2a3ODJPa0zo for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 21:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF70D80F36
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 21:28:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 20FC320007;
 Sun, 21 Nov 2021 21:28:05 +0000 (UTC)
Date: Sun, 21 Nov 2021 22:28:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20211121222804.71784787@windsurf>
In-Reply-To: <20211118174547.3939-1-vincent.stehle@arm.com>
References: <20211118174547.3939-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: add support for
 mkeficapsule
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxOCBOb3YgMjAyMSAxODo0NTo0NyArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBUaGUgbWtlZmljYXBzdWxlIFUtQm9vdCB0b29s
IGNhbiBiZSB1c2VkIHRvIGdlbmVyYXRlIFVFRkkgY2Fwc3VsZSBiaW5hcmllcy4KPiBBZGQgYW4g
b3B0aW9uIHRvIGNyb3NzLWJ1aWxkIGl0IGFuZCBpbnN0YWxsIGl0IHRvIHRoZSB0YXJnZXQgZmls
ZXN5c3RlbS4KPiBBbHNvLCBidWlsZCBpdCBhbmQgaW5zdGFsbCBpdCB1bmNvbmRpdGlvbmFsbHkg
dG8gdGhlIGhvc3QgZGlyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmlu
Y2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogTWF0dCBXZWJlciA8bWF0dGhldy53ZWJlckBjb2xs
aW5zLmNvbT4KPiAtLS0KPiAgcGFja2FnZS91Ym9vdC10b29scy9Db25maWcuaW4gICAgICB8ICA4
ICsrKysrKysrCj4gIHBhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsgfCAxOSArKysr
KysrKysrKysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
