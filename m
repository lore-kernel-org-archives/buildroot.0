Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA24C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 14:29:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B46E6112D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 14:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B46E6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26EB607BE;
	Wed, 10 Nov 2021 14:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkUMb2Nm6dyh; Wed, 10 Nov 2021 14:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F0A460785;
	Wed, 10 Nov 2021 14:29:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC0041BF360
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 14:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB5A8401D0
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 14:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0DgSAMTqvkr for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 14:29:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E740240106
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 14:29:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5F9C4200004
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 14:29:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mkoax-0002QZ-GD
 for buildroot@buildroot.org; Wed, 10 Nov 2021 15:28:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 15:28:59 +0100
Message-ID: <87wnlgythw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.08.2 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjEuMDguMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA4LjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA4LjIudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wOC4yIGlzIGEgYnVnZml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBv
cnRhbnQgLwpzZWN1cml0eSByZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIx
LjA4LjEgcmVsZWFzZS4KCi0gT3BlbkpESyAxNi54IG1vdmVkIHRvIDE3LnggYXMgMTYueCBpcyBF
T0wuCgotIFNlY3VyaXR5IGZpeGVzIGZvciBhc3RlcmlzaywgYmluZCwgY29udGFpbmVyZCwgZG9j
a2VyLWNsaSwKICBkb2NrZXItZW5naW5lLCBleGl2MiwgZnJlZXJkcCwgZ28sIGhpcmVkaXMsIGxy
emlwLCBub2RlanMsIG9wZW5qZGssCiAgb3Blbmpkay1iaW4sIHBocCwgc2FtYmE0LCBzbm9ydCwg
c3Ryb25nc3dhbiwgdmltCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1l
L2xpY2Vuc2UgaXNzdWVzIGluIGF1ZGl0LAogIGJpdGNvaW4sIGNyeXB0c2V0dXAsIGRhaGRpLWxp
bnV4LCBkYnVzLXB5dGhvbiwgZGZ1LXV0aWwsIGVhcmx5b29tLAogIGVkazItcGxhdGZvcm1zLCBm
Zm1wZWcsIGdkYiwgZ2Vuc2lvLCBnbnVwZzIsIGdwc2QsIGdzdDEtcGx1Z2lucy1iYWQsCiAgZ3N0
MS1wbHVnaW5zLXVnbHksIGdzdDEtdmFhcGksIGd0ZXN0LCBsZnRwLCBsaWJwc2wsIGxpYnZhLAog
IGxpYnZhLXV0aWxzLCBsaWdodG5pbmcsIGxvZzRjcGx1cywgbmV0ZGF0YSwgb2xzciwgcGFuZ28s
IHB5dGhvbjMtY2ZmaSwKICBxZW11LCByZWZwb2xpY3ksIHJuZy10b29scywgc2FtYmE0LCBzdXJp
Y2F0YSwgc3lzdGVtZCwgdG9yLCB2aW0sCiAgd2VzdG9uLCB3aXJlZ3VhcmQtbGludXgtY29tcGF0
LCB4ZXJjZXMKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6
Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIxLjA4LjIK
ClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0
byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRv
IHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMS4wOC4xLi4KCiAgICAzNSAgRmFi
cmljZSBGb250YWluZQogICAgMTggIFBldGVyIEtvcnNnYWFyZAogICAgIDkgIEJlcm5kIEt1aGxz
CiAgICAgOSAgVGhvbWFzIFBldGF6em9uaQogICAgIDggIEphbWVzIEhpbGxpYXJkCiAgICAgNyAg
UGV0ZXIgU2VpZGVyZXIKICAgICA2ICBSb21haW4gTmFvdXIKICAgICA0ICBHaXVsaW8gQmVuZXR0
aQogICAgIDIgIEFkYW0gRHVza2V0dAogICAgIDIgIEFsZXhhbmRlciBEYWhsCiAgICAgMiAgRnJh
bmNvaXMgUGVycmFkCiAgICAgMiAgSm9hY2hpbSBXaWJlcmcKICAgICAyICBNYXR0aGV3IFdlYmVy
CiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAgIDEgIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3Nl
bnNpdW0vTWluZCkKICAgICAxICBBcnRlbSBQYW5maWxvdgogICAgIDEgIEpvc8OpIFBla2thcmlu
ZW4KICAgICAxICBSYXBoYcOrbCBNw6lsb3R0ZQoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
