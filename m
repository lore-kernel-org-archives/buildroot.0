Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1AFC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B13614A2;
	Fri, 25 Aug 2023 17:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B13614A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQRjQMqRgDD0; Fri, 25 Aug 2023 17:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D35614E8;
	Fri, 25 Aug 2023 17:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D35614E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1407C1BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2CD541BD7
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2CD541BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlG08uHR1ivu for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:11:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D500541BDD
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D500541BDD
Received: by mail.gandi.net (Postfix) with ESMTPSA id C60D540002;
 Fri, 25 Aug 2023 17:11:55 +0000 (UTC)
Date: Fri, 25 Aug 2023 19:11:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230825191154.34b0374b@windsurf>
In-Reply-To: <20230825155001.349004-1-bernd@kuhls.net>
References: <20230825155001.349004-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692983516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOl5z4eEPlsgIJReycJcAiCEzBQWKfqEASpImBQUWpA=;
 b=ZjdZFopxISGPB/gHRTg8EggMVO+RmOyyClzNklokpKr1xNAbmuH2jBtas7X2LzB4IHJiuc
 NA65+OkWCweSr/g57VCX7+rBvlts+UXWD7OBZcMoH59pOtmZ4gI1kwNtT4Ob0yTyCEaJoX
 jA9mD/LfR7esRygY5Fjemi0vDrPBslpP5/Uqv/6YeqSwnpkTr6NaYch+u3RpEZZT5J6snK
 +Yh7Lu4C6X1Kspz5fmHyIB7juzqh7sFQTNjDlKgCqnD0IZhlzE0Cll3mTJtrIgT6VYNNZo
 h5yITQBG9R89HucXqdFEwpx4l3s4CLQJdhUzlcuQl2osSVyCRQpQEl4bNMRUCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZjdZFopx
Subject: Re: [Buildroot] [PATCH/next 1/1] package/tor: bump version to
 0.4.8.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Aug 2023 17:50:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://forum.torproject.org/t/stable-release-0-4-8-4/8884
> 
> Removed all patches due to upstream commit adding compatibility with
> LibreSSL 3.5:
> https://github.com/torproject/tor/commit/f3dabd705f26c56076934323f24b5b05ecdfd39c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Build-tested using this defconfig

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
