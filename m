Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6451C76195
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6436540359;
	Tue, 21 Mar 2023 13:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6436540359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsj9PUx_-mo8; Tue, 21 Mar 2023 13:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 770E740361;
	Tue, 21 Mar 2023 13:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 770E740361
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A787A1BF327
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82B3780E9C
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B3780E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULR2Cum09vg9 for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 13:23:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C97B180E6E
 for <buildroot@uclibc.org>; Tue, 21 Mar 2023 13:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97B180E6E
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B521D8756A; Tue, 21 Mar 2023 13:23:36 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 21 Mar 2023 13:23:36 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15461-163-ONhrawdyIw@https.bugs.busybox.net/>
In-Reply-To: <bug-15461-163@https.bugs.busybox.net/>
References: <bug-15461-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15461] QtVirtualKeyboard segfaults
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTQ2MQoKLS0tIENvbW1l
bnQgIzEgZnJvbSBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PiAtLS0KQnVpbGRyb290IDIwMjIuMDIgZGVmYXVsdHMgdG8gdXNpbmcgR0NDIDEwLnguCkJ1aWxk
cm9vdCAyMDIzLjAyIGRlZmF1bHRzIHRvIHVzaW5nIEdDQyAxMS54LCBidXQgc3RpbGwgc3VwcG9y
dHMgR0NDIDEwLnguCgpDb3VsZCB5b3UgdHJ5IHN0YXlpbmcgd2l0aCBCdWlsZHJvb3QgMjAyMy4w
MiwgYnV0IHVzZSBHQ0MgMTAueCBpbnN0ZWFkIG9mIEdDQwoxMS54ID8KCk15IGNvbGxlYWd1ZSBB
bGV4aXMgTG90aG9yw6kgaXMgYWxzbyBjaGFzaW5nIGRvd24gYSBRdDUgcHJvYmxlbSB3aXRoIEJ1
aWxkcm9vdAoyMDIzLjAyIChidXQgdXNpbmcgdGhlIEJvb3RsaW4gdG9vbGNoYWluKSwgYW5kIHJl
dmVydGluZyB0byBhbiBvbGRlciB0b29sY2hhaW4Kc29sdmVkIHRoZSBwcm9ibGVtLCB3aGljaCBz
ZWVtcyB0byBwb2ludCB0byBhIEdDQyBpc3N1ZS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlz
IG1haWwgYmVjYXVzZToKWW91IGFyZSBvbiB0aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
