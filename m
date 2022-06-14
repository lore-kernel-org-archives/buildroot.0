Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9867AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 19:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0821540A9B;
	Tue, 14 Jun 2022 19:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmW54-y_zeze; Tue, 14 Jun 2022 19:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F71B40A65;
	Tue, 14 Jun 2022 19:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2CC21BF5B4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E12DD60B95
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPMellpp3Y1p for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 19:55:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA3F560AC4
 for <buildroot@uclibc.org>; Tue, 14 Jun 2022 19:55:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id AF45F87061; Tue, 14 Jun 2022 19:43:51 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 14 Jun 2022 19:55:59 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.02.10
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-14841-163-Q6wokJfaAx@https.bugs.busybox.net/>
In-Reply-To: <bug-14841-163@https.bugs.busybox.net/>
References: <bug-14841-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14841] support/download/git fails with "fatal: No
 such remote 'origin'" due to incorrect check for origin remote
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDg0MQoKWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQg
ICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnIKCi0tLSBDb21tZW50ICMyIGZyb20gWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IC0tLQpIZWxsbywKClRoYW5rcyBmb3IgdGhlIHJlcG9ydC4K
CkknbGwgYmUgcXVvdGluZyB3aGF0IEVkZ2FyIGV4cGxhaW5lZCBvbiB0aGUgbWFpbGluZyBsaXN0
IFswXToKCi0tLQpJIGNhbm5vdCByZXByb2R1Y2UgdGhpcy4gTXkgY29weSBvZiBnaXQgZG9lcyBu
b3QgcHJpbnQg4oCcb3JpZ2lu4oCdIGlmIHRoZXJlCmlzIG5vIHJlbW90ZSBuYW1lZCBzdWNoOgoK
ICAgICQgZ2l0IC0tdmVyc2lvbgogICAgZ2l0IHZlcnNpb24gMi4yNS4xCiAgICAkIGdpdCBpbml0
IGZvbwogICAgSW5pdGlhbGl6ZWQgZW1wdHkgR2l0IHJlcG9zaXRvcnkgaW4gL2hvbWUvZWRnYXIv
Zm9vLy5naXQvCiAgICAkIGNkIGZvby8KICAgICQgZ2l0IHJlbW90ZSB8IGdyZXAgJ15vcmlnaW4k
JwogICAgJCAgICAgIyA8LSBlbXB0eSBvdXRwdXQKCkkgYWxzbyB0cmllZCB3aXRoIGJvdGggYSBx
dWl0ZSBvbGQgYW5kIGEgZmFpcmx5IHJlY2VudCB2ZXJzaW9uIG9mIGdpdAooMi4xMS4wIGZyb20g
RGViaWFuIFN0cmV0Y2ggYW5kIDIuMzUuMSBmcm9tIERlYmlhbiBUZXN0aW5nKSB3aXRoIHRoZQpz
YW1lIHJlc3VsdC4KLS0tCgpJIGFsc28gdHJpZWQgdGhlIHNhbWUgYXMgRWRnYXIsIGFuZCBJIHRv
byBjYW4ndCByZXByb2R1Y2UuCgpDYW4geW91IHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbiwgcGxl
YXNlPwoKWzBdCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC9hY2FlNmY2MC1mNzFj
LTc2ZmUtYjlmZS0wNzc5ZDc1OGMxYzBAZ3Jlbm9ibGUuY25ycy5mci9ULyN0CgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZ
b3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
