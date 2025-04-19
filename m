Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC680C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B08860711;
	Sat, 19 Apr 2025 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oo1s2diwiRc; Sat, 19 Apr 2025 20:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D7C607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D7C607FC;
	Sat, 19 Apr 2025 20:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D0068
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 776624015A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fnrvqFUM6hZ for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7143540190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7143540190
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7143540190
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:39:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A4D31FCE8;
 Sat, 19 Apr 2025 20:39:11 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:39:10 +0200
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
Message-ID: <20250419223910.63f7bc85@windsurf>
In-Reply-To: <20250410-pixman_riscv_dependency-v1-1-25d44d225acc@rivosinc.com>
References: <20250410-pixman_riscv_dependency-v1-1-25d44d225acc@rivosinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeitdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfeklefhieefhefftdfhhefhvdetuedvteevuddvkefhffdvtdegiefgkeelkeetnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhor
 hhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745095151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCMNkrC2AhTJUdjDJPiskWTqStvUT6nTrZwYtUysQSM=;
 b=dMqpxrWB76QLacjqOuR4FaJAQztq8o/glPmPHEJ+JHIrI1OYNOEvWcabyLyU3vRJXZHBC7
 Xj1BdX46ADOgoU2/YdO6VgFaen7BbAgdqJ0AUTL+7FK+55h3jnKfBdm+VW9uTlm64hiQdH
 0cGQ3ua5A4Jd7LaTuU7acKtBNvk4eSHeDxgw/J8e63ee0wVm8m4LVDlzHG3ib/QqbjydKm
 dkRCsg+CKijf/ua8IXKlceWkWIqWkUkGDAGBEocN7lNeLOPr71WyWSauuwX4OVjuTpkMXZ
 Av1tgPuvvgyAuy081lUjCjWMvXh56KDFglqTzn+GEnIuwwmBgc7D2x/Wku2Lgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dMqpxrWB
Subject: Re: [Buildroot] [PATCH] package/pixman: Specify riscv dependency
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

On Thu, 10 Apr 2025 18:08:26 -0700
Charlie Jenkins <charlie@rivosinc.com> wrote:

> riscv Pixman depends on COMPAT_HWCAP_ISA_V which is available in Linux
> 6.4+, so make Pixman dependent on headers that are at least 6.4.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Thanks for this patch! Do you have a reference/explanation?

One issue with adding such a dependency is that it needs to be
propagated to ALL reverse dependencies of pixman, and there are a LOT
of them. Like doing this:

diff --git a/pixman/pixman-riscv.c b/pixman/pixman-riscv.c
index 1f0440f..7b44ece 100644
--- a/pixman/pixman-riscv.c
+++ b/pixman/pixman-riscv.c
@@ -44,7 +44,7 @@ detect_cpu_features (void)
 {
     riscv_cpu_features_t features = 0;
 
-#if defined(__linux__)
+#if defined(__linux__) && defined(COMPAT_HWCAP_ISA_V)
     if (getauxval (AT_HWCAP) & COMPAT_HWCAP_ISA_V)
     {
        features |= RVV;

In the pixman code base would resolve the build issue, and is I believe
acceptable upstream.

But apparently, the issue is that <sys/auxv.h> doesn't exist at all. In
this case, you can add a meson check for this header file.

Also, it would be nice to indicate in the commit message which version
of pixman introduced the issue, apparently pixman-0.44.0.

Could you respin an updated version, that uses a patch against pixman,
and make sure that patch gets submitted upstream?

Also, indicate in your commit message:

Fixes:

  http://autobuild.buildroot.net/results/4ecdf5320716ec8b39f09fde3fcbbdcdb557f8ab/

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
