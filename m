Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E73C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4ABE60E3C;
	Fri, 16 May 2025 11:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcLAehQn7E9V; Fri, 16 May 2025 11:32:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE5C6103E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE5C6103E;
	Fri, 16 May 2025 11:32:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22FDB13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1446760E3C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vc_-DtZBVnJk for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6BDF60B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BDF60B6D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6BDF60B6D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:32:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 015F943AD3;
 Fri, 16 May 2025 11:32:36 +0000 (UTC)
Date: Fri, 16 May 2025 13:32:36 +0200
To: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, Joseph Kogut <joseph.kogut@gmail.com>, David
 Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>, Graeme
 Smecher <gsmecher@threespeedlogic.com>, James Hilliard
 <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>, Torben Voltmer
 <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>, Alex Michel
 <alex.michel@wiedemann-group.com>, Leo Yu-Chi Liang
 <ycliang@andestech.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20250516133236.16e5aa23@windsurf>
In-Reply-To: <20250422074738.821755-1-elmehdi.younes@smile.fr>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegvlhhmvghhughirdihohhunhgvshesshhmihhlvgdrfhhrpdhrtghpthhtohepv
 ghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrhdprhgtphhtthhopehjohhsvghphhdrkhhoghhuthesghhmrghilhdrtghomhdprhgtphhtthhopegurghvihgurdhpihgvrhhrvghtsehsmhhilhgvrdhfrhdprhgtphhtthhopehmrghilhesuggsrhhgnhdrtghhpdhrtghpthhtohepghhsmhgvtghhvghrsehthhhrvggvshhpvggvughlohhgihgtrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747395158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQ+ufkJjN3hn7CG/1EsGIzPC9bam+YL/z9m0iFQy4Q8=;
 b=BacZUm06u4Vd6hjg6AzCEHhI4OrcvZy9X8fHZWCVc8JazQio0iahWTptHm0JOYFPOE4qod
 QpP2CvDpPOpdPTgKQ0FnwONZ/gTAX70JmD1eqE2AmMMmwZVGqdFZ5hH+2GCVOsjt4zi/6r
 HPThbiUfJVHz0mrfDVHoZ3gv66JAp2/T83y3QzA8jluqTn4xpkS+lSBZYwjlGGjQGfnQGm
 ta0tZ1y/jGO+p9869Sf0SP34pymcTlOoygQKdu2XmPh58DSF9eUhrwtZCaHrWcDX8YqYtw
 d8vCFrecthU7qDttqaNOzvE+Uw6VoHZUkxlQKT7bWPIqNmD6W3eOlQRjcRj+6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BacZUm06
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiBUdWUsIDIyIEFwciAyMDI1IDA5OjQ3OjM0ICswMjAwCkVsIE1laGRpIFlPVU5F
UyB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEVsIE1l
aGRpIFlPVU5FUyAoNCk6Cj4gICBwYWNrYWdlL3J1c3Q6IGZpeCBib290c3RyYXAgd2l0aCBSdXN0
4omlMS44Mwo+ICAgcGFja2FnZS9ydXN0OiBidW1wIHRvIHZlcnNpb24gMS44Ni4wCj4gICBwYWNr
YWdlL3BrZy1kb3dubG9hZDogc3dpdGNoIGZyb20gY2FyZ28yIHRvIGNhcmdvMwo+ICAgcGFja2Fn
ZTogdXBkYXRlIGFsbCBoYXNoZXMgYWZ0ZXIgY2FyZ28zIHN3aXRjaAoKVGhhbmtzIGEgbG90IGZv
ciB5b3VyIHBhdGNoZXMsIHdoaWNoIEkgaGF2ZSBhcHBsaWVkLiBUaGUgbGFzdCBwYXRjaApuZWVk
ZWQgYSBmZXcgZml4ZXMgYXMgcGFja2FnZXMgZ290IHVwZGF0ZWQgaW4gdGhlIG1lYW4gdGltZS4K
CkFmdGVyIGNoZWNraW5nIHdpdGggb3RoZXIgQnVpbGRyb290IG1haW50YWluZXJzLCB3ZSBkZWNp
ZGVkIHRvIG1lcmdlCnRoZSBwYXRjaGVzIGFzIHN1Ym1pdHRlZCwgd2l0aG91dCBzcXVhc2hpbmcg
dGhlbSwgZXZlbiBpZiB0ZWNobmljYWxseQoiY29ycmVjdCBiaXNzZWN0YWJpbGl0eSIgd291bGQg
aGF2ZSByZXF1aXJlZCBzcXVhc2hpbmcgdGhlbSB0b2dldGhlcgoocGF0Y2hlcyAyLCAzLCA0KS4K
ClRoYW5rcyBmb3IgeW91ciB3b3JrIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
