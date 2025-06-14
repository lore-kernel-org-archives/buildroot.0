Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33406C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 15:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CAA40394;
	Sat, 14 Jun 2025 15:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCB9luj2FrCV; Sat, 14 Jun 2025 15:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E491540886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E491540886;
	Sat, 14 Jun 2025 15:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DEBB151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63AB48116F
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gTAtZJK1zGI for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 15:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.155;
 helo=fhigh-b4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A70F980FA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A70F980FA8
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A70F980FA8
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 15:54:51 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8208325400D5;
 Sat, 14 Jun 2025 11:54:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sat, 14 Jun 2025 11:54:50 -0400
X-ME-Sender: <xms:SZtNaACg7LES5HtgIGIuEGfvn8G-bAW0ohS6aNLr5v66UPTRODE89w>
 <xme:SZtNaCg8diFgkJ3CU18n-bGFu8D9bvMLL3NqQK-cNcvxgPefOUsheilpJl9vzmYlM
 Jf85O9NEiELSt4B14w>
X-ME-Received: <xmr:SZtNaDnlo5XxpSiWX2wFsybjBCoURIgU2BPn1m4KeRyPVOrEnf1xvXXAIZ4Vaaxu32Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdt
 jeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeu
 ieeguedtveeijeeviefhffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorght
 rdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtth
 hopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphht
 thhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepsghuih
 hlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgihhulhhiohdr
 sggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpth
 htoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhi
 sehsvghniihilhhlrgdrihho
X-ME-Proxy: <xmx:SZtNaGw7KfoBwo74cpj2fkMtpKwGw6qkjw4CcYVOqge4V_LTSiFprA>
 <xmx:SZtNaFQZxTqCul0ZZGfKN4Q068re1lOKuS_uWFOJMQaVyWXutzasBg>
 <xmx:SZtNaBbdA823L-btgCyKwgJpfJGfdHquSWKbRrKW3rsikw_1g36tvg>
 <xmx:SZtNaOR3LBoeq9PNF6FQowB1cx8QLYxpxrp2MIrMffpX2DyRzR5NKg>
 <xmx:SptNaEhQv6JIeuHsODUqCFyrx6xhXbHVQK9wi4_-w4_zEh85_GfrHRqA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 11:54:46 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20250614151717.0f214ef0@windsurf>
Date: Sat, 14 Jun 2025 16:54:34 +0100
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Dick Olsson <hi@senzilla.io>
Message-Id: <B5AF7554-BBA7-4EAD-A065-3BF115BB737B@flygoat.com>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-2-90bc4fda9080@flygoat.com>
 <3807ec63-f603-4a95-9894-93ba95d6e2db@smile.fr>
 <20250614151717.0f214ef0@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749916490;
 x=1750002890; bh=0tPeVWukKQZcRNvaIEoaX3Bw3MycIkIcmAzzbz8omV4=; b=
 BWT2+sDVOgi5w9BNEF5uTUH7uZPy9R9WxUUI9WIIewDRlEDsJzc8uvKbg6CMatMO
 wySbDf9/Fwb8PhVsqc0pS+uqQam6UDk0swDw0AyzFYxMEVQxpqq7l9lCE9EtMbCx
 0PwHCJmNOnV+AAoBJdKmy6608mc347eNJBgwhoPrX0471jcKcUrvA3dSindH7sMv
 dkpSnOxssGgxAI8PKlteXLFBfxJ2+sguyujuUIm6rHQdyQ29rm1o2FFHFtr+zDI+
 qkZ68gPdinuXyQC4riKUsiMiaPHNETA5n1+GHf1BfOB+REmMsIP8DiTFu2QilP36
 EJKSq35gYDyczH/hwcE0bg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749916490; x=
 1750002890; bh=0tPeVWukKQZcRNvaIEoaX3Bw3MycIkIcmAzzbz8omV4=; b=k
 CR0OgTHalZH0fk+v3SENmdiMnFdenRBqf7tZbQVB6n7A8N6RJze2xUV0k5OzSvom
 RNpUfW99NnA6OcH29/GJvbRfyjZkUOKRfaUmYad4O3DRicIH0m+fKif04LqReWXd
 3+JK60YS5wIkGLbQMdjQaR+zbD2c6D9D/kmCelGDJdzLSWJs7aM/IPbmOVimIStf
 vpO20Mjhqmpa2boi5FjsgcWPYpH1IZiuvP7HgtaRxL8DPPRl1JwD82sdHHZ7JciS
 7sO71UBcV7m3rpCOH/xccR/IbjbnD8IFkfO8lbAZuCiDTot6/xgfQ1hhkMOPMhhS
 aDXrpkQgwPxShl9SzWFnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=BWT2+sDV; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kCR0OgTH
Subject: Re: [Buildroot] [PATCH v2 2/9] arch: Introduce LoongArch64
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

Cgo+IDIwMjXlubQ25pyIMTTml6UgMTQ6MTfvvIxUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0
YXp6b25pQGJvb3RsaW4uY29tPiDlhpnpgZPvvJoKPiAKPiBIZWxsbywKCkhpIFRob21hcywKClRo
YW5rcyBmb3IgcmV2aWV3aW5nIQoKPiAKPiBPbiBTYXQsIDE0IEp1biAyMDI1IDE0OjU0OjA0ICsw
MjAwCj4gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IAo+IAo+
Pj4gK2NvbmZpZyBCUjJfbG9vbmdhcmNoNjQKPj4+ICsgYm9vbCAiTG9vbmdBcmNoNjQiCj4+PiAr
IHNlbGVjdCBCUjJfVVNFX01NVQo+Pj4gKyBzZWxlY3QgQlIyX0FSQ0hfSVNfNjQgIAo+IAo+IFNp
bmNlIHlvdSBoYXZlIHRoaXMgc2VsZWN0IEJSMl9BUkNIX0lTXzY0IGhlcmUuLi4KPiAKPj4+ICtj
b25maWcgQlIyX2xvb25nYXJjaDY0X2dlbmVyaWMKPj4+ICsgYm9vbCAiR2VuZXJpYyBMb29uZ0Fy
Y2ggNjQtYml0Igo+Pj4gKyBkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gCj4gVGhpcyBkZXBl
bmRzIG9uIGlzIHVzZWxlc3MuCgpUaG9zZSBhcmUgbW9zdGx5IGluIHByZXBhcmF0aW9uIG9mIExv
b25nQXJjaCAzMiBzdXBwb3J0LCBJIGVudnkgaXQgd291bGQgYmUKaW4gdGhpcyBmaWxlIGFzIHdl
bGwuCgo+IAo+Pj4gKyBzZWxlY3QgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEyICAKPj4g
Cj4+IFRoaXMgY2FuIGJlIG1vdmVkIHVuZGVyIEJSMl9sb29uZ2FyY2g2NC4KClN1cmUsIHdpbGwg
ZG8uCgpUaGFua3MuClvigKZdCgotIEppYXh1bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
