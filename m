Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF8CD11DF
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 10:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0890D40160;
	Tue, 26 Mar 2024 10:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reMiVgLp0Jeb; Tue, 26 Mar 2024 10:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DD8404ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DD8404ED;
	Tue, 26 Mar 2024 10:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5B3F1BF383
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1CF840733
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcaUZAFmESzc for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 10:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D88AF40739
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88AF40739
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D88AF40739
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:14:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73FD44000E
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:14:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rp3pV-009A2g-22
 for buildroot@buildroot.org; Tue, 26 Mar 2024 11:14:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 11:14:53 +0100
Message-ID: <87jzlp9u5e.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.1 released
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
MjQuMDIuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjEudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDI0LjAyLjEgaXMgYSBidWdmaXggcmVsZWFzZSBvbiB0aGUgY3VycmVudCBsb25nIHRlcm0K
cmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9ydGFudCAvIHNlY3VyaXR5IHJlbGF0ZWQg
aXNzdWVzCmRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjQuMDIgcmVsZWFzZS4KCi0gVG9vbGNoYWlu
OiBEcm9wcGVkIG9sZCBDb2Rlc291cmNlcnkgQVJNIC8gQUFSQ0g2NCBhbmQgQ29kZXNjYXBlIE1J
UFMKICBleHRlcm5hbCB0b29sY2hhaW5zIGFzIHRoZXkgdXNlIG9sZCBHbGliYyB2ZXJzaW9ucyBu
b3QgY29tcGF0aWJsZSB3aXRoCiAgNjQtYml0IHRpbWVfdAoKLSBJbmZyYXN0cnVjdHVyZTogVXNl
IGdpdCB0byBmZXRjaCBDVkUgZGF0YSBmcm9tIHRoZSBGS0lFIHJlcG9zaXRvcnkgdG8KICB3b3Jr
IGFyb3VuZCBhbiBpc3N1ZSB3aXRoIG1pc3NpbmcgbWV0YSBmaWxlcyBpbiB0aGUgcmVsZWFzZXMu
CgotIERlZmNvbmZpZ3M6IFN0YXJmaXZlIHZpc2lvbmZpdmUyOiBVc2UgY29ycmVjdCBnZW5pbWFn
ZSBjb25maWd1cmF0aW9uLgogIFRJIGFtNjJ4X3NrIC8gYW02NF9zazogVXNlIGNvcnJlY3Qgb3B0
ZWUtb3MgcGxhdGZvcm0gc2V0dGluZyBhbmQgdXNlIGEKICBmaXhlZCB0aS1rMy1yNS1sb2FkZXIg
dmVyc2lvbi4KCi0gU2VjdXJpdHkgZml4ZXMgZm9yIGJpdGNvaW4sIGV4cGF0LCBnbywgaXdkLCBs
aWJnaXQyCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2Ug
aXNzdWVzIGluIGF4ZWwsIGJhc2gsCiAgYm90YW4sIGJ1c3lib3gsIGNvbnRhaW5lcmQsIGNyeXB0
c2V0dXAsIGN2cywgZG9ja2VyLWNvbXBvc2UsCiAgZG9ja2VyLWVuZ2luZSwgZWxsLCBnaWZsaWIs
IGdtcCwgaGFyZmJ1enosIGludGVsLWdtbWxpYiwKICBpbnRlbC1tZWRpYWRyaXZlciwga29kaSwg
a29kaS1wdnItaHRzLCBsaWJjZ3JvdXAsIGxpYmRybSwgbGlia3JiNSwKICBsaWJuZnMsIGxpYnRv
cnJlbnQtcmFzdGVyYmFyLCBsaWJ1bndpbmQsIGxpYnZwbCwgbGlieG1sMiwgbGludXgsCiAgbWFy
aWFkYiwgbWVzYTNkLCBtbWMtdXRpbHMsIG1zbXRwLCBtdWx0aXBhdGgtdG9vbHMsIG5lb24sCiAg
b25ldnBsLWludGVsLWdwdSwgb3BlbnNzaCwgb3BlbnZwbiwgb3NtMnBnc3FsLCBvd2ZzLCBwaHAs
IHBvY28sCiAgcG9saWN5Y29yZXV0aWxzLCBwb3N0Z2lzLCBwcml2b3h5LCBwdWxzZWF1ZGlvLCBw
dXJlLWZ0cGQsIHB1dHR5LAogIHB5dGhvbi1jb25maWdzaGVsbC1mYiwgcHl0aG9uLXJ0c2xpYi1m
YiwgcmF1YywgcmVzdG9yZWNvbmQsIHNwaWNlLAogIHNxdWlkLCB0YXJnZXRjbGktZmIsIHR6ZGF0
YSwgdXRpbC1saW51eCwgdmRyLCB4bXJpZywgeHZpc29yLCB6aWMKCkZvciBtb3JlIGRldGFpbHMs
IHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJv
b3QvcGxhaW4vQ0hBTkdFUz9pZD0yMDI0LjAyLjEKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNr
YWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8g
YWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxv
ZyAtc24gMjAyNC4wMi4uCgogICAgMzYgIEZhYnJpY2UgRm9udGFpbmUKICAgIDE3ICBCZXJuZCBL
dWhscwogICAgIDQgIERhcmlvIEJpbmFjY2hpCiAgICAgNCAgSmVyZW15IEouIFBlcGVyCiAgICAg
NCAgSnVsaWVuIE9saXZhaW4KICAgICA0ICBQZXRlciBLb3JzZ2FhcmQKICAgICAzICBHaXVsaW8g
QmVuZXR0aQogICAgIDIgIEFraGlsZXNoIE5lbWEKICAgICAyICBDaHJpc3RpYW4gU3Rld2FydAog
ICAgIDIgIEthZGFtYmluaSBOZW1hCiAgICAgMSAgQnJhbmRvbiBNYWllcgogICAgIDEgIEx1a2Fz
eiBUZWtpZWxpCiAgICAgMSAgTWF4aW0gS29jaGV0a292CiAgICAgMSAgTmljb2xhcyBDYXZhbGxh
cmkKICAgICAxICBTY290dCBGYW4KICAgICAxICBTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDEg
IFRob21hcyBQZXRhenpvbmkKICAgICAxICBZYW5uIEUuIE1PUklOCgotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
