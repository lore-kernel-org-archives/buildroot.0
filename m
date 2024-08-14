Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26841C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 11:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACAE78143E;
	Wed, 14 Aug 2024 11:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-NEYHS5WeaJ; Wed, 14 Aug 2024 11:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB2AF81444
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2AF81444;
	Wed, 14 Aug 2024 11:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 296C71BF616
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1626640285
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lo0190_3NEQF for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 11:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7062C4021E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7062C4021E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7062C4021E
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:43:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8496E40005
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:43:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1seCPW-00CLUq-0N
 for buildroot@buildroot.org; Wed, 14 Aug 2024 13:43:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 13:43:26 +0200
Message-ID: <87v803gwip.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.5 released
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
MDI0LjAyLjUgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuNS50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjUudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjAyLjUgdGFnKQoKQnVpbGRyb290IDIwMjQuMDIuNSBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlIG9uIHRoZSBjdXJyZW50IGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIg
b2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0
aGUgMjAyNC4wMi40IHJlbGVhc2UuCgotIEluZnJhc3RydWN0dXJlOiBWYXJpb3VzIG1pbm9yIGlt
cHJvdmVtZW50cyB0byB1dGlscy9jaGVjay1wYWNrYWdlCgotIERlZmNvbmZpZ3M6IEFkZCBkb3du
bG9hZCBoYXNoZXMgZm9yIGNocm9tZWJvb2stZWxtLCBjaHJvbWVib29rLXNub3cKICBhbmQgc3Rt
MzJtcDE1N2FfZGsxCgotIFNlY3VyaXR5IGZpeGVzIGZvciBleGltLCBnbywgd2Via2l0Z3RrLCB3
b2xmc3NsCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2Ug
aXNzdWVzIGluIGJpdGNvaW4sCiAgYm9vc3QsIGNoZWNrLCBjb250YWluZXJkLCBkaXJldGZiLCBl
ZCwgZnd0cywgZ2NjLCBrZXhlYywgbGliYXJjaGl2ZSwKICBsaWJnZW9zLCBsaWJyZXNzbCwgbXVw
ZGYsIG5vZGVqcywgbnRwc2VjLCBvY3RhdmUsIG9wZW5zc2gsIHBwcGQsCiAgcHl0aG9uLW11cGRm
LCBxdDV3ZWJraXQsIHJhdWMtaGF3a2JpdC11cGRhdGVyLCBzbmFwcHksIHNxdWlkLAogIHN1bnhp
LXRvb2xzLCBzeXNsaW51eCwgc3lzdGVtZCwgdGNmLWFnZW50LCB1YnVzLCB1dGlsLWxpbnV4LCB1
dncsCiAgd3Bld2Via2l0LCB4MjY1LCB4bGliX2xpYnhzaG1mZW5jZSwgeHZpc29yCgpGb3IgbW9y
ZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wMi41L0NIQU5HRVMKClVzZXJzIG9mIHRo
ZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoK
TWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFz
ZToKCmdpdCBzaG9ydGxvZyAtcyAtbiAyMDI0LjAyLjQuLgoKICAgIDE1ICBUaG9tYXMgUGV0YXp6
b25pCiAgICAxMyAgSnVsaWVuIE9saXZhaW4KICAgICA2ICBZYW5uIEUuIE1PUklOCiAgICAgNSAg
RmFicmljZSBGb250YWluZQogICAgIDQgIERhcmlvIEJpbmFjY2hpCiAgICAgMyAgQmVybmQgS3Vo
bHMKICAgICAzICBNYXJjdXMgSG9mZm1hbm4KICAgICAzICBQZXRlciBLb3JzZ2FhcmQKICAgICAz
ICBSYXBoYcOrbCBNw6lsb3R0ZQogICAgIDMgIFJpY2FyZG8gTWFydGluY29za2kKICAgICAzICBU
aG9tYXMgRGV2b29nZHQKICAgICAzICBXYWxkZW1hciBCcm9ka29yYgogICAgIDIgIEFsZXhpcyBM
b3Rob3LDqQogICAgIDIgIEhlaWtvIFRoaWVyeQogICAgIDEgIEFkcmlhbiBQZXJleiBkZSBDYXN0
cm8KICAgICAxICBBbGV4YW5kZXIgV2VsbGJyb2NrCiAgICAgMSAgQXJub3V0IFZhbmRlY2FwcGVs
bGUKICAgICAxICBCYXJ0b3N6IEJpbGFzCiAgICAgMSAgQ2hyaXN0aWFuIFN0ZXdhcnQKICAgICAx
ICBKYW1lcyBIaWxsaWFyZAogICAgIDEgIEphbiBIYXZyYW4KICAgICAxICBKYXJra28gU2Fra2lu
ZW4KICAgICAxICBMYW5jZSBGcmVkcmlja3NvbgogICAgIDEgIE1heGltIEtvY2hldGtvdgogICAg
IDEgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAxICBTYWdpIE1vcgogICAgIDEgIFN0ZWZmZW4gUGVy
c3ZvbGQKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
