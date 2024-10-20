Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA308D3C92D
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 14:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9598059E;
	Sun, 20 Oct 2024 14:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzZ3WE2-pwIv; Sun, 20 Oct 2024 14:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41FC0808D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FC0808D9;
	Sun, 20 Oct 2024 14:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC4A1167
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 14:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C4140189
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ShWZpZRDjIw for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 14:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61E3440109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E3440109
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61E3440109
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 14:39:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C257C0003
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 14:39:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2X5S-00DJHT-37
 for buildroot@buildroot.org; Sun, 20 Oct 2024 16:39:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Oct 2024 16:39:18 +0200
Message-ID: <87o73ealex.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.08.1 released
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
MDI0LjA4LjEgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDguMS50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjA4LjEudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjA4LjEgdGFnKQoKQnVpbGRyb290IDIwMjQuMDguMSBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4wOCByZWxlYXNlLgoKLSBQZXItcGFja2Fn
ZS1kaXJlY3RvcmllcyBmaXhlcyBmb3IgdGhlIC5nZGJpbml0IGZpbGUgYW5kIFJQQVRIIGZpeHVw
cwogIGZvciBTREsuCgotIExlZ2FsLWluZm86IEVuc3VyZSBob3N0LXRhciBhbmQgcmVkaXN0IGRp
cmVjdG9yeSBleGlzdHMgd2hlbiB1c2luZwogIG92ZXJyaWRlLXNyY2RpciwgYXMgb3RoZXJ3aXNl
IHRoZSB0YXJiYWxsIGdlbmVyYXRpb24gKHNpbGVudGx5KSBmYWlscy4KCi0gRGVmY29uZmlnczog
aW14NnNsZXZrOiBCdW1wIExpbnV4IGtlcm5lbCB0byA2LjYuNTEgdG8gZml4IGJ1aWxkIGlzc3Vl
CiAgd2l0aCBHQ0MgMTMKCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGFzdGVyaXNrLCBiaW5kLCBjdXBz
LCBleHBhdCwgZ28sIGxpYmFyY2hpdmUsCiAgbGliY3VybCwgbGlicGNhcCwgbW9zcXVpdHRvLCBw
aHAsIHB5dGhvbi1kamFuZ28sIHB5dGhvbjMsIHdwZXdlYmtpdAoKLSBGaXhlcyBmb3IgZG93bmxv
YWQvY29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhdWJpbywKICBidXN5Ym94
LCBjYWlybywgY3J5cHRzZXR1cCwgZmZtcGVnLCBnZW5wYXJ0LCBnbGliYywgZ251dGxzLCBncnVi
MiwKICBsaWJpbGJjLCBsaWdodHRwZCwgbGludXgsIGxpbnV4LXBhbSwgbXRkLCBuZ2lueCwgcHJv
Y3BzLW5nLCBwdXJlLWZ0cGQsCiAgcXQ2Y29yZTVjb21wYXQsIHF0NnN2ZywgcXQ2dG9vbHMsIHJw
LXBwcG9lLCBzYW1iYTQsIHN5c2tsb2dkLCB4ZW5vbWFpLAoKRm9yIG1vcmUgZGV0YWlscywgc2Vl
IHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iLzIwMjQuMDguMS9DSEFOR0VTCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFj
a2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRv
IGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRs
b2cgLXMgLW4gMjAyNC4wOC4uCgogICAxNDUgIFBldGVyIEtvcnNnYWFyZAogICAgMTEgIEJlcm5k
IEt1aGxzCiAgICAgOCAgSnVsaWVuIE9saXZhaW4KICAgICA4ICBZYW5uIEUuIE1PUklOCiAgICAg
NCAgQXJub3V0IFZhbmRlY2FwcGVsbGUKICAgICA0ICBXYWxkZW1hciBCcm9ka29yYgogICAgIDMg
IERhcmlvIEJpbmFjY2hpCiAgICAgMiAgQWtoaWxlc2ggTmVtYQogICAgIDIgIEJhcnVjaCBTaWFj
aAogICAgIDIgIEJyYW5kb24gTWFpZXIKICAgICAyICBDaHJpc3RpYW4gSGl0egogICAgIDIgIEZy
YW5jb2lzIFBlcnJhZAogICAgIDIgIFRob21hcyBQZXJhbGUKICAgICAyICBUaG9tYXMgUGV0YXp6
b25pCiAgICAgMSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDEgIENocmlzdGlhbiBTdGV3
YXJ0CiAgICAgMSAgRGFtaWVuIFRow6liYXVsdAogICAgIDEgIEVkZ2FyIEJvbmV0CiAgICAgMSAg
RmFiaW8gRXN0ZXZhbQogICAgIDEgIEdlb3JnZSBLaWFnaWFkYWtpcwogICAgIDEgIEdpdWxpbyBC
ZW5ldHRpCiAgICAgMSAgSHVnbyBDb3JuZWxpcwogICAgIDEgIEphbWVzIEhpbGxpYXJkCiAgICAg
MSAgSm9hY2hpbSBXaWJlcmcKICAgICAxICBNYXJjdXMgSG9mZm1hbm4KICAgICAxICBNaWNoYWVs
IEZpc2NoZXIKICAgICAxICBUaG9tYXMgRGV2b29nZHQKICAgICAxICBZdXJpeSBLb2xlcm92Cgot
LSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
