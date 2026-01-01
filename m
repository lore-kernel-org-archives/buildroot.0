Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7EFEEB579
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373EC4082E;
	Thu,  1 Jan 2026 15:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whBGwccTjP-H; Thu,  1 Jan 2026 15:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0050E4081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767282815;
	bh=l4qQnKX1erNY0Y6foqwNz7xrcxoINGrXC5X/Ukj3oC8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bf1b7zE7vdyhBw7Gv0CbpZk3agA3L6mlmwk2PRPQuVnPr0ygvgO5mbJ98KR8Ammh7
	 H+GWzb6vnFYOc7OC1pr8R/LXHusW8WdJuDLzq0agldqwDMmaUUEdtld1gyJkwetUf1
	 hby4C1qVF5s4rIrkzRlt6M9PSgOOgEN0HT2oO6nx96f8VH3gOhHlTishN8hlAQ9Nfp
	 0AYy+qjZVb6TPJPJGTRqTPPpTm/uJZ1agjwxNuss2L7W4cKsrpslx53j5e2Zz0P6XP
	 Rdn50QQqDP8QeQHeNugVIZdD5fVT4BGBzfGrcju3GB/UbYTAtagpUGSv0LUm723hB3
	 S+6Aw5FFBM0SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0050E4081F;
	Thu,  1 Jan 2026 15:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40991206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 319AE4024D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGsdHdY0Mccv for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F8234022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8234022A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F8234022A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:53:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6A5424E41ED9;
 Thu,  1 Jan 2026 15:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CEA360749;
 Thu,  1 Jan 2026 15:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7DCE8113B029E; Thu,  1 Jan 2026 16:53:29 +0100 (CET)
Date: Thu, 1 Jan 2026 16:53:28 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101165328.0bf0f156@windsurf>
In-Reply-To: <20251003150122.633790-1-giulio.benetti@benettiengineering.com>
References: <20251003150122.633790-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767282809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BS0h/x0nKPeJv8GqnPNiSlGNtw6PjoWsjlhzRp0lJns=;
 b=cbu3Nih+yDjJHiWjVU8dlvhfL6kPbonc47FGXfCGmBL5ts0nnwzJmqFH43aVQp62mQv2xc
 eQDlCChLz8VrAvKVDQEK4wyVmA9T2GYvm1Obo9W8fO4YpU+PsOyuVGbDlKFGb9jXg8p5ac
 9+SGTXvQcQBlEmWNvIpGfDI8rOh8NcRzeWoa8ONqJ7Mj5T52fIAcFRm/H66UyCsTAA+lrw
 MNKbVY3yv3CJp9aLOUqnqio24lNAwOD6iOikWWZQNXzbAjMf2y5lQqRZw2nsIIJfV3JceI
 W7UHCT8bdhbmAAEj9E6s43lAo8ycxPww2Xg33s7bF/YsENAHr0bMauDG8n3GDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=cbu3Nih+
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: drop
 BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32 choice
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

On Fri,  3 Oct 2025 17:01:22 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> As pointed in this PR[0] ESP_SLAVE and CONFIG_TARGET_* became useless after
> commit [1] so let's drop the SoC Target choice. The SoC ID is automatically
> retrieved via SDIO commands, so no need to specify it.
> 
> [0]: https://github.com/espressif/esp-hosted/pull/668
> [1]: https://github.com/espressif/esp-hosted/commit/b544b01e201bdef20c680a6902c1495e46dde1ff
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/esp-hosted/Config.in     | 14 --------------
>  package/esp-hosted/esp-hosted.mk |  6 ------
>  2 files changed, 20 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
