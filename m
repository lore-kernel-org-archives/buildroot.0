Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9E4C282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 10:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6E828350D;
	Thu, 13 Mar 2025 10:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnnvo2yCFER7; Thu, 13 Mar 2025 10:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B91183566
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B91183566;
	Thu, 13 Mar 2025 10:53:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78DEFE0
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46A5760EF8
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JH5VnWW4CeG2 for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 10:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6FFD60766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6FFD60766
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6FFD60766
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:53:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 602AD441FE
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:53:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tsgC3-00DI9i-2F
 for buildroot@buildroot.org; Thu, 13 Mar 2025 11:53:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 11:53:39 +0100
Message-ID: <87h63x6w24.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedvhfejgfefveejffetjeduvdeggeelfeeffeetjeeufffgheetgfduhfevueejheenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2025.02-rc2 released
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

SGksCgpCdWlsZHJvb3QgMjAyNS4wMi1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjUuMDItcmMy
LnRhci5negoKb3IKCmh0dHBzOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIw
MjUuMDItcmMyLnRhci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LmdpdCAoMjAyNS4wMi1yYzIgdGFnKQoKQW5vdGhlciAy
IHdlZWtzLCBhbm90aGVyIHJlbGVhc2UgY2FuZGlkYXRlLgoKUGxlYXNlIGdpdmUgaXQgYSBzcGlu
IGFuZCByZXBvcnQgYW55IHByb2JsZW1zIHRvIHRoZSBtYWlsaW5nIGxpc3Qgb3IKYnVnIHRyYWNr
ZXIuIE1hbnkgdGhhbmtzIHRvIHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFz
ZToKCmdpdCBzaG9ydGxvZyAtc24gMjAyNS4wMi1yYzEuLgoKICAgICAzICBBZGFtIER1c2tldHQK
ICAgICAzICBQZXRlciBLb3JzZ2FhcmQKICAgICAzICBSb21haW4gTmFvdXIKICAgICAzICBUaG9t
YXMgRGV2b29nZHQKICAgICAyICBCZXJuZCBLdWhscwogICAgIDIgIERhbmllbCBQYWxtZXIKICAg
ICAyICBKdWxpZW4gT2xpdmFpbgogICAgIDIgIFlldmhlbiBCYWJpaWNodWsgKER1c3RERkcpCiAg
ICAgMSAgQWxleCBCZW5uw6llCiAgICAgMSAgQ2hlcm5pYWV2IEFuZHJlaQogICAgIDEgIERhbmll
bCBMYW5nCiAgICAgMSAgRmFiaW8gRXN0ZXZhbQogICAgIDEgIEdlcm8gU2Nod8Okcmlja2UKICAg
ICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBNaWNoYWVsIE5vc3Rob2ZmCiAgICAgMSAgTWlj
aGFlbCBXYWxsZQogICAgIDEgIE5pa2xhcyBDYXNzZWwKICAgICAxICBRdWVudGluIFNjaHVsegog
ICAgIDEgIFJhcGhhw6tsIE3DqWxvdHRlCiAgICAgMSAgVmxhZGltaXIgT2x0ZWFuCgpFeHBlY3Qg
dGhlIGZpbmFsIDIwMjUuMDIgcmVsZWFzZSBhdCB0aGUgZW5kIG9mIHRoZSB3ZWVrLgoKLS0gCkJ5
ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
