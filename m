Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B96C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1D381589;
	Sun, 18 May 2025 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhfQvttZHeVE; Sun, 18 May 2025 14:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 326EE81384
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326EE81384;
	Sun, 18 May 2025 14:42:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D07DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 047934100C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKRxgzXDGYww for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:42:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D74F040F32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74F040F32
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74F040F32
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5E4943B62;
 Sun, 18 May 2025 14:42:13 +0000 (UTC)
Date: Sun, 18 May 2025 16:42:13 +0200
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via buildroot" <buildroot@buildroot.org>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>, Dick Olsson
 <hi@senzilla.io>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20250518164213.78c9bd60@windsurf>
In-Reply-To: <20250414-ska-bump-v2-0-efb0a276750d@gmx.net>
References: <20250414-ska-bump-v2-0-efb0a276750d@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhdrnhgvuhhstghhrggvfhgvrhesghhmgidrnhgvthdprhgtphhtthhopehhihess
 hgvnhiiihhllhgrrdhiohdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747579334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ycvdXP6FivP+YQy3T6j52Tjgy5RSoQKSLh2+gHTzVw=;
 b=LRsMu4seixYxDmZOqw8QqUgH/Fp19GwUIKPEbkIBUQueZXR9xJ1QL8I6O/37ruZ8mxM4tT
 WH+85phFDZ0B6eZAFy1aDR3QNXt7pLQnUB1Wva6Eo/MbPG0/xYqmAtS7S1bJXkt6UCQhRT
 7ksW/iIMVwx/qd6MCwsh6woFGUMXuhuo2dFczFWyv3igEFYhW6Xcxx3cEUZBuAOFNICs5b
 hKRtFf2PuGHeJOmNrMePfdP3AwUjGqlFMsPr0rkQrBUtmlLQK8Mn1qhNrvLr6lxJG6L/jF
 A3dxIv0/1Qo7plTW8lRrCoEctgqgMr7Mitc6iGCddAIG4ZAOgorwN14hK2FPCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LRsMu4se
Subject: Re: [Buildroot] [PATCH v2 0/3] Update skarnet.org packages
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

T24gTW9uLCAxNCBBcHIgMjAyNSAxMzoxOTozMSArMDIwMApKLiBOZXVzY2jDpGZlciB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEouIE5ldXNjaMOkZmVy
ICgzKToKPiAgICAgICBza2FybmV0Lm9yZyBwYWNrYWdlczogcmVtb3ZlIC0tcHJlZml4PS8KPiAg
ICAgICBza2FybmV0Lm9yZyBwYWNrYWdlczogYnVtcCB0byBuZXcgdmVyc2lvbnMgKE9jdG9iZXIg
MjAyNCkKPiAgICAgICBwYWNrYWdlL2V4ZWNsaW5lOiByZW1vdmUgLURfR05VX1NPVVJDRQoKVGhh
bmtzLCBzZXJpZXMgYXBwbGllZCEgVGhlcmUgd2VyZSB0d28gcGFja2FnZXMgZm9yIHdoaWNoIHRo
ZSBsaWNlbnNlCmZpbGUgaGFkIGNoYW5nZWQgKGNvcHlyaWdodCB5ZWFyIGNoYW5nZSkgYnV0IHRo
YXQgeW91IGhhZCBmb3Jnb3R0ZW4gdG8KdXBkYXRlLiBJIHRvb2sgY2FyZSBvZiB0aGF0LiBUaGFu
a3MgYWdhaW4hCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
