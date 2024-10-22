Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624FED1CDA1
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 06:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13FAA606BD;
	Tue, 22 Oct 2024 06:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWr9nJv5_ZnG; Tue, 22 Oct 2024 06:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD1560699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD1560699;
	Tue, 22 Oct 2024 06:43:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B39E2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39A5580D4C
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7kvhKWxvO8f for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 06:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1186080C96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1186080C96
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1186080C96
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 06:43:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B395FF809;
 Tue, 22 Oct 2024 06:43:20 +0000 (UTC)
Date: Tue, 22 Oct 2024 08:43:19 +0200
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20241022084319.445f4226@windsurf>
In-Reply-To: <20241021114752.63157838@kmaincent-XPS-13-7390>
References: <20241014142923.246809-1-kory.maincent@bootlin.com>
 <20241014142923.246809-4-kory.maincent@bootlin.com>
 <20241017154643.442837bf@windsurf>
 <b951fb45-97ef-47c3-aee5-15d23c558461@mind.be>
 <20241021114752.63157838@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729579401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzF4qd4B0iQV7DHGv6Rce50tG5PIKrdkXUFq227xZnE=;
 b=g7ZfNqfXRoBtEgCeTl71o8olCrVMspfW4x1HWjHvNuknPzC0EEp/eGfqT0l5BfdYiLogXx
 xnSvGH116FpCFWFD2RD/hbio4L6JWf3WHjCjoJfrNx9sYMs0aflbJs1sdjjVG2GHhVMDQF
 Hi2p2pPYUM97++099f+ILi2QmYr6T71LFTP7la7Bs041KlQTM613RMj+ZY7WmH6hWXfto+
 DdZESkZb35VE0PGZff9sTl1VFtv4Lv5P0c5iRwk67hybboMkr1Hztv4Hyev5FqmOQQWZ2a
 UjeKggGgTXjttoXihpDNaUSfICwr3mM0yFO8W8BOUm+WBEmKD+k+hDbfngUC0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g7ZfNqfX
Subject: Re: [Buildroot] [PATCH v6 3/3] boot: Add support for
 TrustedFirmware-M package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Kory Maincent via buildroot <buildroot@buildroot.org>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 21 Oct 2024 11:47:52 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> If we don't use tarball for extra download, couldn't we decrease the git clone
> time using --single-branch and/or --depth 1?

One of the big points of switching to Git downloads is that we keep a
cache of the Git repository, which doesn't work well with --depth 1.

See the reasoning in commit 4f54c959dc18cb3ca56e8f54b358fc219352d7bd.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
