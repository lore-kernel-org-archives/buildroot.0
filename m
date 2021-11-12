Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A36C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 09:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7771160EE9
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 09:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7771160EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C419401DA;
	Fri, 12 Nov 2021 09:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PE8EgSeMyoe; Fri, 12 Nov 2021 09:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2155140161;
	Fri, 12 Nov 2021 09:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23C3D1BF40D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 09:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 061AA60624
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 09:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=protonmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XscEHsscF7m3 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 09:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F1BE600B5
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 09:43:33 +0000 (UTC)
Date: Fri, 12 Nov 2021 09:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1636710210;
 bh=q5VbL+NdwW3xr9/72l5kIKXuJzU9bhdvvpQmu+oUve4=;
 h=Date:To:From:Reply-To:Subject:From;
 b=DqkKKvhxdY9boi5yWvKLgwkpx9hPHFwYyqZvQM4Kr+P4gc4N7228WwG4Dcs04b6Pc
 kOVRR/ror6EnEZqEMpwtpVnUINnKYQp4Qbcf9pTUrWwT8rpMNw06gK7y+ODd3JjCWW
 g2d+lLYWTzkFIrp8foOwIwiIAj5x+uR1xSyUWsqk=
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <IyDLoPnV8eWLmKpYfSne5MQpwjDHblwR2NBIDxbO2kcgpxsC19tqxJorpx_IlPzm910Ipv2ekrV2WvYCCyKHUo4aJeax9B33mI7Kc3zNWok=@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] cargo package build with dbus dependencie
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
From: "Patrick G. via buildroot" <buildroot@buildroot.org>
Reply-To: "Patrick G." <pgeiem@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBhbGwsCgpJIHdvdWxkIGxpa2UgdG8gYnVpbGQgYSBydXN0IGFwcGxpY2F0aW9uIHRoYXQg
dXNlIHJ1c3QgZGJ1cyBjcmF0ZS4gVGhpcyBhcHBsaWNhdGlvbiBpcyBidWlsZGluZyBmaW5lIG9u
IG5hdGl2ZSwgSSBhbSBub3cgdHJ5aW5nIHRvIGFkZCBpdCB0byBidWlsZHJvb3QgdG8gY3Jvc3Mt
Y29tcGlsZSBpdC4gSSBhbSBmb2xsb3dpbmcgYnVpbGRyb290IHVzZXIgZ3VpZGUgZm9yIGNhcmdv
IHBhY2thZ2UgKMKnMTguMTYpIGFuZCBpdCB3b3JrcyBmaW5lIHVudGlsIEkgdXNlIHRoZSBkYnVz
IGNyYXRlLgoKV2hlbiBidWlsZGluZywgY2FyZ28gdHJ5IHRvIGNvbXBpbGUgbGliZGJ1cy1zeXMg
d2hpY2ggcmVxdWlyZSBsaWJkYnVzLTEgYW5kIHJldHVybiB0aGUgZm9sbG93aW5nIGVycm9yOgoK
ICBJbnN0YWxsIGEgc3lzcm9vdCBmb3IgdGhlIHRhcmdldCBwbGF0Zm9ybSBhbmQgY29uZmlndXJl
IGl0IHZpYQogIFBLR19DT05GSUdfU1lTUk9PVF9ESVIgYW5kIFBLR19DT05GSUdfUEFUSCwgb3Ig
aW5zdGFsbCBhCiAgY3Jvc3MtY29tcGlsaW5nIHdyYXBwZXIgZm9yIHBrZy1jb25maWcgYW5kIHNl
dCBpdCB2aWEKICBQS0dfQ09ORklHIGVudmlyb25tZW50IHZhcmlhYmxlLgoKSSBhZGRlZCBQS0df
Q09ORklHX1NZU1JPT1RfRElSIGFuZCBQS0dfQ09ORklHX1BBVEggdG8gcG9pbnQgdG8gb3V0cHV0
L2J1aWxkL2RidXMtMS4xMi4yMCB3aGVyZSB0aGUgZGJ1cy0xLnBjIGZpbGUgaXMuCgpJdCBub3cg
YnVpbGQgYnV0IEkgZ2V0IGEgbG90IG9mIGxpbmtpbmcgZXJyb3IgZm9yICJ1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGRidXNfLi4uIiBmdW5jdGlvbnMuCgpOb3RlIEkgaGF2ZSBhbHNvIHRyaWVkIHRv
IGFkZCB0aGUgZm9sbG93aW5nIHdpdGhvdXQgc3VjY2VzczoKICBERVBFTkRFTkNJRVMgPSBob3N0
LXJ1c3RjIGhvc3QtcGtnY29uZiBkYnVzCgpEbyB5b3UgaGF2ZSBhbnkgaWRlYSBob3cgdG8gc29s
dmUgdGhpcyA/IElzIHRoZXJlIGFueSByZWNvbWVuZGVkIHdheSB0byBtYW5hZ2UgdGhpcyBraW5k
IG9mIGRlcGVuZGVuY2llcyA/CgpUaGFua3MgaW4gYWR2YW5jZQpQYXRyaWNrCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
