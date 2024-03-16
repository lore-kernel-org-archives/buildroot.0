Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F4DC54E5D
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 13:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A118F415A5;
	Sat, 16 Mar 2024 13:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVRa71r1Ztde; Sat, 16 Mar 2024 13:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7901D415D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7901D415D3;
	Sat, 16 Mar 2024 13:49:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 313A51BF30C
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 13:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB4582262
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 13:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbgjs-Bij8Mb for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 13:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5189F82256
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5189F82256
 for <buildroot@uclibc.org>; Sat, 16 Mar 2024 13:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 00EEA87F70; Sat, 16 Mar 2024 13:49:01 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 16 Mar 2024 13:49:01 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ps.report@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15997-163-0GUVP7o60p@https.bugs.busybox.net/>
In-Reply-To: <bug-15997-163@https.bugs.busybox.net/>
References: <bug-15997-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15997] Build Squid with GCC12.3 in Buildroot
 2024.02 will fail
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTk5NwoKLS0tIENvbW1l
bnQgIzIgZnJvbSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IC0tLQpOb3RlOiB0
aGlzIG9uZSBpcyB0aGUgb25seSBnKysgY2FsbCBvZiB0aGUgc3F1aWQgYnVpbGQgdXNpbmcgdGhl
IGhvc3QgY29tcGlsZXIKJy91c3IvYmluL2crKycgdG8gYnVpbGQgYW4gaW50ZXJuYWwgdG9vbAoK
V2hpY2ggaG9zdCBzeXN0ZW0/IFdoaWNoIGhvc3QgY29tcGlsZXIgKCcvdXNyL2Jpbi9nKysgLS12
ZXJzaW9uJyk/CgpDb21waWxlcyBmb3IgbWUgd2l0aG91dCBmYWlsdXJlIHVzaW5nIGcrKyAxMi4z
LjAsIDEzLjIuMSBhbmQgMTQuMC4xLCBidXQKZS5nLiB0aGUgZm9sbG93aW5nIGZhaWxzIHdpdGgg
dGhlIHNhbWUgZXJyb3IgeW91IG1lbnRpb246CgokIC91c3IvYmluL2crKyAtc3RkPWMrKzExIC1P
MgotSS9ob21lL3NlaWRlcmVyL1dvcmsvQnVpbGRyb290L2J1aWxkX2J1Z18xNTk5N19zcXVpZF8w
MDEvaG9zdC9pbmNsdWRlIC1vCmNmX2dlbiAuL2NmX2dlbi5jYyAtSS4gLUkuLi9pbmNsdWRlLyAt
SS4uL3NyYwouL2NmX2dlbi5jYzogSW4gZnVuY3Rpb24g4oCYaW50IG1haW4oaW50LCBjaGFyKiop
4oCZOgouL2NmX2dlbi5jYzoyNjg6NjM6IGVycm9yOiBmb3JtaW5nIHJlZmVyZW5jZSB0byB2b2lk
CiAgMjY4IHwgICAgICAgICAgICAgICAgICAgICBhdXRvICZuZXdFbnRyeSA9IGVudHJpZXMuZW1w
bGFjZV9iYWNrKG5hbWUpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgouL2NmX2dlbi5jYzoyNzc6Njg6IGVycm9y
OiBmb3JtaW5nIHJlZmVyZW5jZSB0byB2b2lkCiAgMjc3IHwgICAgICAgICAgICAgICAgICAgICBh
dXRvICZuZXdFbnRyeSA9IGVudHJpZXMuZW1wbGFjZV9iYWNrKCJjb21tZW50Iik7CiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKClNh
bWUgd2l0aCAnLXN0ZD1jKysxNCcsIGJ1dCAnLXN0ZD1jKysxNycgd29ya3MgZmluZS4uLgoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBs
aXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
