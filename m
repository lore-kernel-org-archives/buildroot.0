Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1BFC6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A25188141A;
	Tue, 29 Aug 2023 13:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25188141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCw-XclfY8dr; Tue, 29 Aug 2023 13:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 142B78179A;
	Tue, 29 Aug 2023 13:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142B78179A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23F991BF34B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A7D660BE3
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A7D660BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gWmiRClbts8 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:50:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88D8A60AB7
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88D8A60AB7
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF934C0015
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:50:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qaz6g-006sSQ-Sq
 for buildroot@buildroot.org; Tue, 29 Aug 2023 15:50:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:50:10 +0200
Message-ID: <874jki5565.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.08-rc3 released
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

SGksCgpCdWlsZHJvb3QgMjAyMy4wOC1yYzMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMy4wOC1yYzMu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIz
LjA4LXJjMy50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKQW5vdGhlciB3ZWVrLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLiBF
eHBlY3QgdGhlIGZpbmFsIDIwMjMuMDggaW4gYQpmZXcgZGF5cy4KClBsZWFzZSBnaXZlIGl0IGEg
c3BpbiBhbmQgcmVwb3J0IGFueSBwcm9ibGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0
cmFja2VyLiBNYW55IHRoYW5rcyB0byB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJl
bGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMuMDgtcmMyLi4KCiAgICAxMiAgQmVybmQgS3Vo
bHMKICAgICA5ICBSb21haW4gTmFvdXIKICAgICA2ICBXYWxkZW1hciBCcm9ka29yYgogICAgIDMg
IEdpdWxpbyBCZW5ldHRpCiAgICAgMiAgUGV0ZXIgS29yc2dhYXJkCiAgICAgMSAgQ2xlbWVudCBS
YW1pcmV6CiAgICAgMSAgRnJhbmsgVmFuYmV2ZXIKICAgICAxICBKYW1lcyBIaWxsaWFyZAogICAg
IDEgIEp1bGllbiBPbGl2YWluCiAgICAgMSAgUmFwaGHDq2wgTcOpbG90dGUKICAgICAxICBZYW5u
IEUuIE1PUklOCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
