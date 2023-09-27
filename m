Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0C5E82CB9
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 17:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56E0D4037C;
	Wed, 27 Sep 2023 17:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E0D4037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEyxH7j6m_Xf; Wed, 27 Sep 2023 17:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A499041493;
	Wed, 27 Sep 2023 17:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A499041493
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC8C1BF593
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3771B400D9
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3771B400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uranGBZulNu9 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 17:30:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E02874037C
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 17:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E02874037C
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBFEB1BF203
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 17:30:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qlYMy-0053uv-8t
 for buildroot@buildroot.org; Wed, 27 Sep 2023 19:30:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 19:30:40 +0200
Message-ID: <87msx734n3.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.5 released
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
MjMuMDIuNSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjUudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjUudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjUgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuNCByZWxlYXNlLgoKLSBTZWN1cml0
eSBmaXhlcyBmb3IgYXN0ZXJpc2ssIGNsYW1hdiwgY29ubm1hbiwgY3VwcywgZnJlZXJkcCwKICBm
cmVlc3dpdGNoLCBnaG9zdHNjcmlwdCwgZ3J1YjIsIGhhcHJveHksIGh3bG9jLCBpbnRlbC1taWNy
b2NvZGUsCiAgaXJzc2ksIGxpYmNvYXAsIGxpYmN1cmwsIGxpYmp4bCwgbGlibW9kc2VjdXJpdHks
IGxpYnBqc2lwLCBsaWJxYiwKICBsaWJyYXcsIGxpYnRvbW1hdGgsIGxsZHBkLCBtb3NxdWl0dG8s
IG11dHQsIG5ldGF0YWxrLCBudHBzZWMsIG9wZW5qZGssCiAgb3Blbmpkay1iaW4sIG9wZW5zYywg
cGhwLCBwb3BwbGVyLCBwb3N0Z3Jlc3FsLCBweXRob24tZGphbmdvLAogIHB5dGhvbi10b3JuYWRv
LCBweXRob24zLCBzYW1iYTQsIHNjcmVlbiwgc25ncmVwLCBzdHJvbmdzd2FuLCB2aW0sCiAgd2Vi
a2l0Z3RrLCB3ZWJwLCB3aXJlc2hhcmssIHh0ZXJtCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21w
aWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFnZW50cHAsCiAgYXQ5MWRhdGFmbGFz
aGJvb3QsIGJlcmtlbGV5ZGIsIGNvbXBpbGVyLXJ0LCBmaW8sIGZzdHJjbXAsIGdjYywgZ2RiLAog
IGdtcCwgZ28sIGxpYmtzLCBsZXNzLCBtcGQsIG12LWRkci1tYXJ2ZWxsLCBuZTEwLCBuZXR3b3Jr
LW1hbmFnZXIsCiAgbmZ0YWJsZXMsIG5vZGVqcywgbnV0LCBvcGVuYmxhcywgb3BlbnNzaCwgcGNt
LXRvb2xzLCBwZXJmdGVzdCwgcHBwZCwKICBweXRob24zLCBxdDUsIHJhbXNwZWVkLCBydGw4MTg5
ZnMsIHNjcmVlbmZldGNoLCBzb2ZpYS1zaXAsIHN0ZWxsYXJpdW0sCiAgdGNsLCB1Ym9vdCwgdWNs
aWJjLCB4ZnNwcm9ncywgeHNlcnZlcl94b3JnLXNlcnZlciwgenhpbmctY3BwCgpGb3IgbW9yZSBk
ZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQv
YnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMy4wMi41CgpVc2VycyBvZiB0aGUgYWZmZWN0
ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhh
bmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQg
c2hvcnRsb2cgLXNuIDIwMjMuMDIuNC4uCgogICAgMjggIEZhYnJpY2UgRm9udGFpbmUKICAgIDI1
ICBCZXJuZCBLdWhscwogICAgMTkgIERhbmllbCBMYW5nCiAgICAxMiAgVGhvbWFzIFBldGF6em9u
aQogICAgMTEgIFdhbGRlbWFyIEJyb2Rrb3JiCiAgICAxMCAgSnVsaWVuIE9saXZhaW4KICAgIDEw
ICBQZXRlciBLb3JzZ2FhcmQKICAgICA3ICBZYW5uIEUuIE1PUklOCiAgICAgNSAgQ2zDqW1lbnQg
UmFtaXJlegogICAgIDQgIEFuZHJlYXMgWmllZ2xlcgogICAgIDQgIENocmlzdGlhbiBTdGV3YXJ0
CiAgICAgNCAgSmVucyBNYXVzCiAgICAgMyAgR2l1bGlvIEJlbmV0dGkKICAgICAzICBSb21haW4g
TmFvdXIKICAgICAyICBBZGFtIER1c2tldHQKICAgICAyICBCYXJ0b3N6IEJpbGFzCiAgICAgMiAg
QmFydWNoIFNpYWNoCiAgICAgMiAgQ2xlbWVudCBSYW1pcmV6CiAgICAgMiAgTWFyY2luIE5pZXN0
cm9qCiAgICAgMiAgTmVhbCBGcmFnZXIKICAgICAyICBUaG9tYXMgRGV2b29nZHQKICAgICAyICBZ
YW5naGFvIENoZW5nCiAgICAgMSAgQWxleGFuZGVyIFN2ZXJkbGluCiAgICAgMSAgQWxleGV5IFJv
c2x5YWtvdgogICAgIDEgIEZyYW5jb2lzIFBlcnJhZAogICAgIDEgIEZyYW5rIFZhbmJldmVyCiAg
ICAgMSAgTmljb2xhcyBCb2ljaGF0CiAgICAgMSAgTmljb2xhcyBDYXJyaWVyCiAgICAgMSAgUGV0
ZXIgU2VpZGVyZXIKICAgICAxICBSYXBoYcOrbCBNw6lsb3R0ZQogICAgIDEgIFN0ZWZhbiBBZ25l
cgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
