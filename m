Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB3FC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C6480EA0;
	Tue, 22 Apr 2025 19:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvXY9IJtmsfL; Tue, 22 Apr 2025 19:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9611C80EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9611C80EF4;
	Tue, 22 Apr 2025 19:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A931BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D711560AB1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Isl8pZLmb5GQ for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6CD56081B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6CD56081B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6CD56081B
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:41:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A13641CFD;
 Tue, 22 Apr 2025 19:41:04 +0000 (UTC)
Date: Tue, 22 Apr 2025 21:41:03 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
Message-ID: <20250422214103.149c90dd@windsurf>
In-Reply-To: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
References: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745350865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7ZfYrwGRLLliu1A02TYDsAErufyCBlx+TF0gf6/FOU=;
 b=mf8NcvN6q+uEUQsXRP7/FJ25uo4M6P7y6IIkmkSPpbozK6bL5VdZyiFD+LhA/DLO9FljB5
 g+VV50SMBqUDvHJ+w/FqmZJaM5V1p3I3S3CnaP/qYC2TEvFAx91/XnAUzahjQXfS6l+VT0
 tm2iX2d2b/ENE4m/LFyCbIwpFEbKHdoucQPgyPj/9w2bcYq6PyUdliOj8ART5h5Fn/9zrx
 ey799F7g1KW/GiqufPHMRcuyzGzhxjb8d7fdQn9sdGhpInQ8si4/xR9onpyc8BB9gqQEb0
 tmPLqa/2JDBJGyNNdk/F5xirLnHOkJ8F3XAwtcknXWwY7TcF3+nDOSxf8zepXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mf8NcvN6
Subject: Re: [Buildroot] [PATCH v2 0/2] package/pixman: Fix riscv vector
 support
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

On Mon, 21 Apr 2025 14:37:02 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> Charlie Jenkins (2):
>       package/pixman: Only compile with riscv vector support when selected
>       package/pixman: Fix pixman compilation on riscv

Thanks, both applied.

Aside from the Upstream: link on the second patch, one thing that was
missing for the commit messages was since *when* the issue existed in
Buildroot, which helps the people who maintain our LTS/stable branches
to understand if those patches should be backported or not. So I've
added that information, but it would be great to include it in your
future contributions.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
