Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73DDC7EE22
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 11:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5746B84232;
	Wed, 10 May 2023 11:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5746B84232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4slxCINiqju; Wed, 10 May 2023 11:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF48A841CF;
	Wed, 10 May 2023 11:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF48A841CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDB151BF30C
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 11:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2452414DE
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 11:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2452414DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFGhpJx9YOoz for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 11:19:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40CA041498
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40CA041498
 for <buildroot@buildroot.org>; Wed, 10 May 2023 11:19:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2E6C4C0011
 for <buildroot@buildroot.org>; Wed, 10 May 2023 11:19:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pwhrK-00E3SX-TC
 for buildroot@buildroot.org; Wed, 10 May 2023 13:19:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 13:19:50 +0200
Message-ID: <87mt2c5t7t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2023.02.1 released
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
MjMuMDIuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjEgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIgcmVsZWFzZS4KCi0gSW5mcmFzdHVj
dHVyZToKICAtIGdvOiBFbnN1cmUgZ28gdmVyc2lvbnMgb2Ygb3MvdXNlciBhbmQgbmV0IGFyZSB1
c2VkIGZvciBzdGF0aWMgYnVpbGRzCiAgICAgICAgc28gQ0dPIGlzIG5vdCB1c2VkCgogIC0gcnVz
dCAvIGNhcmdvOiBDb3JyZWN0bHkgc3BsaXQgdXAgcnVzdCBmbGFncyBmb3IgaG9zdCBhbmQgdGFy
Z2V0CiAgICBidWlsZHMKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGFnZW50cHAsIGFwYWNoZSwgY29u
dGFpbmVyZCwgZG5zbWFzcSwKICBkb2NrZXItZW5naW5lLCBnaXQsIGdvLCBpbnRlbC1taWNyb2Nv
ZGUsIGxpYm1pY3JvaHR0cGQsIGxpYnhtbDIsCiAgb3BlbnNzaCwgcHl0aG9uLXdlYjJweSwgcnVu
Yywgc2FtYmE0LCBzbm1wcCwgc3VkbywgdGNwZHVtcCwgdWNsaWJjLAogIHZpbSwgd2Via2l0Z3Rr
LCB3aXJlc2hhcmssIHdwZXdlYmtpdCwgeHNlcnZlcl94b3JnLXNlcnZlcgoKLSBGaXhlcyBmb3Ig
ZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBibHVlejVfdXRp
bHMsCiAgY2EtY2VydGlmaWNhdGVzLCBjb3JlbWFyaywgZGNyb24sIGRvY2tlci1jbGksIGVmaXZh
ciwgZXVkZXYsIGZmbXBlZywKICBmbGFubiwgZmx1aWRzeW50aCwgZ3N0LW9teCwgZ3N0MS1kZXZ0
b29scywgZ3N0MS1saWJhdiwKICBnc3QxLXBsdWdpbnMtYmFkLCBnc3QxLXBsdWdpbnMtYmFzZSwg
Z3N0MS1wbHVnaW5zLWdvb2QsCiAgZ3N0MS1wbHVnaW5zLXVnbHksIGdzdDEtcHl0aG9uLCBnc3Qx
LXJ0c3Atc2VydmVyLCBnc3QxLXZhYXBpLAogIGdzdHJlYW1lcjEsIGdzdHJlYW1lcjEtZWRpdGlu
Zy1zZXJ2aWNlcywga2V4ZWMsIGxpYmN1cmwsIGxpYml0ZSwKICBsaWJndGszLCBsaW51eC10b29s
cywgbHVhLCBtYWxpLWRyaXZlciwgbWF0aW8sIG1kYWRtLCBvcGVub2NkLCBwaHAsCiAgcG9wcGxl
ciwgcG9zdGdyZXNxbCwgcXQ2YmFzZSwgcmVhZGxpbmUsIHJ0bDgxODlmcywgcnRsODcyM2RzLAog
IHJ0bDg4MTJhdS1haXJjcmFjay1uZywgcnVzdCwgcnVzdC1iaW4sIHMzOTAtdG9vbHMsIHNkbDIs
IHhyODE5LXJhZGlvLAogIHplZWsKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBm
aWxlOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvcGxhaW4vQ0hBTkdFUz9p
ZD0yMDIzLjAyLjEKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkg
ZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29u
dHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMy4wMi4uCgog
ICAgMTUgIEphbWVzIEhpbGxpYXJkCiAgICAxMSAgRmFicmljZSBGb250YWluZQogICAgMTAgIFBl
dGVyIFNlaWRlcmVyCiAgICAgOCAgQmVybmQgS3VobHMKICAgICA2ICBHaXVsaW8gQmVuZXR0aQog
ICAgIDUgIFN0ZWZhbiBBZ25lcgogICAgIDUgIFlhbm4gRS4gTU9SSU4KICAgICA0ICBDaHJpc3Rp
YW4gU3Rld2FydAogICAgIDQgIEZyYW5jb2lzIFBlcnJhZAogICAgIDMgIERhbmllbCBMYW5nCiAg
ICAgMyAgRGFyaW8gQmluYWNjaGkKICAgICAzICBKdWxpZW4gT2xpdmFpbgogICAgIDIgIEFkcmlh
biBQZXJleiBkZSBDYXN0cm8KICAgICAyICBBcm5vdXQgVmFuZGVjYXBwZWxsZQogICAgIDIgIEJh
Z2FzIFNhbmpheWEKICAgICAyICBKYW1lcyBLbmlnaHQKICAgICAyICBMdWNhIENlcmVzb2xpCiAg
ICAgMiAgVmluY2VudCBGYXppbwogICAgIDEgIEZsb3JpYW4gRmFpbmVsbGkKICAgICAxICBKb2Fj
aGltIFdpYmVyZwogICAgIDEgIEpvZWwgU3RhbmxleQogICAgIDEgIExhbmcgRGFuaWVsCiAgICAg
MSAgTWFyaW8gSGF1c3RlaW4KICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBNaWNoYWVs
IEZpc2NoZXIKICAgICAxICBQZXRlciBLb3JzZ2FhcmQKICAgICAxICBSb21haW4gTmFvdXIKICAg
ICAxICBTZXJnZXkgTWF0eXVrZXZpY2gKICAgICAxICBTaW1vbiBSb3dlCiAgICAgMSAgU3RlZmFu
IE90dAogICAgIDEgIFRoaWVycnkgR1VJQkVSVAogICAgIDEgIFdhbGRlbWFyIEJyb2Rrb3JiCiAg
ICAgMSAgyo7JkEggx53KjMedyodTCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
