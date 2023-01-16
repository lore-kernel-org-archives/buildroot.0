Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D928C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2CE40037;
	Mon, 16 Jan 2023 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2CE40037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6l2QZ4Z634D; Mon, 16 Jan 2023 20:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D94400C6;
	Mon, 16 Jan 2023 20:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D94400C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D49E1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED801405E2
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED801405E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_bSJCN4MNKj for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:18:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2567D40BD1
 for <buildroot@uclibc.org>; Mon, 16 Jan 2023 20:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2567D40BD1
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 136BA87B32; Mon, 16 Jan 2023 20:18:17 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 16 Jan 2023 20:18:16 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.11.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arinc.unal@arinc9.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-13466-163-2S3HvgaYp2@https.bugs.busybox.net/>
In-Reply-To: <bug-13466-163@https.bugs.busybox.net/>
References: <bug-13466-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 13466] creation of bridge interface via interfaces
 does not work
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xMzQ2NgoKLS0tIENvbW1l
bnQgIzQgZnJvbSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+IC0tLQpJIG1h
ZGUgaXQgd29yay4gVGhlIGJyY3RsIGNoZWNrIG9uIGlmdXBkb3duLnNoIG5lZWRlZCB0byBiZSBj
aGFuZ2VkIHRvCi91c3Ivc2Jpbi9icmN0bC4KCkkgb25seSBuZWVkZWQgdG8gaW5zdGFsbCBicmlk
Z2UtdXRpbHMuIE5vIG5lZWQgZm9yIHRoZSBpZnVwZG93biBwYWNrYWdlLiBCcmlkZ2UKVkxBTiBm
aWx0ZXJpbmcgd29uJ3Qgd29yayBpZiBpcHJvdXRlMiBpcyBub3QgaW5zdGFsbGVkLiBCdXN5Qm94
J3MgaXAgY29tbWFuZApkb2VzIG5vdCBzdXBwb3J0IHRoYXQuCgpNeSBjdXJyZW50IHJvb3RmcyBv
dmVybGF5IGxvb2tzIGxpa2UgdGhpczoKCnJvb3Rmc092ZXJsYXkK4pSc4pSA4pSAIGV0YwrilILC
oMKgIOKUlOKUgOKUgCBuZXR3b3JrCuKUgsKgwqAgICAgIOKUnOKUgOKUgCBpZi1kb3duLmQK4pSC
wqDCoCAgICAg4pSCwqDCoCDilJTilIDilIAgYnJpZGdlIC0+IC9saWIvYnJpZGdlLXV0aWxzL2lm
dXBkb3duLnNoCuKUgsKgwqAgICAgIOKUnOKUgOKUgCBpZi1wb3N0LWRvd24uZArilILCoMKgICAg
ICDilILCoMKgIOKUlOKUgOKUgCBicmlkZ2UgLT4gL2xpYi9icmlkZ2UtdXRpbHMvaWZ1cGRvd24u
c2gK4pSCwqDCoCAgICAg4pSc4pSA4pSAIGlmLXByZS11cC5kCuKUgsKgwqAgICAgIOKUgsKgwqAg
4pSU4pSA4pSAIGJyaWRnZSAtPiAvbGliL2JyaWRnZS11dGlscy9pZnVwZG93bi5zaArilILCoMKg
ICAgICDilJTilIDilIAgaW50ZXJmYWNlcwrilJTilIDilIAgbGliCiAgICDilJTilIDilIAgYnJp
ZGdlLXV0aWxzCiAgICAgICAg4pSc4pSA4pSAIGJyaWRnZS11dGlscy5zaAogICAgICAgIOKUlOKU
gOKUgCBpZnVwZG93bi5zaAoKSSdtIHBsYW5uaW5nIHRvIHdvcmsgb24gdGhlIHNjcmlwdHMgYSBs
aXR0bGUgdG8gcmVwbGFjZSBicmN0bCB3aXRoIGlwIHNvIGl0CndvdWxkIGJlIHVzYWJsZSB3aXRo
b3V0IHJlcXVpcmluZyBhbnkgb3RoZXIgcGFja2FnZXMgdG8gYmUgaW5zdGFsbGVkLgoKLS0gCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0
IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
