Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5928FC25B75
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 08:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DEC4065C;
	Tue,  7 May 2024 08:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5uTCHDY2Nv4; Tue,  7 May 2024 08:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 850324065D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 850324065D;
	Tue,  7 May 2024 08:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE6C11BF31B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D4340580
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpz93RwncySu for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 08:44:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A8064053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A8064053D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A8064053D
 for <buildroot@buildroot.org>; Tue,  7 May 2024 08:44:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D020E0004
 for <buildroot@buildroot.org>; Tue,  7 May 2024 08:44:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4GRP-004EHR-2P
 for buildroot@buildroot.org; Tue, 07 May 2024 10:44:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 07 May 2024 10:44:51 +0200
Message-ID: <874jbaxb7g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.2 released
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
MjQuMDIuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDI0LjAyLjIgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjQuMDIgLjFyZWxlYXNlLgoKLSBTZWN1cml0
eTogVGhlIC9kZXYvc2htIGVudHJ5IGluIHRoZSBkZWZhdWx0IC9ldGMvZnN0YWIgdXNlZCBmb3IK
ICBidXN5Ym94IGFuZCBzeXN2IGluaXQgc3lzdGVtcyB3YXMgbWlzc2luZyB0aGUgc3RpY2t5IGJp
dCwgYWxsb3dpbmcKICB1c2VycyB0byBkZWxldGUgYW5kIHJlcGxhY2Ugb3RoZXIgdXNlcnMgZmls
ZXMuCgogIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI0LTM0NDU1Cgot
IFNlY3VyaXR5IGZpeGVzIGZvciBhcGFjaGUsIGJvdGFuLCBkb2NrZXItZW5naW5lLCBnbywgbGli
Y3VybCwgbWJlZHRscywKICBza2VsZXRvbi1pbml0LXN5c3YsIHdvbGZzc2wKCi0gRml4ZXMgZm9y
IGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4KICBicmNtZm1h
Y19zZGlvLWZpcm13YXJlLXJwaSwgY2xhbWF2LCBjbWFrZSwgY29udGFpbmVyZCwgY3J1Y2libGUs
CiAgZG1lbnUtd2F5bGFuZCwgZG1yYWlkLCBkb2NrZXItY2xpLCBkb21vdGljeiwgZm1jLCBmcmVl
aXBtaSwgZ2RhbCwgZ2RiLAogIGdpZmxpYiwgZ251cGcyLCBnb29nbGUtYnJlYWtwYWQsIGdvb2ds
ZWZvbnRkaXJlY3RvcnksIGlteC1ncHUtdml2LAogIGluaWgsIGxpYmFzc3VhbiwgbGliYmxvY2tk
ZXYsIGxpYmRybSwgbGliZ3BnLWVycm9yLCBsaWJrc2JhLCBsaWJucHRoLAogIGxpYnJlc3NsLCBs
aWJ0cmFjZWZzLCBseGMsIG1lc2EzZCwgb2F0cHAsIG9wZW5zYywgb3Byb2ZpbGUsCiAgcGVybC1u
ZXQtc3NsZWF5LCBwZXRpdGJvb3QsIHBocC14ZGVidWcsIHBzcGxhc2gsIHB5dGhvbi1weXBuZywK
ICBweXRob24tc2Vnbm8sIHB5dGhvbi1zZXJ2aWNlLWlkZW50aXR5LCBweXRob24zLCBzeXN0ZW1k
LCB0Y2YtYWdlbnQsCiAgdGlmZiwgdXV1LCB4bXJpZywgemljCgpGb3IgbW9yZSBkZXRhaWxzLCBz
ZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290
L3BsYWluL0NIQU5HRVM/aWQ9MjAyNC4wMi4yCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2Fn
ZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFs
bCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cg
LXNuIDIwMjQuMDIuMS4uCgogICAgMjUgIEZhYnJpY2UgRm9udGFpbmUKICAgICA2ICBGcmFuY29p
cyBQZXJyYWQKICAgICA2ICBSb21haW4gTmFvdXIKICAgICA0ICBCZXJuZCBLdWhscwogICAgIDQg
IENocmlzdGlhbiBTdGV3YXJ0CiAgICAgNCAgUGV0ZXIgS29yc2dhYXJkCiAgICAgNCAgWWFubiBF
LiBNT1JJTgogICAgIDMgIEp1bGllbiBPbGl2YWluCiAgICAgMiAgQ2hyaXN0aWFuIEhpdHoKICAg
ICAyICBHaXVsaW8gQmVuZXR0aQogICAgIDIgIFNlbiBIYXN0aW5ncwogICAgIDIgIFRob21hcyBQ
ZXRhenpvbmkKICAgICAxICBBbmRyZWFzIE5hdW1hbm4KICAgICAxICBCZW4gSHV0Y2hpbmdzCiAg
ICAgMSAgRGFyaW8gQmluYWNjaGkKICAgICAxICBEYXZpZCBHb3VhcmluCiAgICAgMSAgRmFiaW8g
RXN0ZXZhbQogICAgIDEgIEZyYW5jb2lzIER1Z2FzdAogICAgIDEgIEhlaWtvIFRoaWVyeQogICAg
IDEgIExhdXJlbnQgVml2aWVyCiAgICAgMSAgTWFyY3VzIEhvZmZtYW5uCiAgICAgMSAgTmlzYXJn
IEpoYXZlcmkKICAgICAxICBOb3JiZXJ0IExhbmdlCiAgICAgMSAgUGV0ZXIgU2VpZGVyZXIKICAg
ICAxICBQZXRyIFZvcmVsCiAgICAgMSAgUmFwaGHDq2wgTcOpbG90dGUKICAgICAxICBUaG9tYXMg
RGUgU2NoYW1waGVsZWlyZQogICAgIDEgIFZpbmNlbnQgRmF6aW8KICAgICAxICBXb2pjaWVjaCBO
aXppbnNraQoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
