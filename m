Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33F5C83F38
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 18:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2966D831C1;
	Thu, 31 Aug 2023 18:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2966D831C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ec9J65ipnqAs; Thu, 31 Aug 2023 18:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F61381F61;
	Thu, 31 Aug 2023 18:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F61381F61
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAAD1BF23B
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 18:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4157541EF4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 18:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4157541EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hANIwm51bmHT for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 18:11:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAE0B41EF2
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 18:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAE0B41EF2
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE9BA6000A
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 18:10:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qbm8B-000z6J-3c
 for buildroot@buildroot.org; Thu, 31 Aug 2023 20:10:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 20:10:58 +0200
Message-ID: <87ledrkrpp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.05.2 released
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
MjMuMDUuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA1LjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjA1LjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjA1LjIgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMu
MDUuMSByZWxlYXNlLgoKLSBDb3JyZWN0bHkgbWFyayBCb290bGluIGV4dGVybmFsIHRvb2xjaGFp
bnMgYXMgaGF2aW5nIE9wZW5NUCBzdXBwb3J0CgotIEVuc3VyZSB1dGlscy9kb2NrZXItcnVuIGNv
cnJlY3RseSBzdXBwb3J0cyBnaXQgd29ya3RyZWVzLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgZG1p
ZGVjb2RlLCBpcGVyZjMsIGxpYmN1cmwsIGxpYm9wZW5zc2wsCiAgZ2hvc3RzY3JpcHQsIGdvLCBv
cGVuc3NoLCBzYW1iYTQsIHRwbTItdHNzLCB3ZWJraXRndGssIHdwZXdlYmtpdAoKLSBGaXhlcyBm
b3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbgogIGFybS10
cnVzdGVkLWZpcm13YXJlLCBiaW5kLCBjYWlybywgY21vY2thLCBjb250YWluZXJkLCBjcnVkaW5p
LAogIGNyeXB0b2Rldi1saW51eCwgZmZtcGVnLCBmaXJtd2FyZS1pbXgsIGdjYywgZ2RiLCBna3Jl
bGxtLCBnbnVyYWRpbywKICBpZ2gtZXRoZXJjYXQsIGtvZGksIGxpYnNzaCwgbGlidWJvb3RlbnYs
IGxpbnV4LXRvb2xzLCBtYWxpLWRyaXZlciwKICBuZnMtdXRpbHMsIG50cCwgcGhwLCBwaXBld2ly
ZSwgcHl0aG9uLWluaXBhcnNlLCBweXRob24taXB0YWJsZXMsCiAgcHl0aG9uLXB5c21iLCBydGw4
MTg5ZXMsIHJ0bDgxODlmcywgc2FtLWJhLCBzZWF0ZCwgc2hhZG93LCBzcGVleCwKICBzdW54aS1t
YWxpLXV0Z2FyZC1kcml2ZXIsIHN1cGVydHV4a2FydCwgc3lzZGlnLCB0b3IsIHRyYW5zbWlzc2lv
biwKICB1Ym9vdCwgdW56aXAsIHdpcmVsZXNzLXJlZ2RiLCB3b2xmc3NsLCB3cGV3ZWJhY2tlbmQt
ZmRvLCB4ZW5vbWFpLAogIHlhbWwtY3BwCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5H
RVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5H
RVM/aWQ9MjAyMy4wNS4yCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9u
Z2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxl
IGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMuMDUu
MS4uCgogICAgNDMgIEJlcm5kIEt1aGxzCiAgICAgNiAgR2l1bGlvIEJlbmV0dGkKICAgICAzICBK
YW1lcyBIaWxsaWFyZAogICAgIDMgIFBldGVyIEtvcnNnYWFyZAogICAgIDIgIEJyYW5kb24gTWFp
ZXIKICAgICAyICBDaGFybGVzIEhhcmRpbgogICAgIDIgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAg
MiAgSnVsaWVuIE9saXZhaW4KICAgICAyICBMYW5nIERhbmllbAogICAgIDIgIExvdGhhciBGZWx0
ZW4KICAgICAyICBMdWNhIENlcmVzb2xpCiAgICAgMiAgU2VyZ2V5IEJvYnJlbm9rCiAgICAgMiAg
VGhvbWFzIFBldGF6em9uaQogICAgIDIgIFZpbmNlbnQgRmF6aW8KICAgICAxICBEYXJpbyBCaW5h
Y2NoaQogICAgIDEgIEZsb3JpYW4gRmFpbmVsbGkKICAgICAxICBHd2VuaGFlbCBHb2F2ZWMtTWVy
b3UKICAgICAxICBKb2VsIENhcmxzb24KICAgICAxICBOZWFsIEZyYWdlcgogICAgIDEgIFBpZXJy
ZSBGaWNoZXV4CiAgICAgMSAgUGlldGVyamFuIENhbWVybHluY2sKICAgICAxICBSb21haW4gTmFv
dXIKICAgICAxICBTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDEgIFZpbmNlbnQgU3RlaGzDqQog
ICAgIDEgIFlhbm4gRS4gTU9SSU4KICAgICAxICBZZWdvciBZZWZyZW1vdgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
