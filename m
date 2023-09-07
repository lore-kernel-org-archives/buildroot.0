Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D13EC875F
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 23:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78FC260C11;
	Thu,  7 Sep 2023 23:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78FC260C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNq6NTR64rnn; Thu,  7 Sep 2023 23:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71B8606F2;
	Thu,  7 Sep 2023 23:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B71B8606F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEE641BF3EC
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 23:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90DDE8231E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 23:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DDE8231E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jxy39rcKDuHj for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 23:51:00 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9880D82315
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 23:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9880D82315
Received: from [IPv6:::1] (unknown [IPv6:2a02:169:3df5:10:3c77:bb50:50b1:b20c])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 216845C1730;
 Fri,  8 Sep 2023 01:50:58 +0200 (CEST)
Date: Fri, 08 Sep 2023 01:50:58 +0200
From: Stefan Agner <stefan@agner.ch>
To: Christian Stewart <christian@aperture.us>
User-Agent: K-9 Mail for Android
In-Reply-To: <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
Message-ID: <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1694130658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzOS1desiHHMfACVqtDUgPQibKmKOHjkUptywMLALsA=;
 b=mes5BrOtcOwzJcEXjYGmrZ35bGXbyH8+PuUNIM5F9LpnyYrVGOOYObwtP8+hh5ufRpH+GG
 +mthjhmwoLvzQvgFh/xN3BKEFp/dlaziuOSEIXERue7enT0nSLBKuTxIgU62L3Fip9uVXj
 riIA3YGZAPm4o4MWjW7fwaKHEFSjL0M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=mes5BrOt
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA4IFNlcHRlbWJlciAyMDIzIDAxOjI4OjM2IENFU1QsIENocmlzdGlhbiBTdGV3YXJ0IDxj
aHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+SGkgU3RlZmFuLAo+Cj5PbiBUaHUsIFNlcCA3
LCAyMDIzIGF0IDQ6MjPigK9QTSBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4gd3JvdGU6
Cj4+Cj4+IEhpIENocmlzdGlhbiwKPj4KPj4gSXQgc2VlbXMgdGhhdCB0aGlzIHZlcnNpb24gaGFu
Z3MgYXQgc3RhcnR1cCwgYXQgbGVhc3Qgd2hlbiBidWlsdCB3aXRoCj4+IEJ1aWxkcm9vdCAyMDIz
LjAyLjQuCj4KPkkgYW0gcnVubmluZyAxLjcueCBvbiBteSBzeXN0ZW1zIHNvIEkgY2FuJ3QgY29u
ZmlybSB0aGlzIGN1cnJlbnRseS4KCkkndmUganVzdCB0ZXN0ZWQgMS43LjMgYXMgd2VsbCwgaXQg
c2hvd3MgdGhlIHNhbWUgYmVoYXZpb3IgaGVyZS4gSSdsbCBuZWVkIHRvIGRvIG1vcmUgdGVzdGlu
Zy4gSWRlYWxseSBJIGxpa2UgdG8gc2VlIGEgc3RhY2sgdHJhY2UgKHZpYSBzaWduYWwgb3IgZGVi
dWdnZXIpLCBidXQgbm90IHN1cmUgaG93IHRvIGFyY2hpdmUgdGhpcyB3aXRoIEJ1aWxkcm9vdCBh
bmQgZ29sYW5nLgoKVGhpcyBpcyBvbiBhYXJjaDY0IHBsYXRmb3Jtcy4KCj4KPj4gQnR3LCBvbiBt
YXN0ZXIsIHdoZXJlIHdlIHVzZSBEb2NrZXIgMjQuMC54LCBzaG91bGRuJ3QgY29udGFpbmVyZCBi
ZQo+PiB1cGdyYWRlZCB0byB0aGUgMS43Lnggc2VyaWVzPwo+Cj5BY2NvcmRpbmcgdG8gdGhpcyAx
LjYueCBpcyBMVFMgYW5kIHN0aWxsIGdldHRpbmcgdXBkYXRlczoKPgo+aHR0cHM6Ly9jb250YWlu
ZXJkLmlvL3JlbGVhc2VzLwo+Cj5BY2NvcmRpbmcgdG8gdGhlc2UgcmVsZWFzZSBub3RlcywgMS42
LnggImhhcyBhbHNvIGJlY29tZSBhIGxvbmcgdGVybQo+c3RhYmxlIHJlbGVhc2UgZm9yIHVzZXJz
IHdobyBwcmVmZXIgcmVsZWFzZXMgd2l0aCBtb3N0bHkgc3RhYmlsaXR5Cj5pbXByb3ZlbWVudHMg
YW5kIHdpc2ggdG8gd2FpdCBhIGZldyByZWxlYXNlcyBmb3IgbmV3IGZ1bmN0aW9uYWxpdHkuIgo+
Cj5TZWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvcmVsZWFzZXMv
dGFnL3YxLjcuMAo+Cj5TaW5jZSBEb2NrZXIgaXMgc3VwcG9zZWQgdG8gYmUgYWdub3N0aWMgdG8g
ZGlmZmVyZW50IGNvbnRhaW5lcmQKPnZlcnNpb25zIGl0IG1hZGUgc2Vuc2UgdG8gdXNlIHRoZSBM
VFMuCj4KPkhvd2V2ZXIsIEkgYW0gbm90IGFnYWluc3QgdXBkYXRpbmcgaXQgdG8gMS43LnggYXMg
SSdtIGN1cnJlbnRseSB1c2luZwo+JiB0ZXN0aW5nIHRoYXQgYnJhbmNoIGFueXdheS4KCk9rIEkg
c2VlLiBFaXRoZXIgd2F5IHdvcmtzIGZvciBtZS4KCkJlc3QgcmVnYXJkcywKU3RlZmFuCgo+Cj5C
ZXN0LAo+Q2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
