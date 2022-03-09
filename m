Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF337C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 09:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DDD761043;
	Wed,  9 Mar 2022 09:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8Y-YsXqNPUp; Wed,  9 Mar 2022 09:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679F261035;
	Wed,  9 Mar 2022 09:58:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABCF1BF955
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 09:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 968096102F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 09:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pU8F0jAIXimd for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 09:58:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF17060FEE
 for <buildroot@uclibc.org>; Wed,  9 Mar 2022 09:58:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B8F4383488; Wed,  9 Mar 2022 09:49:47 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 09 Mar 2022 09:58:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mf@go-sys.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14651-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14651] New: OpenSSH 8.9p1 compiler error under ARM
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDY1MQoKICAgICAgICAg
ICAgQnVnIElEOiAxNDY1MQogICAgICAgICAgIFN1bW1hcnk6IE9wZW5TU0ggOC45cDEgY29tcGls
ZXIgZXJyb3IgdW5kZXIgQVJNCiAgICAgICAgICAgUHJvZHVjdDogYnVpbGRyb290CiAgICAgICAg
ICAgVmVyc2lvbjogdW5zcGVjaWZpZWQKICAgICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAg
ICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IG1ham9yCiAgICAgICAgICBQcmlvcml0eTogUDUKICAgICAgICAgQ29tcG9uZW50OiBPdGhl
cgogICAgICAgICAgQXNzaWduZWU6IHVuYXNzaWduZWRAYnVpbGRyb290LnVjbGliYy5vcmcKICAg
ICAgICAgIFJlcG9ydGVyOiBtZkBnby1zeXMuZGUKICAgICAgICAgICAgICAgIENDOiBidWlsZHJv
b3RAdWNsaWJjLm9yZwogIFRhcmdldCBNaWxlc3RvbmU6IC0tLQoKOS1NYXJjaC0yMDIyIGZyb20g
Z2l0IG1hc3RlcgpBUk0gbGl0dGxlIGVuZGlhbgpnY2MtMTEuMgprZXJuZWwgYXNwYmVycnlwaSxs
aW51eCwwYjU0ZGJkYTNjY2EyYmViNTFlMjM2YTI1NzM4Nzg0ZTkwODUzYjY0Cgpjb21waWxpbmcg
ZXJyb3Igb3BlbnNzaCA4LjkucDEKCi1memVyby1jYWxsLXVzZWQtcmVncyBpcyBub3Qgc3VwcG9y
dGVkIG9uIHRoaXMgdGFyZ2V0IAoKCnNzaGVyci5jOiBJbiBGdW5rdGlvbiDCu3NzaF9lcnLCqzoK
c3NoZXJyLmM6MTUxOjE6IG5pY2h0IGltcGxlbWVudGllcnQ6IMK7LWZ6ZXJvLWNhbGwtdXNlZC1y
ZWdzwqsgd2lyZCBhdWYgZGllc2VtClppZWwgbmljaHQgdW50ZXJzdMO8dHp0CiAgMTUxIHwgfQog
ICAgICB8IF4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFy
ZSBvbiB0aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
