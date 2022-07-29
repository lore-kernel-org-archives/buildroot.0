Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04E7C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 09:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C48D6104E;
	Fri, 29 Jul 2022 09:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C48D6104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBSbzJ_JUYe4; Fri, 29 Jul 2022 09:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D6C60BAA;
	Fri, 29 Jul 2022 09:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D6C60BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2321BF36C
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38E5360BAA
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E5360BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id My8C4ZSZopwy for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 09:57:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F1E6064D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4F1E6064D
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 09:57:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A6276000E
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 09:57:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oHMjt-004Fh1-0b
 for buildroot@buildroot.org; Fri, 29 Jul 2022 11:57:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 11:57:00 +0200
Message-ID: <877d3wqm1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.4 released
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
MjIuMDIuNCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjQudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjQudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjQgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIuMyByZWxlYXNlLgoKLSBEaXNhYmxl
IGJpZyBlbmRpYW4gbm8tbW11IG9uIEFSTSBhcyBpdCBpcyBub3Qgc3VwcG9ydGVkIGJ5IGVsZjJm
bHQKCi0gVGlnaHRlbiBkZXBlbmRlbmNpZXMgZm9yIGV4dGVybmFsIEJvb3RsaW4gdG9vbGNoYWlu
cyB0byBlbnN1cmUgdGhleQogIGNhbiBvbmx5IGJlIHNlbGVjdGVkIGluIGNvbXBhdGlibGUgY29u
ZmlndXJhdGlvbnMKCi0gU3VwcG9ydCBleHRlcm5hbCB0b29sY2hhaW5zIHdpdGhvdXQgZ2Ric2Vy
dmVyCgotIFNlY3VyaXR5IGZpeGVzIGZvciBhcGFjaGUsIGN1cHMsIGdob3N0c2NyaXB0LCBnc3Qx
LXBsdWdpbnMtZ29vZCwKICBsaWJjdXJsLCBsaWJvcGVuc3NsLCBsaWJwanNpcCwgbGlic25kZmls
ZSwgbG9ncm90YXRlLCBwaHAsCiAgcHl0aG9uLXBpbGxvdywgcWRlY29kZXIsIHNvZmlhLXNpcCwg
dGNwcmVwbGF5LCB0b3IsIHZpbQoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVu
dGltZS9saWNlbnNlIGlzc3VlcyBpbiBhdmFoaSwgYmR3Z2MsCiAgYmluZCwgYnBmdG9vbCwgZGFy
a2h0dHBkLCBkbWFsbG9jLCBlY3J5cHRmcy11dGlscywgZnhsb2FkLCBnbnV0bHMsCiAgZ3N0LW9t
eCwgZ3N0MS1kZXZ0b29scywgZ3N0MS1saWJhdiwgZ3N0MS1wbHVnaW5zLWJhZCwKICBnc3QxLXBs
dWdpbnMtYmFzZSwgZ3N0MS1wbHVnaW5zLXVnbHksIGdzdDEtcHl0aG9uLCBnc3QxLXJ0c3Atc2Vy
dmVyLAogIGdzdDEtdmFhcGksIGdzdHJlYW1lcjEsIGdzdHJlYW1lcjEtZWRpdGluZy1zZXJ2aWNl
cywgZ3Rlc3QsIGlwdGFibGVzLAogIGtleXV0aWxzLCBsY20yLCBsaWJhYnNlaWwtY3BwLCBsaWJj
YW1lcmEsIGxpYmVhc3RsLCBsaWJncGdtZSwgbGliZ3RrMywKICBsaWJtZGJ4LCBsaWJtZWRpYWFy
dCwgbGlibW9kc2VjdXJpdHksIGxpYm5ldGNvbmYyLCBsaWJzYW1wbGVyYXRlLAogIGxpYnRhbGxv
YywgbHVhaml0LCBuZ2lueCwgbm9pcCwgcGF4dGVzdCwgcG9zdGdyZXNxbCwgcHJvY3JhbmtfbGlu
dXgsCiAgcHVyZS1mdHBkLCByYWJiaXRtcS1zZXJ2ZXIsIHJwaS11c2VybGFuZCwgcnVzdGMsIHN5
c3RlbWQsIHRjcHJlcGxheSwKICB0aW55cHJveHksIHVhY21lLCB1Ym9vdC11dGlscywgd2F0Y2hk
b2dkLCB3ZWJraXRndGssIHdlc3RvbiwKICB3aXJlZ3VhcmQtbGludXgtY29tcGF0LCB3cGFfc3Vw
cGxpY2FudCwgd3Bld2Via2l0LCB6c3RkCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5H
RVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5H
RVM/aWQ9MjAyMi4wMi40CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9u
Z2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxl
IGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjIuMDIu
My4uCgogICAgNDkgIEZhYnJpY2UgRm9udGFpbmUKICAgIDE3ICBKYW1lcyBIaWxsaWFyZAogICAg
MTQgIFRob21hcyBQZXRhenpvbmkKICAgIDEyICBCZXJuZCBLdWhscwogICAgIDMgIEFuZ2VsbyBD
b21wYWdudWNjaQogICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgIDIgIFBldGVyIEtvcnNnYWFy
ZAogICAgIDEgIEFsZXhhbmRlciBNdWtoaW4KICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAxICBE
YW5vbWkgTWFuY2hlZ28KICAgICAxICBEb21pbmlrIE1pY2hhZWwgUmF1aAogICAgIDEgIE5pY29s
YSBEaSBMaWV0bwogICAgIDEgIE5pY29sYXMgQ2F2YWxsYXJpCiAgICAgMSAgTmljb2xhcyBQT0lS
T1QKICAgICAxICBRdWVudGluIFNjaHVsegogICAgIDEgIFNoYWhhYiBWYWhlZGkKICAgICAxICDQ
m9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikKCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
