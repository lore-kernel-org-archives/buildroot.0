Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FEC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 05:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F33082099;
	Sun,  7 May 2023 05:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F33082099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfB-WljI2b2S; Sun,  7 May 2023 05:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FCC81F74;
	Sun,  7 May 2023 05:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FCC81F74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 947EB1BF32B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 05:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A97B402F7
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 05:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A97B402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djpZag2aNQCA for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 05:24:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D98C4010F
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D98C4010F
 for <buildroot@buildroot.org>; Sun,  7 May 2023 05:24:38 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 6128E440F82;
 Sun,  7 May 2023 08:24:34 +0300 (IDT)
References: <87o7mz4amx.fsf@tarshish> <20230506151601.GA252090@scaer>
User-agent: mu4e 1.9.21; emacs 28.2
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 07 May 2023 07:17:13 +0300
In-reply-to: <20230506151601.GA252090@scaer>
Message-ID: <877ctkaf3h.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1683437074;
 bh=fxSEMwqQzvl8D/PGVN0MVS/UQY0ytYQI4lEQYDQ4uPY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lMB9ttrJcJVq8QMYTrhSzHvjp92Nd8bBxLdQMIilbm7XFEEmSOKOuZvVPMBsjmoHm
 cVZeW9mGIxIP+KcwTG9EVxoJ2MzWNdHQ2HLBd9VALIgfrFzdNMvMDrPV3RXWOZcRa1
 d19h++jLwln1bVxifMxx6KevKA0CnkJK0/PjGKfXLXZpRUCWr4LKqAFA4detRkq0T4
 k+XeeQG/uWKfiGYLX5FL4OV5pyj8sXs+pOya3gjTnJZX5bPC1zMrYb+3I+vewmI5sL
 upSj6WQBKYmzZuLJlNyE3UXPupeKRmpEpyHJJOWtYjXW3TIiyYCXtfuLdCaW1DqisT
 DTShpr+Gf9MiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=lMB9ttrJ
