Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3378C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 07:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71DE84025F;
	Tue, 25 Oct 2022 07:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71DE84025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDRu6kwGIpt1; Tue, 25 Oct 2022 07:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7273401A3;
	Tue, 25 Oct 2022 07:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7273401A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 883601BF30B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 07:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF9D812F0
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 07:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF9D812F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xandgkDLjE-Y for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 07:52:20 +0000 (UTC)
X-Greylist: delayed 00:30:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3629C812C3
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3629C812C3
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 07:52:20 +0000 (UTC)
Received: from player788.ha.ovh.net (unknown [10.110.171.50])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 5F11E23E96
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 07:14:02 +0000 (UTC)
Received: from armadeus.com (atoulouse-656-1-53-167.w90-11.abo.wanadoo.fr
 [90.11.232.167])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 760D1300D2FCE;
 Tue, 25 Oct 2022 07:13:59 +0000 (UTC)
X-OVh-ClientIp: 90.11.232.167
Message-ID: <c24c0f6e-3df2-66cc-a3a8-65b0ac501761@armadeus.com>
Date: Tue, 25 Oct 2022 09:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221024082719.6213-1-sebastien.szymanski@armadeus.com>
 <20221024230532.438bb514@windsurf>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
In-Reply-To: <20221024230532.438bb514@windsurf>
X-Ovh-Tracer-Id: 10140136038184119127
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgedthedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttdefjeenucfhrhhomhepuforsggrshhtihgvnhgpufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepjeegudegkedvgffgffeijeelgeelleejjeeugffgfeefleetfeeutdelieevhfefnecukfhppeduvdejrddtrddtrddupdeltddruddurddvfedvrdduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055f743524-fa7a-40cf-8b01-38e0e3c1f145,
 7F4D1C011DFA1CD5A9BA5BC8FCB98F08BFA88FB4)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-jsonrpc: bump to
 version 2.2.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMTAvMjQvMjIgMjM6MDUsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6
Cj4gT24gTW9uLCAyNCBPY3QgMjAyMiAxMDoyNzoxOSArMDIwMAo+IFPDqWJhc3RpZW4gU3p5bWFu
c2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JvdGU6Cj4gCj4+IFNpZ25l
ZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFk
ZXVzLmNvbT4KPj4gLS0tCj4+ICAgcGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9weXRob24t
Zmxhc2stanNvbnJwYy5oYXNoIHwgNCArKy0tCj4+ICAgcGFja2FnZS9weXRob24tZmxhc2stanNv
bnJwYy9weXRob24tZmxhc2stanNvbnJwYy5tayAgIHwgNCArKy0tCj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gVGhhbmtzIGZvciB0aGUg
cGF0Y2gsIGJ1dCBkaWQgeW91IHRlc3QgaXQ/IFRoZQo+IDAwMDEtTW92ZS1weXRlc3QtcnVubmVy
LXRvLXRlc3RzX3JlcXVpcmUucGF0Y2ggcGF0Y2ggbm8gbG9uZ2VyIGFwcGxpZXM6Cj4gCj4+Pj4g
cHl0aG9uLWZsYXNrLWpzb25ycGMgMi4yLjIgRXh0cmFjdGluZwo+IGd6aXAgLWQgLWMgL2hvbWUv
dGhvbWFzL2RsL3B5dGhvbi1mbGFzay1qc29ucnBjL0ZsYXNrLUpTT05SUEMtMi4yLjIudGFyLmd6
IHwgdGFyIC0tc3RyaXAtY29tcG9uZW50cz0xIC1DIC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvcHl0aG9uLWZsYXNrLWpzb25ycGMtMi4yLjIgICAteGYgLQo+Pj4+
IHB5dGhvbi1mbGFzay1qc29ucnBjIDIuMi4yIFBhdGNoaW5nCj4gCj4gQXBwbHlpbmcgMDAwMS1N
b3ZlLXB5dGVzdC1ydW5uZXItdG8tdGVzdHNfcmVxdWlyZS5wYXRjaCB1c2luZyBwYXRjaDoKPiBw
YXRjaGluZyBmaWxlIHNldHVwLnB5Cj4gSHVuayAjMSBGQUlMRUQgYXQgNDIuCj4gMSBvdXQgb2Yg
MSBodW5rIEZBSUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0byBmaWxlIHNldHVwLnB5LnJlago+IG1h
a2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyNTE6IC9ob21lL3Rob21hcy9wcm9qZXRz
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvcHl0aG9uLWZsYXNrLWpzb25ycGMtMi4yLjIvLnN0YW1w
X3BhdGNoZWRdIEVycm9yIDEKPiAKPiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2s/CgpPb3BzLCBzb3Jy
eS4uLiBTdXJlISBJIHdpbGwgc2VuZCBhIHYyIQoKUmVnYXJkcywKCj4gCj4gVGhhbmtzIQo+IAo+
IFRob21hcwoKLS0gClPDqWJhc3RpZW4gU3p5bWFuc2tpLCBBcm1hZGV1cyBTeXN0ZW1zClNvZnR3
YXJlIGVuZ2luZWVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
