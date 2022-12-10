Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E06C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3478D41505;
	Sat, 10 Dec 2022 16:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3478D41505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNKxNljYVDcx; Sat, 10 Dec 2022 16:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20507414C0;
	Sat, 10 Dec 2022 16:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20507414C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5981BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34DCB40376
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34DCB40376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vqJGSsUXeeP for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:18:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5255400AF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5255400AF
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:18:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 327401BF206
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:18:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1p42Ya-003i0u-5O
 for buildroot@buildroot.org; Sat, 10 Dec 2022 17:18:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 17:18:32 +0100
Message-ID: <87mt7vz0yv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.8 released
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
MjIuMDIuOCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjgudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjAyLjgudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjAyLjggaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIuMDIuNyByZWxlYXNlLgoKLSBTZWN1cml0
eSBmaXhlcyBmb3IgYXN0ZXJpc2ssIGRvdmVjb3QsIGV4aW0sIGZyZWVyZHAsIGdpdCwgaGVpbWRh
bCwKICBsaWJhcmNoaXZlLCBsaWJrcmI1LCBsaWJrc2JhLCBuZXRzbm1wLCBuZ2lueCwgcHl0aG9u
Mywgc2FtYmE0LCBzZGwsCiAgc3lzc3RhdCwgc3lzdGVtZCwgdmltLCB2bGMsIHhlbiwgeHRlcm0K
Ci0gRml4ZXMgZm9yIGRvd25sb2FkL2NvbXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMg
aW4gZGFzaCwKICBkb3ZlY290LXBpZ2VvbmhvbGUsIGVkazIsIGVkazItcGxhdGZvcm1zLCBlbGYy
Zmx0LCBnY2MsIGdkYiwgZ251cGcyLAogIGl3ZCwga29kaSwgbGlibWRieCwgbGlib3BlbnNzbCwg
bWVtY2FjaGVkLCBvcGVucGdtLCBvcHRlZS1jbGllbnQsCiAgcnN5bmMsIHJ0bDg3MjNidSwgc2Rs
Miwgc3d1cGRhdGUsIHVib290CgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmls
ZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9
MjAyMi4wMi44CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVu
Y291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRy
aWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjIuMDIuNy4uCgog
ICAgMTYgIFBldGVyIEtvcnNnYWFyZAogICAgMTEgIEZhYnJpY2UgRm9udGFpbmUKICAgIDEwICBC
ZXJuZCBLdWhscwogICAgIDMgIE1pY2hhZWwgRmlzY2hlcgogICAgIDMgIFZpbmNlbnQgU3RlaGzD
qQogICAgIDIgIEdpdWxpbyBCZW5ldHRpCiAgICAgMiAgSmFtZXMgSGlsbGlhcmQKICAgICAyICBU
aG9tYXMgUGV0YXp6b25pCiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAgIDEgIEFsZXhhbmRlciBM
dWtpY2hldgogICAgIDEgIEFuZHLDqSBad2luZwogICAgIDEgIEJhcnVjaCBTaWFjaAogICAgIDEg
IEJyYW5kb24gTWFpZXIKICAgICAxICBFdGllbm5lIENhcnJpZXJlCiAgICAgMSAgTWF4IEZpbGlw
cG92CiAgICAgMSAgTWljaGFlbCBOb3N0aG9mZgogICAgIDEgIE1pcXVlbCBSYXluYWwKICAgICAx
ICBZZWdvciBZZWZyZW1vdgogICAgIDEgIFppa3VpIFpoYW8KICAgICAxICDQm9C10L7QvdC40LQg
0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
