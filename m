Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2537FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 04:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A3E9401F8;
	Wed, 27 Apr 2022 04:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIQxK2J8xQI1; Wed, 27 Apr 2022 04:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9243B40181;
	Wed, 27 Apr 2022 04:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB6C1BF94B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 04:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 174F1415D7
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 04:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eh_nkZI00ky3 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 04:40:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29577415CF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 04:40:17 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 1B6554403AE;
 Wed, 27 Apr 2022 07:39:27 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651034367;
 bh=At6cZtEp5D1mHzaQ/eRvvw6AzercgiGbzNTiWjEiQE4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Q0Jaem16ok4e2Jf9vTqisAJR29xvNWmjs6zLK/NVyiBL+Akov20wnDcuA7d13EyUa
 c4aj/zA/PrUR9O28aE56vFngnVi4V0zVh9utf2RqWJioxIhtUZqAW9nieqBcC4RkT/
 l1A+I511guURriM4/SE4XVvX16XTx2Xax0ovrKoPzBPPxrh0GCkzw7CfHlxM/P5BR+
 TQFR8ZLoOuN44xrndqX/b/DtVz3ZrWoBt6CkSlbsn8GTR6zzd5jpfyrpQLO0per/8I
 gs04X6a1APdxq6fefbjPWB4HCxr3C5mkxnIzak9Uuw0ScdOOb2rA2nPph7p0Q/3jY+
 M/e75dJwZVrDg==
References: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
 <87bkwn21vp.fsf@tarshish> <20220427000159.58749c28@windsurf>
User-agent: mu4e 1.6.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Apr 2022 07:34:16 +0300
In-reply-to: <20220427000159.58749c28@windsurf>
Message-ID: <877d7b16mr.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 diffutils
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
Cc: Ryan Barnett <ryan.barnett@rockwellcollins.com>,
 =?utf-8?Q?Jos?= =?utf-8?Q?=C3=A9?= Luis Salvador Rufo
 <salvador.joseluis@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gV2VkLCBBcHIgMjcgMjAyMiwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
PiBPbiBUdWUsIDI2IEFwciAyMDIyIDIwOjE2OjEyICswMzAwCj4gQmFydWNoIFNpYWNoIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPj4gT24gVHVlLCBBcHIg
MjYgMjAyMiwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+PiA+IFRoZSBjb21tYW5k
IGBjbXBgIGlzIHVzZWQgYnkgYHBhY2thZ2UvcGtnLWdlbmVyaWMubWtgIGF0IGNvbW1pdAo+PiA+
IDg2MjNjYzVkZWI1LiBUaGlzIGNvbW1hbmQgaXMgcHJvdmlkZWQgYnkgYGRpZmZ1dGlsc2AuICAK
Pj4gCj4+IEFjdHVhbGx5LCB3ZSBoYXZlIGhvc3QtZGlmZnV0aWxzLCBzbyB3ZSBjYW4gYnVpbGQg
Y21wIGlmIHRoZSBob3N0IGRvZXMKPj4gbm90IGhhdmUgaXQgaW5zdGFsbGVkLiBBbGwgd2UgbmVl
ZCBpcyBzdXBwb3J0IGFkZGVkIHVuZGVyCj4+IHN1cHBvcnQvZGVwZW5kZW5jaWVzLyBsaWtlIGEg
ZmV3IG90aGVyIHV0aWxpdGllcy4KPgo+IFllcywgYnV0IHdlJ3JlIG5vdCBnb2luZyB0byBidWls
ZCBob3N0LWRpZmZ1dGlscyBpZiBjbXAgaXMgbWlzc2luZy4KPiBJdCdzIG5vdCBkb25lIGluIG91
ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBhbmQgSSBkb24ndCB0aGluayB3ZSB3YW50Cj4gdG8g
ZG8gdGhhdC4gU28gaXQgc2VlbXMgbGlrZSBkaWZmdXRpbHMgaXMgaW5kZWVkIGEgaGFyZCByZXF1
aXJlbWVudC4KClNob3VsZCB3ZSByZW1vdmUgaG9zdC1kaWZmdXRpbHM/IFRoYXQgbWVhbnMgcmV2
ZXJ0aW5nIGNvbW1pdAo4MTk2MzdlMGU5Nzc0LCBhbmQgcGFydCBvZiA5NTIxNDkyYmQwNzA2ICgi
cGFja2FnZS9vcGtnLXV0aWxzOiBhZGQKbWlzc2luZyBkZXBlbmRlbmNpZXMgZm9yIGhvc3QgYnVp
bGQiKS4KClJ5YW4sIGhhdmUgeW91IGVuY291bnRlcmVkIGFuIGlzc3VlIHdpdGggbWlzc2luZyBk
aWZmdXRpbHMgb24geW91ciBidWlsZApob3N0IHdoZW4gdXNpbmcgb3BrZy11dGlscz8KCmJhcnVj
aAoKPj4gV2UgYWxzbyBkb24ndCBsaXN0IGZpbmR1dGlscyBhcyBwcmVyZXF1aXNpdGUsIGV2ZW4g
dGhvdWdoIHdlIHJlbHkKPj4gaGVhdmlseSBvbiB0aGUgJ2ZpbmQnIHV0aWxpdHkuCj4KPiBTbyBw
ZXJoYXBzIHdlIHNob3VsZCBsaXN0IGZpbmR1dGlscyBhcyB3ZWxsIGluIG91ciBoYXJkIHJlcXVp
cmVtZW50cz8KPgo+IEpvc8OpIEx1aXM6IHByYWN0aWNhbGx5IHNwZWFraW5nLCB3aXRoIHdoaWNo
IGRpc3RyaWJ1dGlvbiBoYXZlIHlvdSBiZWVuCj4gYWJsZSB0byBnZXQgYSBzeXN0ZW0gd2l0aG91
dCBkaWZmdXRpbHMvZmluZHV0aWxzIGluc3RhbGxlZCBieSBkZWZhdWx0Pwo+Cj4gVGhhbmtzLAo+
Cj4gVGhvbWFzCgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAg
IC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cu
dGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
