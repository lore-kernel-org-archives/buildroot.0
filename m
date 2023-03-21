Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A6C6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 13:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1660C40BD0;
	Tue, 21 Mar 2023 13:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1660C40BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMFg-ip7kDzK; Tue, 21 Mar 2023 13:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7013240BCD;
	Tue, 21 Mar 2023 13:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7013240BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 069DB1BF327
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D05C581F8A
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 13:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05C581F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhVhT85fgWpD for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 13:42:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06E1F81C18
 for <buildroot@uclibc.org>; Tue, 21 Mar 2023 13:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E1F81C18
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E1DB987526; Tue, 21 Mar 2023 13:42:51 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 21 Mar 2023 13:42:51 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexis.lothore@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15461-163-mmCyzi0BVI@https.bugs.busybox.net/>
In-Reply-To: <bug-15461-163@https.bugs.busybox.net/>
References: <bug-15461-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15461] QtVirtualKeyboard segfaults
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTQ2MQoKLS0tIENvbW1l
bnQgIzIgZnJvbSBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiAt
LS0KSGkuIEkgaW5kZWVkIGVuY291bnRlciB0aGUgc2FtZSBraW5kIG9mIGlzc3VlIGluIGEgUXQg
UXVpY2sgcHJvamVjdCBvbiBBcm12Nwp0YXJnZXQKKiB3aXRoIEJ1aWxkcm9vdCAyMDIzLjAyIGFu
ZCBCb290bGluIFRvb2xjaGFpbiAyMDIyLjA4LCBRdCBwcm9qZWN0IGNyYXNoZXMgZGVlcAppbiBx
cW1sY3Jhc2hwcm9wZXJ0eWNhY2hlLmggKGluIGFuIGlubGluZWQgZnVuY3Rpb24pCiogdHJ5aW5n
IHRvIGJ1aWxkIHdpdGhvdXQgb3B0aW1pemF0aW9ucyAodG8gYWxsb3cgZGVidWdnaW5nKSwgdGhl
IGFwcGxpY2F0aW9uCmRvZXMgbm90IGNyYXNoIGFueW1vcmUKKiBzd2l0Y2hpbmcgYmFjayB0byBC
b290bGluIHRvb2xjaGFpbiAyMDIxLjExLCB0aGUgYXBwbGljYXRpb24gd29ya3MsIGV2ZW4gd2l0
aApvcHRpbWl6YXRpb25zIGVuYWJsZWQKKiBJIHRyaWVkIHRvIHN3aXRjaCB0byBidWlsZHJvb3Qg
aW50ZXJuYWwgdG9vbGNoYWluIEJVVCB3aXRoIGNvbXBvbmVudHMKdmVyc2lvbnMgKGdjYywgZ2xp
YmMsIGJpbnV0aWxzLCBrZXJuZWwgaGVhZGVycykgZnJvbSBib290bGluIHRvb2xjaGFpbiAyMDIy
LjA4Cj0+IGl0IHN0aWxsIGNyYXNoZXMsIHNvIGl0IGlzIHByb2JhYmx5IG5vdCB0aGUgQm9vdGxp
biBidWlsZCBvZiB0aGUgdG9vbGNoYWluCndoaWNoIGlzIHRoZSBjdWxwcml0CgotLSAKWW91IGFy
ZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgb24gdGhlIENDIGxpc3QgZm9y
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
