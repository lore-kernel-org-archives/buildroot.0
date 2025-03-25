Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F128C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 07:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F75E60E59;
	Tue, 25 Mar 2025 07:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM8sfItFLQCa; Tue, 25 Mar 2025 07:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF1A60E89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF1A60E89;
	Tue, 25 Mar 2025 07:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C73301B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 07:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD29B60E59
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 07:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rP4vxypaIAOk for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 07:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 295DB60E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 295DB60E5C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 295DB60E5C
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 07:44:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BB13443D1
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 07:44:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1twyxj-007Lmk-34
 for buildroot@buildroot.org; Tue, 25 Mar 2025 08:44:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 08:44:39 +0100
Message-ID: <87r02l4krc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefhiedvuddthfelkeejgeevfefhueehtddvjefhgefhueejheeliefftdevfeegleenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.12 released
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
MDI0LjAyLjEyIGlzIHJlbGVhc2VkIC0gR28gZG93bmxvYWQgaXQgYXQ6CgpodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjEyLnRhci5negoKb3IKCmh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuMTIudGFyLnh6CgpP
ciBnZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QuZ2l0ICgyMDI0LjAyLjEyIHRhZykKCkJ1aWxkcm9vdCAyMDI0LjAyLjEyIGlzIGEgYnVn
Zml4IHJlbGVhc2Ugb24gdGhlIHByZXZpb3VzIGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBu
dW1iZXIgb2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBz
aW5jZSB0aGUgMjAyNC4wMi4xMSByZWxlYXNlLgoKVGhlIDIwMjQuMDIueCBzZXJpZXMgd2lsbCBz
ZWUgb25lIG1vcmUgYnVnZml4IHJlbGVhc2UgYmVmb3JlIGl0IGdvZXMKRU9MLCBidXQgY29uc2lk
ZXIgbW92aW5nIHRvIHRoZSAyMDI1LjAyLnggc2VyaWVzIG5vdywgd2hpY2ggd2lsbCBiZQpzdXBw
b3J0ZWQgdW50aWwgYXQgbGVhc3QgMjAyNi4wMiBpcyBvdXQsIGFuZCBwb3NzaWJseSBsb25nZXIg
aWYKc3BvbnNvcmluZyBpcyBmb3VuZC4KCi0gT2N0YXZvIG9zZDMybXAxOiBGaXggYnVpbGQgaXNz
dWVzIGluIFRGLUEgYW5kIExpbnV4IHdpdGggbmV3ZXIKICB0b29sY2hhaW5zCgotIFNlY3VyaXR5
IGZpeGVzIGZvciBleGltLCBleHBhdCwgamJpZzJkZWMsIGxpYmp4bCwgbGlieG1sMiwgcGhwLAog
IHdlYmtpdGd0awoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNl
bnNlIGlzc3VlcyBpbiBjb21waWxlci1ydCwKICBmaW8sIGZvb3QsIG11c2wsIHBvc3RncmVzcWws
IHByYm9vbSwgc3lzdGVtZCwgdXRpbC1saW51eCwgd2F0Y2hkb2dkCgpGb3IgbW9yZSBkZXRhaWxz
LCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wMi4xMi9DSEFOR0VTCgpVc2VycyBvZiB0aGUgYWZmZWN0
ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KCk1hbnkgdGhh
bmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQg
c2hvcnRsb2cgLXMgLW4gMjAyNC4wMi4xMS4uCgogICAgIDUgIEJlcm5kIEt1aGxzCiAgICAgNCAg
UGV0ZXIgS29yc2dhYXJkCiAgICAgMyAgRmlvbmEgS2x1dGUgKFdJV0EpCiAgICAgMiAgRGFuaWVs
IFBhbG1lcgogICAgIDIgIFlldmhlbiBCYWJpaWNodWsgKER1c3RERkcpCiAgICAgMSAgQWRhbSBE
dXNrZXR0CiAgICAgMSAgQWxleCBCZW5uw6llCiAgICAgMSAgQW5kcmVhcyBOYXVtYW5uCiAgICAg
MSAgQ2hlcm5pYWV2IEFuZHJlaQogICAgIDEgIERhbmllbCBMYW5nCiAgICAgMSAgS29yeSBNYWlu
Y2VudAogICAgIDEgIFJhcGhhw6tsIE3DqWxvdHRlCiAgICAgMSAgU2NvdHQgRmFuCiAgICAgMSAg
VGhvbWFzIEJvbm5lZmlsbGUKICAgICAxICBUaG9tYXMgRGV2b29nZHQKICAgICAxICBUaG9tYXMg
UGV0YXp6b25pCiAgICAgMSAgVmxhZGltaXIgT2x0ZWFuCiAgICAgMSAgV2FsZGVtYXIgQnJvZGtv
cmIKCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
