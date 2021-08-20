Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97DBC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE9D610FF
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FE9D610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5210760612;
	Fri, 20 Aug 2021 21:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CC1TRAwwf6Aj; Fri, 20 Aug 2021 21:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7170B613B7;
	Fri, 20 Aug 2021 21:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36A251BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BE081A4E
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DxkDKu08FiQw for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEDA481BC5
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:36:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id EA6141C0005;
 Fri, 20 Aug 2021 21:36:12 +0000 (UTC)
Date: Fri, 20 Aug 2021 23:36:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210820233611.1d6d1c71@windsurf>
In-Reply-To: <20210820112322.5762-1-jose.pekkarinen@unikie.com>
References: <20210820112322.5762-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/restorecond: Add new init script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDIwIEF1ZyAyMDIxIDE0OjIzOjIyICswMzAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhlIGN1cnJl
bnQgcmVzdG9yZWNvbmQgdXBzdHJlYW0gaW5pdCBzY3JpcHQgaXMgbm8KPiBnb29kIGZpdCBmb3Ig
dGhlIHVzZXIgc3BhY2UgZ2VuZXJhdGVkIGJ5IGJ1aWxkcm9vdCwKPiB0aGlzIHNjcmlwdCBpcyBh
biBleHRlbnNpb24gb2YgdGhlIG9yaWdpbmFsLCB0aGF0Cj4gYnJpbmdzIHNvbWUgY2hhbmdlcyBm
cm9tIHRoZSBkZWJpYW4gaW5pdCBzY3JpcHQgdG8KPiB1c2Ugc3RhcnQtc3RvcC1kYWVtb24gaW5z
dGVhZCBvZiBkYWVtb24sIHdoaWxlCj4gcmVtb3ZpbmcgZGVwZW5kZW5jaWVzIG9uIC9ldGMvcmMu
ZC9pbml0LmQvZnVuY3Rpb25zCj4gYW5kIC9saWIvbHNiL2luaXQtZnVuY3Rpb25zLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29t
Pgo+IC0tLQo+IFsgdjEgLT4gdjIgXSBNb3ZlZCB0byB1cHN0cmVhbSBzY3JpcHQgdGVtcGxhdGUK
CkkgaGF2ZSBmdXJ0aGVyIHNpbXBsaWZpZWQgdGhlIHNjcmlwdCB0byBiZXR0ZXIgbWF0Y2ggdGhl
IFMwMXN5c2xvZ2QKdGVtcGxhdGUsIGFkZGVkIHRoZSBpbmNsdXNpb24gb2YgL2V0Yy9kZWZhdWx0
L3Jlc3RvcmVjb25kLCBhbmQgYXBwbGllZAp0byBuZXh0LiBUaGFua3MhCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVz
eWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
