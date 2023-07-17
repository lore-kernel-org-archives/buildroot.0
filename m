Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB169C001B0
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 16:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B4A60AA4;
	Mon, 17 Jul 2023 16:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B4A60AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4-BLVEZ4v0j; Mon, 17 Jul 2023 16:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEBE60899;
	Mon, 17 Jul 2023 16:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEEBE60899
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEA461BF338
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 16:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D00DA409B2
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 16:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00DA409B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygXjClL9ShVb for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 16:11:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D56408F9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70D56408F9
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 16:11:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCFC320004
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 16:11:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qLQp9-00Ejms-58
 for buildroot@buildroot.org; Mon, 17 Jul 2023 18:11:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 18:11:47 +0200
Message-ID: <87351m8qm4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.05.1 released
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
MjMuMDUuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA1LjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA1LjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjA1LjEgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MDUgcmVsZWFzZS4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJpbmQsIGRidXMsIGMtYXJlcywgY3Vw
cywgZ2hvc3RzY3JpcHQsCiAgZ3JhcGhpY3NtYWdpY2ssIGpoZWFkLCBsaWJjYXAsIG5vZGVqcywg
cGhwLCBweXRob24tZGphbmdvLAogIHB5dGhvbi1yZXF1ZXN0cywgcHl0aG9uMywgcWVtdSwgdGlm
Ziwgd2lyZXNoYXJrLCB4bGliX2xpYlgxMSwKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0
aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gYWdlbnRwcCwKICBhbHNhLXBsdWdpbnMsIGFz
c2ltcCwgYXVkaXQsIGJ1c3lib3gsIGNoZWNrLCBkYWhkaS1saW51eCwgZGF2MWQsIGZmdHcsCiAg
Zmx1aWRzeW50aCwgZnJlZXR5cGUsIGZ3dHMsIGdudXBnMiwgZ251cmFkaW8sIGd1cG5wLCBoYXBy
b3h5LCBoZWltZGFsLAogIGh3ZGF0YSwga29kaSwgbGliZ2NyeXB0LCBsaWJncGctZXJyb3IsIGxp
Ymd0azMsIGxpYm1kYngsIGxpYnhzbHQsCiAgbWVzYTNkLCBtZXNhM2QtZGVtb3MsIG1waXIsIHBr
Z2NvbmYsIHB5dGhvbi1jcnlwdG9ncmFwaHksCiAgcHl0aG9uLWRidXMtZmFzdCwgcHl0aG9uLWRv
Y2tlciwgcHl0aG9uLXB5aWN1LCBxZW11LCBxdDYsIHF1aWNranMsCiAgcnRsODE5MmV1LCBzYW1i
YTQsIHNjb25lc2VydmVyLCBzeXNsb2ctbmcsIHRhZ2xpYiwgd2luZSwKICB4ZHJpdmVyX3hmODYt
dmlkZW8tZHVtbXkKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0
cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIzLjA1
LjEKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdl
ZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5n
IHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4wNS4uCgogICAgNTYgIEJl
cm5kIEt1aGxzCiAgICAxMiAgUGV0ZXIgS29yc2dhYXJkCiAgICAgMyAgUm9tYWluIE5hb3VyCiAg
ICAgMiAgR2FyeSBCaXNzb24KICAgICAyICBKYW1lcyBIaWxsaWFyZAogICAgIDIgIE1hcmNpbiBO
aWVzdHJvagogICAgIDIgIFBldGVyIFNlaWRlcmVyCiAgICAgMSAgQW5kcsOpIFp3aW5nCiAgICAg
MSAgQmluIE1lbmcKICAgICAxICBDaGFybGVzIEhhcmRpbgogICAgIDEgIEZhYmlvIEVzdGV2YW0K
ICAgICAxICBGbG9yaWFuIExhcnlzY2gKICAgICAxICBGcmFuY29pcyBQZXJyYWQKICAgICAxICBH
aXVsaW8gQmVuZXR0aQogICAgIDEgIEdyemVnb3J6IEJsYWNoCiAgICAgMSAgR3dlbmhhZWwgR29h
dmVjLU1lcm91CiAgICAgMSAgSnVsaWVuIE9saXZhaW4KICAgICAxICBMdWNhIENlcmVzb2xpCiAg
ICAgMSAgU8OpYmFzdGllbiBTenltYW5za2kKICAgICAxICDQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
