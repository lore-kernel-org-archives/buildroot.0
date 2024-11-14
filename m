Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E460ED68B18
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 13:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83093844B5;
	Thu, 14 Nov 2024 13:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLhxQ1CzEL-g; Thu, 14 Nov 2024 13:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E9C844A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E9C844A3;
	Thu, 14 Nov 2024 13:37:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA69D972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A396E401FB
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klS5eAcp4DWl for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 13:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5C3440236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C3440236
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5C3440236
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:36:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04038FF803
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 13:36:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBa1o-002ARM-1J
 for buildroot@buildroot.org; Thu, 14 Nov 2024 14:36:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 14:36:56 +0100
Message-ID: <871pzex7gn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.08.2 released
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
MDI0LjA4LjIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDguMi50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjA4LjIudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjA4LjIgdGFnKQoKQnVpbGRyb290IDIwMjQuMDguMiBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4wOC4xIHJlbGVhc2UuCgotIE5ldyBwYWNr
YWdlczogcHl0aG9uLXB5cXQ1LXNpcAoKLSBTZWN1cml0eSBmaXhlcyBmb3IgZ2hvc3RzY3JpcHQs
IGludGVsLW1pY3JvY29kZSwgbGliYXJjaGl2ZSwgbmdodHRwMgoKLSBGaXhlcyBmb3IgZG93bmxv
YWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhcGFjaGUsCiAgYXN0ZXJp
c2ssIGJpbmQsIGNtYWtlLCBmaWxlLCBmbHVpZHN5bnRoLCBoZWltZGFsLCBpcHJvdXRlMiwgamFp
bGhvdXNlLAogIGpzb25jcHAsIGxpYmN1cmwsIGxpYmdpdDIsIGxpYmxkbnMsIGxpYmxpbmVhciwg
bGlibWRieCwgbGlib3BlbmgyNjQsCiAgbGlicG5nLCBsaWJ0cmFjZWV2ZW50LCBsaWJ4bWwyLCBs
dHJhY2UsIG5ldGhvZ3MsIG50cCwgcGhwLCBwb3N0Z3Jlc3FsLAogIHByb2Nwcy1uZywgcHl0aG9u
LXB5cXQ1LCBweXRob24zLCBxZW11LCBydWJ5LCBzcWxpdGUsIHN5c3Zpbml0LCB0b3IsCiAgdHJh
Y2UtY21kLCB3cGViYWNrZW5kLWZkbwoKCkZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdF
UyBmaWxlOgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxv
Yi8yMDI0LjA4LjIvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBz
dHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBl
b3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIw
MjQuMDguMS4uCgogICAgMjAgIEJlcm5kIEt1aGxzCiAgICAgOCAgSnVsaWVuIE9saXZhaW4KICAg
ICA3ICBXYWxkZW1hciBCcm9ka29yYgogICAgIDUgIFRob21hcyBQZXRhenpvbmkKICAgICAyICBC
cmFuZG9uIE1haWVyCiAgICAgMiAgR2l1bGlvIEJlbmV0dGkKICAgICAyICBNYXJjdXMgSG9mZm1h
bm4KICAgICAyICBOaWNvbGFzIENhdmFsbGFyaQogICAgIDIgIFJhbGYgRHJhZ29uCiAgICAgMSAg
QWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDEgIEFuaXNzZSBBc3RpZXIKICAgICAxICBCYXJ1
Y2ggU2lhY2gKICAgICAxICBCcnlhbiBCcmF0dGxvZgogICAgIDEgIENvZHkgR3JlZW4KICAgICAx
ICBEYXJpbyBCaW5hY2NoaQogICAgIDEgIEVyaWNvIE51bmVzCiAgICAgMSAgRnJhbmNvaXMgUGVy
cmFkCiAgICAgMSAgSGUgSGFvcnVpCiAgICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAgTWlj
aGFlbCBOb3N0aG9mZgogICAgIDEgIFBldGVyIEtvcnNnYWFyZAogICAgIDEgIFJhaW11bmRvIFNh
Z2FyemF6dQogICAgIDEgIFJvbWFpbiBOYW91cgogICAgIDEgIFNlbiBIYXN0aW5ncwogICAgIDEg
INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KQoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
