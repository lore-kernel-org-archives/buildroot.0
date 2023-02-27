Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82920C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 16:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB91D61056;
	Mon, 27 Feb 2023 16:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB91D61056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRJuY5E09cD8; Mon, 27 Feb 2023 16:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0856104C;
	Mon, 27 Feb 2023 16:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0856104C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C96E91BF870
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B09A141757
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 16:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B09A141757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn0peaPUF0Hi for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 16:50:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6793641755
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6793641755
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:50:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A472CC0002
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 16:50:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pWghi-009PwU-Rt
 for buildroot@buildroot.org; Mon, 27 Feb 2023 17:50:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 17:50:22 +0100
Message-ID: <87k003kq7l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2023.02-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyMy4wMi1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMy4wMi1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIz
LjAyLXJjMi50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmdpdDovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdAoKTGF0ZXIgdGhhbiBob3BlZCwgYnV0IGhlcmUgaXMgYW5vdGhlciByZWxl
YXNlIGNhbmRpZGF0ZS4KClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0IGFueSBwcm9i
bGVtcyB0byB0aGUgbWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRoYW5rcyB0byB0
aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNu
IDIwMjMuMDItcmMxLi4KCiAgICA3MiAgRmFicmljZSBGb250YWluZQogICAgIDIgIEdpdWxpbyBC
ZW5ldHRpCiAgICAgMSAgQWxleGFuZGVyIEVnb3JlbmtvdgogICAgIDEgIEhlaWtvIFRoaWVyeQog
ICAgIDEgIEp1bGllbiBPbGl2YWluCiAgICAgMSAgTGFuZyBEYW5pZWwKICAgICAxICBNYXJjdXMg
Rm9sa2Vzc29uCiAgICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAgUGV0ZXIgS29yc2dhYXJk
CiAgICAgMSAgU2VyZ2V5IE1hdHl1a2V2aWNoCiAgICAgMSAgU8OpYmFzdGllbiBTenltYW5za2kK
ICAgICAxICBUaG9tYXMgUGV0YXp6b25pCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5H
RVMgZmlsZToKCmh0dHA6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdF
Uz9pZD0yMDIzLjAyLXJjMgoKRXhwZWN0IHRoZSBmaW5hbCAyMDIzLjAyIHJlbGVhc2UgYnkgdGhl
IGVuZCBvZiB0aGUgd2Vlay4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
