Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FEFC83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 18:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D8383A54;
	Sat,  5 Jul 2025 18:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9tTWhcF_qXO; Sat,  5 Jul 2025 18:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0FBB822E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0FBB822E2;
	Sat,  5 Jul 2025 18:14:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47E73445
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 18:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E63140088
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 18:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDjVZxr6LVGe for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 18:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.144;
 helo=fout-a1-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C096400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C096400BA
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C096400BA
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 18:14:48 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 65E5EEC0222;
 Sat,  5 Jul 2025 14:14:47 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Sat, 05 Jul 2025 14:14:47 -0400
X-ME-Sender: <xms:lmtpaK-xDvIoVSie6_S0Xy8tCA_64H9hK5yJqhSud6AgibYTePgD8Q>
 <xme:lmtpaKv9LhsnR2Fe97uIsSa7b3fM09AZ0ZGiW11JZVAx75unkTUEy9eKh_d_aRR1-
 6Tfj1M0JduZgSpdv3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieejfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
 nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
 heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
 thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjvghffhgsrghisegroh
 hstgdrihhopdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhi
 vghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgrii
 iiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegs
 uhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtg
 hpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
 hhhisehsvghniihilhhlrgdrihhopdhrtghpthhtohepgihrhiduudduseigrhihudduud
 drshhithgv
X-ME-Proxy: <xmx:lmtpaAD87eW8GoIil6SEsea3GOIVnuSHVjWc6bXcj7gTLp261mrCsQ>
 <xmx:lmtpaCe4n0vXe16Hxb_u9NCjSfS0USWYL6tNEyk9yx7N_yYsbT888w>
 <xmx:lmtpaPM2rIQIO4ZG567THumVBpME0MiHsJlAAD7kb-bX2HMTYNCAxQ>
 <xmx:lmtpaMlTnBkqzwc1u9fRtM8oBmB0viESpSbOoqaZCndJmDaZzV1jWQ>
 <xmx:l2tpaIKVMFpseGQYKvLJXajDr0uOzrA2uCd1jbLGg1SqffLNiYuMHXQ9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7DD4B2CE006E; Sat,  5 Jul 2025 14:14:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T071cc8430edced9f
Date: Sat, 05 Jul 2025 19:14:25 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Julien Olivain" <ju.o@free.fr>
Cc: buildroot@buildroot.org,
 "Giulio Benetti" <giulio.benetti@benettiengineering.com>,
 "Romain Naour" <romain.naour@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Dick Olsson" <hi@senzilla.io>, xry111@xry111.site, jeffbai@aosc.io
Message-Id: <7b67757c-fe17-4570-ac54-800272c4d0cc@app.fastmail.com>
In-Reply-To: <ecc1d845fa77dc51dc67bf25fe08de42@free.fr>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
 <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
 <3f1060fd8783b35211b3de718d350dd1@free.fr>
 <dbf55473-aede-485c-a896-8d014d103d06@app.fastmail.com>
 <ecc1d845fa77dc51dc67bf25fe08de42@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1751739287;
 x=1751825687; bh=x0ao3Y5R8SAh2JKiXTLD1aF6SnBZide3eLlchZzVwrA=; b=
 ifq3/vthHv6g0POva7BEcBiKNEO6GJ1+LV2kvFEr0Whb0DhZIFueqlPFPE2OnBa4
 BhmPGwno5tYpjDWfiPLjLsEOTPW/abOeC9g7HnEUURBvhfG1Sp0m2WYUJxyV71RU
 pd9568SRzywUxDbTB1/Av8QcqHsDK9e+40oOgI0FUkoxPafWEAR4OV6wLE04/sq0
 Hp553RW6SnnEzqz4qs90YbLVIgqG+1d9RPEYm4CBhZP00z8NsE2x3fMRCDTYVeox
 4HfzzGDpKxS8VVwQP24bO2JufkBx/1T/YhjjXJvTGu/st09eSBnA5k6ha6xHekVn
 i15hpTYtHmoMwsOo97m5tA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751739287; x=
 1751825687; bh=x0ao3Y5R8SAh2JKiXTLD1aF6SnBZide3eLlchZzVwrA=; b=E
 L2HB8+dWyZlFCtcJZ8+a6WvjxhjMu0Hrru/4/2rgVozbIKpvJoCcc3chI182OPlR
 iyd7i5Y2Pm2sv9cDt2+tsyIKxl8oZDOu32XDWMO0xAmtry6vyhAu+0hWKZ3s+MN/
 BuP9XXevLvulIhvzBfWLDlTL1TSKdOu9QXjo0xSK9Dqn4tjBNxljFrkSqzanh/I2
 wgCR2sCeK77sYxQ8XsunW+zsvM9/jnlUnpHD19XYviP+DQ0DdfpXvw0xo6YkMgTn
 ABB7929esyOEKd+gOM/fMvyVLdg6mw6xwicAGIZKFj8pZYqIm0JrL70C22ezG7Zc
 Uskw9UdKlMikSVXyEWATA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=ifq3/vth; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EL2HB8+d
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

CgrlnKgyMDI15bm0N+aciDXml6Xlkajlha0g5LiL5Y2INjo1MO+8jEp1bGllbiBPbGl2YWlu5YaZ
6YGT77yaCkhpIEp1bGlhbiwKClsuLi5dCgo+IFRoYW5rcyBmb3IgeW91ciBjb25maXJtYXRpb24u
Cj4KPiBXaXRoIHRoYXQsIEkganVzdCBtZXJnZWQgdGhpcyBzZXJpZXMgaW50byBtYXN0ZXIuCgpU
aGFua3MgZm9yIGFjY2VwdGluZyBpdCEKCj4KPiBMZXQncyBzZWUgaG93IGl0IGdvZXMgd2l0aCB0
aGUgYXV0b2J1aWxkZXJzLgoKSSBqdXN0IGhhZCBhIHRhbGsgd2l0aCBMb29uZ3NvbiBmb2xrcyBh
bmQgdGhleSBhZ3JlZWQgdG8KdGFrZSBjYXJlIG9mIHRoZSBwb3J0IHRvZ2V0aGVyIHdpdGggbWUu
CgpUaGV5IHNlbnQgdHdvIGRldmVsb3BlcnMgdG8gaGVscCB3aXRoIHVzOgpYaSBSdW95YW8gPHhy
eTExMUB4cnkxMTEuc2l0ZT4KTWluZ2NvbmcgQmFpIDxqZWZmYmFpQGFvc2MuaW8+CgpUaGV5IGFy
ZSBib3RoIExpbnV4IGRpc3RybyB2ZXRlcmFucywgc28gaXQgc2hvdWxkIGJlIGVhc3kKZm9yIHRo
ZW0gdG8gbWFpbnRhaW4gdGhlIGFyY2hpdGVjdHVyZS4KClNob3VsZCBJIGRyYWZ0IGEgcGF0Y2gg
dG8gYWRkIHRoZW0gdG8gYERFVkVMT1BFUlNgPwoKVGhhbmtzIQo+Cj4+PiAKWy4uLl0KPgo+IEp1
bGllbi4KCi0tIAotIEppYXh1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
