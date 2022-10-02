Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B200FC433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03312408E9;
	Sun,  2 Oct 2022 21:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03312408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdIt1GYbnBmy; Sun,  2 Oct 2022 21:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3CE408A7;
	Sun,  2 Oct 2022 21:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3CE408A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE671BF3EF
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AB9D400C7
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 21:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AB9D400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMeNuCUguXoS for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 21:01:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C059E400AB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C059E400AB
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 21:01:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1582C24000A
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 21:01:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1of65h-00DKh4-TY
 for buildroot@buildroot.org; Sun, 02 Oct 2022 23:01:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 02 Oct 2022 23:01:37 +0200
Message-ID: <87fsg62b4e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.6 released
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
MjIuMDIuNiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjYudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjYudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjYgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIuNSByZWxlYXNlLgoKLSBGaXhlZCBj
b21wYXRpYmlsaXR5IGlzc3VlIHdpdGggbWFrZSA0LjMgYW5kIHRoZSAncHJpbnR2YXJzJyAvCiAg
J3Nob3ctdmFycycgY29tbWFuZHMuCgotIERlcGVuZGVuY2llczogRW5zdXJlICdmaW5kJyBhbmQg
J3hhcmdzJyBhcmUgYXZhaWxhYmxlIG9uIHRoZSBidWlsZAogIGhvc3QuCgotIFNlY3VyaXR5IGZp
eGVzIGZvciBidXN5Ym94LCBjbGFtYXYsIGNvbnRhaW5lcmQsIGRvY2tlci1lbmdpbmUsIGV4cGF0
LAogIGZyZWV0eXBlLCBnaXQsIGdudXRscywgZ28sIGhlaXJsb29tLW1haWx4LCBpbWFnZW1hZ2lj
aywgbGliY29uZnVzZSwKICBsaWJ0aXJwYywgbGlid3BlLCBsaWJ4bWwyLCBsaWJ6bGliLCBtYXJp
YWRiLCBtaW5pZGxuYSwgbW9zcXVpdHRvLAogIG5ldHdvcmtkLWRpc3BhdGNoZXIsIHBvc3RncmVz
cWwsIHB5dGhvbjMsIHJlZGlzLCByc3luYywgc3FsaXRlLCBzcXVpZCwKICB0Y3ByZXBsYXksIHRp
bnlwcm94eSwgdW56aXAsIHY0bDJsb29wYmFjaywgdmltLCB3ZWJraXRndGssIHdvbGZzc2wsCiAg
d3Bld2Via2l0CgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vu
c2UgaXNzdWVzIGluIGFjZSwKICBhcm0tdHJ1c3RlZC1maXJtd2FyZSwgYmFiZWx0cmFjZTIsIGJv
b3N0LCBib3RhbiwgYnVzeWJveCwgY29nLAogIGNvbm5tYW4sIGN1cHMsIGRoY3BjZCwgZGlyZWN0
ZmIsIGRvY2tlci1jbGksIGRvY2tlci1lbmdpbmUsIGVkazIsCiAgZWRrMi1wbGF0Zm9ybXMsIGVs
ZjJmbHQsIGZmbXBlZywgZmljbCwgZnJlZXN3aXRjaCwgZ2NjLCBnZGIsIGdydWIyLAogIGdzdDEt
cGx1Z2lucy1iYWQsIGdzdDEtcGx1Z2lucy1nb29kLCBpY3UsIGlnaC1ldGhlcmNhdCwgamFjazIs
IGpvc2UsCiAganBlZywganF1ZXJ5LXVpLXRoZW1lcywga29kaSwgbGliZnJlZWltYWdlLCBsaWJn
bHZuZCwgbGliZ3BnLWVycm9yLAogIGxpYmlucHV0LCBsaWJtZGJ4LCBsaWJzZXBvbCwgbGlidXBu
cCwgbGlidmlydCwgbGlidm5jc2VydmVyLCBsaW51eCwKICBsaW51eC10b29scywgbHNodywgbWFr
ZWRldnMsIG1ha2VkdW1wZmlsZSwgbWFsaS1kcml2ZXIsIG1hcmlhZGIsCiAgbWVtY2FjaGVkLCBt
dXR0LCBtdi1kZHItbWFydmVsbCwgbmN1cnNlcywgbmUxMCwgbmV0c25pZmYtbmcsIG9jcmFkLAog
IG9wZW5jdjQsIG9wZW5vY2QsIG9wZW5zc2gsIHBhbmdvLCBwY3NjLWxpdGUsIHBvbGtpdCwgcG9z
dGdpcywKICBweXRob24tcGFoby1tcXR0LCBweXRob24tcHlnYW1lLCBxZW11LCBxbGliYywKICBx
b3JpcS1jYWRlbmNlLWRwLWZpcm13YXJlLCBxdDV4bWxwYXR0ZXJucywgcmFuZ2VyLCBybmctdG9v
bHMsIHJzeXNsb2csCiAgcnRsODE4OWVzLCBydGw4NzIzYnUsIHJ1bmMsIHJ1c3RjLCBzY29uZXNl
cnZlciwgc2RsMiwgc25vcnQsIHNveCwKICBzdHJlc3MtbmcsIHN0cm9uZ3N3YW4sIHN1bnhpLW1h
bGktdXRnYXJkLWRyaXZlciwgc3lzbGludXgsIHN5c2xvZy1uZywKICB0Y2YtYWdlbnQsIHRlc3Nl
cmFjdC1vY3IsIHVhY21lLCB1Ym9vdC10b29scywgdXNiZ3VhcmQsIHhmc3Byb2dzLAogIHhzZXJ2
ZXJfeG9yZy1zZXJ2ZXIsIHh0YWJsZXMtYWRkb25zLCB6emlwbGliCgpGb3IgbW9yZSBkZXRhaWxz
LCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRy
b290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMi4wMi42CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFj
a2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRv
IGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRs
b2cgLXNuIDIwMjIuMDIuNS4uCgogICAgNTQgIEZhYnJpY2UgRm9udGFpbmUKICAgIDI5ICBSaWNh
cmRvIE1hcnRpbmNvc2tpCiAgICAyMyAgR2l1bGlvIEJlbmV0dGkKICAgIDE0ICBUaG9tYXMgUGV0
YXp6b25pCiAgICAxMiAgWWFubiBFLiBNT1JJTgogICAgMTEgIEZyYW5jb2lzIFBlcnJhZAogICAg
IDcgIFBldGVyIEtvcnNnYWFyZAogICAgIDYgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgNiAgUm9t
YWluIE5hb3VyCiAgICAgNSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDUgIEJlcm5kIEt1
aGxzCiAgICAgNSAgTGFuZyBEYW5pZWwKICAgICA0ICBMdWNhIENlcmVzb2xpCiAgICAgNCAgTWFy
Y3VzIEhvZmZtYW5uCiAgICAgNCAgUXVlbnRpbiBTY2h1bHoKICAgICAzICBKYW1lcyBIaWxsaWFy
ZAogICAgIDIgIEFsZXhhbmRydSBBcmRlbGVhbgogICAgIDIgIEJhcnVjaCBTaWFjaAogICAgIDIg
IEp1bGllbiBPbGl2YWluCiAgICAgMiAgTmljb2xhIERpIExpZXRvCiAgICAgMSAgQWxpc3RhaXIg
RnJhbmNpcwogICAgIDEgIEFuZHJlYXMgWmllZ2xlcgogICAgIDEgIEFybm91dCBWYW5kZWNhcHBl
bGxlCiAgICAgMSAgQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKQogICAgIDEg
IEF0c3VzaGkgTmVtb3RvCiAgICAgMSAgQnJhbSBWbGVyaWNrCiAgICAgMSAgRmxvcmlhbiBGYWlu
ZWxsaQogICAgIDEgIEdyemVnb3J6IEJsYWNoCiAgICAgMSAgR3dlbmhhZWwgR29hdmVjLU1lcm91
CiAgICAgMSAgSm9hY2hpbSBXaWJlcmcKICAgICAxICBKb2huIEtlZXBpbmcKICAgICAxICBLb25z
dGFudGluIE1lbnlhZXYKICAgICAxICBNYXJrdXMgTWF5ZXIKICAgICAxICBNYXhpbSBLb2NoZXRr
b3YKICAgICAxICBNaWNoYWVsIEtsZWluCiAgICAgMSAgTWljaGFlbCBOb3N0aG9mZgogICAgIDEg
IE5pa2xhcyBDYXNzZWwKICAgICAxICBQZXRlciBTZWlkZXJlcgogICAgIDEgIFJvb3NlbiBIZW5y
aQogICAgIDEgIFN0ZWZhbiBBZ25lcgogICAgIDEgIFRob21hcyBEZXZvb2dkdAogICAgIDEgINCb
0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KQoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
