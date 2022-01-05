Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A2C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 07:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79CC34053C;
	Wed,  5 Jan 2022 07:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdy6LH-NCEsV; Wed,  5 Jan 2022 07:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7762D404AA;
	Wed,  5 Jan 2022 07:39:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 173341BF9C8
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 07:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 047CC400A6
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 07:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDlEgnliBg6h for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 07:39:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15091404AA
 for <buildroot@uclibc.org>; Wed,  5 Jan 2022 07:39:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 25FF78191A; Wed,  5 Jan 2022 07:32:57 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 05 Jan 2022 07:39:01 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: sreedharmahadevan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14501-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14501] New: lttng-modules v2.11 package fails to
 build
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDUwMQoKICAgICAgICAg
ICAgQnVnIElEOiAxNDUwMQogICAgICAgICAgIFN1bW1hcnk6IGx0dG5nLW1vZHVsZXMgdjIuMTEg
cGFja2FnZSBmYWlscyB0byBidWlsZAogICAgICAgICAgIFByb2R1Y3Q6IGJ1aWxkcm9vdAogICAg
ICAgICAgIFZlcnNpb246IDIwMjEuMDUKICAgICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAg
ICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IGJsb2NrZXIKICAgICAgICAgIFByaW9yaXR5OiBQNQogICAgICAgICBDb21wb25lbnQ6IE90
aGVyCiAgICAgICAgICBBc3NpZ25lZTogdW5hc3NpZ25lZEBidWlsZHJvb3QudWNsaWJjLm9yZwog
ICAgICAgICAgUmVwb3J0ZXI6IHNyZWVkaGFybWFoYWRldmFuQGdtYWlsLmNvbQogICAgICAgICAg
ICAgICAgQ0M6IGJ1aWxkcm9vdEB1Y2xpYmMub3JnCiAgVGFyZ2V0IE1pbGVzdG9uZTogLS0tCgpI
ZWxsbywKCkkgYW0gbm90IGFibGUgdG8gc3VjY2Vzc2Z1bGx5IGJ1aWxkIHRoZSBsdHRuZy1tb2R1
bGVzIHBhY2thZ2Ugd2l0aCBCdWlsZHJvb3QKdjIwMjEuMDUuIEkgZ2V0IHRoZSBmb2xsb3dpbmcg
c3ludGF4IGVycm9yczoKCm91dHB1dC9idWlsZC9sdHRuZy1tb2R1bGVzLTIuMTEuMC8uL3Byb2Jl
cy8uLi9pbnN0cnVtZW50YXRpb24vZXZlbnRzL2x0dG5nLW1vZHVsZS90aW1lci5oOjMxMzo0MToK
ZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlIOKAmGNvbnN0IHN0cnVjdCBpdGlt
ZXJ2YWzigJkKICAzMTMgfCAgIGN0Zl9pbnRlZ2VyKGxvbmcsIGludGVydmFsX3VzZWMsIHZhbHVl
LT5pdF9pbnRlcnZhbC50dl91c2VjKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefgoKb3V0cHV0L2J1aWxkL2x0dG5nLW1vZHVsZXMtMi4xMS4wLy4vbGli
Ly4uL2xpYi9yaW5nYnVmZmVyL2Zyb250ZW5kLmg6ODI6NjoKZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHNtcF9yZWFkX2JhcnJpZXJfZGVwZW5kc+KAmQpbLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgODIgfCAgICAgIHNtcF9yZWFkX2Jh
cnJpZXJfZGVwZW5kcygpOyAoY3B1KSA8IG5yX2NwdV9pZHM7IH0pOykKICAgICAgfCAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKL291dHB1dC9idWlsZC9sdHRuZy1tb2R1bGVzLTIuMTEu
MC8uL2xpYi8uLi93cmFwcGVyL3RyYWNlLWNsb2NrLmg6MTY4OjM6IGVycm9yOgppbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhyZWFkX2JhcnJpZXJfZGVwZW5kc+KAmQpbLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAxNjggfCAgIHJlYWRfYmFycmllcl9k
ZXBlbmRzKCk7IC8qIGxvYWQgbHRjIGJlZm9yZSBjb250ZW50ICovCiAgICAgIHwgICBefn5+fn5+
fn5+fn5+fn5+fn5+fgoKVGhlIGVycm9ycyBsb29rIG1vc3RseSBzeW50YWN0aWNhbCBhbmQgaXMg
cmVwbGljYXRlZCB3aXRoIGEgZnJlc2ggY2xvbmUgb2YKdjIwMjEuMDgsIHYyMDIxLjExLCB2MjAy
MC4wNSwgdjIwMjAuMDggYWxzby4gVGhlIGx0dG5nLXRvb2xzIGFuZApsdHRuZy1iYWJlbHRyYWNl
IHBhY2thZ2VzIGJ1aWxkIHdpdGhvdXQgaXNzdWVzIGJ1dCB0aGUgbW9tZW50IGx0dG5nLW1vZHVs
ZXMgaXMKc2VsZWN0ZWQgYW5kIGJ1aWx0LCBpdCBmYWlscy4gSXMgdGhpcyBpc3N1ZSBrbm93biBh
bHJlYWR5PyBBcmUgdGhlcmUgYW55CnNvbHV0aW9ucyBmb3IgaXQ/CgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgb24gdGhlIENDIGxpc3QgZm9yIHRoZSBi
dWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
