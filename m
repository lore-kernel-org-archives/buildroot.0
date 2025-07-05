Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C5EC8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 13:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B121F60D74;
	Sat,  5 Jul 2025 13:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLNToh_-bsRH; Sat,  5 Jul 2025 13:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E716660BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E716660BF2;
	Sat,  5 Jul 2025 13:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1F5812E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 13:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BC781959
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 13:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFz36Jovw3YD for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 13:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.144;
 helo=fout-b1-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2450481801
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2450481801
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2450481801
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 13:24:43 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id D6E281D0017D;
 Sat,  5 Jul 2025 09:24:42 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Sat, 05 Jul 2025 09:24:43 -0400
X-ME-Sender: <xms:mSdpaHzPcJLulvS6JzMNe0fudZCQDyZYwcjmpuw3PRTKEXlK-DP7WQ>
 <xme:mSdpaPTbt8rtSKPXjmchQscXDWArS2dgcZejjtc07o6cePxP_x24q32gqQNAUtC2J
 54YZK28FKK7drrcr2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
 nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
 heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
 thhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgihhulhhiohdrsggvnh
 gvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohep
 thhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoh
 epsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdr
 ohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilh
 drtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhioh
X-ME-Proxy: <xmx:mSdpaBU3NtTMBVYqRUxTCgHXYOK2N_dMFdriR5A9oh7XbH7RtNLkuw>
 <xmx:mSdpaBi-0VJjyHkP2rBASsY79Xh02BGRGeBsp7coyVw9kW81QYtN6Q>
 <xmx:mSdpaJBEe_51Bmqf-ZcyskJl7wOc9eK4WdMn9yTI2uQnQaOXZPxMVg>
 <xmx:mSdpaKItvK_cn5j1GIB9zhvl4ckSYw5ECPJNnSTRLdKutA079z0uAw>
 <xmx:midpaPlidFUQOjFnIYB5pGMNxBfkWJnOLdCmh_uH4pg0d2xzx6JtBaUT>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id C075A2CE0072; Sat,  5 Jul 2025 09:24:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T071cc8430edced9f
Date: Sat, 05 Jul 2025 14:24:21 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Julien Olivain" <ju.o@free.fr>
Cc: buildroot@buildroot.org,
 "Giulio Benetti" <giulio.benetti@benettiengineering.com>,
 "Romain Naour" <romain.naour@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Dick Olsson" <hi@senzilla.io>
Message-Id: <dbf55473-aede-485c-a896-8d014d103d06@app.fastmail.com>
In-Reply-To: <3f1060fd8783b35211b3de718d350dd1@free.fr>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
 <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
 <3f1060fd8783b35211b3de718d350dd1@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1751721882;
 x=1751808282; bh=2AK33hHQq61Vddgw1dBosFa9WMdo/ZtrIpzUsOZbSMk=; b=
 n96oh5yZJaBwELhx3gJKwHqRPhJeKOhLE2AmuUNuu5BKUENMDy7OzI3GeNRjuMlf
 6pb1PjyKaH1K4wOsM/ku22NtHZo2H7GldNxgPmqZoNTrLgZZZFoJzjt/5ynlJaNV
 S60hs3naXayj3ZLDvAtqY5xUz73ls/9LNyQr1eDWT4GjjSbB3zLwqjR/ik2OGB2R
 zzK3ZcqFd5HAH+hHBaJpyB2UV6eDJbg3MPmwUHb27N7hSsxqyYfV/qAyO/EMk8rX
 5ag3z18ehiuWVd0DVKEOG741Nf1/Zg/BrxH7IUBRWd1zwU3UhvpS+in/YWWBgGw0
 GicEYC6tqnGPE+p09Gdxwg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751721882; x=
 1751808282; bh=2AK33hHQq61Vddgw1dBosFa9WMdo/ZtrIpzUsOZbSMk=; b=Z
 c7vg/wXU5gGXqJPH2Kx5EmUxIL3DyYGwAl289/MCgGF6Q6TwtWACMxCa5OKYWALs
 4LgBsUQ9Jk9EpDe0eTsFqzZfDUU+tSRXkm6uP8SVIMedz8OL5EC0CZEpbhbKYNML
 fw5IX5bvJx5VWfMj/pyLWaWeMWY1jHiOHiytrP7+D+QNLw1Io+EVXHqxvVGeBIMf
 sdCufXbTm5kIi9cqriN9hDpXbUr+cV5z5+I/Kj4wTykhBwwUjjBvks7ObmZHFNxJ
 x4fTIeiQH0h8jahMduzA3t3EMrxQIjQGIJSLTNLPiI6BytROj3JRFvIa+FTVJ0RZ
 07kJp3h2EhnoM9zYEILSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=n96oh5yZ; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Zc7vg/wX
Subject: Re: [Buildroot] [PATCH v3 02/11] arch: Introduce LoongArch64
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

CgrlnKgyMDI15bm0N+aciDXml6Xlkajlha0g5LiL5Y2IMToxN++8jEp1bGllbiBPbGl2YWlu5YaZ
6YGT77yaCj4gSGkgSmlheHVuLAo+CkhpIEp1bGllbiwKCkFsbCBzb3VuZHMgZ29vZCB0byBtZSEg
TWFueSB0aGFua3MgZm9yIGxvb2tpbmcgaW50byBpdC4KClsuLi5dCgo+IElmIHlvdSBwcm9taXNl
IHRvIGhlbHAgdXMgZG9pbmcgdGhpcyBtYWludGVuYW5jZSwgSSB0aGluayB3ZSBjb3VsZAo+IHRo
aXMgc2VyaWVzIG1lcmdlZCBzb29uLgoKU3VyZSwgSSB3aWxsIHRyeSBteSBiZXN0LgoKSSBqdXN0
IHdhbnQgdG8gbm90ZSB0aGF0IEknbSBhIGhvYmJ5aXN0IHNvIG15IGF2YWlsYWJpbGl0eSBtYXkg
dmFyeSwKYnV0IGl0IHNob3VsZCBiZSBmaW5lIHRvIGRldm90ZSBhIGNvdXBsZSBvZiBob3VycyBw
ZXIgd2Vlay4KCkknbGwgbW9uaXRvciBDYyBmcm9tIGJ1aWxkcm9vdCBsaXN0IHByb21wdGx5LgoK
Pgo+IFdoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzIGFnYWluLgoKPgo+IEJlc3QgcmVnYXJkcywK
Pgo+IEp1bGllbi4KCi0tIAotIEppYXh1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
