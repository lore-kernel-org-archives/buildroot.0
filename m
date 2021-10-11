Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DDCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 15:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3F660E98
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 15:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B3F660E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5AAC606D9;
	Mon, 11 Oct 2021 15:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ha_PFhA9GEcn; Mon, 11 Oct 2021 15:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CFD6064E;
	Mon, 11 Oct 2021 15:41:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCCAB1BF371
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 15:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB3FC6064E
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 15:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id km1crbfUnVtE for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 15:41:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 493CB60608
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:41:09 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D77E21BF20B
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:41:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mZxQI-0005nF-8t
 for buildroot@buildroot.org; Mon, 11 Oct 2021 17:41:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 17:41:06 +0200
Message-ID: <87k0ijpo19.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.05.3 released, 2021.05.x EOL
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
MjEuMDUuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA1LjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA1LjMudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wNS4zIGlzIGEgYnVnZml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBv
cnRhbnQgLwpzZWN1cml0eSByZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIx
LjA1LjIgcmVsZWFzZS4KCi0gZ2RiaW5pdDogTWFyayB0aGUgc3lzcm9vdCBhcyBhICJzYWZlIHBh
dGgiIGJlZm9yZSBjb25maWd1cmluZwlpdCwgc28KICBwcmV0dHkgcHJpbnRlcnMgd29yayBjb3Jy
ZWN0bHkgd2l0aG91dCBoYXZpbmcgdG8gcGFzcwktaXggdG8gZ2RiCgotIFNlY3VyaXR5IGZpeGVz
IGZvciBhcGFjaGUsIGF0ZnRwLCBiaW5kLCBib3RhbiwgY29udGFpbmVyZCwgY3J5cHRvcHAsCiAg
ZmV0Y2htYWlsLCBnaG9zdHNjcmlwdCwgZ28sIGxpYmN1cmwsIGxpYmtyYjUsIGxpYnNuZGZpbGUs
IGxpYnlhbmcsCiAgbHlueCwgbm9kZWpzLCBudGZzLTNnLCBvcGVuamRrLCBvcGVuamRrLWJpbiwg
b3BlbnNzaCwgcGhwLCBweXRob24tcGlwLAogIHJlZGlzLCBzcXVpZCwgdWNsaWJjLCB4ZW4KCi0g
Rml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4g
YWxzYS1saWIsCiAgYXJtLXRydXN0ZWQtZmlybXdhcmUsIGRhc2gsIGRjM2RkLCBkb2NrZXItY2xp
LCBkb2NrZXItZW5naW5lLCBkb3ZlY290LAogIGVybGFuZywgZmZtcGVnLCBnZGIsIGdzdC1vbXgs
IGdzdDEtZGV2dG9vbHMsIGdzdDEtaW50ZXJwaXBlLAogIGdzdDEtbGliYXYsIGdzdDEtcGx1Z2lu
cy1iYWQsIGdzdDEtcGx1Z2lucy1iYXNlLCBnc3QxLXBsdWdpbnMtZ29vZCwKICBnc3QxLXBsdWdp
bnMtdWdseSwgZ3N0MS1weXRob24sIGdzdDEtcnRzcC1zZXJ2ZXIsIGdzdDEtdmFhcGksCiAgZ3N0
cmVhbWVyMSwgZ3N0cmVhbWVyMS1lZGl0aW5nLXNlcnZpY2VzLCBrb2RpLCBrb2RpLXB2ci1vY3Rv
bmV0LAogIGtvZGktdmlzdWFsaXNhdGlvbi1maXNoYm1jLCBsaWJyZXNzbCwgbGlieGNyeXB0LCBs
eGMsIG1lc2EzZCwKICBtaWNyb3B5dGhvbiwgbWluaWNvbSwgbW9ubywgbXRyLCBtdi1kZHItbWFy
dmVsbCwgbmV0LXRvb2xzLCBubWFwLAogIG9wZW5sZGFwLCBweXRob24tYWlvY29uc29sZSwgcHl0
aG9uLWNmZmksIHB5dGhvbi1kYXRldXRpbCwKICBweXRob24tZGphbmdvLCBweXRob24tdGV4dHRh
YmxlLCBweXRob24tdXJsbGliMywgcHl0aG9uLXdlYm9iLAogIHF0NWxvY2F0aW9uLCByZWZwb2xp
Y3ksIHJpcGdyZXAsIHJ1bmMsIHNpc3BtY3RsLCBzdHJvbmdzd2FuLAogIHN1cGVydmlzb3IsIHN5
c2xpbnV4LCB0aW55Y2JvciwgdHJhY2UtY21kLCB1Ym9vdC10b29scywgd2F2ZW1vbiwgd2dldCwK
ICB3aXJlbGVzcy1yZWdkYiwgeHNlcnZlcl94b3JnLXNlcnZlciwKCkZvciBtb3JlIGRldGFpbHMs
IHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJv
b3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDIxLjA1LjMKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNr
YWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTm90aWNlIHRoYXQgdGhl
IDIwMjEuMDUueCBzZXJpZXMgaXMgbm93IEVORCBPRiBMSUZFLiBQbGVhc2UgbWlncmF0ZSB0bwp0
aGUgMjAyMS4wOC54IHNlcmllcyBpbnN0ZWFkIHdoaWNoIHdpbGwgYmUgc3VwcG9ydGVkIHVudGls
IERlY2VtYmVyCjIwMjEsIG9yIHRoZSAyMDIxLjAyLnggTFRTIHNlcmllcywgd2hpY2ggaXMgc3Vw
cG9ydGVkIHVudGlsIEFwcmlsIDIwMjIuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBj
b250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIxLjA1LjIu
LgoKICAgIDI0ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAxOSAgUGV0ZXIgU2VpZGVyZXIKICAgIDE3
ICBQZXRlciBLb3JzZ2FhcmQKICAgIDExICBSb21haW4gTmFvdXIKICAgICA3ICBHaXVsaW8gQmVu
ZXR0aQogICAgIDUgIEFzYWYgS2FobG9uCiAgICAgNSAgQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1
aWxkcm9vdAogICAgIDMgIEZyYW5jb2lzIFBlcnJhZAogICAgIDMgIFlhbm4gRS4gTU9SSU4KICAg
ICAyICBCZXJuZCBLdWhscwogICAgIDIgIEVkZ2FyIEJvbmV0CiAgICAgMiAgSWxsaWEgQml0a292
CiAgICAgMiAgUGV0ciBWb3JlbAogICAgIDEgIEFkYW0gRHVza2V0dAogICAgIDEgIEFudG9pbmUg
VGVuYXJ0CiAgICAgMSAgQmFydWNoIFNpYWNoCiAgICAgMSAgQ2hyaXMgUGFja2hhbQogICAgIDEg
IEphbWVzIEhpbGxpYXJkCiAgICAgMSAgSm9hY2hpbSBXaWJlcmcKICAgICAxICBLb3J5IE1haW5j
ZW50CiAgICAgMSAgTWFydGluIEVsc2h1YmVyCiAgICAgMSAgTWljaGFlbCBOb3N0aG9mZgogICAg
IDEgIE5pY29sYXMgQ2F2YWxsYXJpCiAgICAgMSAgUXVlbnRpbiBTY2h1bHoKICAgICAxICBSYXBo
YcOrbCBNw6lsb3R0ZQogICAgIDEgIFNhbSBWb3NzCiAgICAgMSAgVGhvbWFzIERlIFNjaGFtcGhl
bGVpcmUKICAgICAxICBUaG9tYXMgUGV0YXp6b25pCiAgICAgMSAgVGl0b3VhbiBDaHJpc3RvcGhl
CiAgICAgMSAgV2FsZGVtYXIgQnJvZGtvcmIKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
