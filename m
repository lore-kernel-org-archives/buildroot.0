Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D3AC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C8F406F7;
	Sat, 19 Apr 2025 21:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DQwfj1xYJ3D; Sat, 19 Apr 2025 21:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2DA4052A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2DA4052A;
	Sat, 19 Apr 2025 21:30:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABB4C230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D28F4052A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpJL0hgv6Bt8 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9135740527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9135740527
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9135740527
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 945721FCEA;
 Sat, 19 Apr 2025 21:30:27 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:30:26 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
Message-ID: <20250419233026.2a04c201@windsurf>
In-Reply-To: <20250408-fix_e2fsprogs-v1-1-cc814171907a@rivosinc.com>
References: <20250408-fix_e2fsprogs-v1-1-cc814171907a@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745098227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7YvfVGQq6CwieGTvYK/0uibDTSK2TJWOK+d5HKUW3M=;
 b=IjXIZlIgdNXvTChjFDGcX0nGd8pZwHBjPepboNG+TYWvAOACwNzFjMuFKM9tTi133NawAk
 cBnV4LXYfMiYcTnTeL8Hbnrt0GCSH6eveTyy7PH1iDtuEOhKl1+iCSC3CWSbN+3OjeSEiO
 DKozUuf5fYkUame97fNBVMj3Ln1nR7RHMNB44Svls9d0GxHO5aX/J4548UW/HQpI3WTdql
 C0sZe6aR1EJF5JF89JsM/AwrEeLZVLruSJ+aVnjidPmbsmIeRTrzzLIFIoQ2uAM9bhh4OV
 kuonvsCBupQuq2RI5WORdGmL3EhCxOg5OQmmxqvNNYpec7xzbO+4qyQuL8YRGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IjXIZlIg
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: Don't build docs for host
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charlie,

On Tue, 08 Apr 2025 17:03:05 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> texinfo isn't provided for the host in buildroot, but e2fsprogs always
> attempts to build the documentation. The error that gets printed is as
> follows:
> 
> /usr/bin/install: cannot stat 'libext2fs.info*': No such file or directory
> make[3]: [Makefile:363: install-doc-libs] Error 1 (ignored)
> 
> This error is ignored but it is unnecessary.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

But why is that an issue for the host variant of e2fsprogs and not the
target variant?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
