Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37ECCA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 17:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FFB81449;
	Tue, 19 Aug 2025 17:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfjExXlHHEek; Tue, 19 Aug 2025 17:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA9281444
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA9281444;
	Tue, 19 Aug 2025 17:08:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C90E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0C3240028
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68LfsQFJdeos for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 17:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D627C407C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D627C407C5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D627C407C5
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:08:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 73E39C6B394
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:08:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F289860697;
 Tue, 19 Aug 2025 17:08:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6423C1C22CC33; 
 Tue, 19 Aug 2025 19:08:20 +0200 (CEST)
Date: Tue, 19 Aug 2025 19:08:19 +0200
To: Leo Liang <ycliang@andestech.com>
Cc: <buildroot@buildroot.org>
Message-ID: <20250819190819.206fde13@windsurf>
In-Reply-To: <aKRPH3Kz3vG_GDYc@swlinux02>
References: <20250818203223.3219221-1-thomas.petazzoni@bootlin.com>
 <aKRGPS7VOFk7VNCs@swlinux02> <20250819115459.34b62b9b@windsurf>
 <aKRPH3Kz3vG_GDYc@swlinux02>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755623304; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FwEM1uu6/5VHFhvm+118qtcQRuqVLtY+QOoErn1lzl0=;
 b=OgLeRh9kIcoOkERV/4amsrONCnKUEu2/H1a6MtrhIX4znHPp5AJB6r16n/nmIOYXtwelH8
 oWuvx/y4K7tZDYgV1ecx3OlXzq3M3DihUthQKTN4r6n/4mUcTQaCAOpyb0iUCsA94uHNN6
 oYYqC0FOz/za/v5p4FdiVRF3vZGKrC03BcAgSEtuwvkpaVC+Z+a3LXd7jXEQWUyFXqOZIJ
 fsXq7Q4LTwlfqzRms3gT+lpFHQ6HApdPIuziGILzqJcc8bXB9A4QnVVRe7L8FKq9X28ayT
 NrQUGbZ8rMa1wl2OjerNTA8XsFhHNDpabfsj3YFqUN2sAyf2/mjj0/lrSW69rQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=OgLeRh9k
Subject: Re: [Buildroot] [PATCH] configs/andes_ae350_45: remove defconfig,
 broken
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

Hello Leo,

On Tue, 19 Aug 2025 18:17:03 +0800
Leo Liang <ycliang@andestech.com> wrote:

> Roger that!
> I will prepare a patchset ASAP to address these issues.
> Thank you for all the reminders!

Thanks, looking forward to seeing your patches!

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
