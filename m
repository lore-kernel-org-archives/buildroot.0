Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393CEC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 22:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C73F361AC4;
	Wed, 29 Nov 2023 22:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73F361AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOCec6mC8YfQ; Wed, 29 Nov 2023 22:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD6F61610;
	Wed, 29 Nov 2023 22:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD6F61610
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 614BC1BF356
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 22:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4756161610
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 22:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4756161610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jsG9V0oh5Nu for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 22:18:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B346A61609
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 22:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B346A61609
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF0D81BF203
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 22:18:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8StS-001nqu-0U
 for buildroot@buildroot.org; Wed, 29 Nov 2023 23:18:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 23:18:54 +0100
Message-ID: <877cm09p9t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.11-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyMy4xMS1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMy4xMS1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIz
LjExLXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKQW5vdGhlciAyIHdlZWtzLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRl
LgoKUGxlYXNlIGdpdmUgaXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBt
YWlsaW5nIGxpc3Qgb3IKYnVnIHRyYWNrZXIuIE1hbnkgdGhhbmtzIHRvIHRoZSBwZW9wbGUgY29u
dHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4xMS1yYzEu
LgoKICAgIDE5ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAgNiAgUGV0ZXIgS29yc2dhYXJkCiAgICAg
NCAgQWRhbSBEdXNrZXR0CiAgICAgMyAgQmVybmQgS3VobHMKICAgICAyICBHYcOrbCBQT1JUQVkK
ICAgICAyICBZYW5uIEUuIE1PUklOCiAgICAgMSAgQW50b2luZSBDb3V0YW50CiAgICAgMSAgQnJh
bmRvbiBNYWllcgogICAgIDEgIEZyYW5jb2lzIFBlcnJhZAogICAgIDEgIEdpdWxpbyBCZW5ldHRp
CiAgICAgMSAgSmFtZXMgSGlsbGlhcmQKICAgICAxICBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8K
ICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBNaWNoZWwgQWxleAogICAgIDEgIE5pY29s
YXMgQ2F2YWxsYXJpCiAgICAgMSAgUGV0ZXIgU2VpZGVyZXIKICAgICAxICBUaG9tYXMgUGV0YXp6
b25pCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
