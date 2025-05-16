Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE9C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CF283A58;
	Fri, 16 May 2025 10:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ0At9S4CRmP; Fri, 16 May 2025 10:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1264A83C61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1264A83C61;
	Fri, 16 May 2025 10:08:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D78185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A60417B0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dpv-ur0D_bU for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9264D415EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9264D415EB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9264D415EB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:08:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B4B543212;
 Fri, 16 May 2025 10:08:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFrzR-0050V6-2A;
 Fri, 16 May 2025 12:08:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Felicitas Pojtinger <felicitas@pojtinger.com>,  Christian Stewart
 <christian@aperture.us>,  Thomas Perale <thomas.perale@mind.be>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250516010021.977627-1-felicitas@pojtinger.com>
 <CA+h8R2rnEKw7a8QEfYDYn+RdK40mzahAj0QbZHGb4OPFMQbm9Q@mail.gmail.com>
Date: Fri, 16 May 2025 12:08:29 +0200
In-Reply-To: <CA+h8R2rnEKw7a8QEfYDYn+RdK40mzahAj0QbZHGb4OPFMQbm9Q@mail.gmail.com>
 (Christian Stewart via buildroot's message of "Thu, 15 May 2025
 22:04:37 -0700")
Message-ID: <87cyc8c1gi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedvuedtgeeiveelhfelieehffduledtuedvieevteeuheekgfekueektefhhfehffenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfvghlihgtihhtrghssehpohhjthhinhhgvghrrdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhesrghpv
 ghrthhurhgvrdhushdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/go: bump to version 1.24.3
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

Pj4+Pj4gIkNocmlzdGlhbiIgPT0gQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IEhpIEZlbGljaXRhcywgYWxsLAogPiBP
biBUaHUsIE1heSAxNSwgMjAyNSwgNjowMOKAr1BNIEZlbGljaXRhcyBQb2p0aW5nZXIgPGZlbGlj
aXRhc0Bwb2p0aW5nZXIuY29tPgogPiB3cm90ZToKCiA+PiBnbzEuMjQuMyAocmVsZWFzZWQgMjAy
NS0wNS0wNikgaW5jbHVkZXMgc2VjdXJpdHkgZml4ZXMgdG8gdGhlIG9zIHBhY2thZ2UsCiA+PiBh
cyB3ZWxsIGFzIGJ1ZyBmaXhlcyB0byB0aGUgcnVudGltZSwgdGhlIGNvbXBpbGVyLCB0aGUgbGlu
a2VyLCB0aGUgZ28KID4+IGNvbW1hbmQsIGFuZCB0aGUgY3J5cHRvL3RscyBhbmQgb3MgcGFja2Fn
ZXMuCiA+PiAKCiA+IFRoYW5rcyBmb3IgdGhpcyBidXQgd2UgaGF2ZSBhIFBSIG9wZW4gYWxyZWFk
eSBmb3IgdGhpczsKID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9saXN0Lz9zZXJpZXM9NDUxMDQ2CgpDb3VsZCB3ZSBhbHNvIGhhdmUgYSBzZWN1cml0eSBi
dW1wIHRvIDEuMjMuOSBmaXJzdCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
