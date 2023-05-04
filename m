Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5B8C7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC67F408EC;
	Thu,  4 May 2023 20:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC67F408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHqXRCK9zz5m; Thu,  4 May 2023 20:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0669E4088F;
	Thu,  4 May 2023 20:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0669E4088F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57D7E1BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 292114088F
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292114088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJPt_RdOgsHn for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:48:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F18A14088C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F18A14088C
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:48:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0396440002
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:48:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pufsE-008zmC-1Y
 for buildroot@buildroot.org; Thu, 04 May 2023 22:48:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 04 May 2023 22:48:21 +0200
Message-ID: <87h6sr7rhm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.12 released, 2022.02.x EOL
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
MjIuMDIuMTIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHA6Ly9idWlsZHJv
b3Qub3JnL2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4wMi4xMi50YXIuZ3oKCm9yCgpodHRwOi8v
YnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjIuMDIuMTIudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxk
cm9vdCAyMDIyLjAyLjEyIGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIHByZXZpb3VzIGxvbmcg
dGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVs
YXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyMi4wMi4xMSByZWxlYXNlLgoKLSBT
ZWN1cml0eSBmaXhlcyBmb3IgYWdlbnRwcCwgYXBhY2hlLCBjb250YWluZXJkLCBnaXQsIGludGVs
LW1pY3JvY29kZSwKICBsaWJtaWNyb2h0dHBkLCBsaWJ4bWwyLCBwb3N0Z3Jlc3FsLCBweXRob24t
d2ViMnB5LCBydW5jLCBzYW1iYTQsIHN1ZG8sCiAgdGNwZHVtcCwgdWNsaWJjLCB2aW0sIHdlYmtp
dGd0aywgd3Bld2Via2l0LCB4c2VydmVyX3hvcmctc2VydmVyCgotIEZpeGVzIGZvciBkb3dubG9h
ZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluCiAgY2EtY2VydGlmaWNhdGVz
LCBjb3JlbWFyaywgZGNyb24sIGV1ZGV2LCBmZm1wZWcsIG1hdGlvLCBwb3BwbGVyLAogIHMzOTAt
dG9vbHMsIHNubXBwcAoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6Cgpo
dHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjIu
MDIuMTIKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3Vy
YWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0
aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyMi4wMi4xMS4uCgogICAg
MTEgIEZhYnJpY2UgRm9udGFpbmUKICAgICA3ICBCZXJuZCBLdWhscwogICAgIDQgIFBldGVyIFNl
aWRlcmVyCiAgICAgMyAgUGV0ZXIgS29yc2dhYXJkCiAgICAgMiAgQWRyaWFuIFBlcmV6IGRlIENh
c3RybwogICAgIDIgIEFuZ2VsbyBDb21wYWdudWNjaQogICAgIDIgIENocmlzdGlhbiBTdGV3YXJ0
CiAgICAgMiAgRnJhbmNvaXMgUGVycmFkCiAgICAgMiAgSnVsaWVuIE9saXZhaW4KICAgICAyICBM
dWNhIENlcmVzb2xpCiAgICAgMiAgTWF4aW0gS29jaGV0a292CiAgICAgMiAgV2FsZGVtYXIgQnJv
ZGtvcmIKICAgICAxICBCYWdhcyBTYW5qYXlhCiAgICAgMSAgRGFuaWVsIExhbmcKICAgICAxICBE
YXJpbyBCaW5hY2NoaQogICAgIDEgIEdpdWxpbyBCZW5ldHRpCiAgICAgMSAgSmFtZXMgSGlsbGlh
cmQKICAgICAxICBKYW1lcyBLbmlnaHQKICAgICAxICBKb2VsIFN0YW5sZXkKICAgICAxICBMYW5n
IERhbmllbAogICAgIDEgIE1hcmlvIEhhdXN0ZWluCiAgICAgMSAgU3RlZmFuIE90dAogICAgIDEg
IMqOyZBIIMedyozHncqHUwoKTm90aWNlOiBUaGlzIHdpbGwgYmUgdGhlIGxhc3QgdXBkYXRlIGZv
ciAyMDIyLjAyLnguIFBsZWFzZSBtaWdyYXRlIHRvCnRoZSAyMDIzLjAyLnggc2VyaWVzIGluc3Rl
YWQuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
