Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93805C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 20:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1442F405BA;
	Sun,  1 Sep 2024 20:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJsVh0daaJYF; Sun,  1 Sep 2024 20:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE969405C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE969405C5;
	Sun,  1 Sep 2024 20:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD381BF591
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D44760754
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Qe78PfYjjN1 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 20:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 018B6606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 018B6606A6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 018B6606A6
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 20:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FA3EE0002
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 20:17:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skr0Y-001O33-1B
 for buildroot@buildroot.org; Sun, 01 Sep 2024 22:17:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 01 Sep 2024 22:17:10 +0200
Message-ID: <87jzfvruwp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.08-rc3 released
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

SGksCgpCdWlsZHJvb3QgMjAyNC4wOC1yYzMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyNC4wOC1yYzMu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0
LjA4LXJjMy50YXIueHoKCk9yIGdldCBpdCBmcm9tIEdpdDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC5naXQKCkFub3RoZXIgd2VlaywgYW5vdGhlciByZWxlYXNl
IGNhbmRpZGF0ZS4gRm9yIGNoYW5nZXMsIHNlZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wOC1yYzMvQ0hBTkdFUwoKUGxlYXNlIGdpdmUg
aXQgYSBzcGluIGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBtYWlsaW5nIGxpc3Qgb3IK
YnVnIHRyYWNrZXIuIE1hbnkgdGhhbmtzIHRvIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRo
aXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyNC4wOC1yYzIuLgoKICAgICA5ICBXYWxk
ZW1hciBCcm9ka29yYgogICAgIDcgIEJlcm5kIEt1aGxzCiAgICAgNSAgVGhvbWFzIFBldGF6em9u
aQogICAgIDQgIFBldGVyIEtvcnNnYWFyZAogICAgIDIgIEp1bGllbiBPbGl2YWluCiAgICAgMiAg
U2NvdHQgRmFuCiAgICAgMiAgVGhvbWFzIEh1dGgKICAgICAxICBEYXJpbyBCaW5hY2NoaQogICAg
IDEgIEZhYmlvIEVzdGV2YW0KICAgICAxICBKLiBOZXVzY2jDpGZlcgogICAgIDEgIEphbWVzIEhp
bGxpYXJkCiAgICAgMSAgTWFyY3VzIEhvZmZtYW5uCiAgICAgMSAgTWF0dGlhIE5hcmR1Y2NpCiAg
ICAgMSAgUm95IEtvbGxlbiBTdmVuZHNlbgogICAgIDEgIFdvb2Ryb3cgRG91Z2xhc3MKCkV4cGVj
dCB0aGUgZmluYWwgMjAyNC4wOCByZWxlYXNlIGluIGEgZmV3IGRheXMuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
