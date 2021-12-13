Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFB0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 23:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74A964019D;
	Mon, 13 Dec 2021 23:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBViEs9kKoLp; Mon, 13 Dec 2021 23:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F591404C4;
	Mon, 13 Dec 2021 23:05:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE07B1BF3B5
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 23:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E95A960AFD
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 23:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvlhY6nbkI2g for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 23:05:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9AA660A9B
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 23:05:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AB884200005
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 23:05:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mwuNa-0003Km-Hg
 for buildroot@buildroot.org; Tue, 14 Dec 2021 00:05:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 00:05:10 +0100
Message-ID: <87wnk8rtqx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.08.3 released, 2021.08.x EOL
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
MjEuMDguMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA4LjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA4LjMudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wOC4zIGlzIGEgYnVnZml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBv
cnRhbnQgLwpzZWN1cml0eSByZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIx
LjA4LjIgcmVsZWFzZS4KCi0gRml4ZWQgYSBudW1iZXIgb2YgZGVmY29uZmlnIGJ1aWxkIGlzc3Vl
cyB3aXRoIGdjYyA+PSAxMCBob3N0IG9yIHRhcmdldAogIGNvbXBpbGVycwoKLSBTZWN1cml0eSBm
aXhlcyBmb3IgYmx1ZXo1X3V0aWxzLCBnbXAsIGljdSwgamFudXMtZ2F0ZXdheSwKICBsaWJtb2Rz
ZWN1cml0eSwgbGlibnNzLCBwaHAsIHBvc3RncmVzcWwsIHB1cmUtZnRwZCwgc2FtYmE0LCBzdXJp
Y2F0YSwKICB2aW0sIHdpcmVzaGFyawoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24v
cnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhbHNhLWxpYiwKICBhcHBhcm1vciwgYXByLCBhc3Rl
cmlzaywgYmludXRpbHMsIGNvcmV1dGlscywgZTJmc3Byb2dzLCBleGZhdCwKICBmcmVlc3dpdGNo
LCBnZGIsIGdsbWFyazIsIGdsb2csIGdsb3J5dHVuLCBncHUtYW1kLWJpbi1teDUxLAogIGdzdDEt
aW50ZXJwaXBlLCBnc3RyZWFtZXIxLCBndWlsZSwgZ3VwbnAsIGhhY2tyZiwgaGVpbWRhbCwgaGlh
d2F0aGEsCiAgaHBsaXAsIGlzbCwgaW14LXZwdXdyYXAsIGxpYmF0b21pY19vcHMsIGxpYmJzb24s
IGxpYmRuZXQsIGxpYmZmaSwKICBsaWJnZGlwbHVzLCBsaWJnZWUsIGxpYmdsaWIyLCBsaWJodHAs
IGxpYm5zcHIsIGxpYm5zcywgbGlib3NtaXVtLAogIGxpYnVud2luZCwgbHlueCwgbWVzb24sIG1p
Y3JvcHl0aG9uLCBta3Bhc3N3ZCwgbWtzaCwgbW9zcXVpdHRvLAogIG1vdGlvbiwgbXVwZGYsIG14
bWwsIG5ldGRhdGEsIG5mcy11dGlscywgb3BlbmN2NCwgb3JhY2xlLW15c3FsLCBwY3JlLAogIHB5
dGhvbi1jeWNsZXIsIHFkZWNvZGVyLCByY3ctc21hcmMtc2FsMjgsIHNtYWNrLCBzcGVleCwgc3Ry
ZXNzLW5nLAogIHN5c2xpbnV4LCB1Ym9vdCwgdW5peG9kYmMsIHVucmFyLCB3ZWJzb2NrZXRwcAoK
Rm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWls
ZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjEuMDguMwoKVXNlcnMgb2Yg
dGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUu
CgpOb3RpY2UgdGhhdCB0aGUgMjAyMS4wOC54IHNlcmllcyBpcyBub3cgRU5EIE9GIExJRkUuIFBs
ZWFzZSBtaWdyYXRlIHRvCnRoZSAyMDIxLjExLnggc2VyaWVzIGluc3RlYWQgd2hpY2ggd2lsbCBi
ZSBzdXBwb3J0ZWQgdW50aWwgdW50aWwgQXByaWwKMjAyMi4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0
aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNu
IDIwMjEuMDguMi4uCgogICAgNjcgIEZhYnJpY2UgRm9udGFpbmUKICAgIDEyICBQZXRlciBLb3Jz
Z2FhcmQKICAgIDEyICBZYW5uIEUuIE1PUklOCiAgICAgNiAgQmVybmQgS3VobHMKICAgICAzICBT
w6liYXN0aWVuIFN6eW1hbnNraQogICAgIDIgIENhcmxvcyBTYW50b3MKICAgICAyICBKb2FjaGlt
IFdpYmVyZwogICAgIDIgIFJvbWFpbiBOYW91cgogICAgIDIgIFRpdG91YW4gQ2hyaXN0b3BoZQog
ICAgIDEgIEJhcnVjaCBTaWFjaAogICAgIDEgIEZhYmlvIEVzdGV2YW0KICAgICAxICBHaXVsaW8g
QmVuZXR0aQogICAgIDEgIEphbWVzIEhpbGxpYXJkCiAgICAgMSAgSm9obiBLZWVwaW5nCiAgICAg
MSAgTHVjYSBDZXJlc29saQogICAgIDEgIE1hcmt1cyBNYXllcgogICAgIDEgIE1heGltIEtvY2hl
dGtvdgogICAgIDEgIFBldGVyIFNlaWRlcmVyCiAgICAgMSAgVGhvbWFzIFBldGF6em9uaQogICAg
IDEgIFVyamEgUmFubmlra28KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
