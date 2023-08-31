Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4966DC83F29
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 07:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD9B819F8;
	Thu, 31 Aug 2023 07:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD9B819F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKKA1Qd1pk1D; Thu, 31 Aug 2023 07:24:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145FF81A39;
	Thu, 31 Aug 2023 07:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 145FF81A39
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 737CD1BF4DD
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 07:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53680819F5
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 07:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53680819F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOy5fLzwrNvL for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 07:24:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D151819C8
 for <buildroot@uclibc.org>; Thu, 31 Aug 2023 07:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D151819C8
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8677C86609; Thu, 31 Aug 2023 07:24:02 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 31 Aug 2023 07:24:02 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bonet@grenoble.cnrs.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15745-163-4opOijWvma@https.bugs.busybox.net/>
In-Reply-To: <bug-15745-163@https.bugs.busybox.net/>
References: <bug-15745-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15745] Adding custom user account does nothing
 when the user table text file dose not have a terminating newline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTc0NQoKLS0tIENvbW1l
bnQgIzEgZnJvbSBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj4gLS0tCj4gQWRk
aW5nIGEgbmV3bGluZSBhdCB0aGUgZW5kIGZpeGVzIGl0IGFuZCB3b3JrcyBhcyBleHBlY3RlZC4K
CkRvIHlvdSBtZWFuIHRoYXQgdGhlIGZpbGUgc2hvdWxkIGVuZCB3aXRoICp0d28qIG5ld2xpbmUg
Y2hhcmFjdGVycz8KCk5vdGUgdGhhdCwgaW4gYSBVbml4IGVudmlyb25tZW50LCBhIHRleHQgZmls
ZSBpcyBieSBkZWZpbml0aW9uIGEKc2VxdWVuY2Ugb2YgTEYtdGVybWluYXRlZCBsaW5lcyBvZiB0
ZXh0LiBUaGlzIGltcGxpZXMgdGhhdCBhIG5vbi1lbXB0eQpmaWxlIHRoYXQgZG9lcyBub3QgZW5k
IHdpdGggYW4gTEYgY2hhcmFjdGVyIGlzIG5vdCBhIHZhbGlkIHRleHQgZmlsZS4KClRoZSBtYW51
YWwgZG9lcyBtZW50aW9uIHRoYXQgdXNlcnMgdGFibGVzIGFyZSDigJxyZWd1bGFyIHRleHQgZmls
ZXPigJ0uIElmCnRoZSB1c2VyIGFjY291bnQgY3JlYXRpb24gZmFpbHMgdG8gcGFyc2UgYW4gaW52
YWxpZCB0ZXh0IGZpbGUsIEkgd291bGQKbm90IGNvbnNpZGVyIGl0IGEgYnVnLgoKLS0gCllvdSBh
cmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZv
ciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
