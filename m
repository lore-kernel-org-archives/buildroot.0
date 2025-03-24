Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE72C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 17:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3860F4059F;
	Mon, 24 Mar 2025 17:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvoXJ2KRV620; Mon, 24 Mar 2025 17:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C2E40652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C2E40652;
	Mon, 24 Mar 2025 17:36:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 537B2C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 423EC400EA
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw3WpgAyQVlK for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 17:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21F9F400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F9F400CE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21F9F400CE
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:35:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EC6543421
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:35:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1twliM-005gfO-1F
 for buildroot@buildroot.org; Mon, 24 Mar 2025 18:35:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 18:35:54 +0100
Message-ID: <87v7ry49hh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefhiedvuddthfelkeejgeevfefhueehtddvjefhgefhueejheeliefftdevfeegleenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.11.3 released
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
MDI0LjExLjMgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMTEuMy50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjExLjMudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjExLjMgdGFnKQoKQnVpbGRyb290IDIwMjQuMTEuMyBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBp
c3N1ZXMgZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4xMS4yIHJlbGVhc2UuCgotIE9jdGF2byBv
c2QzMm1wMTogRml4IGJ1aWxkIGlzc3VlcyBpbiBURi1BIGFuZCBMaW51eCB3aXRoIG5ld2VyCiAg
dG9vbGNoYWlucwoKLSBTZWN1cml0eSBmaXhlcyBmb3IgZXhpbSwgZXhwYXQsIGdvLCBqYmlnMmRl
YywgbGlianhsLCBsaWJ4bWwyLCBwaHAsCiAgd2Via2l0Z3RrCgotIEZpeGVzIGZvciBkb3dubG9h
ZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vuc2UgaXNzdWVzIGluIGNvbXBpbGVyLXJ0LAogIGZp
bywgZm9vdCwgbGliY2FtZXJhLCBsaWJvcGVuc3NsLCBtdXNsLCBwa2djb25mLCBwb3N0Z3Jlc3Fs
LCBwcmJvb20sCiAgcmF1Yywgc3lzdGVtZCwgdXRpbC1saW51eCwgd2F0Y2hkb2dkCgpGb3IgbW9y
ZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4xMS4zL0NIQU5HRVMKClVzZXJzIG9mIHRo
ZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25nbHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoK
TWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFz
ZToKCmdpdCBzaG9ydGxvZyAtcyAtbiAyMDI0LjExLjIuLgoKICAgICA2ICBCZXJuZCBLdWhscwog
ICAgIDQgIFBldGVyIEtvcnNnYWFyZAogICAgIDMgIEZpb25hIEtsdXRlIChXSVdBKQogICAgIDIg
IERhbmllbCBQYWxtZXIKICAgICAyICBLb3J5IE1haW5jZW50CiAgICAgMiAgVGhvbWFzIERldm9v
Z2R0CiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAgIDIgIFlldmhlbiBCYWJpaWNodWsgKER1c3RE
RkcpCiAgICAgMSAgQWRhbSBEdXNrZXR0CiAgICAgMSAgQWxleCBCZW5uw6llCiAgICAgMSAgQW5k
cmVhcyBOYXVtYW5uCiAgICAgMSAgQ2hlcm5pYWV2IEFuZHJlaQogICAgIDEgIERhbmllbCBMYW5n
CiAgICAgMSAgSnVsaWVuIE9saXZhaW4KICAgICAxICBRdWVudGluIFNjaHVsegogICAgIDEgIFJh
cGhhw6tsIE3DqWxvdHRlCiAgICAgMSAgU2NvdHQgRmFuCiAgICAgMSAgVGhvbWFzIEJvbm5lZmls
bGUKICAgICAxICBWbGFkaW1pciBPbHRlYW4KICAgICAxICBXYWxkZW1hciBCcm9ka29yYgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
