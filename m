Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CA1C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 10:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D95D40210;
	Wed, 14 Aug 2024 10:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe-VsdkM_J-J; Wed, 14 Aug 2024 10:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1946C40BAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1946C40BAD;
	Wed, 14 Aug 2024 10:04:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1AF1BF5A3
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 10:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0890040BAD
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 10:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiXlHnj4eyeD for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 10:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11F7D40210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F7D40210
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11F7D40210
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 10:04:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11C0B240008
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 10:04:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1seArQ-00C941-1b
 for buildroot@buildroot.org; Wed, 14 Aug 2024 12:04:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 12:04:08 +0200
Message-ID: <87zfpfh147.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.05.2 released
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
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI0LjA1LjIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDUuMi50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjA1LjIudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjA1LjIgdGFnKQoKQnVpbGRyb290IDIwMjQuMDUuMiBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4wNS4xIHJlbGVhc2UuCgotIEluZnJhc3Ry
dWN0dXJlOiBWYXJpb3VzIG1pbm9yIGltcHJvdmVtZW50cyB0byB1dGlscy9jaGVjay1wYWNrYWdl
CgotIERlZmNvbmZpZ3M6IEFkZCBkb3dubG9hZCBoYXNoZXMgZm9yIGNocm9tZWJvb2stZWxtLCBj
aHJvbWVib29rLXNub3cKICBhbmQgc3RtMzJtcDE1N2FfZGsxCgotIFNlY3VyaXR5IGZpeGVzIGZv
ciBleGltLCBnbywgd2Via2l0Z3RrLCB3b2xmc3NsCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21w
aWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluCiAgYW5kcm9pZC10b29scywgYmNjLCBi
aXRjb2luLCBib29zdCwgY2Rya2l0LCBjaGVjaywgY29udGFpbmVyZCwKICBkaXJlY3RmYiwgZHVt
cDEwOTAsIGVkLCBmYWlsMmJhbiwgZnJvdHosIGZ3dHMsIGdjYywgZ3BtLCBrZXhlYywKICBsaWJh
cmNoaXZlLCBsaWJnZW9zLCBsaWJyZXNzbCwgbXVwZGYsIG5jZnRwLCBub2RlanMsIG50cHNlYywg
b2N0YXZlLAogIG9wZW5zc2gsIHBwcGQsIHB5dGhvbi1tdXBkZiwgcXQ1d2Via2l0LCByYXVjLWhh
d2tiaXQtdXBkYXRlciwKICBydGw4MTg4ZXUsIHNuYXBweSwgc3F1aWQsIHN1bnhpLXRvb2xzLCBz
eXNsaW51eCwgc3lzdGVtZCwgdGNmLWFnZW50LAogIHRmdHBkLCB1YnVzLCB1dGlsLWxpbnV4LCB1
dncsIHdwZXdlYmtpdCwgeDI2NSwgeGxpYl9saWJ4c2htZmVuY2UsCiAgeHZpc29yCgpGb3IgbW9y
ZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wNS4yL0NIQU5HRVMKClVzZXJzIG9mIHRo
ZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoK
TWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFz
ZToKCmdpdCBzaG9ydGxvZyAtcyAtbiAyMDI0LjA1LjEuLgoKICAgIDE4ICBUaG9tYXMgUGV0YXp6
b25pCiAgICAxMiAgSnVsaWVuIE9saXZhaW4KICAgICA3ICBZYW5uIEUuIE1PUklOCiAgICAgNiAg
RmFicmljZSBGb250YWluZQogICAgIDUgIERhcmlvIEJpbmFjY2hpCiAgICAgMyAgQmVybmQgS3Vo
bHMKICAgICAzICBNYXJjdXMgSG9mZm1hbm4KICAgICAzICBQZXRlciBLb3JzZ2FhcmQKICAgICAz
ICBSYXBoYcOrbCBNw6lsb3R0ZQogICAgIDMgIFJpY2FyZG8gTWFydGluY29za2kKICAgICAzICBU
aG9tYXMgRGV2b29nZHQKICAgICAzICBXYWxkZW1hciBCcm9ka29yYgogICAgIDMgIFllZ29yIFll
ZnJlbW92CiAgICAgMiAgQWxleGlzIExvdGhvcsOpCiAgICAgMiAgQW5nZWxvIENvbXBhZ251Y2Np
CiAgICAgMiAgQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICAyICBDaHJpc3RpYW4gU3Rld2FydAog
ICAgIDIgIEdlcm8gU2Nod8Okcmlja2UKICAgICAyICBIZWlrbyBUaGllcnkKICAgICAxICBBZHJp
YW4gUGVyZXogZGUgQ2FzdHJvCiAgICAgMSAgQWxleGFuZGVyIFdlbGxicm9jawogICAgIDEgIEJh
cnRvc3ogQmlsYXMKICAgICAxICBHaXVsaW8gQmVuZXR0aQogICAgIDEgIEphbWVzIEhpbGxpYXJk
CiAgICAgMSAgSmFuIEhhdnJhbgogICAgIDEgIEphcmtrbyBTYWtraW5lbgogICAgIDEgIExhbmNl
IEZyZWRyaWNrc29uCiAgICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAgTWljaGFlbCBOb3N0
aG9mZgogICAgIDEgIFNhZ2kgTW9yCiAgICAgMSAgU3RlZmZlbiBQZXJzdm9sZAogICAgIDEgIFRo
b21hcyBIdXRoCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
