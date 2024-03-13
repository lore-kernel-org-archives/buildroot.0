Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E5AC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 08:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C754016B;
	Wed, 13 Mar 2024 08:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvHBJx3PlYsu; Wed, 13 Mar 2024 08:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0832740195
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0832740195;
	Wed, 13 Mar 2024 08:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 692B61BF29F
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56C894031F
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 08:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MvcZxdI-7dKn for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 08:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8681A404B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8681A404B6
 for <buildroot@uclibc.org>; Wed, 13 Mar 2024 08:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7DF66882B3; Wed, 13 Mar 2024 08:51:32 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 13 Mar 2024 08:51:32 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sebastien.szymanski@armadeus.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15988-163-bcUAR7e8BT@https.bugs.busybox.net/>
In-Reply-To: <bug-15988-163@https.bugs.busybox.net/>
References: <bug-15988-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15988] imx93evk defconfig is not working for
 MCIMX93-SOM rev B
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTk4OAoKLS0tIENvbW1l
bnQgIzEgZnJvbSBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1h
ZGV1cy5jb20+IC0tLQooSW4gcmVwbHkgdG8gc3RlZmZlbi5kYWxnYXJkIGZyb20gY29tbWVudCAj
MCkKCkkgdGVzdGVkIG9uIGkuTVg5MyBFVksgd2l0aCBBMCBTb0MgYW5kIEp1bGllbiBPbGl2YWlu
IHRlc3RlZCBvbiB0aGUgc2FtZSBib2FyZAphcyB5b3VyczoKCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2J1aWxkcm9vdC84NGQxYWUyZDVhY2ZmMWIxZDU2ZmJmNzI2ZDAzYWY2Y0BmcmVlLmZyLwoK
VW5mb3J0dW5hdGVseSwgSSBkb24ndCBoYXZlIGEgdGhlIEVWSyBib2FyZCBhbnltb3JlLgpJIHRl
c3RlZCBvbiBteSBpLk1YOTMgYmFzZWQgU29NIGFuZCB0aGUgZ2VuZXJhdGVkIGlteDktYm9vdC1z
ZC5iaW4gYm9vdHMuCgpSZWdhcmRzLAoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBi
ZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
