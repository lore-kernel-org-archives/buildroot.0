Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE8CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A7E281238;
	Tue, 19 Aug 2025 20:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYiO991bnp2Y; Tue, 19 Aug 2025 20:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27F8081200
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F8081200;
	Tue, 19 Aug 2025 20:25:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 671ADE0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58D1581205
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoqmRcm7TJec for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 20:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B294811E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B294811E5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B294811E5
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:25:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8720D4E40A2A;
 Tue, 19 Aug 2025 20:25:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 60C7260697;
 Tue, 19 Aug 2025 20:25:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A7D421C228A25; 
 Tue, 19 Aug 2025 22:25:25 +0200 (CEST)
Date: Tue, 19 Aug 2025 22:25:24 +0200
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Message-ID: <20250819222524.5682cbc2@windsurf>
In-Reply-To: <20250819181451.3012126-3-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
 <20250819181451.3012126-3-michael@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755635126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Tu1NiuUZ1c3Q8MY06i4fhumRXHK+E5jn1JusMcQLkdQ=;
 b=IYmvFx7rGLSFsoVrPe5yupS94qvkxtoY+4I8KJ70AmWePTf/T+SEFyah7yJk+r+ab4f/IS
 EnOu6bs42fR/iggLdJxZn+jvRfKuCQMXcEz3Urlc73u0Tdy1TmsphGLyLXTddqs3EM+YEq
 vgsEBLzYRib0X/g9Y0u2Rr3qT7DxPzco/xfOVpr6fzJjaTRY+YhOA1y4vB0ifWZFrtu5Bb
 xm18OblKTGm8XHD2gma9wMz03QiK6kefOoxm2ZBMMicNRAIawcqnb7meU9Rv7H24suglG/
 +VCNaCaCLF/2kQrPfe4Nlh0TySS8gLKYxMHUa68ob2qLfJukogUuhTONqq4Yag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IYmvFx7r
Subject: Re: [Buildroot] [PATCH 2/6]
 configs/engicam_imx6qdl_icore_defconfig: bump Linux to 6.12.36 and U-Boot
 to 2025.07
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

Hello Michael,

On Tue, 19 Aug 2025 20:14:47 +0200
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> +BR2_PACKAGE_HOST_E2FSPROGS=y

What do you need this?

> +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y

Please do not add this package, we try to keep our defconfigs minimal.

(Comment applies to other patches of course)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
