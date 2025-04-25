Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB2C369D1
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 07:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23EC440548;
	Fri, 25 Apr 2025 07:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLtmXJuj2Dmr; Fri, 25 Apr 2025 07:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FF742E2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FF742E2B;
	Fri, 25 Apr 2025 07:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A858C1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 504F960B2C
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brdwmmM2t0OQ for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 07:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E48D608C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E48D608C0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E48D608C0
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 07:45:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 610FC43B55;
 Fri, 25 Apr 2025 07:45:20 +0000 (UTC)
Date: Fri, 25 Apr 2025 09:45:19 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250425094519.3883d298@windsurf>
In-Reply-To: <20250425020634.2474835-1-gael.portay+rtone@gmail.com>
References: <20250425020634.2474835-1-gael.portay+rtone@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedujeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehgrggvlhdrphhorhhtrgihodhrthhonhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745567120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJEgqm197b8wcBmC3Dv4jx8jjxcqVKiIWOWUSxCLTXc=;
 b=EuHlXtZBkcmotx6uZLfcEyM4K3sOk2dmYuBNZBBGkxpAZRdh/iJJJ2vPGB8IhKviaqiW7n
 MRgA/RYpIhiWXzS6r96XmvQrP8k4PBgH9iQu91RQSsb7GXW/kXKF+JW2WallHMA67mdEDr
 3cxrN62oOFPqWOI1dds0EruZpeST+5/EAF/Qqw4O5aKTUz6YHrhGnJ95eS44LsdCn6/pXw
 3zMfoAdAoORDSwoTvStkrrExJUlCC5J1i6g0Tym+X+RLJ0H9X1FHb7i0sXERCGn+1h7ORF
 MgrNyfuyCoY5PxMlC0s7brlVZCubqdpkNLR+qprhoFBc7oaQg6ECaH5YB+W7Jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EuHlXtZB
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/mesa3d: Gallium VC4
 driver depends on NEON"
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

SGVsbG8gR2HDq2wsCgpPbiBGcmksIDI1IEFwciAyMDI1IDA0OjA2OjM0ICswMjAwCkdhw6tsIFBP
UlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyByZXZlcnRz
IGNvbW1pdCBhNWNkYjU0ZWQ3OGIxMzZjODNkZDQ0YWViZmEyN2Y3MTVjZGE1ZWEzLgoKVGhpcyBj
b21taXQgcG9pbnRzIHRvIGl0IHJlc29sdmluZyBhIGJ1aWxkIGZhaWx1cmUuIEhvdyByZXZlcnRp
bmcgdGhlCmNvbW1pdCB3aWxsIGNvbnRpbnVlIHRvIGZpeCB0aGUgYnVpbGQgaXNzdWU/IE9yIGRv
IHlvdSBzYXkgdGhhdCB0aGUKYnVpbGQgaXNzdWUgZG9lcyBub3QgZXhpc3Q/CgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
