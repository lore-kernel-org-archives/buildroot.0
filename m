Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD91C64EC7
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 13:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE4A41965;
	Wed,  1 Mar 2023 13:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE4A41965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUSKKoQKs0_y; Wed,  1 Mar 2023 13:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DEA4193D;
	Wed,  1 Mar 2023 13:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46DEA4193D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC1D1BF4E2
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 13:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0687C60F81
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 13:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0687C60F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASqhZqmmCh2V for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 13:26:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D043160F63
 for <buildroot@uclibc.org>; Wed,  1 Mar 2023 13:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D043160F63
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BA4EB86C70; Wed,  1 Mar 2023 13:26:52 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 01 Mar 2023 13:26:51 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jakub.swistak.stud@pw.edu.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15361-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15361] New: Buildroot linking error on Apple
 Silicon
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTM2MQoKICAgICAgICAg
ICAgQnVnIElEOiAxNTM2MQogICAgICAgICAgIFN1bW1hcnk6IEJ1aWxkcm9vdCBsaW5raW5nIGVy
cm9yIG9uIEFwcGxlIFNpbGljb24KICAgICAgICAgICBQcm9kdWN0OiBidWlsZHJvb3QKICAgICAg
ICAgICBWZXJzaW9uOiAyMDIyLjExLjEKICAgICAgICAgIEhhcmR3YXJlOiBNYWNpbnRvc2gKICAg
ICAgICAgICAgICAgIE9TOiBNYWMgT1MKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAg
IFNldmVyaXR5OiBub3JtYWwKICAgICAgICAgIFByaW9yaXR5OiBQNQogICAgICAgICBDb21wb25l
bnQ6IE90aGVyCiAgICAgICAgICBBc3NpZ25lZTogdW5hc3NpZ25lZEBidWlsZHJvb3QudWNsaWJj
Lm9yZwogICAgICAgICAgUmVwb3J0ZXI6IGpha3ViLnN3aXN0YWsuc3R1ZEBwdy5lZHUucGwKICAg
ICAgICAgICAgICAgIENDOiBidWlsZHJvb3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6
IC0tLQoKSEksIApJJ20gdHJ5aW5nIHRvIHJ1biBCdWlsZHJvb3Qgb24gQXBwbGUgU2lsaWNvbiwg
SSdtIHVuYWJsZSB0byBkbyB0aGF0IHNpbmNlIEknbQpnZXR0aW5nIGFuIGVycm9yIHdpdGggbGlu
a2luZyB0aGUgbGlicmFyaWVzLgpBZnRlciBydW5uaW5nICdtYWtlIG1lbnVjb25maWcnIEknbSBn
ZXR0aW5nIGFuIGVycm9yICdVbmRlZmluZWQgc3ltYm9scyBmb3IKYXJjaGl0ZWN0dXJlIGFybTY0
JyAodG9wIG9mIEF0dGFjaG1lbnQgMiBmb3IgZnVsbCBsb2cpLCBJIHdhcyBhYmxlIHRvIHNvbHZl
IGl0CmJ5IHJ1bm5pbmcgCifina8gY2Qgb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1jb25maWcnCifi
na8gL3Vzci9sb2NhbC9iaW4vZ2NjIC1EQ1VSU0VTX0xPQz0iPGN1cnNlcy5oPiIgLURMT0NBTEUg
LURLQlVJTERfTk9fTkxTCi1JL1VzZXJzL2pha3Vic3dpc3Rhay9EZXNrdG9wL2xpbmVzMi9idWls
ZHJvb3QtMjAyMi4xMS4xL291dHB1dC9idWlsZC9idWlsZHJvb3QtY29uZmlnCi1EQ09ORklHXz1c
IlwiICAKL1VzZXJzL2pha3Vic3dpc3Rhay9EZXNrdG9wL2xpbmVzMi9idWlsZHJvb3QtMjAyMi4x
MS4xL291dHB1dC9idWlsZC9idWlsZHJvb3QtY29uZmlnL21jb25mLm8KL1VzZXJzL2pha3Vic3dp
c3Rhay9EZXNrdG9wL2xpbmVzMi9idWlsZHJvb3QtMjAyMi4xMS4xL291dHB1dC9idWlsZC9idWls
ZHJvb3QtY29uZmlnL3pjb25mLnRhYi5vCi9Vc2Vycy9qYWt1YnN3aXN0YWsvRGVza3RvcC9saW5l
czIvYnVpbGRyb290LTIwMjIuMTEuMS9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWNvbmZpZy9seGRp
YWxvZy9jaGVja2xpc3QubwovVXNlcnMvamFrdWJzd2lzdGFrL0Rlc2t0b3AvbGluZXMyL2J1aWxk
cm9vdC0yMDIyLjExLjEvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1jb25maWcvbHhkaWFsb2cvdXRp
bC5vCi9Vc2Vycy9qYWt1YnN3aXN0YWsvRGVza3RvcC9saW5lczIvYnVpbGRyb290LTIwMjIuMTEu
MS9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWNvbmZpZy9seGRpYWxvZy9pbnB1dGJveC5vCi9Vc2Vy
cy9qYWt1YnN3aXN0YWsvRGVza3RvcC9saW5lczIvYnVpbGRyb290LTIwMjIuMTEuMS9vdXRwdXQv
YnVpbGQvYnVpbGRyb290LWNvbmZpZy9seGRpYWxvZy90ZXh0Ym94Lm8KL1VzZXJzL2pha3Vic3dp
c3Rhay9EZXNrdG9wL2xpbmVzMi9idWlsZHJvb3QtMjAyMi4xMS4xL291dHB1dC9idWlsZC9idWls
ZHJvb3QtY29uZmlnL2x4ZGlhbG9nL3llc25vLm8KL1VzZXJzL2pha3Vic3dpc3Rhay9EZXNrdG9w
L2xpbmVzMi9idWlsZHJvb3QtMjAyMi4xMS4xL291dHB1dC9idWlsZC9idWlsZHJvb3QtY29uZmln
L2x4ZGlhbG9nL21lbnVib3gubwogLW8KL1VzZXJzL2pha3Vic3dpc3Rhay9EZXNrdG9wL2xpbmVz
Mi9idWlsZHJvb3QtMjAyMi4xMS4xL291dHB1dC9idWlsZC9idWlsZHJvb3QtY29uZmlnL21jb25m
Ci1sbmN1cnNlcycgLSBhZGRlZCAnLWxuY3Vyc2VzJyAKQnV0IGxhdGVyIGR1cmluZyB0aGUgY29t
cGlsYXRpb24gJ21ha2UnCkknbSBnZXR0aW5nIGFub3RoZXIgZXJyb3Igd2l0aCBsaW5raW5nIGxp
YnJhcnkgKGJvdHRvbSBvZiBBdHRhY2htZW50IDIgZm9yIGZ1bGwKbG9nKSAKCkknbSB1c2luZyBB
cHBsZSBNMiBjaGlwIHdpdGggZ2NjL2crKyAxMi4yLjAgaW5zdGFsbGVkIHZpYSBob21lYnJldy4K
Ci0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSBvbiB0aGUg
Q0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
