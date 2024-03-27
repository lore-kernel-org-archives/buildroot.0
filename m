Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972E7C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 17:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B458606B1;
	Wed, 27 Mar 2024 17:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vuYplD8Ahti; Wed, 27 Mar 2024 17:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A88B60BAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A88B60BAA;
	Wed, 27 Mar 2024 17:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656161BF29D
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 17:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51BD74056B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 17:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LegB9dNmnfY3 for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 17:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60FCD40562
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60FCD40562
 for <buildroot@uclibc.org>; Wed, 27 Mar 2024 17:44:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4AF3B842B3; Wed, 27 Mar 2024 17:44:15 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 27 Mar 2024 17:44:15 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: niziak@spox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-15973-163-woi227CD4R@https.bugs.busybox.net/>
In-Reply-To: <bug-15973-163@https.bugs.busybox.net/>
References: <bug-15973-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15973] imx8m bootloader image generation broken
 since update to imx-mkimage 6.1.36_2.1.0
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTk3MwoKV29qY2llY2gg
Tml6acWEc2tpIDxuaXppYWtAc3BveC5vcmc+IGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAg
fFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
ICAgICAgICAgIFNldmVyaXR5fG5vcm1hbCAgICAgICAgICAgICAgICAgICAgICB8YmxvY2tlcgoK
LS0tIENvbW1lbnQgIzEgZnJvbSBXb2pjaWVjaCBOaXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4g
LS0tCkJ1bXBlZCBgaW14LW1raW1hZ2VgIGZyb20gYGxmLTUuMTAuNzJfMi4yLjBgIHRvIGBsZi02
LjEuMzYtMi4xLjBgCmluIGNvbW1pdDoKaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVpbGRyb290
L2NvbW1pdC9wYWNrYWdlL2lteC1ta2ltYWdlP2lkPTcyZGU3ODkwMjMzMDI2ZjAyMGRlNGFiYTNl
OGU4NmMxNTZlNTU3NzMKCmludHJvZHVjZXMgaS5NWDkgc3VwcG9ydC4gTm93IGFsbCBpLk1YOE0/
IGJhc2VkIHRhcmdldHMgYXJlIGJyb2tlbiAoYm9hcmRzCnVzaW5nICdib2FyZC9mcmVlc2NhbGUv
Y29tbW9uL2lteC9pbXg4LWJvb3Rsb2FkZXItcHJlcGFyZS5zaCcgdG8gZ2VuZXJhdGUgYm9vdApp
bWFnZSkuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUg
b24gdGhlIENDIGxpc3QgZm9yIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
