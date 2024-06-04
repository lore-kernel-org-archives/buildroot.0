Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D29C27C53
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 20:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AFA040466;
	Tue,  4 Jun 2024 20:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_bxetvc2myo; Tue,  4 Jun 2024 20:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 510114049C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 510114049C;
	Tue,  4 Jun 2024 20:18:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D24B1BF48D
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 707BC4049C
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLqPV_fcVTmJ for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 20:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B64440466
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B64440466
 for <buildroot@uclibc.org>; Tue,  4 Jun 2024 20:18:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4573E86A8D; Tue,  4 Jun 2024 20:18:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 04 Jun 2024 20:18:07 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lancethepants@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-16096-163-qkIM5Ooh9F@https.bugs.busybox.net/>
In-Reply-To: <bug-16096-163@https.bugs.busybox.net/>
References: <bug-16096-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16096] iproute musl + gcc-14 compile error w/
 2024.05-rc1
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNjA5NgoKLS0tIENvbW1l
bnQgIzEgZnJvbSBMYW5jZSBGcmVkcmlja3NvbiA8bGFuY2V0aGVwYW50c0BnbWFpbC5jb20+IC0t
LQpBZnRlciBhcHBseWluZyB0aGF0IGZpeCBpdCBzdGlsbCBmYWlscyB3aXRoIHRoZSBmb2xsb3dp
bmcuCgpyZG1hLmM6MTEwOjIwOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYYmFzZW5hbWXigJk7IGRpZCB5b3UgbWVhbgrigJhyZW5hbWXigJk/IFstV2ltcGxpY2l0
LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDExMCB8ICAgICAgICAgZmlsZW5hbWUgPSBiYXNlbmFt
ZShhcmd2WzBdKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgcmVuYW1lCnJkbWEuYzoxMTA6MTg6IGVycm9yOiBhc3NpZ25tZW50
IHRvIOKAmGNoYXIgKuKAmSBmcm9tIOKAmGludOKAmSBtYWtlcyBwb2ludGVyIGZyb20KaW50ZWdl
ciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KICAxMTAgfCAgICAgICAgIGZpbGVu
YW1lID0gYmFzZW5hbWUoYXJndlswXSk7CgoKaG1tbW0sIGJhc2VuYW1lLCBsb29rcyBmYW1pbGlh
ci4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSBvbiB0
aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
