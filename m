Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83772C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 13:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D408983F12;
	Wed, 22 Mar 2023 13:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D408983F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVET4qhFtkGw; Wed, 22 Mar 2023 13:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6BA83EE8;
	Wed, 22 Mar 2023 13:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6BA83EE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0721BF5DC
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB51E416B5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 13:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB51E416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RqmAxWV9t9R for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 13:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B206416B1
 for <buildroot@uclibc.org>; Wed, 22 Mar 2023 13:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B206416B1
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id ECE9486F74; Wed, 22 Mar 2023 13:51:09 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 22 Mar 2023 13:51:09 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexis.lothore@bootlin.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15461-163-pHsqtx6a95@https.bugs.busybox.net/>
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
bnQgIzUgZnJvbSBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiAt
LS0KPiBUaGFuayB5b3UgZm9yIGdvb2QgY29tbWVudHMuIEkndmUgYmVlbiB0cnlpbmcgdG8gcGxh
eSB3aXRoIG9wdGltaXphdGlvbiBsZXZlbCwgYW55IGNvbW1lbnRzIGhvdyBhbmQgd2hhdCB5b3Ug
ZG8gb24gb3B0aW1pemF0aW9uIGluIGRldGFpbHMgd291bGQgYmUgYXBwcmVjaWF0ZWQuCgpJZiB5
b3UgYXJlIHN0aWxsIGludGVyZXN0ZWQgaW4gdGhpcyBvcHRpb24sIEkgc2ltcGx5IGFkZGVkIHRo
ZSBmb2xsb3dpbmcgdG8KcGFja2FnZS9xdDUvcXQ1ZGVjbGFyYXRpdmUvcXQ1ZGVjbGFyYXRpdmUu
bWs6CgpRVDVERUNMQVJBVElWRV9DT05GX09QVFMgKz0gUU1BS0VfQ1hYRkxBR1M9LU8wCgpJIGFs
c28gdHJpZWQgd2l0aCBHQ0MxMiwgd2l0aCB3aGljaCB0aGUgY3Jhc2ggaXMgc3RpbGwgb2NjdXJp
bmcsIHNvIHRoZSBpc3N1ZQppcyBzdGlsbCBpbiBHQ0MxMi4gSSBndWVzcyBuZXh0IHN0ZXAgd2ls
bCBiZSB0byB0cnkgdG8gaXNvbGF0ZSBhIHF0IHF1aWNrCnNhbXBsZSBhYmxlIHRvIHJlcHJvZHVj
ZSB0aGUgaXNzdWUgdG8gdHJhY2sgdGhlIGV4YWN0IGlzc3VlIGFuZC9vciBzaGFyZSBpdAp3aXRo
IEdOVSBwZW9wbGUKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91
IGFyZSBvbiB0aGUgQ0MgbGlzdCBmb3IgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
