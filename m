Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DA8C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60CD04078C;
	Tue,  4 Feb 2025 17:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghtF9rqSGoUE; Tue,  4 Feb 2025 17:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A12407A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A12407A9;
	Tue,  4 Feb 2025 17:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CF2185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9112A40B57
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLIfiGUzsWuw for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DD524119B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD524119B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DD524119B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:09:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 377B9204A5;
 Tue,  4 Feb 2025 17:09:11 +0000 (UTC)
Date: Tue, 4 Feb 2025 18:09:10 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>, Julien
 Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Message-ID: <20250204180910.27fd582b@windsurf>
In-Reply-To: <20250109-nxp-mwifiex-firmware-driver-v1-0-b2ec8b34643c@armadeus.com>
References: <20250109-nxp-mwifiex-firmware-driver-v1-0-b2ec8b34643c@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgihhllhgvshdrthgrlhhishesghhmrghilhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdpr
 hgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738688951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILPoX/q7ZeLhYNi6UnVB//Rw25YPLvo7DzNTCvuJoRc=;
 b=TNS1iSKPCW5jBv56jXFHJK7JZxgY6WZ8IuK/kkiln6uHuKHIbQ21VVn+579E2ZGypb9ItY
 UfBARnhdBihMRu/3fqQrgfxLopZbiPa1awylGy0VyBEhS+y2fcV0SPXIhLhMxk9F0B+WhQ
 refwFSktZmhekx05YQotyNYThH95m8gNSPEJDoXadXeNHy++FC3QQgnb6iQaW04Mg81YgO
 18swT9EIrm0pa3iD5HCqVknL86+e/EF26SbQX1CqT1JHSdPNVdJD9htILhp42aTnRZMtv8
 fVJ/dKAuZsa+H08PO5IKFlMuA928X/HnjLT63JA3deCmsUSGKlYxZUP/9FIRMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TNS1iSKP
Subject: Re: [Buildroot] [PATCH 0/2] Add NXP WiFi chipsets support
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

T24gVGh1LCAwOSBKYW4gMjAyNSAxNzozNjoyNSArMDEwMApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoKPiBTw6liYXN0aWVuIFN6
eW1hbnNraSAoMik6Cj4gICAgICAgcGFja2FnZS9ueHAtYnQtd2lmaS1maXJtd2FyZTogbmV3IHBh
Y2thZ2UKPiAgICAgICBwYWNrYWdlL254cC1td2lmaWV4OiBuZXcgcGFja2FnZQoKQm90aCBhcHBs
aWVkLiBUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
