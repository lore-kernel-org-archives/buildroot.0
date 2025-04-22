Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97FC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 06:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D8D60D6B;
	Tue, 22 Apr 2025 06:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuhCg3t_-FH6; Tue, 22 Apr 2025 06:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7501760C21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7501760C21;
	Tue, 22 Apr 2025 06:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 468611BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 377C24088C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iFq80duiPBn for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 06:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34D15408DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34D15408DD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34D15408DD
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:57:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0979143A55;
 Tue, 22 Apr 2025 06:57:31 +0000 (UTC)
Date: Tue, 22 Apr 2025 08:57:30 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
Message-ID: <20250422085730.74c0ccff@windsurf>
In-Reply-To: <20250421-pixman_riscv_dependency-v2-2-7209dd6f2485@rivosinc.com>
References: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
 <20250421-pixman_riscv_dependency-v2-2-7209dd6f2485@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfeklefhieefhefftdfhhefhvdetuedvteevuddvkefhffdvtdegiefgkeelkeetnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhor
 hhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745305052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwmpJ/XCv1OqURBg00hpEteY3FB+Mjh9i4UvCMxbrgE=;
 b=H+Utsncje7PjGMZFvVmVZdj3NZ/zSF4HJRdKioR811EHm9PytMy/9WnGKyzv/bCrd8uPWR
 AqjwiQ97EGga6cJeFoHi0cwA+miqFV8SilgcMhy10JYrfHl8TeF1hALmSXe6R8pdWB7J9C
 m1u+yRuYCFDVIioJHxnt3mmpcbE2ZpZEo5vXuWoZsoJ+X/xHu4qGkwiiqBBhLQ13JaNu7Z
 ACTPaUrHZ6t8GNJBO7g/g4dIZ1xZG7tNgXk+kPLeneXZZqcW4qtYJT2BTuC6s+cAOIymnA
 0XCqM97NMUDojEAjQnrdHRGj0AInlygRz5EirAZYRG+xA+AEz3Gija6ivfcD3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H+Utsncj
Subject: Re: [Buildroot] [PATCH v2 2/2] package/pixman: Fix pixman
 compilation on riscv
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

On Mon, 21 Apr 2025 14:37:04 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> When the riscv vector extension is enabled for pixman, it assumes that
> the kernel headers also support riscv vector. Apply a patch that
> disables riscv vector in pixman if the Linux headers do not support
> COMPAT_HWCAP_ISA_V which pixman requires for vector runtime detection.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: http://autobuild.buildroot.net/results/4ecdf5320716ec8b39f09fde3fcbbdcdb557f8ab/

Thanks for the new iteration! One question below.

> +Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> +Fixes: 0e424031bda2 ("RISC-V floating point operations")
> +Upstream: Pending

Rather than just "Pending", we like to have here the link to the
submission, either a like to the PR/MR, or to the mail posted on a
mailing list. Could you provide that? No need to resend a v3 just for
that, it can be fixed up when we apply your patch.

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
