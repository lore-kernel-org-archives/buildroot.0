Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72230C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 14:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C64BD4018F;
	Sun,  2 Oct 2022 14:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64BD4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUpQPee0Cv_v; Sun,  2 Oct 2022 14:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F5940133;
	Sun,  2 Oct 2022 14:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F5940133
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13E1A1BF41B
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 14:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAED340984
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 14:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAED340984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id er1Q5kbyrLXo for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 14:10:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58A2D40951
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58A2D40951
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 14:10:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 91F8D240007
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 14:10:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oezfi-00D72E-Km
 for buildroot@buildroot.org; Sun, 02 Oct 2022 16:10:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 02 Oct 2022 16:10:22 +0200
Message-ID: <87lepy2u5t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.05.3 released
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
MjIuMDUuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA1LjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA1LjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjA1LjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MDUuMiByZWxlYXNlLgoKLSBGaXhlZCBjb21wYXRpYmlsaXR5IGlzc3VlIHdpdGggbWFrZSA0LjMg
YW5kIHRoZSAncHJpbnR2YXJzJyAvCiAgJ3Nob3ctdmFycycgY29tbWFuZHMuCgotIERlcGVuZGVu
Y2llczogRW5zdXJlICdmaW5kJyBhbmQgJ3hhcmdzJyBhcmUgYXZhaWxhYmxlIG9uIHRoZSBidWls
ZAogIGhvc3QuCgotIFNlY3VyaXR5IGZpeGVzIGZvciBidXN5Ym94LCBjbGFtYXYsIGRvY2tlci1l
bmdpbmUsIGV4cGF0LCBnaXQsIGdudXRscywKICBnbywgaGVpcmxvb20tbWFpbHgsIGltYWdlbWFn
aWNrLCBsaWJjb25mdXNlLCBsaWJ0aXJwYywgbGlid3BlLAogIGxpYnhtbDIsIGxpYnpsaWIsIG1h
cmlhZGIsIG1pbmlkbG5hLCBtb3NxdWl0dG8sIG5ldHdvcmtkLWRpc3BhdGNoZXIsCiAgcG9zdGdy
ZXNxbCwgcHl0aG9uMywgcmVkaXMsIHJzeW5jLCBzcWxpdGUsIHNxdWlkLCB0Y3ByZXBsYXksCiAg
dGlueXByb3h5LCB1bnppcCwgdjRsMmxvb3BiYWNrLCB2aW0sIHdlYmtpdGd0aywgd29sZnNzbCwg
d3Bld2Via2l0LAoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNl
bnNlIGlzc3VlcyBpbiBhY2UsCiAgYXJtLXRydXN0ZWQtZmlybXdhcmUsIGJhYmVsdHJhY2UsIGJv
b3N0LCBib3RhbiwgYnVzeWJveCwgY29nLCBjb25ubWFuLAogIGNvbnRhaW5lcmQsIGN1cHMsIGRo
Y3BjZCwgZGlyZWN0ZmIsIGRvY2tlci1jbGksIGRvY2tlci1lbmdpbmUsIGVkazIsCiAgZWRrMi1w
bGF0Zm9ybXMsIGVsZjJmbHQsIGZmbXBlZywgZmljbCwgZnJlZXN3aXRjaCwgZ2NjLCBnZGIsIGds
aWJjLAogIGdvY3J5cHRmcywgZ3JhcGhpY3NtYWdpY2ssIGdydWIyLCBnc3QxLXBsdWdpbnMtYmFk
LCBnc3QxLXBsdWdpbnMtZ29vZCwKICBpY3UsIGlnaC1ldGhlcmNhdCwgaW14LWdwdS12aXYsIGph
Y2syLCBqb3NlLCBqcGVnLCBqcXVlcnktdWktdGhlbWVzLAogIGtvZGksIGxpYmNhbWVyYSwgbGli
ZnJlZWltYWdlLCBsaWJnbHZuZCwgbGliZ3BnLWVycm9yLCBsaWJpbnB1dCwKICBsaWJtZGJ4LCBs
aWJwMTEsIGxpYnNlcG9sLCBsaWJ1cG5wLCBsaWJ2aXJ0LCBsaWJ2bmNzZXJ2ZXIsIGxpbnV4LAog
IGxzaHcsIG00LCBtYWtlZGV2cywgbWFrZWR1bXBmaWxlLCBtYWxpLWRyaXZlciwgbWFyaWFkYiwg
bWVtY2FjaGVkLAogIG1lc2EzZCwgbXV0dCwgbXYtZGRyLW1hcnZlbGwsIG5jdXJzZXMsIG5lMTAs
IG5ldHNuaWZmLW5nLCBvY3JhZCwKICBvcGVuY3Y0LCBvcGVub2NkLCBvcGVuc3NoLCBwYW5nbywg
cGNzYy1saXRlLCBwaXN0YWNoZSwgcG9sa2l0LAogIHBvc3RnaXMsIHB5dGhvbi1jcm9zc2Jhciwg
cHl0aG9uLXBhaG8tbXF0dCwgcHl0aG9uLXB5Z2FtZSwgcWVtdSwKICBxbGliYywgcW9yaXEtY2Fk
ZW5jZS1kcC1maXJtd2FyZSwgcXQ1eG1scGF0dGVybnMsIHJhbmdlciwgcm5nLXRvb2xzLAogIHJz
eXNsb2csIHJ0bDgxODllcywgcnRsODcyM2J1LCBydW5jLCBydXN0Yywgc2NvbmVzZXJ2ZXIsIHNk
bDIsIHNub3J0LAogIHNveCwgc3RyZXNzLW5nLCBzdHJvbmdzd2FuLCBzdW54aS1tYWxpLXV0Z2Fy
ZC1kcml2ZXIsIHN5c2RpZywKICBzeXNsaW51eCwgc3lzbG9nLW5nLCB0Y2YtYWdlbnQsIHRlc3Nl
cmFjdC1vY3IsIHVhY21lLCB1Ym9vdC10b29scywKICB1c2JndWFyZCwgd2FmZmxlLCB4ZnNwcm9n
cywgeHNlcnZlcl94b3JnLXNlcnZlciwgeHRhYmxlcy1hZGRvbnMsCiAgenppcGxpYgoKRm9yIG1v
cmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3Qu
bmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjIuMDUuMwoKVXNlcnMgb2YgdGhlIGFm
ZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpOb3Rp
Y2UgdGhhdCB0aGUgMjAyMi4wNS54IHNlcmllcyBpcyBub3cgRU5EIE9GIExJRkUuIFBsZWFzZSBt
aWdyYXRlIHRvCnRoZSAyMDIyLjA4Lnggc2VyaWVzIGluc3RlYWQgd2hpY2ggd2lsbCBiZSBzdXBw
b3J0ZWQgdW50aWwgRGVjZW1iZXIgMjAyMi4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxl
IGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjIuMDUu
Mi4uCgogICAgNjEgIEZhYnJpY2UgRm9udGFpbmUKICAgIDI5ICBSaWNhcmRvIE1hcnRpbmNvc2tp
CiAgICAyMyAgR2l1bGlvIEJlbmV0dGkKICAgIDE2ICBUaG9tYXMgUGV0YXp6b25pCiAgICAxMyAg
WWFubiBFLiBNT1JJTgogICAgMTEgIENocmlzdGlhbiBTdGV3YXJ0CiAgICAgOCAgRnJhbmNvaXMg
UGVycmFkCiAgICAgNyAgUm9tYWluIE5hb3VyCiAgICAgNiAgUGV0ZXIgS29yc2dhYXJkCiAgICAg
NSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDUgIExhbmcgRGFuaWVsCiAgICAgNCAgQmVy
bmQgS3VobHMKICAgICA0ICBMdWNhIENlcmVzb2xpCiAgICAgNCAgTWFyY3VzIEhvZmZtYW5uCiAg
ICAgMyAgSmFtZXMgSGlsbGlhcmQKICAgICAzICBKdWxpZW4gT2xpdmFpbgogICAgIDMgIFF1ZW50
aW4gU2NodWx6CiAgICAgMiAgQWxleGFuZHJ1IEFyZGVsZWFuCiAgICAgMiAgQXJub3V0IFZhbmRl
Y2FwcGVsbGUKICAgICAyICBCYXJ1Y2ggU2lhY2gKICAgICAyICBOaWNvbGEgRGkgTGlldG8KICAg
ICAxICBBbGlzdGFpciBGcmFuY2lzCiAgICAgMSAgQW5kcmVhcyBaaWVnbGVyCiAgICAgMSAgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKQogICAgIDEgIEF0c3VzaGkgTmVtb3Rv
CiAgICAgMSAgQnJhbSBWbGVyaWNrCiAgICAgMSAgRW1pbGUgQ29ybWllcgogICAgIDEgIEZsb3Jp
YW4gRmFpbmVsbGkKICAgICAxICBHcnplZ29yeiBCbGFjaAogICAgIDEgIEd3ZW5oYWVsIEdvYXZl
Yy1NZXJvdQogICAgIDEgIEpvYWNoaW0gV2liZXJnCiAgICAgMSAgSm9lbCBTdGFubGV5CiAgICAg
MSAgSm9obiBLZWVwaW5nCiAgICAgMSAgS29uc3RhbnRpbiBNZW55YWV2CiAgICAgMSAgTWFya3Vz
IE1heWVyCiAgICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAgTWljaGFlbCBLbGVpbgogICAg
IDEgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAxICBOaWtsYXMgQ2Fzc2VsCiAgICAgMSAgUGV0ZXIg
U2VpZGVyZXIKICAgICAxICBSb29zZW4gSGVucmkKICAgICAxICBTdGVmYW4gQWduZXIKICAgICAx
ICBUaG9tYXMgRGV2b29nZHQKICAgICAxICBUaXRvdWFuIENocmlzdG9waGUKICAgICAxICDQm9C1
0L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikKCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
