Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A481FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5518360EC1;
	Sun, 29 May 2022 20:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQvvI3RfPY3l; Sun, 29 May 2022 20:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A6E60E64;
	Sun, 29 May 2022 20:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D06011BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE9EB84330
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHUM9Xc8euAM for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:30:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 442888432D
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:30:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 167152000A
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:30:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nvPY8-005d70-5I
 for buildroot@buildroot.org; Sun, 29 May 2022 22:30:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 22:30:08 +0200
Message-ID: <87sfos3wvj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.2 released
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
MjIuMDIuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjIgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIuMSByZWxlYXNlLgoKLSBBcmNoaWN0
dXJlczogRHJvcCBzaDJhLCBjb3JyZWN0IHg4NiBCb25uZWxsIHZhcmlhbnQKCi0gVG9vbGNoYWlu
OiBCdW1wIEdDQyAxMS54IHRvIDExLjMsIGNvcnJlY3QgcHJlLWluc3RhbGxlZCBleHRlcm5hbAog
IHRvb2xjaGFpbiBsb2dpYyB3aGVuIHRvb2xjaGFpbiBpcyBhdmFpbGFibGUgaW4gcGF0aC4KCi0g
UmV3b3JrIE9DSSBmaWxlc3lzdGVtIGVudHJ5cG9pbnQvY29tbWFuZCBsb2dpYyB0byBoYW5kbGUg
Y29tbWFuZAogIGFyZ3VtZW50cwoKLSBEZWZjb25maWdzOiBVcGRhdGUgWnlucW1wIHpjdTEwMi8x
MDYgdG8gZmluYWwgMjAyMi4xIHJlbGVhc2UsIGZpeAogIHpjdTEwNiBQTEwgY29uZmlnCgotIFNl
Y3VyaXR5IGZpeGVzIGZvciBhc3RlcmlzaywgY2lmcy11dGlscywgY2xhbWF2LCBkaGNwLCBlMmZz
cHJvZ3MsCiAgZnJlZXJkcCwgZ2l0LCBnbywgZ3ppcCwga29tcGV4c3FsaXRlLCBsaWJhcmNoaXZl
LCBsaWJjdXJsLCBsaWJpbnB1dCwKICBsaWJvcGVuc3NsLCBsaWJwanNpcCwgbGlieG1sMiwgbXV0
dCwgb3Blbmpkaywgb3Blbmpkay1iaW4sIHBvc3RncmVzcWwsCiAgcHl0aG9uLWRqYW5nbywgcmVk
aXMsIHJ0bF80MzMsIHN1YnZlcnNpb24sIHN1cmljYXRhLCB2aW0sIHh6LCB6bG9nCgotIEZpeGVz
IGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluCiAgYWR3
YWl0YS1pY29uLXRoZW1lLCBhZmJvb3Qtc3RtMzIsIGFpcmNyYWNrLW5nLCBhbGNoZW15LCBhbHNh
LWxpYiwKICBhcnB0YWJsZXMsIGFzc2ltcCwgYXViaW8sIGF2cmR1ZGUsIGF6dXJlLWlvdC1zZGst
YywgYmF0bWFuLWFkdiwKICBiaW51dGlscywgYnBmdG9vbCwgYnJvdGxpLCBjbGFtYXYsIGNyeXB0
b2Rldi1saW51eCwgZGhjcCwgZGlmZnV0aWxzLAogIGRtYWxsb2MsIGR1a3RhcGUsIGVsZjJmbHQs
IGVzcGVhaywgZXhwYXQsIGZmbXBlZywgZmx1aWRzeW50aCwgZ2NjLAogIGdsb3J5dHVuLCBnbHNs
c2FuZGJveC1wbGF5ZXIsIGdudXRscywgZ3N0MS1pbXgsIGdzdDEtcGx1Z2lucy1nb29kLAogIGlt
YWdlbWFnaWNrLCBqYW51cy1nYXRld2F5LCBrZWVwYWxpdmVkLCBrdm0tdW5pdC10ZXN0cywgbGli
Y2dpLAogIGxpYmV2ZGV2LCBsaWJlWG9zaXAyLCBsaWJodHAsIGxpYmtjYXBpLCBsaWJrcmI1LCBs
aWJrcywgbGlibWRieCwKICBsaWJtbmwsIGxpYm5wdXBucCwgbGlibnNwciwgbGlib3BpbmcsIGxp
YnByaSwgbGlic2VsaW51eCwgbGlic2lnc2VndiwKICBsaWJ2NGwsIGxpYndlYnNvY2tldHMsIGxp
bnV4LCBsaW51eC10b29scywgbHRwLXRlc3RzdWl0ZSwgbHVhaml0LAogIGx2bTIsIG1hbGktZHJp
dmVyLCBtYXJpYWRiLCBtYywgbWluaXppcCwgbXBkLCBuZXRhdGFsaywgbmV0c3VyZiwKICBuZXR3
b3JrLW1hbmFnZXIsIG5vZGVqcywgbnVtYWN0bCwgcW9tbmlvcmIsIG9wZW5ib3gsIG9wZW5jdjQs
IG9wZW5vY2QsCiAgcGFtdGVzdGVyLCBwYW5nbywgcGNyZTIsIHBocCwgcGhwLWFwY3UsIHBpbmVu
dHJ5LCBwaXhtYW4sIHBvbGtpdCwKICBwb3N0Z2lzLCBwb3N0Z3Jlc3FsLCBwdXJlLWZ0cGQsIHB5
dGhvbi1hZW51bSwgcHl0aG9uLXBpbGxvdywKICBweXRob24tc2ltcGxlanNvbiwgcHl0aG9uLXVy
bGxpYjMsIHB5dGhvbi16b3BmbGksIHB5dGhvbjMsIHFlbXUsIHFwZGYsCiAgcXVhemlwLCByb2Nr
Y2hpcC1tYWxpLCByc3luYywgcnQtdGVzdHMsIHJ0bDgxODllcywgcnRsODE4OWZzLCBydXN0LAog
IHNhbS1iYSwgc2FtYmE0LCBzZGwyX3R0Ziwgc2hhZG93c29ja3MtbGliZXYsIHNoaW0sIHN1bjIw
aS1kMS1zcGwsCiAgc3lzdGVtZCwgdHJpbml0eSwgdHZoZWFkZW5kLCB3aXJlcGx1bWJlciwgdWZ0
cmFjZSwgdXJhbmRvbS1zY3JpcHRzLAogIHVzYl9tb2Rlc3dpdGNoLCB2YWxncmluZCwgdmRlMiwg
d29sZnNzbCwgd3BhX3N1cHBsaWNhbnQsIHpsb2cKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUg
Q0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4v
Q0hBTkdFUz9pZD0yMDIyLjAyLjIKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUg
c3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBw
ZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAy
Mi4wMi4xLi4KCiAgICA5MCAgRmFicmljZSBGb250YWluZQogICAgMTggIEphbWVzIEhpbGxpYXJk
CiAgICAxNyAgUGV0ZXIgS29yc2dhYXJkCiAgICAxMyAgQmVybmQgS3VobHMKICAgICA4ICBUaG9t
YXMgUGV0YXp6b25pCiAgICAgNyAgRnJhbmNvaXMgUGVycmFkCiAgICAgNyAgTmVhbCBGcmFnZXIK
ICAgICA2ICBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpCiAgICAgNiAgUm9t
YWluIE5hb3VyCiAgICAgNCAgQW5kcmVhcyBaaWVnbGVyCiAgICAgNCAgRGFyaW8gQmluYWNjaGkK
ICAgICA0ICBHaXVsaW8gQmVuZXR0aQogICAgIDQgIFRJQU4gWXVhbmhhbwogICAgIDMgIFNlcmdl
eSBNYXR5dWtldmljaAogICAgIDMgIFlhbm4gRS4gTU9SSU4KICAgICAyICBDaHJpc3RpYW4gU3Rl
d2FydAogICAgIDIgIEphbiBIYXZyYW4KICAgICAyICBKb2VsIFN0YW5sZXkKICAgICAyICBKdWxp
ZW4gT2xpdmFpbgogICAgIDIgIFllZ29yIFllZnJlbW92CiAgICAgMSAgQWRyaWFuIFBlcmV6IGRl
IENhc3RybwogICAgIDEgIEFuZHJlYXMgRWhtYW5ucwogICAgIDEgIEJhcnVjaCBTaWFjaAogICAg
IDEgIERhbmlsbwogICAgIDEgIEphc29uIEEuIERvbmVuZmVsZAogICAgIDEgIExhbmcgRGFuaWVs
CiAgICAgMSAgTGVnZXIgQ2hhcmxpZQogICAgIDEgIE1hcmN1cyBIb2ZmbWFubgogICAgIDEgIE1h
eGltIEtvY2hldGtvdgogICAgIDEgIFBldGVyIFNlaWRlcmVyCiAgICAgMSAgU29sIEJla2ljCiAg
ICAgMSAgVGhvbWFzIEh1dGgKICAgICAxICBUaMOpbyBMZWJydW4KICAgICAxICBUaW0gSGFtbWVy
CiAgICAgMSAgVGl0b3VhbiBDaHJpc3RvcGhlCiAgICAgMSAgWWFubmljayBCcm9zc2VhdQogICAg
IDEgINCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KQoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
