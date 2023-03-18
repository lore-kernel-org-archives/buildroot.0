Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8904AC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 16:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B2460BF4;
	Sat, 18 Mar 2023 16:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7B2460BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SanXFMWWqEp6; Sat, 18 Mar 2023 16:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E0A260BE4;
	Sat, 18 Mar 2023 16:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E0A260BE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A679B1BF59A
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 16:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79AB060BE4
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 16:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79AB060BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJfC2PC-KYvJ for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 16:26:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84A260AE3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D84A260AE3
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 16:26:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E788720004
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 16:26:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pdZOM-005zeh-Vk
 for buildroot@buildroot.org; Sat, 18 Mar 2023 17:26:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 17:26:50 +0100
Message-ID: <878rfuxbxx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.11.3 released
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
MjIuMTEuMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjExLjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjExLjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjExLjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MTEuMiByZWxlYXNlLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXBhY2hlLCBhcHIsIGFwci11dGls
LCBiaW5kLCBjbGFtYXYsIGV4ZmF0LAogIGV4ZmF0LXV0aWxzLCBnaXQsIGdvLCBoYXByb3h5LCBs
aWJjdXJsLCBsaWJtb2RzZWN1cml0eSwgbGlicGpzaXAsCiAgbGVzcywgcGFoby1tcXR0LWMsIHBo
cCwgcHl0aG9uLWNyeXB0b2dyYXBoeSwgcHl0aG9uLWRqYW5nbywKICBweXRob24tbTJjcnlwdG8s
IHB5dGhvbi13ZXJremV1ZywgdGlmZiwgdWFjbWUsIHdlYmtpdGd0aywgd3Bld2Via2l0CgotIEZp
eGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGFj
ZSwKICBhc3RlcmlzaywgYXQ5MWRhdGFmbGFzaGJvb3QsIGF1ZGl0LCBkbWFsbG9jLCBlZml2YXIs
IGVybGFuZywKICBmMmZzLXRvb2xzLCBnZGFsLCBnZW5zaW8sIGdlcmJlcmEsIGdsc2xzYW5kYm94
LXBsYXllciwgaW50ZWwtZ21tbGliLAogIGlwbWl1dGlsLCBsaWJibG9ja2RldiwgbGliZXYsIGxp
YmdjcnlwdCwgbGliZ2xmdywgbGlibWFkLCBsaWJtZGJ4LAogIGxpYm9sbSwgbGlyYy10b29scywg
bHR0bmctYmFiZWx0cmFjZSwgbWVuZGVyLCBtcHYsIG11dHQsIG14cy1ib290bGV0cywKICBuZXRz
dXJmLCBudHBzZWMsIG51dCwgb3BlbnNiaSwgb3B1cywgcGNtLXRvb2xzLCBwaXN0YWNoZSwgcHJv
ZnRwZCwKICBwcm94eWNoYWlucy1uZywgcHVsc2VhdWRpbywgcHl0aG9uLW51bXB5LCBxZW11LCBx
dWF6aXAsIHF1aWNranMsCiAgcm9ja2NoaXAtbWFsaSwgcnN5bmMsIHM2LWxpbnV4LXV0aWxzLCBz
dWRvLCB1cW1pLCB3aWxjLWRyaXZlciwKICB3cGFfc3VwcGxpY2FudCwgem5jCgpGb3IgbW9yZSBk
ZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQv
YnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMi4xMS4zCgpVc2VycyBvZiB0aGUgYWZmZWN0
ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhh
bmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQg
c2hvcnRsb2cgLXNuIDIwMjIuMTEuMi4uCgogICAgNjYgIEZhYnJpY2UgRm9udGFpbmUKICAgICA3
ICBQZXRlciBLb3JzZ2FhcmQKICAgICA2ICBCZXJuZCBLdWhscwogICAgIDQgIEphbWVzIEhpbGxp
YXJkCiAgICAgNCAgUGV0ZXIgU2VpZGVyZXIKICAgICAzICBZYW5uIEUuIE1PUklOCiAgICAgMiAg
Q2hyaXN0aWFuIFN0ZXdhcnQKICAgICAyICBMYW5nIERhbmllbAogICAgIDEgIEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8KICAgICAxICBBcm5vdXQgVmFuZGVjYXBwZWxsZQogICAgIDEgIEdpdWxpbyBC
ZW5ldHRpCiAgICAgMSAgSGVpa28gVGhpZXJ5CiAgICAgMSAgSnVsaWVuIE9saXZhaW4KICAgICAx
ICBNYXR0aGV3IFdlYmVyCiAgICAgMSAgTmljb2xhIERpIExpZXRvCiAgICAgMSAgUm9tYWluIE5h
b3VyCiAgICAgMSAgU2ViYXN0aWFuIFdleWVyCiAgICAgMSAgU2VyZ2V5IE1hdHl1a2V2aWNoCiAg
ICAgMSAgU3RlZmFuIEFnbmVyCiAgICAgMSAgVGhvbWFzIERldm9vZ2R0CiAgICAgMSAgVGhvbWFz
IFBldGF6em9uaQogICAgIDEgINCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2
KQoKVGhpcyB3aWxsIGJlIGZpbmFsIDIwMjIuMTEueCByZWxlYXNlLiBQbGVhc2UgbWlncmF0ZSB0
byBvdXIgbmV3IGxvbmcKdGVybSBzdXBwb3J0IHJlbGVhc2UgaW5zdGVhZCwgMjAyMy4wMi54LgoK
LS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
