Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE3DC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 741CB4210A;
	Mon, 15 Jan 2024 19:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 741CB4210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpftKmzHYufn; Mon, 15 Jan 2024 19:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABA50426BA;
	Mon, 15 Jan 2024 19:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA50426BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAD221BF424
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 19:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA0742CE1
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 19:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA0742CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e43iNTl1AX_f for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 19:58:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56672426C2
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 19:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56672426C2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1385040002
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 19:58:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rPT6a-00EnGV-10
 for buildroot@buildroot.org; Mon, 15 Jan 2024 20:58:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 20:58:44 +0100
Message-ID: <878r4qjrm3.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.9 released
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
MjMuMDIuOSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjkudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjkudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjkgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuOCByZWxlYXNlLgoKLSBJbmZyYXN0
cnVjdHVyZToKCiAgLSBEb3dubG9hZDogUmV2ZXJ0IGEgcGVybWlzc2lvbiBmaXh1cCBzdGVwIGlu
IHRoZSB0YXJiYWxsIGNyZWF0aW9uCiAgICBsb2dpYywgd2hpY2ggbGVhZCB0byBhIGhhc2ggbWlz
bWF0Y2ggaXNzdWUgaW4gdHdvIGNhcmdvLXZlbmRvcmVkCiAgICBwYWNrYWdlcywgcmlwZ3JlcCBh
bmQgc2VudHJ5LWNsaS4KCiAgLSBCdWlsZDogUGFzcyBHSVRfRElSPS4gaW4gdGhlIGVudmlyb25t
ZW50ICh0aHJvdWdoCiAgICBIT1NUX01BS0VfRU5WL1RBUkdFVF9NQUtFX0VOVikgdG8gdGhlIGJ1
aWxkIHN0ZXBzIHRvIHdvcmthcm91bmQKICAgIHBhY2thZ2VzIHRyeWluZyB0byBkZXRlY3QgaWYg
dGhleSBhcmUgYnVpbGRpbmcgaW4gYSBnaXQgY2hlY2tvdXQgYW5kCiAgICBnZXR0aW5nIGNvbmZ1
c2VkIHdoZW4gYnVpbGRpbmcgaW4gYSBzdWIgZGlyZWN0b3J5IG9mIGEgQnVpbGRyb290IGdpdAog
ICAgY2hlY2tvdXQuCgotIFNlY3VyaXR5IGZpeGVzIGZvciBjanNvbiwgZHJvcGJlYXIsIGV4aW0s
IGZhYWQyLCBmcmVlc3dpdGNoLCBnaWZsaWIsCiAgZ28sIGdzdDEtcGx1Z2lucy1iYWQsIGpxLCBr
c21iZC10b29scywgbGliY3VybCwgbGliZWJtbCwgbGlic3NoLAogIGxpYnNzaDIsIGxpYnVldiwg
bWljcm9weXRob24sIG1wNHYyLCBvcGVuc2MsIG9wZW5zc2gsIHBocCwgcHJvZnRwZCwKICBwdXR0
eSwgcHl0aG9uLXdlcmt6ZXVnLCBzaGltLCBzcXVpZCwgc3Ryb25nc3dhbiwgdGlueXNzaCwgdG9y
LCB1ZnRwLAogIHdpcmVzaGFyaywgd29sZnNzbCwgeHNlcnZlcl94b3JnLXNlcnZlciwgeHdheWxh
bmQKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1
ZXMgaW4gYXBjdXBzZCwKICBhcm0tdHJ1c3RlZC1maXJtd2FyZSwgYm90YW4sIGN1cHMsIGR1a3Rh
cGUsIGVkazIsIGdjYywgZ2RhbCwgZ2RiLAogIGdsaWJjLCBnbywgZ29vZ2xlLWJyZWFrcGFkLCBn
c3Qtb214LCBnc3RkLCBnc3QxLWRldnRvb2xzLCBnc3QxLWxpYmF2LAogIGdzdDEtcGx1Z2lucy1i
YWQsIGdzdDEtcGx1Z2lucy1iYXNlLCBnc3QxLXBsdWdpbnMtZ29vZCwKICBnc3QxLXBsdWdpbnMt
dWdseSwgZ3N0MS1weXRob24sIGdzdDEtcnRzcC1zZXJ2ZXIsIGdzdDEtdmFhcGksCiAgZ3N0cmVh
bWVyMSwgZ3N0cmVhbWVyMS1lZGl0aW5nLXNlcnZpY2VzLCBpcGNhbGMsIGpzb24tZm9yLW1vZGVy
bi1jcHAsCiAgbGliYWlvLCBsaWJjYW1lcmEsIGxpYmNhcC1uZywgbGliZ3RrMywgbGliaWVjNjE4
NTAsIGxpYnJhdywKICBsaWJzaWdzZWd2LCBsaWJ3ZWJzb2NrZXRzLCBsaXF1aWQtZHNwLCBsdm0y
LCBtYWRwbGF5LCBtZXNhM2QsCiAgbWljcm9weXRob24sIG9yYywgcGlwZXdpcmUsIHBvc3RnaXMs
IHBvc3RncmVzcWwsIHB5dGhvbi1zaXAsCiAgcm5nLXRvb2xzLCBzd2F5LCB0cmVlLCB2YWxpanNv
biwgeHdheWxhbmQKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0
cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIzLjAy
LjkKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdl
ZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5n
IHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4wMi44Li4KCiAgICA0OSAg
RmFicmljZSBGb250YWluZQogICAgMzkgIFBldGVyIEtvcnNnYWFyZAogICAgMjUgIEJlcm5kIEt1
aGxzCiAgICAgOSAgQWRhbSBEdXNrZXR0CiAgICAgNyAgVGhvbWFzIFBldGF6em9uaQogICAgIDMg
IEJhcnVjaCBTaWFjaAogICAgIDMgIFBldGVyIFNlaWRlcmVyCiAgICAgMiAgQWxleGV5IEJyb2Rr
aW4KICAgICAyICBDaHJpc3RpYW4gSGl0egogICAgIDIgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAy
ICBZYW5uIEUuIE1PUklOCiAgICAgMSAgQWxleGFuZGVyIERhaGwKICAgICAxICBDaHJpc3RpYW4g
U3Rld2FydAogICAgIDEgIEZyYW5jb2lzIFBlcnJhZAogICAgIDEgIEp1bGllbiBPbGl2YWluCiAg
ICAgMSAgTG91aXMgQ2hhdXZldAogICAgIDEgIE1heGltIEtvY2hldGtvdgogICAgIDEgIFJhbGYg
RHJhZ29uCiAgICAgMSAgUmFwaGFlbCBQYXZsaWRpcwogICAgIDEgIFPDqWJhc3RpZW4gU3p5bWFu
c2tpCiAgICAgMSAgVGhvbWFzIERldm9vZ2R0CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
