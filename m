Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8709EE80A93
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 06:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C3176100B;
	Wed, 27 Sep 2023 06:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C3176100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id miHzVssksyWr; Wed, 27 Sep 2023 06:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5428E60FC8;
	Wed, 27 Sep 2023 06:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5428E60FC8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC89D1BF23C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95B0760FC8
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95B0760FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnSNUADLuqse for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 06:06:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2403E60BE4
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 06:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2403E60BE4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F8EE1BF204
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 06:06:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qlNhH-004tBy-B0
 for buildroot@buildroot.org; Wed, 27 Sep 2023 08:06:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 08:06:55 +0200
Message-ID: <87h6ngup34.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.05.3 released, 2023.05.x series EOL
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
MjMuMDUuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA1LjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA1LjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjA1LjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MDUuMiByZWxlYXNlLgoKLSBEZWZjb25maWdzOiBQQyB4ODYtNjQgYmlvcy9lZmk6IE5lZWRzIGxp
YmVsZi4gUmFzcGJlcnJ5cGk6CiAgQWxzbyBlbmFibGUgSERNSSBjb25zb2xlIHdoZW4gc3lzdGVt
ZCBpcyB1c2VkLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXN0ZXJpc2ssIGNsYW1hdiwgY29ubm1h
biwgY3VwcywgZnJlZXJkcCwKICBmcmVlc3dpdGNoLCBnaG9zdHNjcmlwdCwgZ3J1YjIsIGhhcHJv
eHksIGh3bG9jLCBpbnRlbC1taWNyb2NvZGUsCiAgaXJzc2ksIGxpYmN1cmwsIGxpYmp4bCwgbGli
bW9kc2VjdXJpdHksIGxpYnBqc2lwLCBsaWJxYiwgbGlicmF3LAogIGxpYnRvbW1hdGgsIGxsZHBk
LCBtb3NxdWl0dG8sIG11dHQsIG5ldGF0YWxrLCBudHBzZWMsIG9wZW5qZGssCiAgb3Blbmpkay1i
aW4sIG9wZW5zYywgcGhwLCBwb3BwbGVyLCBwb3N0Z3Jlc3FsLCBweXRob24tZGphbmdvLAogIHB5
dGhvbi10b3JuYWRvLCBweXRob24zLCBzYW1iYTQsIHNjcmVlbiwgc25ncmVwLCBzdHJvbmdzd2Fu
LCB2aW0sCiAgd2Via2l0Z3RrLCB3ZWJwLCB3aXJlc2hhcmssIHh0ZXJtCgotIEZpeGVzIGZvciBk
b3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFnZW50cHAsCiAg
YXQ5MWRhdGFmbGFzaGJvb3QsIGJlcmtlbGV5ZGIsIGNvbXBpbGVyLXJ0LCBkdCwgZXhwZWN0LCBm
aW8sIGZzdHJjbXAsCiAgZ2NjLCBnZGIsIGdtcCwgZ28sIGxpYmdsaWIyLCBsaWJrcywgbGVzcywg
bHNvZiwgbXBkLCBtcHYsCiAgbXYtZGRyLW1hcnZlbGwsIG5lMTAsIG5mdGFibGVzLCBub2RlanMs
IG51dCwgb3BlbmJsYXMsIG9wZW5zc2gsCiAgcGNtLXRvb2xzLCBwZXJmdGVzdCwgcGV0aXRib290
LCBweXRob24zLCBxdDUsIHJhbXNwZWVkLCBydGw4MTg5ZnMsCiAgcnRsODgxMmF1LWFpcmNyYWNr
LW5nLCBzY3JlZW5mZXRjaCwgc29maWEtc2lwLCBzdGVsbGFyaXVtLCBzdHJlc3MtbmcsCiAgdGNs
LCB1Ym9vdCwgdWNsaWJjLCB4ZnNwcm9ncywgeHNlcnZlcl94b3JnLXNlcnZlciwgenhpbmctY3Bw
CgotIFZhcmlvdXMgZml4ZXMgdG8gdGhlIENQRSAvIENWRSBpZ25vcmUgbWFya2luZ3MKCi0gTmV3
IHBhY2thZ2VzOiB4bGliX2xpYlhwcmVzZW50CgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENI
QU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NI
QU5HRVM/aWQ9MjAyMy4wNS4zCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0
cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVv
cGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMu
MDUuMi4uCgogICAgMzAgIEZhYnJpY2UgRm9udGFpbmUKICAgIDI3ICBCZXJuZCBLdWhscwogICAg
MjAgIERhbmllbCBMYW5nCiAgICAxMyAgVGhvbWFzIFBldGF6em9uaQogICAgMTEgIFdhbGRlbWFy
IEJyb2Rrb3JiCiAgICAxMCAgSnVsaWVuIE9saXZhaW4KICAgICA5ICBQZXRlciBLb3JzZ2FhcmQK
ICAgICA3ICBZYW5uIEUuIE1PUklOCiAgICAgNSAgQ2zDqW1lbnQgUmFtaXJlegogICAgIDQgIEFu
ZHJlYXMgWmllZ2xlcgogICAgIDQgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgNCAgR2l1bGlvIEJl
bmV0dGkKICAgICA0ICBSb21haW4gTmFvdXIKICAgICAzICBKZW5zIE1hdXMKICAgICAyICBBZGFt
IER1c2tldHQKICAgICAyICBCYXJ0b3N6IEJpbGFzCiAgICAgMiAgQmFydWNoIFNpYWNoCiAgICAg
MiAgQ2xlbWVudCBSYW1pcmV6CiAgICAgMiAgTWFyY2luIE5pZXN0cm9qCiAgICAgMiAgTmVhbCBG
cmFnZXIKICAgICAyICBUaG9tYXMgRGV2b29nZHQKICAgICAyICBZYW5naGFvIENoZW5nCiAgICAg
MSAgQWxleGFuZGVyIFN2ZXJkbGluCiAgICAgMSAgQWxleGV5IFJvc2x5YWtvdgogICAgIDEgIEFy
bm91dCBWYW5kZWNhcHBlbGxlCiAgICAgMSAgRnJhbmNvaXMgUGVycmFkCiAgICAgMSAgRnJhbmsg
VmFuYmV2ZXIKICAgICAxICBOaWNvbGFzIEJvaWNoYXQKICAgICAxICBOaWNvbGFzIENhcnJpZXIK
ICAgICAxICBQZXRlciBTZWlkZXJlcgogICAgIDEgIFJhcGhhw6tsIE3DqWxvdHRlCiAgICAgMSAg
UmV6YSBBcmJhYgogICAgIDEgIFN0ZWZhbiBBZ25lcgoKTm90aWNlOiBUaGlzIHdpbGwgYmUgdGhl
IGxhc3QgdXBkYXRlIGZvciAyMDIzLjA1LnguIFBsZWFzZSBtaWdyYXRlIHRvCnRoZSAyMDIzLjA4
Lnggc2VyaWVzIGluc3RlYWQuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
