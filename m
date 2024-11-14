Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC216D68B36
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FAED4052B;
	Thu, 14 Nov 2024 16:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_N2rwxQVW56; Thu, 14 Nov 2024 16:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C79405B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C79405B7;
	Thu, 14 Nov 2024 16:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB3BE1ED5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA682841BD
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IX58_ka-3hWH for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 16:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92297841BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92297841BC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92297841BC
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:36:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D01940005
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:36:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBcpn-002TjB-3C
 for buildroot@buildroot.org; Thu, 14 Nov 2024 17:36:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 17:36:43 +0100
Message-ID: <87plmxwz50.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.8 released
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
MDI0LjAyLjggaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuOC50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjgudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjAyLjggdGFnKQoKQnVpbGRyb290IDIwMjQuMDIuOCBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlIG9uIHRoZSBjdXJyZW50IGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIg
b2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0
aGUgMjAyNC4wMi43IHJlbGVhc2UuCgotIE5ldyBwYWNrYWdlOiBweXRob24tcHlxdDUtc2lwCgot
IFNlY3VyaXR5IGZpeGVzIGZvciBnaG9zdHNjcmlwdCwgaW50ZWwtbWljcm9jb2RlLCBsaWJhcmNo
aXZlLCBuZ2h0dHAyCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xp
Y2Vuc2UgaXNzdWVzIGluIGFwYWNoZSwKICBhc3RlcmlzaywgYmluZCwgYm9vdGdlbiwgY3JpdSwg
ZmlsZSwgZmx1aWRzeW50aCwgaGVpbWRhbCwgamFpbGhvdXNlLAogIGpzb25jcHAsIGxpYmN1cmws
IGxpYmxkbnMsIGxpYmxpbmVhciwgbGlibWRieCwgbGlib3BlbmgyNjQsIGxpZ2h0bmluZywKICBs
dHJhY2UsIG50cCwgcGhwLCBwb3N0Z3Jlc3FsLCBwcm9jcHMtbmcsIHB5dGhvbi1weXF0NSwgcnVi
eSwgc3lzdmluaXQsCiAgdG9yLCB3cGViYWNrZW5kLWZkbwoKRm9yIG1vcmUgZGV0YWlscywgc2Vl
IHRoZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iLzIwMjQuMDIuOC9DSEFOR0VTCgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFj
a2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRv
IGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRs
b2cgLXMgLW4gMjAyNC4wMi43Li4KCiAgICAxNSAgQmVybmQgS3VobHMKICAgICA4ICBKdWxpZW4g
T2xpdmFpbgogICAgIDcgIFdhbGRlbWFyIEJyb2Rrb3JiCiAgICAgNSAgUGV0ZXIgS29yc2dhYXJk
CiAgICAgNCAgVGhvbWFzIFBldGF6em9uaQogICAgIDIgIEJyYW5kb24gTWFpZXIKICAgICAyICBS
YWxmIERyYWdvbgogICAgIDIgIFllZ29yIFllZnJlbW92CiAgICAgMSAgQWRyaWFuIFBlcmV6IGRl
IENhc3RybwogICAgIDEgIEFuaXNzZSBBc3RpZXIKICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAx
ICBCcnlhbiBCcmF0dGxvZgogICAgIDEgIENvZHkgR3JlZW4KICAgICAxICBFcmljbyBOdW5lcwog
ICAgIDEgIEZyYW5jb2lzIFBlcnJhZAogICAgIDEgIEhlIEhhb3J1aQogICAgIDEgIE1hcmN1cyBI
b2ZmbWFubgogICAgIDEgIE1heGltIEtvY2hldGtvdgogICAgIDEgIE1pY2hhZWwgTm9zdGhvZmYK
ICAgICAxICBQYXVsIENlcmN1ZWlsCiAgICAgMSAgUmFpbXVuZG8gU2FnYXJ6YXp1CiAgICAgMSAg
U2VuIEhhc3RpbmdzCiAgICAgMSAg0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJp
ZXYpCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
