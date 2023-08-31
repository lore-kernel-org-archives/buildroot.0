Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF6C83F2F
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C8161347;
	Thu, 31 Aug 2023 19:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32C8161347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2A9TVoyTjZ1Y; Thu, 31 Aug 2023 19:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874A361339;
	Thu, 31 Aug 2023 19:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 874A361339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DCC01BF576
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F88041F92
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F88041F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALF3ABObEG-c for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:27:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C457B41F65
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C457B41F65
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E45D240002
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:27:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qbnJs-0011kA-L1
 for buildroot@buildroot.org; Thu, 31 Aug 2023 21:27:08 +0200
From: Peter Kierkegaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 21:27:08 +0200
Message-ID: <87h6ofko6r.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.4 released
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
MjMuMDIuNCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjQudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIzLjAyLjQudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIzLjAyLjQgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjMuMDIuMyByZWxlYXNlLgoKLSBDb3JyZWN0
bHkgbWFyayBCb290bGluIGV4dGVybmFsIHRvb2xjaGFpbnMgYXMgaGF2aW5nIE9wZW5NUCBzdXBw
b3J0CgotIEVuc3VyZSB1dGlscy9kb2NrZXItcnVuIGNvcnJlY3RseSBzdXBwb3J0cyBnaXQgd29y
a3RyZWVzLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgZG1pZGVjb2RlLCBnaG9zdHNjcmlwdCwgZ28s
IGlwZXJmMywgbGliY3VybCwKICBsaWJtb2RzZWN1cml0eSwgbGlib3BlbnNzbCwgb3BlbnNzaCwg
c2FtYmE0LCB0cG0yLXRzcywgd2Via2l0Z3RrLAogIHdwZXdlYmtpdAoKLSBGaXhlcyBmb3IgZG93
bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbgogIGFybS10cnVzdGVk
LWZpcm13YXJlLCBiaW5kLCBjYWlybywgY21vY2thLCBjb250YWluZXJkLCBjcnVkaW5pLAogIGZm
bXBlZywgZnJlZXNjYWxlLWlteCwgZ2NjLCBnZGIsIGdrcmVsbG0sIGdudXJhZGlvLCBsaWJzc2gs
CiAgbGlidWJvb3RlbnYsIGxpYnVodHRwZCwgbGludXgtdG9vbHMsIG50cCwgcGhwLCBwaXBld2ly
ZSwKICBweXRob24taW5pcGFyc2UsIHB5dGhvbi1pcHRhYmxlcywgcHl0aG9uLXB5c21iLCBydGw4
MTg5ZnMsIHNhbS1iYSwKICBzZWF0ZCwgc3BlZXgsIHN1cGVydHV4a2FydCwgc3lzZGlnLCB0b3Is
IHVib290LCB1bnppcCwgd2lyZWxlcy1yZWdkYiwKICB3b2xmc3NsLCB3cGViYWNrZW5kLWZkbywg
eGVub21haSwgeWFtbC1jcHAsIHlhdnRhCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5H
RVMgZmlsZToKCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5H
RVM/aWQ9MjAyMy4wMi40CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9u
Z2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxl
IGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjMuMDIu
My4uCgogICAgNDEgIEJlcm5kIEt1aGxzCiAgICAgMyAgR2l1bGlvIEJlbmV0dGkKICAgICAzICBK
YW1lcyBIaWxsaWFyZAogICAgIDMgIEp1bGllbiBPbGl2YWluCiAgICAgMyAgUGV0ZXIgS29yc2dh
YXJkCiAgICAgMiAgQnJhbmRvbiBNYWllcgogICAgIDIgIENoYXJsZXMgSGFyZGluCiAgICAgMiAg
Q2hyaXN0aWFuIFN0ZXdhcnQKICAgICAyICBMYW5nIERhbmllbAogICAgIDIgIEx1Y2EgQ2VyZXNv
bGkKICAgICAyICBTZXJnZXkgQm9icmVub2sKICAgICAyICBUaG9tYXMgUGV0YXp6b25pCiAgICAg
MiAgVmluY2VudCBGYXppbwogICAgIDEgIERhcmlvIEJpbmFjY2hpCiAgICAgMSAgRmxvcmlhbiBG
YWluZWxsaQogICAgIDEgIEZyYW5rIFZhbmJldmVyCiAgICAgMSAgR3dlbmhhZWwgR29hdmVjLU1l
cm91CiAgICAgMSAgSm9lbCBDYXJsc29uCiAgICAgMSAgTG90aGFyIEZlbHRlbgogICAgIDEgIE5l
YWwgRnJhZ2VyCiAgICAgMSAgUGllcnJlIEZpY2hldXgKICAgICAxICBQaWV0ZXJqYW4gQ2FtZXJs
eW5jawogICAgIDEgIFJvbWFpbiBOYW91cgogICAgIDEgIFPDqWJhc3RpZW4gU3p5bWFuc2tpCiAg
ICAgMSAgVmluY2VudCBTdGVobMOpCiAgICAgMSAgWWFubiBFLiBNT1JJTgogICAgIDEgIFllZ29y
IFllZnJlbW92CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
