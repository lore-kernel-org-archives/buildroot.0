Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A43C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 15:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75045402FD;
	Wed, 30 Apr 2025 15:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2ik-DnAaJJ9; Wed, 30 Apr 2025 15:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4CD40B45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4CD40B45;
	Wed, 30 Apr 2025 15:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B76FE4
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 15:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4263980E95
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 15:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORsKfRj--6Ft for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 15:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=francois.foltete@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 483DB80C75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 483DB80C75
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 483DB80C75
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 15:15:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 1CCA75857E6
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 15:00:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83B0743A3F;
 Wed, 30 Apr 2025 15:00:51 +0000 (UTC)
Message-ID: <778708a8-e1c9-4f09-8c93-4349f53d401c@bootlin.com>
Date: Wed, 30 Apr 2025 17:00:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Joseph Zikusooka <josephzik@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvvefhufgtgfesthekredttddvjeenucfhrhhomhephfhrrghnpohoihhsucfhohhlthosthgvuceofhhrrghntghoihhsrdhfohhlthgvthgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdefteevueelteefudduteekkefhtdetvdeuveeihfethfeuhfffieefgeelvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvgeefngdpmhgrihhlfhhrohhmpehfrhgrnhgtohhishdrfhholhhtvghtvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjohhsvghphhiiihhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: francois.foltete@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746025251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nZoJrHM22I/qZgCGiYunwQpJbVpQFtqi7mV0h9+zeUk=;
 b=CFAAqanoY4zdkZrnk2aQhkxBLDwJt1XFABDDgnuf4kVrX/ZoGz+5CgdSU/EgRuSDSWyjFH
 2OmRm1/fB1cQGO5KjUbCudd2T2Xv4ncfjxd/qZpg2HorDO5sT65S2Tt/zLbVQYr9Rn9LRG
 uw3O1OqlOhGE7roF+efwYJepDHA6+mJgfMEDULxZgmt7LYxIfKM8Yt2cAi9YMzIgvOD6Tw
 PIP+xM0/f5BHkOx+SKbQdoT+JXnJX/KeTG17CpanA4NQuIsS3OFXoDH8FhPUY7FnQuSXn9
 28RtMN0uJcNc2K1CYS/sVFeRPPErO5DBsIl1K+H78RI4eLRR9I6XnY+ZkaoiSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CFAAqano
Subject: Re: [Buildroot] [PATCH] package/m4: fix build failure with gcc 15
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
From: =?utf-8?q?Fran=C3=A7ois_Folt=C3=AAte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?RnJhbsOnb2lzIEZvbHTDqnRl?= <francois.foltete@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZXBoLAoKdGhhbmtzIGZvciB0aGUgcGF0Y2gsIGl0IHdvcmtlZCBmb3IgbWUuCgpU
ZXN0ZWQtYnk6IEZyYW5jb2lzIEZvbHRldGUgPGZyYW5jb2lzLmZvbHRldGVAYm9vdGxpbi5jb20+
CgotLSAKRnJhbsOnb2lzIEZvbHTDqnRlLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
