Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3205EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88A0827A9;
	Wed, 23 Feb 2022 20:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKJQlBduZgV1; Wed, 23 Feb 2022 20:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F179181DB2;
	Wed, 23 Feb 2022 20:59:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA901BF20F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48732408F3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njSrj12M9dSL for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:59:05 +0000 (UTC)
X-Greylist: delayed 02:20:00 by SQLgrey-1.8.0
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net
 [46.105.60.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1DCC403B3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:59:04 +0000 (UTC)
Received: from player761.ha.ovh.net (unknown [10.108.4.72])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 3515322ECE
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:59:59 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-222-18.w86-243.abo.wanadoo.fr
 [86.243.182.18]) (Authenticated sender: fabien.marteau@armadeus.com)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id 4A9C127BB7F08
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:59:58 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006efd70a59-c1ee-4b75-9da6-65d9babc0e83,
 0EFBCE6602A261E18421D9E2E3EB229968F70525)
 smtp.auth=fabien.marteau@armadeus.com
X-OVh-ClientIp: 86.243.182.18
Message-ID: <872b9dab-c446-adca-905c-1d5481c00a3b@armadeus.com>
Date: Wed, 23 Feb 2022 15:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: buildroot@buildroot.org
From: Fabien Marteau <fabien.marteau@armadeus.com>
Organization: ARMadeus Systems
X-Ovh-Tracer-Id: 5471310600518542709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfrhfvhffuohgtgfesthekredttdefjeenucfhrhhomhephfgrsghivghnucforghrthgvrghuuceofhgrsghivghnrdhmrghrthgvrghusegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepieeihfdvvdfhvdevheeugefhudetleekjefhleehudekkeejfefhiefgfeffudfgnecukfhppedtrddtrddtrddtpdekiedrvdegfedrudekvddrudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejiedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepfhgrsghivghnrdhmrghrthgvrghusegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] zynq_zc706_defconfig target works on zc702 board
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
Reply-To: fabien.marteau@armadeus.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpJIGp1c3QgdHJ5aWVkIHRvIGNvbXBpbGUgYnVpbGRyb290IGZvciBaQzcwMsKgYm9h
cmQgdXNpbmcgdGFyZ2V0IAp6eW5xX3pjNzA2X2RlZmNvbmZpZyAoWkM3MDYpLgoKV2l0aCBsYXN0
IGJ1aWxkcm9vdCBnaXQgOgoKbWFrZSB6eW5xX3pjNzA2X2RlZmNvbmZpZwpzdWRvIGRkIGlmPW91
dHB1dC9pbWFnZXMvc2RjYXJkLmltZyBvZj0vZGV2L21tY2JsazAKCkJvb3RpbmcgdGhlIGJvYXJk
IHdpdGggU0RDYXJkIGZyZXNobHkgZm9ybWF0dGVkIDoKCjxkZWJ1Z191YXJ0PiBEZWJ1ZyB1YXJ0
IGVuYWJsZWQKClUtQm9vdCBTUEwgMjAxOC4wMSAoRmViIDIzIDIwMjIgLSAxMTo0MzoxNSkKbW1j
IGJvb3QKVHJ5aW5nIHRvIGJvb3QgZnJvbSBNTUMxCnNwbF9sb2FkX2ltYWdlX2ZhdDogZXJyb3Ig
cmVhZGluZyBpbWFnZSBmcGdhLmJpbiwgZXJyIC0gLTIKc3BsOiBlcnJvciByZWFkaW5nIGltYWdl
IGZwZ2EuYmluLCBlcnIgLSAxCnNwbF9sb2FkX2ltYWdlX2ZhdF9vczogZXJyb3IgcmVhZGluZyBp
bWFnZSBzeXN0ZW0uZHRiLCBlcnIgLSAtMgpyZWFkaW5nIHUtYm9vdC5pbWcKcmVhZGluZyB1LWJv
b3QuaW1nCgoKVS1Cb290IDIwMTguMDEgKEZlYiAyMyAyMDIyIC0gMTE6NDM6MTUgKzAxMDApIFhp
bGlueCBaeW5xIFpDNzA2CgpNb2RlbDogWnlucSBaQzcwNiBEZXZlbG9wbWVudCBCb2FyZApCb2Fy
ZDogWGlsaW54IFp5bnEKU2lsaWNvbjogdjAuMApJMkM6ICAgcmVhZHkKRFJBTTogIEVDQyBkaXNh
YmxlZCAxIEdpQgpNTUM6ICAgc2RoY2lAZTAxMDAwMDA6IDAgKFNEKQpTRjogRGV0ZWN0ZWQgbjI1
cTEyOGEgd2l0aCBwYWdlIHNpemUgNTEyIEJ5dGVzLCBlcmFzZSBzaXplIDEyOCBLaUIsIAp0b3Rh
bCAzMiBNaUIKKioqIFdhcm5pbmcgLSBiYWQgQ1JDLCB1c2luZyBkZWZhdWx0IGVudmlyb25tZW50
CgpJbjogICAgc2VyaWFsQGUwMDAxMDAwCk91dDogICBzZXJpYWxAZTAwMDEwMDAKRXJyOiAgIHNl
cmlhbEBlMDAwMTAwMApOZXQ6ICAgWllOUSBHRU06IGUwMDBiMDAwLCBwaHlhZGRyIDcsIGludGVy
ZmFjZSByZ21paS1pZApldGgwOiBldGhlcm5ldEBlMDAwYjAwMApIaXQgYW55IGtleSB0byBzdG9w
IGF1dG9ib290OiAgMApaeW5xPgoKVGhlbiBib290aW5nIExpbnV4IDoKClp5bnE+IGJvb3QKRGV2
aWNlOiBzZGhjaUBlMDEwMDAwMApNYW51ZmFjdHVyZXIgSUQ6IDI3Ck9FTTogNTA0OApOYW1lOiBT
RDE2RwpUcmFuIFNwZWVkOiA1MDAwMDAwMApSZCBCbG9jayBMZW46IDUxMgpTRCB2ZXJzaW9uIDMu
MApIaWdoIENhcGFjaXR5OiBZZXMKQ2FwYWNpdHk6IDE0LjQgR2lCCkJ1cyBXaWR0aDogNC1iaXQK
RXJhc2UgR3JvdXAgU2l6ZTogNTEyIEJ5dGVzCioqIFVuYWJsZSB0byByZWFkIGZpbGUgdUVudi50
eHQgKioKQ29weWluZyBMaW51eCBmcm9tIFNEIHRvIFJBTS4uLgpyZWFkaW5nIHVJbWFnZQozNzMy
MjU2IGJ5dGVzIHJlYWQgaW4gMjEyIG1zICgxNi44IE1pQi9zKQpyZWFkaW5nIGRldmljZXRyZWUu
ZHRiCjEzNjY3IGJ5dGVzIHJlYWQgaW4gMTQgbXMgKDk1My4xIEtpQi9zKQpyZWFkaW5nIHVyYW1k
aXNrLmltYWdlLmd6Cjk1MTQ4OCBieXRlcyByZWFkIGluIDY1IG1zICgxNCBNaUIvcykKIyMgQm9v
dGluZyBrZXJuZWwgZnJvbSBMZWdhY3kgSW1hZ2UgYXQgMDIwODAwMDAgLi4uCiAgICBJbWFnZSBO
YW1lOiAgIExpbnV4LTQuOS4wLXhpbGlueAogICAgSW1hZ2UgVHlwZTogICBBUk0gTGludXggS2Vy
bmVsIEltYWdlICh1bmNvbXByZXNzZWQpCiAgICBEYXRhIFNpemU6ICAgIDM3MzIxOTIgQnl0ZXMg
PSAzLjYgTWlCCiAgICBMb2FkIEFkZHJlc3M6IDAwMDA4MDAwCiAgICBFbnRyeSBQb2ludDogIDAw
MDA4MDAwCiAgICBWZXJpZnlpbmcgQ2hlY2tzdW0gLi4uIE9LCiMjIExvYWRpbmcgaW5pdCBSYW1k
aXNrIGZyb20gTGVnYWN5IEltYWdlIGF0IDA0MDAwMDAwIC4uLgogICAgSW1hZ2UgTmFtZToKICAg
IEltYWdlIFR5cGU6ICAgQVJNIExpbnV4IFJBTURpc2sgSW1hZ2UgKHVuY29tcHJlc3NlZCkKICAg
IERhdGEgU2l6ZTogICAgOTUxNDI0IEJ5dGVzID0gOTI5LjEgS2lCCiAgICBMb2FkIEFkZHJlc3M6
IDAwMDAwMDAwCiAgICBFbnRyeSBQb2ludDogIDAwMDAwMDAwCiAgICBWZXJpZnlpbmcgQ2hlY2tz
dW0gLi4uIE9LCiMjIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSBibG9iIGF0IDAyMDAwMDAwCiAgICBC
b290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBhdCAweDIwMDAwMDAKICAgIExvYWRpbmcgS2VybmVs
IEltYWdlIC4uLiBPSwogICAgTG9hZGluZyBSYW1kaXNrIHRvIDFmZjE3MDAwLCBlbmQgMWZmZmY0
ODAgLi4uIE9LCiAgICBMb2FkaW5nIERldmljZSBUcmVlIHRvIDFmZjEwMDAwLCBlbmQgMWZmMTY1
NjIgLi4uIE9LCgpTdGFydGluZyBrZXJuZWwgLi4uCgpCb290aW5nIExpbnV4IG9uIHBoeXNpY2Fs
IENQVSAweDAKClsuLi5dCgpTdGFydGluZyBuZXR3b3JrOiBPSwoKV2VsY29tZSB0byBCdWlsZHJv
b3QKYnVpbGRyb290IGxvZ2luOgoKCkl0IHdvcmtzIGFzIGlzIFxvLwoKRG8gSSBoYXZlIHRvIG1h
a2UgYSBwYXRjaCB0byBhZGQgdGhlIHRhcmdldD8KCkJlc3QgcmVnYXJkcywKRmFiaWVuIE1hcnRl
YXUKQXJtYWRldXMgU3lzdGVtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
