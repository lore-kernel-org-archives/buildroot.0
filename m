Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C50C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 15:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D65DA403E4;
	Wed,  1 Dec 2021 15:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yez5dRknpv5t; Wed,  1 Dec 2021 15:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB6E403A5;
	Wed,  1 Dec 2021 15:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 729841BF5F5
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 15:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6050440355
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 15:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7L9OeOzRIpQT for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 15:15:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 886BE4034D
 for <buildroot@uclibc.org>; Wed,  1 Dec 2021 15:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E289C88C88; Wed,  1 Dec 2021 15:10:36 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 01 Dec 2021 15:15:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: info@hifiberry.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14411-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14411] New: 2021.11-rc2: Samba doesn't compile
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDQxMQoKICAgICAgICAg
ICAgQnVnIElEOiAxNDQxMQogICAgICAgICAgIFN1bW1hcnk6IDIwMjEuMTEtcmMyOiBTYW1iYSBk
b2Vzbid0IGNvbXBpbGUKICAgICAgICAgICBQcm9kdWN0OiBidWlsZHJvb3QKICAgICAgICAgICBW
ZXJzaW9uOiB1bnNwZWNpZmllZAogICAgICAgICAgSGFyZHdhcmU6IE90aGVyCiAgICAgICAgICAg
ICAgICBPUzogTGludXgKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5
OiBibG9ja2VyCiAgICAgICAgICBQcmlvcml0eTogUDUKICAgICAgICAgQ29tcG9uZW50OiBPdGhl
cgogICAgICAgICAgQXNzaWduZWU6IHVuYXNzaWduZWRAYnVpbGRyb290LnVjbGliYy5vcmcKICAg
ICAgICAgIFJlcG9ydGVyOiBpbmZvQGhpZmliZXJyeS5jb20KICAgICAgICAgICAgICAgIENDOiBi
dWlsZHJvb3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6IC0tLQoKQ29tcGlsYXRpb24g
b2YgU2FtYmEgYWJvcnRzOgoKWyA4NzYvMzQzNV0gQ29tcGlsaW5nIGJpbi9kZWZhdWx0L3NvdXJj
ZTQvaGVpbWRhbC9saWIvYXNuMS9hc24xX3BraW5pdF9hc24xLmMKc291cmNlNC9oZWltZGFsL2xp
Yi9hc24xL2FzbjFfZXJyLmM6NDc6MjM6IGVycm9yOiDigJhsaW5r4oCZIHJlZGVjbGFyZWQgYXMK
ZGlmZmVyZW50IGtpbmQgb2Ygc3ltYm9sCiAgIDQ3IHwgc3RhdGljIHN0cnVjdCBldF9saXN0IGxp
bmsgPSB7IDAsIDAgfTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fgpJbiBmaWxl
IGluY2x1ZGVkIGZyb20KL2hvbWUvbWF0dXNjaGQvYnVpbGRyb290LTIwMjEuMTEtcmMyL291dHB1
dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUv
Yml0cy9zaWdzdGtzei5oOjI0LAogICAgICAgICAgICAgICAgIGZyb20KL2hvbWUvbWF0dXNjaGQv
YnVpbGRyb290LTIwMjEuMTEtcmMyL291dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251
ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc2lnbmFsLmg6MzI4LAogICAgICAgICAgICAgICAg
IGZyb20KL2hvbWUvbWF0dXNjaGQvYnVpbGRyb290LTIwMjEuMTEtcmMyL291dHB1dC9ob3N0L2Fy
bS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc3lzL3BhcmFt
Lmg6MjgsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi8uLi9saWIvcmVwbGFjZS8uLi9yZXBsYWNl
L3JlcGxhY2UuaDo2NTksCiAgICAgICAgICAgICAgICAgZnJvbSAuLi8uLi9zb3VyY2U0L2hlaW1k
YWxfYnVpbGQvY29uZmlnLmg6MTAsCiAgICAgICAgICAgICAgICAgZnJvbSBzb3VyY2U0L2hlaW1k
YWwvbGliL2FzbjEvYXNuMV9lcnIuYzoxOgovaG9tZS9tYXR1c2NoZC9idWlsZHJvb3QtMjAyMS4x
MS1yYzIvb3V0cHV0L2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91
c3IvaW5jbHVkZS91bmlzdGQuaDo4MTk6MTI6Cm5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9m
IOKAmGxpbmvigJkgd2FzIGhlcmUKICA4MTkgfCBleHRlcm4gaW50IGxpbmsgKGNvbnN0IGNoYXIg
Kl9fZnJvbSwgY29uc3QgY2hhciAqX190bykKICAgICAgfCAgICAgICAgICAgIF5+fn4KCldhZjog
TGVhdmluZyBkaXJlY3RvcnkKYC9ob21lL21hdHVzY2hkL2J1aWxkcm9vdC0yMDIxLjExLXJjMi9v
dXRwdXQvYnVpbGQvc2FtYmE0LTQuMTQuMTAvYmluL2RlZmF1bHQnCkJ1aWxkIGZhaWxlZAogLT4g
dGFzayBpbiAnSEVJTURBTF9IRUlNX0FTTjEnIGZhaWxlZCB3aXRoIGV4aXQgc3RhdHVzIDEgKHJ1
biB3aXRoIC12IHRvCmRpc3BsYXkgbW9yZSBpbmZvcm1hdGlvbikKbWFrZVsyXTogKioqIFtNYWtl
ZmlsZTo3OiBhbGxdIEVycm9yIDEKbWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1r
OjI5NDoKL2hvbWUvbWF0dXNjaGQvYnVpbGRyb290LTIwMjEuMTEtcmMyL291dHB1dC9idWlsZC9z
YW1iYTQtNC4xNC4xMC8uc3RhbXBfYnVpbHRdCkVycm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZTo4
NDogX2FsbF0gRXJyb3IgMgoKQ29uZmlndXJhdGlvbiBtYWtlIHJhc3BiZXJyeXBpM19kZWZjb25m
aWcsIHdpdGgganVzdCBnbGliYyBhbmQgc2FtYmEgZW5hYmxlZC4KCi0tIApZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSBvbiB0aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1
Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
