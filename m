Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA481C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96170615F8;
	Thu,  4 Jan 2024 21:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96170615F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFzNuvBv923T; Thu,  4 Jan 2024 21:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E378261B27;
	Thu,  4 Jan 2024 21:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E378261B27
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31EC11BF977
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2C18452C
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2C18452C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyUfIaN3FG_S for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:31:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BC628452E
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BC628452E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 187B5C0006;
 Thu,  4 Jan 2024 21:31:00 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:30:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240104223059.33ed0dc5@windsurf>
In-Reply-To: <20240103190258.2729806-1-bernd@kuhls.net>
References: <20240103190258.2729806-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8AKs/ymnmWCEHK0kqMcD1bsiZE58y5W9cgCpvXNQaM=;
 b=IWKeo/KOoKjBiGm9QIBzHl3fnmEhbGc3o5GqRLwKI0fzWlV+xitsyye7Ty0ggu906YTFa5
 1YSqDdXBqyRATQ21nrnqmosMFfZ0YFZ3TRU7jN0/aIlm8tWaWNeuPwDUa5ju3jvbG3Y3Ec
 O6IdxfxEAEHxzO1gk4wm4BeBagq7tdrwYDOt5TRre1G9jK2pUhT6jOMWegjU3GTaRXt48g
 IjNlnxorv3sRaYLAPgec068OJ6f8JI2uw8pM3HuK8mAL2Uq22BkGQPl3776uJglYm5cLnb
 38Rs94DT0uiMNqhmlWcb3ffePmrxbCEN7MxdoJw6SN5M03DbVrnhSjeDhHBnxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IWKeo/KO
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.97.1
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 20:02:58 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes CVE-2023-51766: https://seclists.org/oss-sec/2023/q4/348
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
