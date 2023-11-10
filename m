Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5FCC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1600A4013F;
	Fri, 10 Nov 2023 19:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1600A4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AN-59Kqip926; Fri, 10 Nov 2023 19:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A6FD408EF;
	Fri, 10 Nov 2023 19:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A6FD408EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A06C81BF852
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 792736F67A
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 19:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792736F67A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWNCsOYVk4f3 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 19:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB9196F672
 for <buildroot@uclibc.org>; Fri, 10 Nov 2023 19:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB9196F672
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 9319E86F32; Fri, 10 Nov 2023 19:52:29 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 10 Nov 2023 19:52:29 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: minor
X-Bugzilla-Who: arnout@mind.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15847-163-Q6FBqneYJo@https.bugs.busybox.net/>
In-Reply-To: <bug-15847-163@https.bugs.busybox.net/>
References: <bug-15847-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15847] Systemd: Incorrect Permission on
 /usr/lib/systemd
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTg0NwoKLS0tIENvbW1l
bnQgIzEgZnJvbSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IC0tLQpJJ3Zl
IHRha2VuIHFlbXVfeDg2XzY0X2RlZmNvbmZpZyB3aXRoIEJSMl9JTklUX1NZU1RFTUQgYW5kIF9O
RVRXT1JLRCwgYW5kIEkKZG9uJ3Qgc2VlIHRoZSBzYW1lIGlzc3VlOgoKIyBscyAtYWxkIC91c3Iv
bGliL3N5c3RlbWQvCmRyd3hyLXhyLXggICAxMyByb290ICAgICByb290ICAgICAgICAgIDIwNDgg
Tm92IDEwIDE5OjQzIC91c3IvbGliL3N5c3RlbWQvCiMgbHMgLWFsIC91c3IvbGliL3N5c3RlbWQv
c3lzdGVtZC1uZXR3b3JrZAotcnd4ci14ci14ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAxNTc5
NDU2IE5vdiAxMCAxOTo0MwovdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbWQtbmV0d29ya2QKIyBwcyAt
ZWYgfCBncmVwIG5ldHdvcmsKICAgODQgc3lzdGVtZC0gL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW1k
LW5ldHdvcmtkCiAgMTE5IHJvb3QgICAgIGdyZXAgbmV0d29yawojIHN5c3RlbWN0bCBzdGF0dXMg
c3lzdGVtZC1uZXR3b3JrZAril48gc3lzdGVtZC1uZXR3b3JrZC5zZXJ2aWNlIC0gTmV0d29yayBD
b25maWd1cmF0aW9uCiAgICAgTG9hZGVkOiBsb2FkZWQgKC91c3IvbGliL3N5c3RlbWQvc3lzdGVt
L3N5c3RlbWQtbmV0d29ya2Quc2VydmljZTsgZW5hYmxlZDsKcHJlc2V0OiBlbmFibGVkKQogICAg
IEFjdGl2ZTogYWN0aXZlIChydW5uaW5nKSBzaW5jZSBGcmkgMjAyMy0xMS0xMCAxOTo0ODo0OCBV
VEM7IDJtaW4gOHMgYWdvClRyaWdnZXJlZEJ5OiDil48gc3lzdGVtZC1uZXR3b3JrZC5zb2NrZXQK
ICAgICAgIERvY3M6IG1hbjpzeXN0ZW1kLW5ldHdvcmtkLnNlcnZpY2UoOCkKICAgICAgICAgICAg
IG1hbjpvcmcuZnJlZWRlc2t0b3AubmV0d29yazEoNSkKICAgTWFpbiBQSUQ6IDg0IChzeXN0ZW1k
LW5ldHdvcmspCiAgICAgU3RhdHVzOiAiUHJvY2Vzc2luZyByZXF1ZXN0cy4uLiIKICAgRkQgU3Rv
cmU6IDAgKGxpbWl0OiA1MTIpCiAgICAgICAgQ1BVOiAyMjBtcwogICAgIENHcm91cDogL3N5c3Rl
bS5zbGljZS9zeXN0ZW1kLW5ldHdvcmtkLnNlcnZpY2UKICAgICAgICAgICAgIOKUlOKUgDg0IC91
c3IvbGliL3N5c3RlbWQvc3lzdGVtZC1uZXR3b3JrZAoKTm92IDEwIDE5OjQ4OjQ3IGJ1aWxkcm9v
dCBzeXN0ZW1kWzFdOiBTdGFydGluZyBOZXR3b3JrIENvbmZpZ3VyYXRpb24uLi4KTm92IDEwIDE5
OjQ4OjQ3IGJ1aWxkcm9vdCBzeXN0ZW1kLW5ldHdvcmtkWzg0XTogbG86IExpbmsgVVAKTm92IDEw
IDE5OjQ4OjQ3IGJ1aWxkcm9vdCBzeXN0ZW1kLW5ldHdvcmtkWzg0XTogbG86IEdhaW5lZCBjYXJy
aWVyCk5vdiAxMCAxOTo0ODo0OCBidWlsZHJvb3Qgc3lzdGVtZC1uZXR3b3JrZFs4NF06IEVudW1l
cmF0aW9uIGNvbXBsZXRlZApOb3YgMTAgMTk6NDg6NDggYnVpbGRyb290IHN5c3RlbWRbMV06IFN0
YXJ0ZWQgTmV0d29yayBDb25maWd1cmF0aW9uLgpOb3YgMTAgMTk6NDg6NDkgYnVpbGRyb290IHN5
c3RlbWQtbmV0d29ya2RbODRdOiBldGgwOiBJbnRlcmZhY2UgbmFtZSBjaGFuZ2UKZGV0ZWN0ZWQs
IHJlbmFtZWQgdG8gZW5wMHMzLgoKKEkgZGlkbid0IGJvdGhlciBjaGFuZ2luZyB0aGUga2VybmVs
IGNvbmZpZyBhbmQgSSBkaWRuJ3QgYWRkIGFueXRoaW5nIGluCi9ldGMvc3lzdGVtZC9uZXR3b3Jr
LCBzbyB0aGUgbmV0d29yayBpc24ndCBhY3R1YWxseSBjb21pbmcgdXAsIGJ1dApzeXN0ZW1kLW5l
dHdvcmtkIGlzIHJ1bm5pbmcuKQoKSXQgc2VlbXMgdGhhdCBzb21ldGhpbmcgd2VudCB3cm9uZyBp
biB5b3VyIGJ1aWxkIGFuZCAvdXNyL2xpYi9zeXN0ZW1kIHdhcwpjcmVhdGVkIHdpdGggdGhlIHdy
b25nIHBlcm1pc3Npb25zPwoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNl
OgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
