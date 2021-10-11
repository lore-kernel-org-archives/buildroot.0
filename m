Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F72C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:25:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCEB60F14
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CCEB60F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA85581776;
	Mon, 11 Oct 2021 20:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stQ4h3aFS9bZ; Mon, 11 Oct 2021 20:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D1C816F5;
	Mon, 11 Oct 2021 20:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3CD61BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C05F9816F5
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVt5eXQpUjz9 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:25:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91604814B8
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:25:41 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 97CAE1BF205
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:25:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1ma1rd-0004EX-V9
 for buildroot@buildroot.org; Mon, 11 Oct 2021 22:25:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:25:37 +0200
Message-ID: <875yu3pav2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.6 released
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
MjEuMDIuNiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjYudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjYudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wMi42IGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJt
CnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVk
IGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIxLjAyLjUgcmVsZWFzZS4KCi0gU2VjdXJp
dHkgZml4ZXMgZm9yIGFwYWNoZSwgYXRmdHAsIGJpbmQsIGJvdGFuLCBjcnlwdG9wcCwKICBkb2Nr
ZXItY29udGFpbmVyZCwgZmV0Y2htYWlsLCBnaG9zdHNjcmlwdCwgZ28sIGxpYmN1cmwsIGxpYmty
YjUsCiAgbGlic25kZmlsZSwgbGlieWFuZywgbHlueCwgbm9kZWpzLCBudGZzLTNnLCBvcGVuamRr
LCBvcGVuamRrLWJpbiwKICBvcGVuc3NoLCBwaHAsIHB5dGhvbi1waXAsIHJlZGlzLCBzcXVpZCwg
dWNsaWJjLCB4ZW4KCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGlj
ZW5zZSBpc3N1ZXMgaW4gYWxzYS1saWIsCiAgYXJtLXRydXN0ZWQtZmlybXdhcmUsIGRhc2gsIGRj
M2RkLCBkb2NrZXItY2xpLCBkb2NrZXItZW5naW5lLCBkb3ZlY290LAogIGVybGFuZywgZ2RiLCBn
c3Qtb214LCBnc3QxLWRldnRvb2xzLCBnc3QxLWludGVycGlwZSwgZ3N0MS1saWJhdiwKICBnc3Qx
LXBsdWdpbnMtYmFkLCBnc3QxLXBsdWdpbnMtYmFzZSwgZ3N0MS1wbHVnaW5zLWdvb2QsCiAgZ3N0
MS1wbHVnaW5zLXVnbHksIGdzdDEtcHl0aG9uLCBnc3QxLXJ0c3Atc2VydmVyLCBnc3QxLXZhYXBp
LAogIGdzdHJlYW1lcjEsIGdzdHJlYW1lcjEtZWRpdGluZy1zZXJ2aWNlcywga29kaS1wdnItb2N0
b25ldCwgbGlicmVzc2wsCiAgbHhjLCBtZXNhM2QsIG1pY3JvcHl0aG9uLCBtaW5pY29tLCBtb25v
LCBtdHIsIG12LWRkci1tYXJ2ZWxsLAogIG5ldC10b29scywgbm1hcCwgb3BlbmxkYXAsIHB5dGhv
bi1haW9jb25zb2xlLCBweXRob24tY2ZmaSwKICBweXRob24tZGF0ZXV0aWwsIHB5dGhvbi1kamFu
Z28sIHB5dGhvbi10ZXh0dGFibGUsIHB5dGhvbi11cmxsaWIzLAogIHB5dGhvbi13ZWJvYiwgcXQ1
bG9jYXRpb24sIHJlZnBvbGljeSwgcmlwZ3JlcCwgcnVuYywgc2lzcG1jdGwsCiAgc3Ryb25nc3dh
biwgc3VwZXJ2aXNvciwgc3lzbGludXgsIHRpbnljYm9yLCB0cmFjZS1jbWQsIHVib290LXRvb2xz
LAogIHdhdmVtb24sIHdpcmVsZXNzLXJlZ2RiLCB4c2VydmVyX3hvcmctc2VydmVyCgpGb3IgbW9y
ZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5u
ZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMS4wMi42CgpVc2VycyBvZiB0aGUgYWZm
ZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkg
dGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6Cgpn
aXQgc2hvcnRsb2cgLXNuIDIwMjEuMDIuNS4uCiAgICAyMyAgRmFicmljZSBGb250YWluZQogICAg
MTkgIFBldGVyIFNlaWRlcmVyCiAgICAxNyAgUGV0ZXIgS29yc2dhYXJkCiAgICAxMSAgUm9tYWlu
IE5hb3VyCiAgICAgNiAgR2l1bGlvIEJlbmV0dGkKICAgICA1ICBBc2FmIEthaGxvbgogICAgIDUg
IENocmlzdGlhbiBTdGV3YXJ0IHZpYSBidWlsZHJvb3QKICAgICAzICBZYW5uIEUuIE1PUklOCiAg
ICAgMiAgQWRhbSBEdXNrZXR0CiAgICAgMiAgRWRnYXIgQm9uZXQKICAgICAyICBGcmFuY29pcyBQ
ZXJyYWQKICAgICAyICBJbGxpYSBCaXRrb3YKICAgICAyICBQZXRyIFZvcmVsCiAgICAgMSAgQW50
b2luZSBUZW5hcnQKICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAxICBCZXJuZCBLdWhscwogICAg
IDEgIENocmlzIFBhY2toYW0KICAgICAxICBIZWlrbyBUaGllcnkKICAgICAxICBKYW1lcyBIaWxs
aWFyZAogICAgIDEgIEpvYWNoaW0gV2liZXJnCiAgICAgMSAgS29yeSBNYWluY2VudAogICAgIDEg
IE1hcnRpbiBFbHNodWJlcgogICAgIDEgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAxICBOaWNvbGFz
IENhdmFsbGFyaQogICAgIDEgIFF1ZW50aW4gU2NodWx6CiAgICAgMSAgUmFwaGHDq2wgTcOpbG90
dGUKICAgICAxICBTYW0gVm9zcwogICAgIDEgIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlCiAgICAg
MSAgVGhvbWFzIFBldGF6em9uaQogICAgIDEgIFRpdG91YW4gQ2hyaXN0b3BoZQogICAgIDEgIFdh
bGRlbWFyIEJyb2Rrb3JiCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
