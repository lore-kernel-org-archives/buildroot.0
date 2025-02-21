Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFA1C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 14:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437A260B5D;
	Fri, 21 Feb 2025 14:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmS_eLAGGNrC; Fri, 21 Feb 2025 14:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28E8160B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28E8160B5E;
	Fri, 21 Feb 2025 14:47:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 912526B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F48481516
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFS18lMupi_d for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 14:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E70581095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E70581095
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E70581095
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:47:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 555CB441B1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:47:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tlUJb-003xFj-2G
 for buildroot@buildroot.org; Fri, 21 Feb 2025 15:47:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 15:47:43 +0100
Message-ID: <87v7t3nyls.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufffkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhephfeivddutdfhleekjeegveefhfeuhedtvdejhfeghfeujeehleeiffdtveefgeelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.11.2 released
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
MDI0LjExLjIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMTEuMi50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjExLjIudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjExLjIgdGFnKQoKQnVpbGRyb290IDIwMjQuMTEuMiBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4xMS4xIHJlbGVhc2UuCgotIEZpeCBhIGJv
b3QgaXNzdWUgZm9yIFRJIGFtNjJheF9zayBieSBidWlsZGluZyBpbiB0aGUgUE1JQyBkcml2ZXIK
Ci0gU2VjdXJpdHkgZml4ZXMgZm9yIGFjcGljYSwgYXNzaW1wLCBhc3RlcmlzaywgYmluZCwgYnVz
eWJveCwgY2xhbWF2LAogIGdpdCwgZ251dGxzLCBnbywgaW50ZWwtbWljcm9jb2RlLCBsaWJjdXJs
LCBsaWJvcGVuc3NsLCBsaWJ0YXNuMSwKICBtcGcxMjMsIG11c2wsIG5naW54LCBub2RlanMsIG9w
ZW5qcGVnLCBvcGVuc3NoLCBwb3N0Z3Jlc3FsLAogIHB5dGhvbi1kamFuZ28sIHJlZGlzLCByc3lu
Yywgc29jYXQsIHVuYm91bmQsIHdlYmtpdGd0aywgemxvZwoKLSBGaXhlcyBmb3IgZG93bmxvYWQv
Y29tcGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBhcGFjaGUsCiAgYnVzeWJveCwg
Y3VybHBwLCBkaWxsbywgZWxmdXRpbHMsIGZha2Vyb290LCBmZm1wZWcsIGZyZWV0eXBlLCBnbGli
YywKICBnbnUtZWZpLCBncHNkLCBoZWltZGFsLCBpbWFnZW1hZ2ljaywga29kaSwgbGliYnNkLCBs
aWJ4bWwyLCBtZG5zZCwKICBuZXR0bGUsIG9wZW52cG4sIHBocCwgcGlwZXdpcmUsIHB5dGhvbjMs
IHN3aXBsLCBzeXNsaW51eCwgdG9yLCB0emRhdGEsCiAgdWNsaWJjLCB1ZW1hY3MsIHVzYnV0aWxz
LCB1dGlsLWxpbnV4LCB4ZW4sIHppYywgenN0ZCwgenhpbmctY3BwCgpGb3IgbW9yZSBkZXRhaWxz
LCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4xMS4yL0NIQU5HRVMKClVzZXJzIG9mIHRoZSBhZmZlY3Rl
ZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFu
a3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBz
aG9ydGxvZyAtcyAtbiAyMDI0LjExLjEuLgoKICAgIDI1ICBQZXRlciBLb3JzZ2FhcmQKICAgIDIw
ICBCZXJuZCBLdWhscwogICAgMTMgIFRob21hcyBQZXRhenpvbmkKICAgICA5ICBKdWxpZW4gT2xp
dmFpbgogICAgIDcgIFlhbm4gRS4gTU9SSU4KICAgICA1ICBBa2hpbGVzaCBOZW1hCiAgICAgNCAg
V2FsZGVtYXIgQnJvZGtvcmIKICAgICAzICBSb21haW4gTmFvdXIKICAgICAzICBUaG9tYXMgQm9u
bmVmaWxsZQogICAgIDMgIFZpbmNlbnQgRmF6aW8KICAgICAzICBWaW5jZW50IFN0ZWhsw6kKICAg
ICAyICBHYcOrbCBQT1JUQVkKICAgICAyICBKYW1lcyBIaWxsaWFyZAogICAgIDIgIFPDqWJhc3Rp
ZW4gU3p5bWFuc2tpCiAgICAgMSAgQmFydWNoIFNpYWNoCiAgICAgMSAgQ2hyaXN0aWFuIFN0ZXdh
cnQKICAgICAxICBGcmFuY29pcyBQZXJyYWQKICAgICAxICBNaWNoYWVsIEZpc2NoZXIKICAgICAx
ICBNaXF1ZWwgUmF5bmFsCiAgICAgMSAgU2VyZ2V5IE1hdHl1a2V2aWNoCiAgICAgMSAgVGhvbWFz
IERldm9vZ2R0CiAgICAgMSAgVGhvbWFzIFBlcmFsZQoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
