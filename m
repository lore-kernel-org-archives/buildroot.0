Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA6EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142798415B;
	Tue,  8 Mar 2022 15:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ho9kqd2e6bqT; Tue,  8 Mar 2022 15:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43DF8833C9;
	Tue,  8 Mar 2022 15:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEFE21BF380
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 15:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC652833C9
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 15:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9x2J1CipLILp for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 15:54:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFC0812CE
 for <buildroot@uclibc.org>; Tue,  8 Mar 2022 15:54:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A090781492; Tue,  8 Mar 2022 15:45:49 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 08 Mar 2022 15:54:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14646-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14646] New: OpenSSH 8.9p1 error under mipsel
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDY0NgoKICAgICAgICAg
ICAgQnVnIElEOiAxNDY0NgogICAgICAgICAgIFN1bW1hcnk6IE9wZW5TU0ggOC45cDEgZXJyb3Ig
dW5kZXIgbWlwc2VsCiAgICAgICAgICAgUHJvZHVjdDogYnVpbGRyb290CiAgICAgICAgICAgVmVy
c2lvbjogdW5zcGVjaWZpZWQKICAgICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAgICAgICAg
IE9TOiBMaW51eAogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG5v
cm1hbAogICAgICAgICAgUHJpb3JpdHk6IFA1CiAgICAgICAgIENvbXBvbmVudDogT3RoZXIKICAg
ICAgICAgIEFzc2lnbmVlOiB1bmFzc2lnbmVkQGJ1aWxkcm9vdC51Y2xpYmMub3JnCiAgICAgICAg
ICBSZXBvcnRlcjogbGFuY2V0aGVwYW50c0BnbWFpbC5jb20KICAgICAgICAgICAgICAgIENDOiBi
dWlsZHJvb3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6IC0tLQoKOC1NYXJjaC0yMDIy
IGZyb20gZ2l0IG1hc3RlcgptaXBzMzIgc29mdGZsb2F0CmdjYy0xMS4yCmtlcm5lbCA1LjE2Cgpt
aXBzZWwgdGhyb3dzIHRoZSBmb2xsb3dpbmcgY29tcGlsZXIgZXJyb3Igd2hpbGUgY29tcGlsaW5n
IG9wZW5zc2ggOC45cDEuCgptYWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkKJy9ob21lL3RvbWF0
by90b21hdG93YXJlL3NyYy9vcGVuc3NoL29wZW5zc2gvb3BlbmJzZC1jb21wYXQnCm1pcHNlbC1s
aW51eC1jYyAtTzIgLXBpcGUgLW1pcHMzMiAtbXR1bmU9bWlwczMyIC1waXBlCi1Xbm8tZXJyb3I9
Zm9ybWF0LXRydW5jYXRpb24gLVdhbGwgLVdleHRyYSAtV3BvaW50ZXItYXJpdGggLVd1bmluaXRp
YWxpemVkCi1Xc2lnbi1jb21wYXJlIC1XZm9ybWF0LXNlY3VyaXR5IC1Xc2l6ZW9mLXBvaW50ZXIt
bWVtYWNjZXNzIC1Xbm8tcG9pbnRlci1zaWduCi1Xbm8tdW51c2VkLXBhcmFtZXRlciAtV25vLXVu
dXNlZC1yZXN1bHQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaAotV21pc2xlYWRpbmctaW5kZW50YXRp
b24gLWZuby1zdHJpY3QtYWxpYXNpbmcgLURfRk9SVElGWV9TT1VSQ0U9MiAtZnRyYXB2Ci1memVy
by1jYWxsLXVzZWQtcmVncz1hbGwgLWZuby1idWlsdGluLW1lbXNldCAgIC1mUElDIC1JLiAtSS4u
IC1JLiAtSS4vLi4KLUkvaG9tZS90b21hdG8vdG9tYXRvd2FyZS9tbWMvaW5jbHVkZSAtSS9ob21l
L3RvbWF0by90b21hdG93YXJlL21tYy9pbmNsdWRlCi1EX1hPUEVOX1NPVVJDRT02MDAgLURfQlNE
X1NPVVJDRSAtRF9ERUZBVUxUX1NPVVJDRSAtREhBVkVfQ09ORklHX0ggLWMKYXJjNHJhbmRvbS5j
CmR1cmluZyBSVEwgcGFzczogZmluYWwKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyYzRyYW5kb20u
Yzo1MjoKY2hhY2hhX3ByaXZhdGUuaDogSW4gZnVuY3Rpb24g4oCYY2hhY2hhX2VuY3J5cHRfYnl0
ZXMuY29uc3Rwcm9w4oCZOgpjaGFjaGFfcHJpdmF0ZS5oOjIyMjoxOiBpbnRlcm5hbCBjb21waWxl
ciBlcnJvcjogaW4gbWlwc19vdXRwdXRfbW92ZSwgYXQKY29uZmlnL21pcHMvbWlwcy5jOjUzMjEK
ICAyMjIgfCB9CiAgICAgIHwgXgoweDEyYzAyMGUgZGlhZ25vc3RpY19pbXBsKHJpY2hfbG9jYXRp
b24qLCBkaWFnbm9zdGljX21ldGFkYXRhIGNvbnN0KiwgaW50LCBjaGFyCmNvbnN0KiwgX192YV9s
aXN0X3RhZyAoKikgWzFdLCBkaWFnbm9zdGljX3QpCiAgICAgICAgPz8/OjAKMHgxMmMwZTI2IGlu
dGVybmFsX2Vycm9yKGNoYXIgY29uc3QqLCAuLi4pCiAgICAgICAgPz8/OjAKMHg1YTFmYzEgZmFu
Y3lfYWJvcnQoY2hhciBjb25zdCosIGludCwgY2hhciBjb25zdCopCiAgICAgICAgPz8/OjAKMHhk
Y2M2ZTkgbWlwc19vdXRwdXRfbW92ZShydHhfZGVmKiwgcnR4X2RlZiopCiAgICAgICAgPz8/OjAK
MHg3ZTcwNWYgZmluYWxfc2Nhbl9pbnNuXzEocnR4X2luc24qLCBfSU9fRklMRSosIGludCwgaW50
LCBpbnQqKSBbY2xvbmUKLmlzcmEuODRdCiAgICAgICAgPz8/OjAKMHg3ZTc0NWIgZmluYWxfc2Nh
bl9pbnNuKHJ0eF9pbnNuKiwgX0lPX0ZJTEUqLCBpbnQsIGludCwgaW50KikKICAgICAgICA/Pz86
MAoweDdlNmU5MSBmaW5hbF9zY2FuX2luc25fMShydHhfaW5zbiosIF9JT19GSUxFKiwgaW50LCBp
bnQsIGludCopIFtjbG9uZQouaXNyYS44NF0KICAgICAgICA/Pz86MAoweDdlNzQ1YiBmaW5hbF9z
Y2FuX2luc24ocnR4X2luc24qLCBfSU9fRklMRSosIGludCwgaW50LCBpbnQqKQogICAgICAgID8/
PzowCjB4N2U3NzFjIGZpbmFsXzEocnR4X2luc24qLCBfSU9fRklMRSosIGludCwgaW50KQogICAg
ICAgID8/PzowCjB4N2U3ZWUzIChhbm9ueW1vdXMgbmFtZXNwYWNlKTo6cGFzc19maW5hbDo6ZXhl
Y3V0ZShmdW5jdGlvbiopCiAgICAgICAgPz8/OjAKUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVnIHJl
cG9ydCwKd2l0aCBwcmVwcm9jZXNzZWQgc291cmNlIGlmIGFwcHJvcHJpYXRlLgpQbGVhc2UgaW5j
bHVkZSB0aGUgY29tcGxldGUgYmFja3RyYWNlIHdpdGggYW55IGJ1ZyByZXBvcnQuClNlZSA8aHR0
cDovL2J1Z3MuYnVpbGRyb290Lm5ldC8+IGZvciBpbnN0cnVjdGlvbnMuCntzdGFuZGFyZCBpbnB1
dH06IEFzc2VtYmxlciBtZXNzYWdlczoKe3N0YW5kYXJkIGlucHV0fTogV2FybmluZzogbWlzc2lu
ZyAuZW5kIGF0IGVuZCBvZiBhc3NlbWJseQptYWtlWzJdOiAqKiogW01ha2VmaWxlOjEwNDogYXJj
NHJhbmRvbS5vXSBFcnJvciAxCm1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5CicvaG9tZS90b21h
dG8vdG9tYXRvd2FyZS9zcmMvb3BlbnNzaC9vcGVuc3NoL29wZW5ic2QtY29tcGF0JwptYWtlWzFd
OiAqKiogW01ha2VmaWxlOjIwNDogb3BlbmJzZC1jb21wYXQvbGlib3BlbmJzZC1jb21wYXQuYV0g
RXJyb3IgMgptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvdG9tYXRvL3RvbWF0b3dh
cmUvc3JjL29wZW5zc2gvb3BlbnNzaCcKbWFrZTogKioqIFtNYWtlZmlsZTo1OiB0b21hdG93YXJl
XSBFcnJvciAyCnRvbWF0b0BlMmE4NDUzMGFmYTk6fi90b21hdG93YXJlJAoKLS0gCllvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