Subject: Re: [Buildroot] List of trivial old patches
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFNhdCwgTWF5IDA2IDIwMjMsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gT24g
MjAyMy0wNS0wNSAwODoxNyArMDMwMCwgQmFydWNoIFNpYWNoIHZpYSBidWlsZHJvb3Qgc3Bha2Ug
dGh1c2x5Ogo+PiBIZXJlIGlzIGEgbGlzdCBvZiBvdmVyIG1vbnRoIG9sZCBwYXRjaHdvcmsgZW50
cmllcyB0aGF0IGxvb2sgbGlrZQo+PiB0cml2aWFsIHZlcnNpb24gYnVtcHMsIG9yIHVwc3RyZWFt
IGJhY2twb3J0cy4KPj4gVGhlcmUgYXJlIGEgbG90IG1vcmUuIFNvIGlmIHlvdSBmaW5kIHRoaXMg
bGlzdCB1c2VmdWwsIEknbGwgZGlnIHVwIG1vcmUKPj4gcGF0Y2hlcy4KPgo+IEkgYmxpbmRseSBh
cHBsaWVkIHRoZSBwYXRjaGVzLCBvbiB0aGUgYXNzdW1wdGlvbiB5b3UgZGlkIGFjdHVhbGx5IHJl
dmlldwo+IHRoZW0gYmVmb3JlIGFkZGluZyB0aGVtIHRvIHRoZSBsaXN0LCB3aGljaCB3YXMgbmVp
dGhlciB0b28gc2hvcnQgbm9yIHRvbwo+IGxvbmcsIHNvIGl0IHdhcyBwcmV0dHkgbXVjaCBtYW5h
Z2VhYmxlLCBzbyB5ZXMsIHRoYXQgd2FzIHVzZWZ1bC4gVGhhbmtzIQoKVGhhbmtzIGZvciB5b3Vy
IHByb21wdCBhY3Rpb24uCgpJIG9ubHkgcmV2aWV3ZWQgdGhlIHBhdGNoZXMgdG8gbWFrZSBzdXJl
IHRoZXkgYXJlIGluZGVlZCB0cml2aWFsLiBUaGF0CmlzLCBtZWNoYW5pY2FsIHZlcnNpb24gYnVt
cCwgb3IgdXBzdHJlYW0gYmFja3BvcnRzLgoKPiBXaGF0IHdvdWxkIGJlIGV2ZW4gbW9yZSB1c2Vm
dWwgKGFuZCB0aGlzIGlzIHZhbGlkIGZvciBldmVyeW9uZSkgaXMgdG8KPiByZXZpZXcgY29tcGxl
eCBwYXRjaGVzIHRvbywgYmVjYXVzZSB0aG9zZSBhcmUgdGhlIG9uZXMgdGhhdCB0YWtlIG1vcmUK
PiB0aW1lICh2ZXJzaW9uIGJ1bXBzIGFyZSBpbmRlZWQgdHJpdmlhbCBhbmQgc2VsZG9tIGdldCBh
IHNlY29uZCB0aG91Z2h0Cj4gZnJvbSBteSBwYXJ0KS4KCkkgYW0gZnVsbHkgYXdhcmUgb2YgdGhl
IHJldmlldyBiYW5kd2lkdGggc2hvcnRhZ2UgdGhhdCBtYWtlcyBjb21wbGV4CnBhdGNoZXMgbGlu
Z2VyIGluIHBhdGNod29yayBxdWV1ZS4gVGhlIHRoaW5nIGlzIHRoYXQgdGhlIHF1ZXVlIGxlbmd0
aApzZWVtcyB0byBoaWRlIHRyaXZpYWwgcGF0Y2hlcyB0aGF0IGFyZSBjbG9zZXIgdG8gdGhlIGRp
c3RhbnQgZW5kIG9mIHRoZQpxdWV1ZS4gU28gSSB0b29rIGFjdGlvbiBpbiBob3BlIHRvIGJyaW5n
IHNvbWUgb2YgdGhlc2UgcGF0Y2hlcyBiYWNrIHRvCmZyb250LCBhdCBsZWFzdCBvbiB0aGUgbWFp
bGluZyBsaXN0LiBJIGFtIGdsYWQgaXQgd29ya2VkLgoKVGhlIGltbWVkaWF0ZSB0cmlnZ2VyIGZv
ciBtZSB3YXMgdGhlIGxpYmN1cmwgYnVtcCAoY29tbWl0IDFlNzM1YzQ4MzcyKQp0aGF0IHdhcyBh
bHNvIGEgc2VjdXJpdHkgdXBkYXRlIHRoYXQgd2VudCB0aHJvdWdoIHNvbWUgdHJvdWJsZSB3aXRo
CmRpc3Ryb3NbMV0uIFdhcyBCdWlsZHJvb3QgYWZmZWN0ZWQgYXMgd2VsbD8gQW55d2F5LCB0aGUg
dXBkYXRlIGRlbGF5Cm1hZGUgbGliY3VybCBidW1wIG1pc3MgdGhlIGxhc3QgMjAyMi4wMi54IHJl
bGVhc2UsIHdoaWNoIGlzIHVuZm9ydHVuYXRlLgoKWzFdIGh0dHBzOi8vZGFuaWVsLmhheHguc2Uv
YmxvZy8yMDIzLzAzLzI5L3ByZS1ub3RpZmljYXRpb24tZGlsZW1tYXMvCgo+IEFueXdheSwgdGhh
bmtzIGZvciB0aGUgZWZmb3J0LCBhbmQgaWYgeW91IHNlbmQgYW5vdGhlciBsaXN0LCB0aGlzIGxl
bmd0aAo+IGFuZCBjb250ZW50IGlzIG5pY2UuIPCfkY0KClRoYW5rcywKYmFydWNoCgotLSAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+LiAufiAg
IFRrIE9wZW4gU3lzdGVtcwo9fS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLW9vTy0tVS0tT29vLS0tLS0tLS0tLS0tez0KICAgLSBiYXJ1Y2hAdGtvcy5jby5p
bCAtIHRlbDogKzk3Mi41Mi4zNjguNDY1NiwgaHR0cDovL3d3dy50a29zLmNvLmlsIC0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
