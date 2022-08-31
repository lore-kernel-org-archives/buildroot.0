Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FDEECAAD1
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66921830C1;
	Wed, 31 Aug 2022 22:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66921830C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dbKVjZux7-C; Wed, 31 Aug 2022 22:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A6F8309A;
	Wed, 31 Aug 2022 22:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A6F8309A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0C691BF410
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8C5F60A6D
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 22:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C5F60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAuEzHWuNTE8 for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 22:00:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E8560A4F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39E8560A4F
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 22:00:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E652A240005
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 22:00:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oTVkn-000UNH-ES
 for buildroot@buildroot.org; Thu, 01 Sep 2022 00:00:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 01 Sep 2022 00:00:09 +0200
Message-ID: <8735dcm5ue.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.5 released
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
MjIuMDIuNSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjUudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjUudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjUgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIuNCByZWxlYXNlLgoKLSBkZXBlbmRl
bmNpZXM6IEVuc3VyZSAnY21wJyBpcyBhdmFpbGFibGUgb24gdGhlIGJ1aWxkIGhvc3QuCgotIHBr
Zy11dGlsczogVGhlIEtDT05GSUdfRU5BQkxFX09QVCBtYWNybyB1c2VkIHRvIGVuZm9yY2UgYSBz
cGVjaWZpYwogIEtjb25maWcgb3B0aW9uIHRvIGJlIGVuYWJsZWQgKEUuRy4gZm9yIGtlcm5lbCBv
cHRpb25zIG5lZWRlZCBieQogIHBhY2thZ2VzKSBubyBsb25nZXIgY2hhbmdlcyBhID1tIChtb2R1
bGFyKSB3aXRoID15IChidWlsdCBpbikuCgotIGNoZWNrLWhvc3QtcnBhdGg6IFNpbGVuY2UgcmVh
ZGVsZiB3YXJuaW5ncyB3aGVuIGNsYW5nIGlzIHVzZWQKCi0gR0NDIDEwLnggdXBkYXRlZCB0byAx
MC40LjAKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGdudXBnMiwganF1ZXJ5LXZhbGlkYXRpb24sIGpz
emlwLCBsaWJvcGVuc3NsLAogIG1iZWR0bHMsIG5vZGVqcywgcHJvdG9idWYtYywgcHl0aG9uLWJv
dHRsZSwgcHl0aG9uLWRqYW5nbywKICBweXRob24tbHhtbCwgc3VyaWNhdGEsIHdlYmtpdGd0aywg
d3Bld2Via2l0LCB4c2VydmVyX3hvcmctc2VydmVyCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21w
aWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFwZywgYXNzaW1wLAogIGJheWVyMnJn
Yi1uZW9uLCBiaW5kLCBiaXJkLCBjb2csIGN3aWlkLCBmbHVpZHN5bnRoLCBmcmVlcmRwLCBnY2Ms
CiAgZ2RrLXBpeGJ1ZiwgZ2xpYmMsIGdsc2xzYW5kYm94LXBsYXllciwgZ3Rlc3QsIGkycGQsIGph
Y2syLAogIGxpYmJzZCwgbGliY2FtZXJhLCBsaWJjdXJsLCBsaWJlc3QsIGxpYmtyYjUsCiAgbGli
cHNsLCBsdWFzeXNsb2csIGx4YywgbXN0cGQsIG11dHQsCiAgbmV0ZGF0YSwgbmV0c25pZmYtbmcs
IG52aWRpYS1kcml2ZXIsIG9wZW5zc2wsIG9wa2ctdXRpbHMsCiAgcGFoby1tcXR0LWMsIHBhbmdv
LCBwY3NjLWxpdGUsIHBlcmwsIHBpbWQsCiAgcG9wcGxlciwgcG9zdGdpcywgcG93ZXJwYy11dGls
cywgcHBwZCwgcHJvdG9idWYtYywgcHVsc2VhdWRpbywKICBweXRob24zLCBxdDV3ZWJraXQsIHJw
aS11c2VybGFuZCwgcnN5c2xvZywgcnVzdGMsIHNjb25lc2VydmVyLAogIHNnM191dGlscywgc2hh
ZG93c29ja3MtbGliZXYsIHN0ZWxsYXJpdW0sIHRjcHJlcGxheSwgdWFjbWUsCiAgdWNsaWJjLCB3
ZWJraXRndGssIHdpbGMtZHJpdmVyLCB3aW5lLCB3cGV3ZWJraXQsIHhkZy1kYnVzLXByb3h5LAog
IHhzZXJ2ZXJfeG9yZy1zZXJ2ZXIsIHplcm9tcSwgemZzLCB6bGliLW5nCgpGb3IgbW9yZSBkZXRh
aWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVp
bGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMi4wMi41CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQg
cGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtz
IHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hv
cnRsb2cgLXNuIDIwMjIuMDIuNC4uCgogICAgNTggIEZhYnJpY2UgRm9udGFpbmUKICAgIDE0ICBU
aG9tYXMgUGV0YXp6b25pCiAgICAgOCAgQmVybmQgS3VobHMKICAgICA1ICBCYXJ1Y2ggU2lhY2gK
ICAgICA1ICBKYW1lcyBIaWxsaWFyZAogICAgIDUgIFBldGVyIEtvcnNnYWFyZAogICAgIDUgIFJv
bWFpbiBOYW91cgogICAgIDQgIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8KICAgICA0ICBBcm5vdXQg
VmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpCiAgICAgMyAgRnJhbmNvaXMgUGVycmFkCiAg
ICAgMiAgQmVuIEh1dGNoaW5ncwogICAgIDIgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgMiAgR2l1
bGlvIEJlbmV0dGkKICAgICAyICBMYW5nIERhbmllbAogICAgIDIgIFF1ZW50aW4gU2NodWx6CiAg
ICAgMiAgUmljYXJkbyBNYXJ0aW5jb3NraQogICAgIDIgIFRJQU4gWXVhbmhhbwogICAgIDEgIEFs
ZWtzYW5kciBNYWthcm92CiAgICAgMSAgQWxleGFuZHJ1IEFyZGVsZWFuCiAgICAgMSAgQ29saW4g
Rm9zdGVyCiAgICAgMSAgRGF2aWQgR09VQVJJTgogICAgIDEgIEhlaWtvIFRoaWVyeQogICAgIDEg
IEphcmVkIEJlbnRzCiAgICAgMSAgSmVzc2UgVGF1YmUKICAgICAxICBKb3PDqSBMdWlzIFNhbHZh
ZG9yIFJ1Zm8KICAgICAxICBKdWxpZW4gT2xpdmFpbgogICAgIDEgIEtvcnkgTWFpbmNlbnQKICAg
ICAxICBOaWNvbGFzIENhcnJpZXIKICAgICAxICBQZXRlciBTZWlkZXJlcgogICAgIDEgIFNlbiBI
YXN0aW5ncwogICAgIDEgIFZpbmNlbnQgRmF6aW8KICAgICAxICBZYW5uIEUuIE1PUklOCgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
