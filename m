Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD59C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 21:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6212782A5D;
	Wed, 27 Jul 2022 21:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6212782A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBIORt8OSTH2; Wed, 27 Jul 2022 21:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6769D82907;
	Wed, 27 Jul 2022 21:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6769D82907
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165E91BF405
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5CB440983
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5CB440983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVn-Q8Om3JWo for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 21:21:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6746D40104
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6746D40104
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:21:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 780471BF206
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:21:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1oGoSn-003f1S-3N
 for buildroot@buildroot.org; Wed, 27 Jul 2022 23:21:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 23:21:04 +0200
Message-ID: <87edy6qmkf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.05.1 released
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
MjIuMDUuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA1LjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA1LjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjA1LjEgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MDUgcmVsZWFzZS4KCi0gRGlzYWJsZSBiaWcgZW5kaWFuIG5vLW1tdSBvbiBBUk0gYXMgaXQgaXMg
bm90IHN1cHBvcnRlZCBieSBlbGYyZmx0LgoKLSBUaWdodGVuIGRlcGVuZGVuY2llcyBmb3IgZXh0
ZXJuYWwgQm9vdGxpbiB0b29sY2hhaW5zIHRvIGVuc3VyZSB0aGV5CiAgY2FuIG9ubHkgYmUgc2Vs
ZWN0ZWQgaW4gY29tcGF0aWJsZSBjb25maWd1cmF0aW9ucy4KCi0gU3VwcG9ydCBleHRlcm5hbCB0
b29sY2hhaW5zIHdpdGhvdXQgZ2Ric2VydmVyLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXBhY2hl
LCBjdXBzLCBnaG9zdHNjcmlwdCwgZ3N0MS1wbHVnaW5zLWdvb2QsCiAgbGliY3VybCwgbGlib3Bl
bnNzbCwgbGlicGpzaXAsIGxpYnNuZGZpbGUsIGxvZ3JvdGF0ZSwgcGhwLAogIHB5dGhvbi1waWxs
b3csIHFkZWNvZGVyLCBzb2ZpYS1zaXAsIHRjcHJlcGxheSwgdG9yLCB2aW0KCi0gRml4ZXMgZm9y
IGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gYXBhY2hlLAog
IGF2YWhpLCBiZHdnYywgYmluZCwgYnBmdG9vbCwgZGFya2h0dHBkLCBkbWFsbG9jLCBlY3J5cHRm
cy11dGlscywKICBmeGxvYWQsIGdudXRscywgZ3N0LW9teCwgZ3N0MS1kZXZ0b29scywgZ3N0MS1s
aWJhdiwgZ3N0MS1wbHVnaW5zLWJhZCwKICBnc3QxLXBsdWdpbnMtYmFzZSwgZ3N0MS1wbHVnaW5z
LXVnbHksIGdzdDEtcHl0aG9uLCBnc3QxLXJ0c3Atc2VydmVyLAogIGdzdDEtdmFhcGksIGdzdHJl
YW1lcjEsIGdzdHJlYW1lcjEtZWRpdGluZy1zZXJ2aWNlcywgZ3Rlc3QsIGlwdGFibGVzLAogIGtl
eXV0aWxzLCBsY21zMiwgbGliYWJzZWlsLWNwcCwgbGliY2FtZXJhLCBsaWJlYXN0bCwgbGliZ3Bn
bWUsCiAgbGliZ3RrMywgbGlibWRieCwgbGlibWVkaWFhcnQsIGxpYm1vZHNlY3VyaXR5LCBsaWJu
ZXRjb25mMiwKICBsaWJzYW1wbGVyYXRlLCBsaWJ0YWxsb2MsIGx1YWppdCwgbmdpbngsIG5vaXAs
IHBheHRlc3QsIHBvc3RncmVzcWwsCiAgcHJvY3JhbmtfbGludXgsIHB1cmUtZnRwZCwgcmFiYml0
bXEtc2VydmVyLCBycGktdXNlcmxhbmQsIHJ1YnksIHJ1c3RjLAogIHNvZmlhLXNpcCwgc3lzdGVt
ZCwgdGlueXByb3h5LCB1YWNtZSwgdWJvb3QtdG9vbHMsIHdhdGNoZG9nZCwKICB3ZWJraXRndGss
IHdlc3Rvbiwgd2lyZWd1YXJkLWxpbnV4LWNvbXBhdCwgd3BhX3N1cHBsaWNhbnQsIHdwZXdlYmtp
dCwKICB6c3RkCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBz
Oi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMi4wNS4x
CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQg
dG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0
byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjIuMDUuLgoKICAgIDUwICBGYWJy
aWNlIEZvbnRhaW5lCiAgICAxNiAgSmFtZXMgSGlsbGlhcmQKICAgIDEyICBUaG9tYXMgUGV0YXp6
b25pCiAgICAxMCAgQmVybmQgS3VobHMKICAgICAzICBOZWFsIEZyYWdlcgogICAgIDIgIEFuZ2Vs
byBDb21wYWdudWNjaQogICAgIDIgIEZyYW5jb2lzIFBlcnJhZAogICAgIDIgIFBldGVyIEtvcnNn
YWFyZAogICAgIDEgIEFsZXhhbmRlciBNdWtoaW4KICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAx
ICBEYW5vbWkgTWFuY2hlZ28KICAgICAxICBEb21pbmlrIE1pY2hhZWwgUmF1aAogICAgIDEgIEhl
aWtvIFRoaWVyeQogICAgIDEgIE5pY29sYSBEaSBMaWV0bwogICAgIDEgIE5pY29sYXMgQ2F2YWxs
YXJpCiAgICAgMSAgTmljb2xhcyBQT0lST1QKICAgICAxICBRdWVudGluIFNjaHVsegogICAgIDEg
IFNoYWhhYiBWYWhlZGkKICAgICAxICDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1
cmlldikKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
