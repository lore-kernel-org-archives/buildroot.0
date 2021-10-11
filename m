Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0126AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 12:40:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B55F60E9C
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 12:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B55F60E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1775A60829;
	Mon, 11 Oct 2021 12:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ap021A_0gj66; Mon, 11 Oct 2021 12:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A63605F5;
	Mon, 11 Oct 2021 12:40:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC9551BF3EF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 12:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB96840327
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 12:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ro0KDhK--Rct for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 12:40:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 086F2400A4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 12:40:18 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0BE0DFF817
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 12:40:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mZubH-0006xu-Cy
 for buildroot@buildroot.org; Mon, 11 Oct 2021 14:40:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 14:40:15 +0200
Message-ID: <87o87vpweo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.08.1 released
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
MjEuMDguMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA4LjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA4LjEudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wOC4xIGlzIGEgYnVnZml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBv
cnRhbnQgLwpzZWN1cml0eSByZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIx
LjA4IHJlbGVhc2UuCgotIGdkYmluaXQ6IE1hcmsgdGhlIHN5c3Jvb3QgYXMgYSAic2FmZSBwYXRo
IiBiZWZvcmUgY29uZmlndXJpbmcJaXQsIHNvCiAgcHJldHR5IHByaW50ZXJzIHdvcmsgY29ycmVj
dGx5IHdpdGhvdXQgaGF2aW5nIHRvIHBhc3MJLWl4IHRvIGdkYgoKLSBTZWN1cml0eSBmaXhlcyBm
b3IgYXBhY2hlLCBhdGZ0cCwgYmluZCwgYm90YW4sIGNvbnRhaW5lcmQsIGNyeXB0b3BwLAogIGZl
dGNobWFpbCwgZ2QsIGdob3N0c2NyaXB0LCBnbywgaGFwcm94eSwgbGliY3VybCwgbGliZXhpZiwg
bGlia3JiNSwKICBsaWJzbmRmaWxlLCBsaWJzc2gsIGxpYnZpcnQsIGxpYnhjcnlwdCwgbGlieWFu
ZywgbHlueCwgbW9zcXVpdHRvLAogIG5vZGVqcywgbnRmcy0zZywgb3Blbmpkaywgb3Blbmpkay1i
aW4sIG9wZW5zc2gsIHBocCwgcHl0aG9uLXBpbGxvdywKICBweXRob24tcGlwLCByZWRpcywgc3F1
aWQsIHVjbGliYywgdmltLCB3ZWJraXRndGssIHdwZXdlYmtpdCwgeGVuCgotIEZpeGVzIGZvciBk
b3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFsc2EtbGliLAog
IGFybS10cnVzdGVkLWZpcm13YXJlLCBjb2csIGRhc2gsIGRjM2RkLCBkb2NrZXItY2xpLCBkb2Nr
ZXItZW5naW5lLAogIGRvdmVjb3QsIGVudmlyb25tZW50LXNldHVwLCBlcmxhbmcsIGZmbXBlZywg
ZmlvLCBnY2MsIGdkYiwgZ251cmFkaW8sCiAgZ251dGxzLCBnb2JqZWN0LWludHJvc3BlY3Rpb24s
IGdvb2dsZS1icmVha3BhZCwgZ3N0LW9teCwKICBnc3QxLWRldnRvb2xzLCBnc3QxLWludGVycGlw
ZSwgZ3N0MS1saWJhdiwgZ3N0MS1wbHVnaW5zLWJhZCwKICBnc3QxLXBsdWdpbnMtYmFzZSwgZ3N0
MS1wbHVnaW5zLWdvb2QsIGdzdDEtcGx1Z2lucy11Z2x5LCBnc3QxLXB5dGhvbiwKICBnc3QxLXJ0
c3Atc2VydmVyLCBnc3QxLXZhYXBpLCBnc3RyZWFtZXIxLCBnc3RyZWFtZXIxLWVkaXRpbmctc2Vy
dmljZXMsCiAgZ3VwbnAsIGltbGliMiwga29kaSwga29kaS1wdnItb2N0b25ldCwga29kaS12aXN1
YWxpc2F0aW9uLWZpc2hibWMsCiAgbGliZ2NyeXB0LCBsaWJnbGliMiwgbGlicmVzc2wsIGxpYnJz
dmcsIGxpYnZpcnQsIGxpbmtzLCBsdm0yLCBseGMsCiAgbWVzYTNkLCBtaWNyb3B5dGhvbiwgbWlu
aWNvbSwgbW9ubywgbXRyLCBtdXBkZiwgbXYtZGRyLW1hcnZlbGwsCiAgbmV0LXRvb2xzLCBuZ2lu
eC1kYXYtZXh0LCBubWFwLCBvcGVuamRrLCBvcGVubGRhcCwgcGNyZTIsIHBocC1nbnVwZywKICBw
aXBld2lyZSwgcG9zdGdpcywgcHl0aG9uLWFpb2NvbnNvbGUsIHB5dGhvbi1jYm9yMiwgcHl0aG9u
LWNmZmksCiAgcHl0aG9uLWN5dGhvbiwgcHl0aG9uLWRhdGV1dGlsLCBweXRob24tZGphbmdvLCBw
eXRob24tdGV4dHRhYmxlLAogIHB5dGhvbi11cmxsaWIzLCBweXRob24td2Vib2IsIHFlbXUsIHF0
NWxvY2F0aW9uLCByZWZwb2xpY3ksIHJpcGdyZXAsCiAgcnVieSwgcnVuYywgc2lzcG1jdGwsIHNv
eCwgc3Ryb25nc3dhbiwgc3VwZXJ2aXNvciwgc3lzbGludXgsCiAgc3lzbG9nLW5nLCBzeXN0ZW1k
LCBzd3VwZGF0ZSwgdGlueWNib3IsIHRyYWNlLWNtZCwgdWJvb3QtdG9vbHMsCiAgdWRpc2tzLCB1
aGQsIHZzZnRwZCwgd2F2ZW1vbiwgd2dldCwgd2lyZWxlc3MtcmVnZGIsIHhhcHBfeHJkYiwKICB4
YXBwX3h3ZCwgeGxpYl9saWJYZm9udDIsIHhsaWJfbGliWGZ0LCB4c2VydmVyX3hvcmctc2VydmVy
LCB6aXAKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9n
aXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIxLjA4LjEKClVz
ZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1
cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRo
aXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMS4wOC4uCgogICAgNTMgIEZhYnJpY2Ug
Rm9udGFpbmUKICAgIDE5ICBQZXRlciBTZWlkZXJlcgogICAgMTYgIFBldGVyIEtvcnNnYWFyZAog
ICAgMTMgIEdpdWxpbyBCZW5ldHRpCiAgICAxMiAgSmFtZXMgSGlsbGlhcmQKICAgIDExICBSb21h
aW4gTmFvdXIKICAgICA5ICBGcmFuY29pcyBQZXJyYWQKICAgICA4ICBCZXJuZCBLdWhscwogICAg
IDUgIEFzYWYgS2FobG9uCiAgICAgNSAgQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9vdAog
ICAgIDQgIFBldHIgVm9yZWwKICAgICAzICBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgMyAg
WWFubiBFLiBNT1JJTgogICAgIDIgIEFkYW0gRHVza2V0dAogICAgIDIgIENocmlzIFBhY2toYW0K
ICAgICAyICBFZGdhciBCb25ldAogICAgIDIgIElsbGlhIEJpdGtvdgogICAgIDIgIEphbWVzIEtu
aWdodAogICAgIDIgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAyICBSYXBoYcOrbCBNw6lsb3R0ZQog
ICAgIDIgIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlCiAgICAgMiAgVGl0b3VhbiBDaHJpc3RvcGhl
CiAgICAgMSAgQWRyaWFuIEFtYWdsaW8KICAgICAxICBBbmdlbG8gQ29tcGFnbnVjY2kKICAgICAx
ICBBbnRvaW5lIFRlbmFydAogICAgIDEgIEJhcnVjaCBTaWFjaAogICAgIDEgIENocmlzdGlhbiBT
dGV3YXJ0CiAgICAgMSAgSm9hY2hpbSBXaWJlcmcKICAgICAxICBLb3J5IE1haW5jZW50CiAgICAg
MSAgS3J6eXN6dG9mIEthbmFzCiAgICAgMSAgTWFydGluIEVsc2h1YmVyCiAgICAgMSAgTWF4aW0g
S29jaGV0a292IHZpYSBidWlsZHJvb3QKICAgICAxICBNaWNoYWVsIEZpc2NoZXIKICAgICAxICBO
aWNvbGFzIENhdmFsbGFyaQogICAgIDEgIFF1ZW50aW4gU2NodWx6CiAgICAgMSAgU2FtIFZvc3MK
ICAgICAxICBTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDEgIFRob21hcyBQZXRhenpvbmkKICAg
ICAxICBXYWxkZW1hciBCcm9ka29yYgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
