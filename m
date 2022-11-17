Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14FDC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 13:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323B141932;
	Thu, 17 Nov 2022 13:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 323B141932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVEOvtlTBICq; Thu, 17 Nov 2022 13:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E01E4192D;
	Thu, 17 Nov 2022 13:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E01E4192D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0EB61BF580
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 13:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B830E4192D
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 13:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B830E4192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3Em_vq5Z-Xp for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 13:56:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B034192C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01B034192C
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 13:56:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47A4B20012
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 13:56:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1ovfND-00BkWs-9j
 for buildroot@buildroot.org; Thu, 17 Nov 2022 14:56:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 14:56:11 +0100
Message-ID: <87r0y1d6ro.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.7 released
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
MjIuMDIuNyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjcudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjcudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjcgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIuNiByZWxlYXNlLgoKLSBTZWN1cml0
eSBmaXhlcyBmb3IgYmluZCwgZGFya2h0dHBkLCBkYnVzLCBkaGNwLCBkbnNtYXNxLCBleHBhdCwK
ICBmcmVlcmRwLCBnbywgZ3J1YjIsIGltYWdlbWFnaWNrLCBsaWJjdXJsLCBsaWJmcmliaWQsIGxp
Ym9zaXAyLAogIGxpYnRhc24xLCBsaWJ2bmNzZXJ2ZXIsIGxpYnhtbDIsIGxsZHBkLCBscnppcCwg
bXNtdHAsIG11bHRpcGF0aC10b29scywKICBtdXBkZiwgbm9kZWpzLCBudGZzLTNnLCBvcGVudm10
b29scywgcGhwLCBwaXhtYW4sIHBvcHBsZXIsCiAgcHl0aG9uLWRqYW5nbywgcHl0aG9uMywgc2Ft
YmE0LCBzaGFwZWxpYiwgc3F1YXNoZnMsIHNxdWlkLCBzdHJvbmdzd2FuLAogIHN1ZG8sIHZpbSwg
d29sZnNzbCwgd3Bld2Via2l0LCB6c2gKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9u
L3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4KICBhcm0tdHJ1c3RlZC1maXJtd2FyZSwgYm90YW4s
IGNvbGxlY3RkLCBkb2NrZXItY2xpLCBkb2NrZXItZW5naW5lLAogIGV4ZmF0cHJvZ3MsIGYyZnMt
dG9vbHMsIGZhYWQyLCBmZm1wZWcsIGdudXRscywgZ3BzZCwgZ3NsLCBnc3Qtb214LAogIGdzdDEt
ZGV2dG9vbHMsIGdzdDEtbGliYXYsIGdzdDEtcGx1Z2lucy1iYWQsIGdzdDEtcGx1Z2lucy1iYXNl
LAogIGdzdDEtcGx1Z2lucy1nb29kLCBnc3QxLXBsdWdpbnMtdWdseSwgZ3N0MS1weXRob24sIGdz
dDEtcnRzcC1zZXJ2ZXIsCiAgZ3N0MS12YWFwaSwgZ3N0cmVhbWVyMSwgZ3N0cmVhbWVyMS1lZGl0
aW5nLXNlcnZpY2VzLCBoZHBhcm0sIGhvc3RhcGQsCiAgaXdkLCBqYWNrMiwgbGliYnBmLCBsaWJp
ZG4yLCBsaWJtZGJ4LCBsaWJvcGVuc3NsLCBsaWJwbmcsCiAgbGlidG9ycmVudC1yYXN0ZXJiYXIs
IGxpYnVodHRwZCwgbGludXgsIGxpbnV4LXRvb2xzLCBsejQsCiAgbWF0Y2hib3gtc3RhcnR1cC1t
b25pdG9yLCBtdXNsLCBtdi1kZHItbWFydmVsbCwgbXhtbCwgbnVtYWN0bCwKICBwYWhvLW1xdHQt
YywgcGVybC1uZXQtc3NsZWF5LCBwcm9jcHMtbmcsIHJwaS11c2VybGFuZCwgcnN5bmMsCiAgcnRs
ODE4OWVzLCBydGw4MTg5ZnMsIHJ0bDg3MjNidSwgcnRsODgxMmF1LWFpcmNyYWNrLW5nLCBydGw4
ODIxYXUsCiAgcnRsXzQzMywgc29jYXQsIHNxbGl0ZSwgc3d1cGRhdGUsIHVjbGliYy1uZy10ZXN0
LCB1ZGlza3MsIHVmdHAsIHVoZCwKICB1bXRwcmQsIHdhdmVtb24sIHdpcmVndWFyZC1saW51eC1j
b21wYXQsIHdwYV9zdXBwbGljYW50LCB6bGliLW5nCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhl
IENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWlu
L0NIQU5HRVM/aWQ9MjAyMi4wMi43CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJl
IHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUg
cGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIw
MjIuMDIuNi4uCgogICAgNjUJRmFicmljZSBGb250YWluZQogICAgMTUJSmFtZXMgSGlsbGlhcmQK
ICAgIDExCVRob21hcyBQZXRhenpvbmkKICAgICA5CUNocmlzdGlhbiBTdGV3YXJ0CiAgICAgOQlH
aXVsaW8gQmVuZXR0aQogICAgIDkJUGV0ZXIgS29yc2dhYXJkCiAgICAgOAlCYXJ1Y2ggU2lhY2gK
ICAgICA3CUJlcm5kIEt1aGxzCiAgICAgNAlOdW5vIEdvbsOnYWx2ZXMKICAgICA0CVlhbm4gRS4g
TU9SSU4KICAgICAzCUxhbmcgRGFuaWVsCiAgICAgMwlOZWFsIEZyYWdlcgogICAgIDMJeWFubi5t
b3JpbkBvcmFuZ2UuY29tCiAgICAgMglGcmFuY29pcyBQZXJyYWQKICAgICAyCVNlcmdleSBNYXR5
dWtldmljaAogICAgIDIJU3RlZmFuIEFnbmVyCiAgICAgMglXb2xmZ2FuZyBHcmFuZGVnZ2VyCiAg
ICAgMQlBZHJpYW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgMQlBbGV4YW5kZXIgRWdvcmVua292CiAg
ICAgMQlIZWlrbyBUaGllcnkKICAgICAxCUpvZWwgU3RhbmxleQogICAgIDEJTWFya3VzIE1heWVy
CiAgICAgMQlNaWNoYWVsIE5vc3Rob2ZmCiAgICAgMQlQYXVsIENlcmN1ZWlsCiAgICAgMQlQZXRy
IFZvcmVsCiAgICAgMQlUaW0gR292ZXIKICAgICAxCVRvYmlhcyBXYWxkZWtyYW56CiAgICAgMQlW
aW5jZW50IEZhemlvCiAgICAgMQlXYWxkZW1hciBCcm9ka29yYgogICAgIDEJV29vZHkgRG91Z2xh
c3MKICAgICAxCdCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KQoKLS0gCkJ5
ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
