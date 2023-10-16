Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88369CDB482
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 09:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1019661395;
	Mon, 16 Oct 2023 09:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1019661395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rubcrfD0g9hf; Mon, 16 Oct 2023 09:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 549EB61388;
	Mon, 16 Oct 2023 09:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549EB61388
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 191061BF82F
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 09:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBCBE61388
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 09:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCBE61388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roM94F0CDRvb for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 09:19:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57F4C61387
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 09:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F4C61387
Received: by mail.gandi.net (Postfix) with ESMTPSA id 927AD40010
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 09:19:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qsJl6-009JTR-IJ
 for buildroot@buildroot.org; Mon, 16 Oct 2023 11:19:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 11:19:32 +0200
Message-ID: <87a5sivs9n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.6 released
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
MjMuMDIuNiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjYudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjYudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjYgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuNSByZWxlYXNlLgoKLSBQZXItcGFj
a2FnZSBidWlsZHM6IERvIG5vdCB1c2UgaGFyZCBsaW5rcyBmb3IgaG9zdCAvIHRhcmdldCBkaXJz
LAogIGZpeGluZyBpc3N1ZXMgd2l0aCBwYWNrYWdlIHJlYnVpbGRzIG9yIHBvc3QtYnVpbGQgc2Ny
aXB0cwogIG1vZGlmaWNhdGlvbnMuCgotIEluZnJhc3RydWN0dXJlOiBFeHBsaWNpdGx5IGRpc2Fi
bGUgc2h1ZmZsZSBtb2RlIGZvciBNYWtlID49IDQuNCB3aGVyZQogIG5lZWRlZC4KCi0gVXJhbmRv
bS1zY3JpcHRzOiBNb3ZlIHNlZWRybmcgaW5pdCBzY3JpcHQgdG8gUzAxIGZvciBlYXJsaWVyIHJh
bmRvbQogIG51bWJlciBlbnRyb3BoeSBpbml0aWFsaXphdGlvbi4KCi0gR286IEJ1bXAgdG8gMS4y
MC54IGFzIDEuMTkueCBpcyBub3cgRU9MIGFuZCBhZmZlY3RlZCBieSBzZWN1cml0eQogIGlzc3Vl
cy4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJpbmQsIGN1cHMsIGVubGlnaHRlbm1lbnQsIGV4aW0s
IGdsaWJjLCBnbywKICBnc3QxLXBsdWdpbnMtYmFzZSwgZ3N0MS1wbHVnaW5zLWJhZCwgZ3N0MS1w
bHVnaW5zLWdvb2QsCiAgZ3N0MS1wbHVnaW5zLXVnbHksIGxpYmN1ZSwgbGliY3VybCwgbGliZmFz
dGpzb24sIGxpYnJzdmcsIGxpYnZweCwKICBsaWJ5YW5nLCBtYmVkdGxzLCBuZXRzbm1wLCBzYW1i
YTQsIHN1cmljYXRhLCB0YXIKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRp
bWUvbGljZW5zZSBpc3N1ZXMgaW4KICBhdDkxYm9vdHN0cmFwLCBlZmwsIGdudS1lZmksIGdvLCBn
cHRmZGlzaywgZ3N0LW9teCwgZ3N0MS1kZXZ0b29scywKICBnc3QxLWxpYmF2LCBnc3QxLXB5dGhv
biwgZ3N0MS1yc3RwLXNlcnZlciwgZ3N0MS1yc3RwLXZhYXBpLAogIGdzdHJlYW1lcjEsIGdzdHJl
YW1lcjEtZWRpdGluZy1zZXJ2aWNlcywgbGliaHRwLCBsaWJtb2RwbHVnLAogIGxpbnV4LXRvb2xz
LCBtb3NxdWl0dG8sIG11dHQsIG5lb24sIG5tYXAsIG5vZGVqcywgb2xzciwgb3BlbmJsYXMsCiAg
b3BrZy11dGlscywgcGhwLCBwb3dlcnRvcCwgcHl0aG9uLW1ha28sIHB5dGhvbjMsIHJvY2tjaGlw
LW1hbGksIHNzbGgsCiAgdW5pZmRlZiwgdXJhbmRvbS1zY3JpcHRzLCB3ZWJraXRndGssIHdpcmVs
ZXNzLXJlZ2RiLCB3cGV3ZWJraXQKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBm
aWxlOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9p
ZD0yMDIzLjAyLjYKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkg
ZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29u
dHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4wMi41Li4K
CiAgICAyMiAgUGV0ZXIgS29yc2dhYXJkCiAgICAxMyAgRmFicmljZSBGb250YWluZQogICAgMTIg
IEJlcm5kIEt1aGxzCiAgICAgOCAgQ2hyaXN0aWFuIFN0ZXdhcnQKICAgICA1ICBZYW5uIEUuIE1P
UklOCiAgICAgNCAgRnJhbmNvaXMgUGVycmFkCiAgICAgMyAgRGFuaWVsIExhbmcKICAgICAzICBU
aG9tYXMgUGV0YXp6b25pCiAgICAgMiAgUm9tYWluIE5hb3VyCiAgICAgMiAgVGhvbWFzIERldm9v
Z2R0CiAgICAgMSAgQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICAxICBCZW4gV29sc2llZmZlcgog
ICAgIDEgIEJyYW5kb24gTWFpZXIKICAgICAxICBHYcOrbCBQT1JUQVkKICAgICAxICBHbGViIE1h
em92ZXRza2l5CiAgICAgMSAgSGVydmUgQ29kaW5hCiAgICAgMSAgSmFtZXMgSGlsbGlhcmQKICAg
ICAxICBKYW4gxIxlcm3DoWsKICAgICAxICBKZW5zIE1hdXMKICAgICAxICBKdWxpZW4gT2xpdmFp
bgogICAgIDEgIEtvcnkgTWFpbmNlbnQKICAgICAxICBTZWJhc3RpYW4gV2V5ZXIKICAgICAxICBZ
dSBDaGllbiBQZXRlciBMaW4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
