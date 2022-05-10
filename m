Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AFAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 06:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5693140A96;
	Tue, 10 May 2022 06:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_RF49JQ5Ym0; Tue, 10 May 2022 06:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D82140A92;
	Tue, 10 May 2022 06:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D73C1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 06:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B935415F8
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 06:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgISio3fUjcB for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 06:54:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E268415C1
 for <buildroot@uclibc.org>; Tue, 10 May 2022 06:54:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 31BAE83D60; Tue, 10 May 2022 06:44:11 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 10 May 2022 06:54:57 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: alacki93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14796-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14796] New: 64 bit time and seccomp conflict
 (OpenSSH server crash)
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDc5NgoKICAgICAgICAg
ICAgQnVnIElEOiAxNDc5NgogICAgICAgICAgIFN1bW1hcnk6IDY0IGJpdCB0aW1lIGFuZCBzZWNj
b21wIGNvbmZsaWN0IChPcGVuU1NIIHNlcnZlcgogICAgICAgICAgICAgICAgICAgIGNyYXNoKQog
ICAgICAgICAgIFByb2R1Y3Q6IGJ1aWxkcm9vdAogICAgICAgICAgIFZlcnNpb246IDIwMjIuMDIK
ICAgICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAg
ICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG1ham9yCiAgICAgICAgICBQcmlv
cml0eTogUDUKICAgICAgICAgQ29tcG9uZW50OiBPdGhlcgogICAgICAgICAgQXNzaWduZWU6IHVu
YXNzaWduZWRAYnVpbGRyb290LnVjbGliYy5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBhbGFja2k5
M0BnbWFpbC5jb20KICAgICAgICAgICAgICAgIENDOiBidWlsZHJvb3RAdWNsaWJjLm9yZwogIFRh
cmdldCBNaWxlc3RvbmU6IC0tLQoKSSBmb3VuZCB0aGF0IGdsaWJjIHdpdGggc3VwcG9ydCBmb3Ig
NjQtYml0IHRpbWUgY291bGQgY3Jhc2ggT3BlblNTSCAoc3NoZCkKcHJvY2VzcyB3aXRoIGVuYWJs
ZWQgc2VjY29tcC4gVGVzdCBlbnZpcm9ubWVudDoKLUtlcm5lbCA0LjE0Lnggd2l0aCBlbmFibGVk
IHNlY2NvbXAKLTMyIGJpdCBBUk0gQ1BVCi1nbGliYyAyLjM0Ci1PcGVuU1NIIDguOXAxIHdpdGgg
ZW5hYmxlZCBzZWNjb21wIHNhbmRib3gKLVRvb2xjaGFpbjogR0NDIDEwCgpTeXNjYWxsIHdyYXBw
ZXJzIGxpa2UgYSBjbG9ja19nZXR0aW1lCihodHRwczovL2dpdGh1Yi5jb20vYm1pbm9yL2dsaWJj
L2Jsb2IvZ2xpYmMtMi4zNC9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9jbG9ja19nZXR0aW1lLmMp
CmZpcnN0IHJ1biBzeXNjYWxsIGRlZGljYXRlZCBmb3Iga2VybmVscyB0aGF0IHN1cHBvcnQgNjQg
Yml0IHRpbWUuIElmIHRoaXMKc3lzY2FsbCBmYWlsZWQgd2l0aCBFTk9TWVMgZXJyb3IsIHRoZW4g
Z2xpYmMgY2FsbHMgdHJhZGl0aW9uYWwgdmFyaWFudCBmb3IgMzIKYml0IHRpbWUuIElmIHlvdSBy
dW4gc3NoZCB3aXRoIHN0cmFjZSB5b3UgY2FuIGZpbmQgZW50cmllcyBsaWtlIHRoaXM6Cgo0NjI4
IGNsb2NrX2dldHRpbWU2NChDTE9DS19CT09UVElNRSwgMHhiZThjMTQ4OCkgPSAtMSBFTk9TWVMg
KEZ1bmN0aW9uIG5vdAppbXBsZW1lbnRlZCkKNDYyOCBjbG9ja19nZXR0aW1lKENMT0NLX0JPT1RU
SU1FLCB7dHZfc2VjPTI0NywgdHZfbnNlYz02NTMzMDExNjh9KSA9IDAKClVzdWFsbHkgdGhpcyBp
cyBub3QgYSBwcm9ibGVtLCBidXQgc3NoZCB1c2VzIHNlY2NvbXAuIE9wZW5TU0ggaW4gaXRzIHNv
dXJjZQpjb2RlIGFkZHMgdG8gc2VjY29tcCBzeXNjYWxscyB0aGF0IGNhbiBiZSBmb3VuZCBpbiBr
ZXJuZWwgaGVhZGVycwooaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2gvb3BlbnNzaC1wb3J0YWJs
ZS9ibG9iL21hc3Rlci9zYW5kYm94LXNlY2NvbXAtZmlsdGVyLmMpLgpJZiB5b3UgdXNlIGtlcm5l
bCB3aXRob3V0IHN1cHBvcnQgZm9yIDY0IGJpdCB0aW1lIHRoZW4gcmVsYXRlZCBzeXNjYWxscyBh
cmUgbm90CnJlZ2lzdGVyZWQgYXMgYWxsb3dlZCBpbiBzZWNjb21wLiBJZiBzc2hkIHRyaWVzIHRv
IHVzZSBjbG9ja19nZXR0aW1lIGZyb20gZ2xpYmMKYWZ0ZXIgaW5pdGlhbGl6aW5nIHNlY2NvbXAs
IHRoZSBwcm9jZXNzIHdpbGwgYmUga2lsbGVkOgoKNDYzNyBjbG9ja19nZXR0aW1lNjQoQ0xPQ0tf
Qk9PVFRJTUUsIDx1bmZpbmlzaGVkIC4uLj4KNDYzNyA8Li4uIGNsb2NrX2dldHRpbWU2NCByZXN1
bWVkPiA8dW5maW5pc2hlZCAuLi4+KSA9ID8KNDYzNyArKysga2lsbGVkIGJ5IFNJR1NZUyArKysK
NDYyOCAtLS0gU0lHQ0hMRCB7c2lfc2lnbm89U0lHQ0hMRCwgc2lfY29kZT1DTERfS0lMTEVELCBz
aV9waWQ9NDYzNywKc2lfdWlkPTEwMSwgc2lfc3RhdHVzPVNJR1NZUywgc2lfdXRpbWU9NCwgc2lf
c3RpbWU9MH0gLS0tCjQ2Mjgga2lsbCg0NjM3LCBTSUdLSUxMKQoKRnJvbSB1c2VyJ3MgcGVyc3Bl
Y3RpdmUgaXQgbG9va3MgbGlrZSBjb25uZWN0aW9uIHdpdGggc2VydmVyIHdhcyBjbG9zZWQgYmVm
b3JlCmFueSBwYXNzd29yZCBwcm9tcHQuCgpTdXBwb3J0IGZvciA2NC1iaXQgdGltZSBoYXMgYmVl
biBhZGRlZCBpbiBrZXJuZWwgNS4xCihodHRwczovL3d3dy5waG9yb25peC5jb20vc2Nhbi5waHA/
cGFnZT1uZXdzX2l0ZW0mcHg9TGludXgtNS4xLVllYXItMjAzOC1TeXNjYWxscykuCk9sZGVyIChi
dXQgc3RpbGwgc3VwcG9ydGVkKSBrZXJuZWxzIGxpa2UgNC4xNCBkb27igJl0IGhhdmUgdGhpcyBm
ZWF0dXJlLgoKVGVtcG9yYXJ5IHNvbHV0aW9ucyB0byBmaXggdGhpcyBidWcgYXJlOgotQnVpbGRp
bmcgT3BlblNTSCB3aXRob3V0IHNlY2NvbXAKLUJ1aWxkaW5nIGtlcm5lbCB3aXRob3V0IHNlY2Nv
bXAKLVBhdGNoaW5nIGdsaWJjIHRvIHJlbW92ZSBjbG9ja19nZXR0aW1lNjQgc3lzY2FsbCAoYW5k
IG90aGVyIHN5c2NhbGxzIHRoYXQgdXNlCjY0IGJpdCB0aW1lKS4KCkRpc2FibGluZyBzZWNjb21w
IGlzIHRoZSBlYXNpZXN0IHdvcmthcm91bmQsIGJ1dCBpdCBkZWNyZWFzZXMgc2VjdXJpdHkgb2Yg
c3NoZC4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSBv
biB0aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
