Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE83C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5938A403CA;
	Tue,  4 Jun 2024 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbGLXox5xpBE; Tue,  4 Jun 2024 20:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FE5C40443
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FE5C40443;
	Tue,  4 Jun 2024 20:06:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 692081BF48D
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5337E8204B
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fuvYczam9jx for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 20:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDB78201F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CDB78201F
 for <buildroot@uclibc.org>; Tue,  4 Jun 2024 20:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 17C3086132; Tue,  4 Jun 2024 20:06:02 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 04 Jun 2024 20:06:01 +0000
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
Message-ID: <bug-16096-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16096] New: iproute musl + gcc-14 compile error w/
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNjA5NgoKICAgICAgICAg
ICAgQnVnIElEOiAxNjA5NgogICAgICAgICAgIFN1bW1hcnk6IGlwcm91dGUgbXVzbCArIGdjYy0x
NCBjb21waWxlIGVycm9yIHcvIDIwMjQuMDUtcmMxCiAgICAgICAgICAgUHJvZHVjdDogYnVpbGRy
b290CiAgICAgICAgICAgVmVyc2lvbjogdW5zcGVjaWZpZWQKICAgICAgICAgIEhhcmR3YXJlOiBB
bGwKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAg
ICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFA1CiAgICAgICAgIENv
bXBvbmVudDogT3RoZXIKICAgICAgICAgIEFzc2lnbmVlOiB1bmFzc2lnbmVkQGJ1aWxkcm9vdC51
Y2xpYmMub3JnCiAgICAgICAgICBSZXBvcnRlcjogbGFuY2V0aGVwYW50c0BnbWFpbC5jb20KICAg
ICAgICAgICAgICAgIENDOiBidWlsZHJvb3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6
IC0tLQoKSSdtIGdldHRpbmcgdGhlIGJlbG93IGVycm9yIHdpdGggZ2NjLTE0IGFuZCBtdXNsIHVz
aW5nIDIwMjQuMDUtcmMxLgoKVGhlcmUncyBpcyBhbiB1cHN0cmVhbSBwYXRjaCB0aGF0IGZpeGVz
IHRoaXMuCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9uZXR3b3JrL2lwcm91dGUyL2lw
cm91dGUyLmdpdC9jb21taXQvP2lkPTUzYTg5YmZkODZmZmYxYTAwY2M3N2NhYmI4NDU3YTAzZWFh
M2JjN2QKCi4uL2luY2x1ZGUvanNvbl9wcmludC5oOjU4OjQ4OiBlcnJvcjogcGFzc2luZyBhcmd1
bWVudCA1IG9mIOKAmHByaW50X2NvbG9yX3R24oCZCmZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIg
dHlwZSBbLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICAgNTggfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbHVlKTsgICAgICAgICAgICAgICAg
IApcCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IHRpbWV2YWwgKgoKCkJSMl94ODZfNjQ9eQpCUjJfVE9PTENIQUlO
X0JVSUxEUk9PVF9NVVNMPXkKQlIyX0tFUk5FTF9IRUFERVJTXzZfNj15CkJSMl9CSU5VVElMU19W
RVJTSU9OXzJfNDJfWD15CkJSMl9HQ0NfVkVSU0lPTl8xNF9YPXkKQlIyX1BBQ0tBR0VfSVBST1VU
RTI9eQoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9u
IHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
