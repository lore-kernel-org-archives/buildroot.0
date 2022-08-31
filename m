Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A350ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 16:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B47E40C53;
	Wed, 31 Aug 2022 16:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B47E40C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGdoikiDwmMc; Wed, 31 Aug 2022 16:16:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A089140165;
	Wed, 31 Aug 2022 16:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A089140165
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65F4D1BF2C3
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 16:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4084640165
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 16:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4084640165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDXuEjus39Ni for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 16:15:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE91740162
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE91740162
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 16:15:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4C3260002
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 16:15:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oTQNc-000Oat-9V
 for buildroot@buildroot.org; Wed, 31 Aug 2022 18:15:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 18:15:52 +0200
Message-ID: <877d2omls7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.05.2 released
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
MjIuMDUuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA1LjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA1LjIudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjA1LjIgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MDUuMSByZWxlYXNlLgoKLSBkZXBlbmRlbmNpZXM6IEVuc3VyZSAnY21wJyBpcyBhdmFpbGFibGUg
b24gdGhlIGJ1aWxkIGhvc3QuCgotIHBrZy11dGlsczogVGhlIEtDT05GSUdfRU5BQkxFX09QVCBt
YWNybyB1c2VkIHRvIGVuZm9yY2UgYSBzcGVjaWZpYwogIEtjb25maWcgb3B0aW9uIHRvIGJlIGVu
YWJsZWQgKEUuRy4gZm9yIGtlcm5lbCBvcHRpb25zIG5lZWRlZCBieQogIHBhY2thZ2VzKSBubyBs
b25nZXIgY2hhbmdlcyBhID1tIChtb2R1bGFyKSB3aXRoID15IChidWlsdCBpbikuCgotIGNoZWNr
LWhvc3QtcnBhdGg6IFNpbGVuY2UgcmVhZGVsZiB3YXJuaW5ncyB3aGVuIGNsYW5nIGlzIHVzZWQK
Ci0gR0NDIDEwLnggdXBkYXRlZCB0byAxMC40LjAKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGdudXBn
MiwganFldXJ5LXZhbGlkYXRpb24sIGpzemlwLCBsaWJvcGVuc3NsLAogIG1iZWR0bHMsIG5vZGVq
cywgcHJvdG9idWYtYywgcHl0aG9uLWJvdHRsZSwgcHl0aG9uLWRqYW5nbywKICBweXRob24tbHht
bCwgc3VyaWNhdGEsIHdlYmtpdGd0aywgd3Bld2Via2l0LCB4c2VydmVyX3hvcmctc2VydmVyCgot
IEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGlu
IGFwZywgYXNzaW1wLAogIGJheWVyMnJnYi1uZW9uLCBiaW5kLCBiaXJkLCBjb2csIGN3aWlkLCBm
bHVpZHN5bnRoLCBmcmVlcmRwLCBnY2MsCiAgZ2RrLXBpeGJ1ZiwgZ2xpYmMsIGdsc2xzYW5kYm94
LXBsYXllciwgZ3Rlc3QsIGkycGQsIGphY2syLAogIGt2bS11bml0LXRlc3RzLCBsaWJic2QsIGxp
YmNhbWVyYSwgbGliY3VybCwgbGliZXN0LCBsaWJrcmI1LCBsaWJwMTEsCiAgbGlicHNsLCBsaWJ3
ZWJzb2NrZXRzLCBsb2NhbGVkZWYsIGx1YXN5c2xvZywgbHhjLCBtc3RwZCwgbXV0dCwKICBuZXRk
YXRhLCBuZXRzbmlmZi1uZywgbnZpZGlhLWRyaXZlciwgb2xhLCBvcGVuc3NsLCBvcGtnLXV0aWxz
LAogIHBhaG8tbXF0dC1jLCBwYW5nbywgcGNzYy1saXRlLCBwZXJsLCBwZXJsLWNyeXB0LW9wZW5z
c2wtcnNhLCBwaW1kLAogIHBvcHBsZXIsIHBvc3RnaXMsIHBvd2VycGMtdXRpbHMsIHBwcGQsIHBy
b3RvYnVmLWMsIHB1bHNlYXVkaW8sCiAgcHl0aG9uMywgcXQ1d2Via2l0LCByZWRpcywgcnBpLXVz
ZXJsYW5kLCByc3lzbG9nLCBydXN0Yywgc2NvbmVzZXJ2ZXIsCiAgc2czX3V0aWxzLCBzaGFkb3dz
b2Nrcy1saWJldiwgc3RlbGxhcml1bSwgc3d1cGRhdGUsIHRjcHJlcGxheSwgdWFjbWUsCiAgdWNs
aWJjLCB3ZWJraXRndGssIHdpbGMtZHJpdmVyLCB3aW5lLCB3cGV3ZWJraXQsIHhkZy1kYnVzLXBy
b3h5LAogIHhzZXJ2ZXJfeG9yZy1zZXJ2ZXIsIHplcm9tcSwgemZzLCB6bGliLW5nCgpGb3IgbW9y
ZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5u
ZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMi4wNS4yCgpVc2VycyBvZiB0aGUgYWZm
ZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkg
dGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6Cgpn
aXQgc2hvcnRsb2cgLXNuIDIwMjIuMDUuMS4uCgogICAgNjYgIEZhYnJpY2UgRm9udGFpbmUKICAg
IDE1ICBUaG9tYXMgUGV0YXp6b25pCiAgICAxMCAgQmVybmQgS3VobHMKICAgICA1ICBCYXJ1Y2gg
U2lhY2gKICAgICA1ICBSb21haW4gTmFvdXIKICAgICA0ICBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
CiAgICAgNCAgQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKQogICAgIDQgIEph
bWVzIEhpbGxpYXJkCiAgICAgMyAgQmVuIEh1dGNoaW5ncwogICAgIDMgIFBldGVyIEtvcnNnYWFy
ZAogICAgIDIgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgMiAgRnJhbmNvaXMgUGVycmFkCiAgICAg
MiAgR2l1bGlvIEJlbmV0dGkKICAgICAyICBMYW5nIERhbmllbAogICAgIDIgIFF1ZW50aW4gU2No
dWx6CiAgICAgMiAgUmljYXJkbyBNYXJ0aW5jb3NraQogICAgIDIgIFRJQU4gWXVhbmhhbwogICAg
IDEgIEFsZWtzYW5kciBNYWthcm92CiAgICAgMSAgQWxleGFuZHJ1IEFyZGVsZWFuCiAgICAgMSAg
Q29saW4gRm9zdGVyCiAgICAgMSAgRGF2aWQgR09VQVJJTgogICAgIDEgIEhlaWtvIFRoaWVyeQog
ICAgIDEgIEphcmVkIEJlbnRzCiAgICAgMSAgSmVzc2UgVGF1YmUKICAgICAxICBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8KICAgICAxICBKdWxpZW4gT2xpdmFpbgogICAgIDEgIEtvcnkgTWFpbmNl
bnQKICAgICAxICBLcmlzIEJhaG5zZW4KICAgICAxICBOZWFsIEZyYWdlcgogICAgIDEgIE5pY29s
YXMgQ2FycmllcgogICAgIDEgIFBldGVyIFNlaWRlcmVyCiAgICAgMSAgU2VuIEhhc3RpbmdzCiAg
ICAgMSAgVGhvbWFzIEh1dGgKICAgICAxICBUaXRvdWFuIENocmlzdG9waGUKICAgICAxICBWaW5j
ZW50IEZhemlvCiAgICAgMSAgWWFubiBFLiBNT1JJTgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
